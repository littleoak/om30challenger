<?php

// app/Jobs/ProcessCsvJob.php
namespace App\Jobs;

use App\Models\Pacientes;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class ProcessCsvJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $path;

    public function __construct($path)
    {
        $this->path = $path;
    }
    public function handle()
    {
        $handle = fopen(storage_path('app/'.$this->path), 'r');

        while (($data = fgetcsv($handle, 1000, ',')) !== false) {
            $model = new Pacientes([
                'nome' => $data[0],
                'nome_mae' => $data[1],
                'data_nascimento' => $data[2],
                'cpf' => $data[3],
                'cns' => $data[4],
                'foto' => $data[5],
            ]);

            $model->save();
        }

        fclose($handle);
        Storage::delete($this->path);
    }
}
