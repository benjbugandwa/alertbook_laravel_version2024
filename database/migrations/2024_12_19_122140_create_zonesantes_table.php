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
        Schema::create('zonesantes', function (Blueprint $table) {
            $table->string('pcode_zonesante')->primary();
            $table->string('zonesante_name')->unique();
            $table->string('pcode_territoire');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('zonesantes');
    }
};
