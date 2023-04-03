<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Pacientes;
use Illuminate\Http\Request;

class FotosPacientesController extends Controller
{
    #controller específica para upload de IMAGENS de paciente
    public function upload(Request $request)
    {

        $news = 'Algum erro ocorreu no upload da imagem';
        $apiCode = 400;
        $pacienteId = $request->has('paciente');
        $user = Pacientes::find($pacienteId);
        
        if($user == null) return response()->json($news, $apiCode);

        $uploadPath = $request->hasFile('imagem')
            ? $request->file('imagem')->store('pacientes_fotos', 'public')
            : null;

        if($uploadPath) {
            $user->update(['foto' => $uploadPath]);
            return response()->json($uploadPath, 200);
        }

        return response()->json($news, $apiCode);
    }


}
