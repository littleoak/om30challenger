<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PacientesController extends Controller
{
    #mostrar pacientes overall, quando está listando sem critérios - bom paginar já
    public function index(Request $request)
    {
        $arrayzada = ['thanksGod', 'thanksJesus', 'thanksChallengerOm30'];
        return response()->json($arrayzada, '200');
    }

    #mostrar paciente por search, paginar aqui também é bom
    public function show()
    {

    }

    #insert do paciente
    public function store()
    {

    }

    #atualizando um dado do paciente
    public function update()
    {

    }

    #removendo um paciente
    public function destroy()
    {

    }

}
