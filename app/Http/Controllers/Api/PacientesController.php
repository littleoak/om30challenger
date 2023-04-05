<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\Pacientes;
use Illuminate\Http\Request;
use App\Traits\CnsTrait;


class PacientesController extends Controller
{
    use CnsTrait;

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
    public function store(Request $request)
    {
        //$cns = "237 2443 5445 0003"; //nice
        //$cns = "732 0155 4019 0001"; //nice
        //$cns = "732 1155 4419 9999"; //troll
        $news = null;
        $cns = $this->limparNumerosCns($request->cns);
        #DEADLINE :( - ENCERRAR DADOS ERRADOS DE FORMA SIMBÓLICA - > Poderia haver uma validação mais gostosa :(, deadline
        if(!$request->has('cns')) $news = 'Erro de CNS Vazio. ';
        if(!$request->has('nome')) $news .= 'Erro de NOME Vazio. ';
        if(!$request->has('nome_mae')) $news .= 'Erro de NOME DA MÃE Vazio. ';
        if(!$request->has('cpf')) $news .= 'Erro de CPF Vazio. ';
        if(!$request->has('data_nascimento')) $news .= 'Erro de DATA DE NASCIMENTO Vazia. ';
        if(!$this->validadorDeCns($cns)) $news .= 'Erro de CNS ERRADO/INVÁLIDO. ';
        if(!empty($news)) return response()->json($news, 404);

        $data = request()->only(['nome', 'nome_mae', 'data_nascimento', 'cpf', 'cns']);
        if(Pacientes::create($data)) return response()->json('Dados Perfeitos! Atente para o Resource com EndPoint /api/fotoupload INFORMANDO paciente como ID em POST', 200);

        return response()->json('Erro na Inserção de Dados'.$news, 404);

    }

    #atualizando um dado do paciente
    public function update()
    {

    }

    #removendo um paciente por ID
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
