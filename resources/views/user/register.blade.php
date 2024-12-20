@extends('layouts.auth')

@section('title', 'Créer un compte')

@section('content')
@section('card_title', 'Créer votre compte ici')


<form action="{{ route('register') }}" method="POST">
    @csrf


    <div class="form-floating mb-3">
        <input class="form-control" id="name" name="name" type="text" value="{{ old('name') }}"
            placeholder="name@example.com" />
        <label for="inputEmail">Nom complet</label>
        @error('name')
            <div class="error">{{ $message }}</div>
        @enderror
    </div>
    <div class="form-floating mb-3">
        <input class="form-control" id="email" name="email" type="email" value="{{ old('email') }}"
            placeholder="name@example.com" />
        <label for="inputEmail">Adresse email</label>
        @error('email')
            <div class="error">{{ $message }}</div>
        @enderror
    </div>

    <div class="form-floating mb-3">
        <input class="form-control" id="phone_number" name="phone_number" type="text"
            value="{{ old('phone_number') }}" placeholder="name@example.com" />
        <label for="inputEmail">N° Téléphone</label>
        @error('phone_number')
            <div class="error">{{ $message }}</div>
        @enderror
    </div>

    <div class="form-floating mb-3">
        <select class="form-control" name="pcode_province" id="pcode_province">
            @foreach ($provinces as $province)
                <option value="{{ $province->pcode_province }}">
                    {{ $province->province_name }}
                </option>
            @endforeach

        </select>
        <label for="pcode_province">Province</label>
    </div>



    <div class="row mb-3">
        <div class="col-md-6">
            <div class="form-floating mb-3 mb-md-0">
                <input class="form-control" id="password" name="password" type="password"
                    placeholder="Create a password" />
                <label for="password">Mot de passe</label>
            </div>
            @error('password')
                <div class="error">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-md-6">
            <div class="form-floating mb-3 mb-md-0">
                <input class="form-control" id="password_confirmation" name="password_confirmation" type="password"
                    placeholder="Confirm password" />
                <label for="password_confirmation">Confirmer le mot de passe</label>
            </div>
        </div>
    </div>
    <div class="mt-4 mb-0">
        <div class="d-grid">
            <button type="submit" class="btn btn-primary btn-block">Créer un
                compte</button>
        </div>
    </div>
</form>

@endsection
