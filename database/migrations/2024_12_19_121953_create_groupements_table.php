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
        Schema::create('groupements', function (Blueprint $table) {
            $table->string('pcode_groupement')->primary();
            $table->string('groupement_name')->unique();
            $table->string('pcode_chefferie');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('groupements');
    }
};
