@extends('layouts.master')

@section('title', 'AlertBook-Ajout organisation')

@section('content')
    <!--<div class="form-container">-->


    <div class="card mb-4">




        <div class="card-header">
            <i class="fas fa-chart-area me-1"></i>
            Ajouter une organisation
        </div>
        <div class="card-body">
            <form action="{{ route('org.store') }}" method="POST">
                @csrf


                <div class="form-floating mb-3">
                    <input class="form-control" id="code_organisation" name="code_organisation" type="text"
                        value="{{ old('code_organisation') }}" />
                    <label for="inputEmail">Sigle de l'organisation</label>
                    @error('code_organisation')
                        <div class="error">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-floating mb-3">
                    <input class="form-control" id="denomination" name="denomination" type="text"
                        value="{{ old('denomination') }}" />
                    <label for="inputEmail">Dénomination de l'organisation</label>
                    @error('denomination')
                        <div class="error">{{ $message }}</div>
                    @enderror
                </div>

                <div class="form-floating mb-3">
                    <select class="form-control" name="type_organisation" id="type_organisation">
                        <option value="UN">Nations Unies</option>
                        <option value="ONGI">ONG Internationale</option>
                        <option value="ONGN">ONG Nationale</option>
                        <option value="SOCIV">Société civile</option>
                        <option value="GOUV">Entité gouvernementale</option>
                        <option value="AUTRE">Autre</option>
                    </select>
                    <label for="type_organisation">Catégorie</label>
                </div>

                <div class="form-floating mb-3">
                    <select class="form-control" name="secteur_activite" id="secteur_activite">
                        <option value="Urgences">Urgences</option>
                        <option value="Sante">Santé</option>
                        <option value="WASH">Eau, assainissement et hygiène</option>
                        <option value="SECAL">Sécurité alimentaire et nutrition</option>
                        <option value="PROTECTION">Protection des droits humains</option>
                        <option value="EDUCATION">Education</option>
                        <option value="ABRIS">Abris et logement</option>
                        <option value="DEV">Développement</option>
                        <option value="AUTRE">Autre</option>
                    </select>
                    <label for="secteur_activite">Secteur d'activité</label>
                </div>


                <div class="form-floating mb-3">
                    <input class="form-control" id="telephone_contact" name="telephone_contact" type="text"
                        value="{{ old('telephone_contact') }}" />
                    <label for="inputEmail">N° de contact</label>
                    @error('telephone_contact')
                        <div class="error">{{ $message }}</div>
                    @enderror
                </div>






                <div class="mt-4 mb-0">
                    <button type="submit" class="btn btn-primary btn-block">Ajouter</button>

                </div>





            </form>
        </div>
        <div class="card-footer small text-muted">AlertBook</div>
    </div>






    <!--</div>-->
@endsection
