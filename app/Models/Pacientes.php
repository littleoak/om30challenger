<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pacientes extends Model
{
    use HasFactory;
    protected $appends = ['link'];
    protected $with = ['enderecos'];

    public function enderecos()
    {
        return $this->hasOne(Enderecos::class);
    }

    public function link(): Attribute //com appends a gente disse que LINK que não é uma coluna na tabela
        //deve ser chamado, no topo na var appends
    {
        return new Attribute(
            get: fn() => [[
                'rel' => 'self',
                'url' => "/api/pacientes/{$this->id}"
            ],
                [
                    'rel' => 'enderecos',
                    'url' => "/api/pacientes/{$this->id}/enderecos"
                ],
            ]);
    }

    protected static function booted()
    {
        self::addGlobalScope('ordered', function(Builder $queryBuilder) {
            $queryBuilder->orderBy('nome', 'asc');
        });
    }


}
