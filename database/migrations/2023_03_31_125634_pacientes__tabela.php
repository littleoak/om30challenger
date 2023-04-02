<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('pacientes', function (Blueprint $table) {
            $table->id();
            $table->string('nome', 177);
            $table->string('nome_mae', 177);
            $table->date('data_nascimento');
            $table->string('cpf', 14);
            $table->string('cns', 15); //com espaços em média fica 18
            $table->string('foto')->nullable(); #não sei se o critério do teste foi nulo na foto ou obrigatório
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pacientes');
    }
};
