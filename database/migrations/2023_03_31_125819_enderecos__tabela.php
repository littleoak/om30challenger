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
        Schema::create('enderecos', function (Blueprint $table) {
            $table->id();
            $table->foreignId('pacientes_id')->constrained()->onDelete('cascade');
            $table->string('endereco', 177);
            $table->string('numero', 20); //pode ter SEM NÚMERO, e números que não são calculados precisam ser STRING
            $table->string('complemento', 177);
            $table->string('bairro', 177);
            $table->string('cidade', 177);
            $table->string('estado', 177);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('enderecos');
    }
};
