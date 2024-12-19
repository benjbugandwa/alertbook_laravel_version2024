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
        Schema::create('mouvementpopulations', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('alerte_id');
            $table->date('date_mouvement')->nullable();
            $table->string('type_mouvement');
            $table->string('pcode_province_provenance');
            $table->string('pcode_territoire_provenance');
            $table->string('village_provenance');

            $table->string('pcode_province_accueil');
            $table->string('pcode_territoire_accueil');
            $table->string('village_accueil');
            $table->unsignedBigInteger('nbre_personnes')->default(0);
            $table->unsignedBigInteger('nbre_menages')->default(0);
            $table->string('site_spontane')->default('Non');
            $table->text('commentaires')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mouvementpopulations');
    }
};
