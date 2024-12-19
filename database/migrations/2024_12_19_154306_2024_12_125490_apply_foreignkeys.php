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
        //
        Schema::table('users', function (Blueprint $table) {
            //
            $table->foreign('code_organisation')->references('code_organisation')->on('organisations')->onDelete('cascade');
        });

        Schema::table('territoires', function (Blueprint $table) {
            //
            $table->foreign('pcode_province')->references('pcode_province')->on('provinces')->onDelete('cascade');
        });

        Schema::table('chefferies', function (Blueprint $table) {
            //
            $table->foreign('pcode_territoire')->references('pcode_territoire')->on('territoires')->onDelete('cascade');
        });

        Schema::table('groupements', function (Blueprint $table) {
            //
            $table->foreign('pcode_chefferie')->references('pcode_chefferie')->on('chefferies')->onDelete('cascade');
        });

        Schema::table('zonesantes', function (Blueprint $table) {
            //
            $table->foreign('pcode_territoire')->references('pcode_territoire')->on('territoires')->onDelete('cascade');
        });

        Schema::table('airesantes', function (Blueprint $table) {
            //
            $table->foreign('pcode_zonesante')->references('pcode_zonesante')->on('zonesantes')->onDelete('cascade');
        });

        Schema::table('violationalertes', function (Blueprint $table) {
            //
            $table->foreign('alerte_id')->references('id')->on('alertes')->onDelete('cascade');
        });

        Schema::table('reponses', function (Blueprint $table) {
            //
            $table->foreign('alerte_id')->references('id')->on('alertes')->onDelete('cascade');
        });

        Schema::table('mouvementpopulations', function (Blueprint $table) {
            //
            $table->foreign('alerte_id')->references('id')->on('alertes')->onDelete('cascade');
        });

        //

        //$table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
        /* Schema::table('mouvementpopulations', function (Blueprint $table) {
             
         });*/
    }
};
