<?php

namespace App\Traits;

trait CnsTraitOld
{

    function validadorDeCns($cns)
    {

        $cns = preg_replace('/[^0-9]/', '', (string) $cns);
        if (strlen($cns) != 15) return false;

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

        if (in_array($cns, $invalidos)) {
            return false;
        }

        // check sum pis
        $acao = substr($cns, 0, 1);

        switch ($acao):
            case '1':
            case '2':
                $ret = $this->validaCns($cns);
                break;
            case '7':
            case '8':
            case '9':
                $ret = $this->validaCnsProvisorio($cns);
                break;
            default:
                $ret = false;
        endswitch;

        return $ret;
    }

    function validaCns($cns)
    {
        // check sum pis
        $pis = substr($cns, 0, 11);
        $soma = 0;

        for ($i = 0, $j = strlen($pis), $k = 15; $i < $j; $i++, $k--) {
            $soma += $pis[$i] * $k;
        }

        $dv = 11 - fmod($soma, 11);
        $dv = ($dv != 11) ? $dv : '0'; // '0' se for igual a 11

        if ($dv == 10) {
            $soma += 2;
            $dv = 11 - fmod($soma, 11);
            $resultado = $pis . '001' . $dv;
        } else {
            $resultado = $pis . '000' . $dv;
        }

        if ($cns != $resultado) {
            return false;
        } else {
            return true;
        }
    }

    function validaCnsProvisorio($cns)
    {

        $soma = 0;

        for ($i = 0, $j = strlen($cns), $k = $j; $i < $j; $i++, $k--) {
            $soma += (int)$cns[$i] * $k;
        }

        return $soma % 11 == 0 && $j == 15;
    }
}
