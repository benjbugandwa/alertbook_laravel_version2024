@extends('layouts.master')

@section('title', 'AlertBook-Liste des utilisateurs')

@section('content')
    <!--<div class="form-container">-->


    <div class="card mb-4">




        <div class="card-header">
            <i class="fas fa-chart-area me-1"></i>
            Liste des utilisateurs
        </div>
        <div class="card-body">

            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>Email</th>
                        <th>Nom</th>
                        <th>Organisation</th>
                        <th>Profil</th>
                        <th>Téléphone</th>
                        <th>Statut</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($users as $user)
                        <tr>
                            <td>{{ $user['email'] }}</td>
                            <td>{{ $user['name'] }}</td>
                            <td>{{ $user['code_organisation'] }}</td>
                            <td>{{ $user['user_role'] }}</td>
                            <td>{{ $user['phone_number'] }}</td>
                            <td>{{ $user['is_active'] }}</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown"
                                        aria-expanded="false">
                                        Action
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item"
                                                href="{{ route('user.show', ['id' => $user->id]) }}">Activer</a></li>
                                        <li><a class="dropdown-item"
                                                href="{{ route('user.show', ['id' => $user->id]) }}">Editer</a></li>

                                    </ul>
                                </div>

                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>







        </div>
        <div class="card-footer small text-muted">AlertBook</div>
    </div>






    <!--</div>-->
@endsection
