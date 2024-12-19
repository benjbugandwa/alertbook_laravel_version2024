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
        Schema::create('alertes', function (Blueprint $table) {
            $table->id();
            $table->string('code_alerte')->unique();
            $table->date('date_alerte');
            $table->text('description_fais')->nullable();
            $table->string('type_incident_code')->nullable()->default('-');
            $table->string('mouvement_population')->default('Non');
            $table->string('impact_alerte')->nullable();
            $table->string('alerte_status')->default('En attente');
            $table->string('auteur_presume')->nullable();
            $table->string('profil_victime')->nullable();
            $table->string('gravite_alerte')->default('Moderée');
            $table->string('reported_by'); //Organisation
            $table->string('source_information');
            $table->string('distance_position_fardc')->nullable();
            $table->string('force_occupant_zone')->nullable();
            $table->string('accessibilite_zone')->nullable();
            $table->string('cause_inaccessibilite_zone')->nullable();

            $table->text('recommandations')->nullable();


            //Localisation
            $table->string('pcode_province');
            $table->string('pcode_territoire');
            $table->string('pcode_chefferie')->nullable();
            $table->string('pcode_groupement')->nullable();
            $table->string('pcode_zonesante');
            $table->string('pcode_airesante')->nullable();
            $table->string('pcode_village');
            $table->string('axe_route')->nullable();
            $table->string('longitude')->nullable();
            $table->string('latitude')->nullable();

            //Traçabilité
            $table->string('created_by');
            $table->string('approved_by');
            $table->date('Approved_date')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('alertes');
    }
};
