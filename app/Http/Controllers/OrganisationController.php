<?php

namespace App\Http\Controllers;

use App\Models\Organisation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class OrganisationController extends Controller
{
    //
    public function list()
    {
        //$posts = Organisation::all();
        $orgs = Organisation::orderBy('code_organisation', 'asc')->get();

        return view('organisation.list', compact('orgs'));
    }

    public function store(Request $request)
    {

        $validator = Validator::make(
            $request->all(),
            [
                'code_organisation' => 'required|string|max:10|unique:organisations',
                'denomination' => 'required|string|max:255|unique:organisations',

            ],
            [
                'code_organisation.required' => 'Le sigle est obligatoire',
                'denomination.required' => 'La denomination est obligatoire',
                'code_organisation.unique' => 'Une organisation avec ce sigle existe déjà',
                'denomination.unique' => 'Une organisation avec cette dénomination existe déjà',

            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();

        }

        $org = new Organisation;
        $org->code_organisation = $request->code_organisation;
        $org->denomination = $request->denomination;
        $org->type_organisation = $request->type_organisation;
        $org->secteur_activite = $request->secteur_activite;
        $org->telephone_contact = $request->telephone_contact;

        $org->save();

        return redirect()->route('orgs.list')->with('success', 'Organisation ajoutée avec succès!');


    }

    public function showCreateOrgForm()
    {
        if (Auth::check()) {
            $user = auth()->user();
            if ($user->user_role == "Administrateur") {
                return view('organisation.create');
            } else {
                session()->flash('error', 'Vous n\'êtes pas autorisé à effectuer cette action !');
            }
        } else {

            return redirect()->route('login');

        }


    }

    public function showEditOrgForm($code_organisation)
    {

        if (Auth::check()) {
            $user = auth()->user();
            if ($user->user_role == "Administrateur") {

                $org = Organisation::where('code_organisation', '=', $code_organisation)->first();
                return view('organisation.edit', compact('org'));
            } else {
                session()->flash('error', 'Vous n\'êtes pas autorisé à effectuer cette action !');
            }
        } else {

            return redirect()->route('login');

        }




    }
}
