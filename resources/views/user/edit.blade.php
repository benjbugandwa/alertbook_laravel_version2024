@extends('layouts.master')

@section('title', 'AlertBook-Ajout organisation')

@section('content')
    <!--<div class="form-container">-->


    <div class="card mb-4">




        <div class="card-header">
            <i class="fas fa-chart-area me-1"></i>
            Editer un utilisateur
        </div>
        <div class="card-body">
            <form action="{{ route('user.edit') }}" method="POST">
                @csrf

                <input hidden class="form-control" id="id" name="id" type="text" value="{{ $user->id }}"
                    placeholder="name@example.com" />
                <div class="form-floating mb-3">
                    <input class="form-control" id="name" name="name" type="text" value="{{ $user->name }}"
                        placeholder="name@example.com" />
                    <label for="inputEmail">Nom complet</label>
                    @error('name')
                        <div class="error">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-floating mb-3">
                    <input class="form-control" id="email" name="email" type="email" value="{{ $user->email }}"
                        placeholder="name@example.com" readonly />
                    <label for="inputEmail">Adresse email</label>
                    @error('email')
                        <div class="error">{{ $message }}</div>
                    @enderror
                </div>



                <div class="row mb-3">
                    <div class="col-md-6">
                        <div class="form-floating mb-3 mb-md-0">
                            <select class="form-control" name="code_organisation" id="code_organisation">
                                @foreach ($organisations as $org)
                                    <option value="{{ $org->code_organisation }}">
                                        {{ $org->code_organisation }}
                                    </option>
                                @endforeach

                            </select>

                            <label for="code_organisation">Organisation</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating mb-3 mb-md-0">
                            <a class="btn btn-primary btn-block" href="{{ route('org.showcreate') }}">Ajouter l'organisation
                                ?</a>
                        </div>
                    </div>
                </div>














                <div class="form-floating mb-3">
                    <select class="form-control" name="user_role" id="user_role">
                        <option value="Moniteur">Moniteur</option>
                        <option value="Superviseur">Superviseur</option>
                        <option value="Administrateur">Administrateur</option>

                    </select>
                    <label for="user_role">Profil utilisateur</label>
                </div>

                <div class="form-floating mb-3">
                    <input class="form-control" id="phone_number" name="phone_number" type="text"
                        value="{{ old('phone_number') }}" placeholder="name@example.com"
                        value="{{ $user->phone_number }}" />
                    <label for="inputEmail">N° Téléphone</label>
                    @error('phone_number')
                        <div class="error">{{ $message }}</div>
                    @enderror
                </div>

                <div class="form-floating mb-3">
                    <select class="form-control" name="province_code" id="province_code">
                        @foreach ($provinces as $province)
                            <option value="{{ $province->pcode_province }}">
                                {{ $province->province_name }}
                            </option>
                        @endforeach

                    </select>
                    <label for="province_code">Province</label>
                </div>

                <div class="form-floating mb-3">
                    <select class="form-control" name="is_active" id="is_active">
                        <option value="Non" {{ $user->is_active == 'Non' ? 'selected' : '' }}>Non</option>
                        <option value="Oui" {{ $user->is_active == 'Oui' ? 'selected' : '' }}>Oui</option>


                    </select>
                    <label for="is_active">Actif</label>
                </div>





                <div class="mt-4 mb-0">
                    <button type="submit" class="btn btn-primary btn-block">Modifier</button>
                    <div class="d-grid">

                    </div>
                </div>
            </form>
        </div>
        <div class="card-footer small text-muted">AlertBook</div>
    </div>






    <!--</div>-->
@endsection
