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
        Schema::create('violationalertes', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('alerte_id');
            $table->date('date_violation')->nullable();
            $table->string('type_violation');
            $table->text('details_violation');
            $table->integer('nombre_total_victimes');
            $table->integer('nombre_victimes_hommes');
            $table->integer('nombre_victimes_femmes');
            $table->integer('nombre_victimes_enfants');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('violationalertes');
    }
};
