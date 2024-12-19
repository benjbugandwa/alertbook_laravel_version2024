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
        Schema::create('airesantes', function (Blueprint $table) {
            $table->string('pcode_airesante')->primary();
            $table->string('airesante_name')->unique();
            $table->string('pcode_zonesante');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('airesantes');
    }
};
