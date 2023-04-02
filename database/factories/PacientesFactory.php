<?php

namespace Database\Factories;

//use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Pacientes;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class PacientesFactory extends Factory
{
    protected $model = Pacientes::class;

    public function definition()
    {
        $this->faker = \Faker\Factory::create('pt_BR');

        return [
            'nome' => $this->faker->name,
            'nome_mae' => $this->faker->name,
            'data_nascimento' => $this->faker->date(),
            'cpf' => $this->faker->cpf,
            'cns' => Str::random(15),
            'foto' => 'pacientes_fotos/'.Str::random(177).'.png',
        ];
    }
}
