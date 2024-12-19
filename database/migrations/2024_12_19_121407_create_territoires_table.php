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
        Schema::create('territoires', function (Blueprint $table) {
            $table->string('pcode_territoire')->primary();
            $table->string('territoire_name')->unique();
            $table->string('pcode_province');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('territoires');
    }
};
