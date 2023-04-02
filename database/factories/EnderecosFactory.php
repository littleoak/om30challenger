<?php

namespace Database\Factories;

use App\Models\Enderecos;
use Illuminate\Database\Eloquent\Factories\Factory;

class EnderecosFactory extends Factory
{
    protected $model = Enderecos::class;

    public function definition()
    {
        $this->faker = \Faker\Factory::create('pt_BR');
        return [
            'endereco' => $this->faker->streetName,
            'numero' => $this->faker->buildingNumber,
            'complemento' => $this->faker->randomElement(['Apto. 101', 'Sala 202', 'Fundos']),
            'bairro' => $this->faker->citySuffix,
            'cep' => $this->faker->postcode,
            'cidade' => $this->faker->city,
            'estado' => $this->faker->stateAbbr,
        ];
    }
}


