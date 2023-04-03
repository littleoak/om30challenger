<?php

namespace App\Traits;

trait CnsTrait
{

    function validadorDeCns($numeroCartao)
    {
        $numeroCartao = preg_replace('/[^0-9]/', '', (string) $numeroCartao);

        // Etapa 1: Validar tamanho do número do cartão
            if (strlen($numeroCartao) !== 15) {
                echo 'erro em 15';
                return false;
            }

        $invalidos = [
            '000000000000000',
            '111111111111111',
            '222222222222222',
            '333333333333333',
            '444444444444444',
            '555555555555555',
            '666666666666666',
            '777777777777777',
            '888888888888888',
            '999999999999999'
        ];

        if (in_array($numeroCartao, $invalidos)) {
            echo 'erro repetidos';
            return false;
        }

            // Etapa 2: Calcular dígito verificador
            $soma = 0;
            for ($i = 0; $i < 14; $i++) {
                $digito = intval($numeroCartao[$i]);
                if ($i % 2 === 0) {
                    $soma += $digito;
                } else {
                    $digitoX2 = $digito * 2;
                    $soma += ($digitoX2 >= 10 ? ($digitoX2 - 9) : $digitoX2);
                }
            }

            $digitoVerificadorCalculado = ceil($soma / 10) * 10;

            // Etapa 3: Validar dígito verificador
            $digitoVerificador = intval($numeroCartao[14]);
            echo $digitoVerificador.'< dv | calc > '.$digitoVerificadorCalculado.PHP_EOL;
            return ($digitoVerificador === $digitoVerificadorCalculado);
    }
}
