<?php

namespace App\Http\Controllers\Api;

use App\Jobs\ProcessCsvJob;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CsvImportadorController extends Controller
{
    #controller específica para upload de CSV de paciente

    public function importCsv(Request $request)
    {
        $file = $request->file('csv_file');
        $path = $file->store('temp');
        ProcessCsvJob::dispatch($path);
        return redirect()->back()->with('status', 'O CSV foi importado com sucesso e está sendo processado em segundo plano.');
    }

}
