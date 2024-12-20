<?php

namespace App\Http\Controllers;

use App\Models\Organisation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use App\Mail\RegistrationEmail;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;
use App\Models\Province;

class AuthController extends Controller
{
    //
    public function showRegistrationForm()
    {
        //$provinces = User::all();
        $provinces = Province::orderBy('province_name', 'asc')->get();
        return view('user.register')->with('provinces', $provinces);
    }

    public function showLoginForm()
    {
        return view('user.login');
    }

    public function register(Request $request)
    {


        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required|string|max:255',
                'email' => 'required|string|email|max:255|unique:users',
                'password' => 'required|string|min:8|confirmed',
            ],
            [
                'name.required' => 'Le nom est obligatoire',
                'email.required' => 'Veuillez fournir votre adresse email',
                'email.email' => 'Le format de l\'adresse email n\'est pas valide',
                'email.unique' => 'Un compte avec cette email existe déjà',
                'password.required' => 'Veuillez spécifier un mot de passe',
                'password.min' => 'Le mot de passe doit avoir au moins 8 caractères',
                'password.confirmed' => 'Les deux mots de passe saisis ne correspondent pas',
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();

        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'code_organisation' => '-',
            'user_role' => 'Guest',
            'phone_number' => $request->phone_number,
            'is_active' => 'Non',
            'province_code' => $request->pcode_province,
            'desactivated_by' => '',
            'desactivate_reason' => '',
            'access_level' => 'Local',

        ]);

        $details = [
            'title' => 'Bienvenue sur AlertBook',
            'body' => 'Nous vous remercions d\'avoir pris le temps de créer votre compte. Vous serez notifier dès que le compte sera activé par les administrateurs'
        ];

        Mail::to($request->email)->send(new RegistrationEmail($details));

        return redirect()->route('login')->with('success', 'Votre compte a été créé avec succès.');
    }

    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $authenticated = Auth::attempt($credentials);
        if (!$authenticated) {

            Session::flash('error', "Identifiant ou mot de passe incorrect");

            return Redirect::back();

        } else {
            return redirect()->route('dashboard');

        }



    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/');
    }

    public function showDashboardForm()
    {
        if (Auth::check()) {
            return view('dashboard');

        } else {
            return redirect()->route('login');
        }

    }

    public function getUsers()
    {
        if (Auth::check()) {
            $user = auth()->user();

            if ($user->user_role == 'Administrateur') {
                $users = User::where('province_code', '=', $user->province_code)
                    ->orderBy('name', 'asc')
                    ->get();

                return view('user.list')->with('users', $users);

            } else {
                session()->flash('error', 'Vous n\'êtes pas autorisé à effectuer cette action !');
            }


        } else {
            return redirect()->route('login');
        }

    }

    public function getUser($id)
    {
        $provinces = Province::all();
        $user = User::find($id);
        $organisations = Organisation::where('code_organisation', '!=', '-')->get();
        return view('user.edit', compact('user'))
            ->with('provinces', $provinces)
            ->with('organisations', $organisations);
    }


    public function edituser(Request $request)
    {
        //Validation
        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required|string|max:255',
                'phone_number' => 'required|digits:10',

            ],
            [
                'name.required' => 'Le nom est obligatoire',
                'phone_number.required' => 'Saisissez le numéro de téléphone',


            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();

        }


        //Mise a jour
        $id = $request->input('id');
        $user = User::find($id);

        $user->name = $request->input('name');
        $user->phone_number = $request->input('phone_number');
        //$user->is_active = $request->input('is_active');
        $user->user_role = $request->input('user_role');
        $user->code_organisation = $request->input('code_organisation');
        $user->is_active = $request->is_active;

        $user->save();


        return redirect()->route('users.list')->with('success', 'Données modifiées avec succès');


    }
}
