<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\Pacientes;
use Illuminate\Http\Request;

class PacientesController extends Controller
{
    #mostrar pacientes overall, quando está listando sem critérios - bom paginar já
    public function index(Request $request)
    {
        $news = 'Bem Vindo a API OMG30 - Restful Ready';
        $apiCode = 400;
        $page = null;
        $query = Pacientes::query();

        if($request->has('page')) $page = $request->page;

        if($request->has('nome')) {
             $count = $query->where('nome', 'LIKE', '%'.$request->nome.'%')->count();
             if($count > 0) {
                 if($page !== null) {
                     $news = $query->paginate(7, ['*'], 'page', $page);
                 } else {
                     $news = $query->paginate(7);
                 }
                 $apiCode = 200;
             }
         }

         if($request->has('cpf')) {
             $count = $query->where('cpf', 'LIKE', '%'.$request->cpf.'%')->count();
             if($count > 0) {
                 if($page !== null) {
                     $news = $query->paginate(1, ['*'], 'page', $page);
                 } else {
                     $news = $query->paginate(1);
                 }
                 $apiCode = 200;
             }
         }

        return response()->json($news, $apiCode);
    }

    #mostrar paciente por search, paginar aqui também é bom
    public function show(int $pacientes)
    {

        $apiCode = 404;
        $news = 'consulta vazia ou sem retorno';
        $pacientesModel = Pacientes::find($pacientes);

        if($pacientesModel !== null) {
            return response()->json($pacientesModel, 200);
        }
        return response()->json($news, $apiCode);
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
    public function destroy(int $pacientes)
    {
        $del = 0;
        
        if(filter_var($pacientes, FILTER_VALIDATE_INT) !== false) $del = Pacientes::destroy($pacientes);
        if($del) {
            return response()->json('Paciente Removido Com Sucesso', 200);
        }

        return response()->json('Erro ou Inexistência', 404);

    }

}
