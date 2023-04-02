<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Pacientes;
use App\Models\Enderecos;

class PacientesTableSeeder extends Seeder
{
    public function run()
    {
        Pacientes::factory()->count(77)->create()->each(function ($paciente) {
            $endereco = Enderecos::factory()->make();
            $paciente->enderecos()->save($endereco);
        });
    }
}
