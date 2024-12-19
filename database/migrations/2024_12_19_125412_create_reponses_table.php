<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('reponses', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('alerte_id');
            $table->date('date_reponse')->nullable();
            $table->string('type_reponse');
            $table->string('code_organisation');
            $table->string('modalite_reponse');
            $table->string('secteur_couvert');
            $table->unsignedBigInteger('nbre_personnes_assistees')->default(0);
            $table->unsignedBigInteger('nbre_menages_assistes')->default(0);
            $table->text('commentaires')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reponses');
    }
};
