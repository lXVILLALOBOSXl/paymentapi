<?php

    function checkData($resultDeudor, $resultAcredor, $monto, $concepto, $isDevolution){

        //Resultado en formato JSON
        $false = '{
            "resultado":"false"
        }';
        $true = '{ "resultado":"true", ';
        
        //Si las consultas arrojaron resultados
        if ($resultDeudor->num_rows > 0 && $resultAcredor->num_rows > 0) {
                //Existe y los datos de la tarjeta del deudor y la cuenta del acredor son correctos
                $conexion = connectDB();
                //Almacenamos los datos de ambas cuentas
                $rowDeudor = $resultDeudor->fetch_array(MYSQLI_NUM);
                $rowAcredor = $resultAcredor->fetch_array(MYSQLI_NUM);

                //Verifica que la cuenta del deudor no este caducada
                $sql = "SELECT caducidad.isActive FROM validador.caducidad WHERE numeroDeTarjeta = '$rowDeudor[1]';";
                //Almacenamos el resultado de la consulta
                $resultDeudor = $conexion->query($sql);
                //Verifica que la cuenta del acredor no este caducada
                $sql = "SELECT caducidad.isActive FROM validador.caducidad WHERE numeroDeCuenta = '$rowDeudor[0]';;";
                //Almacenamos el resultado de la consulta
                $resultAcredor = $conexion->query($sql);
                //Almacenamos si el estado es valido o no
                $isValidDeudor = $resultDeudor->fetch_array(MYSQLI_NUM);
                $isValidAcredor = $resultAcredor->fetch_array(MYSQLI_NUM);

                if($isValidDeudor[0] == 1 && $isValidAcredor[0] == 1){
                    //Si ambas cuentas no estan caducadas
                    if($rowDeudor[4] > $monto){
                        //Si se cuenta con los fondos suficientes
                        //Se hace el movimiento
                        $sql = "INSERT INTO `validador`.`Movimientos` (`concepto`, `monto`, `tipo`, `cuentaAcredor`, `cuentaDeudor`) VALUES ('$concepto', '$monto', '1', '$rowAcredor[0]', '$rowDeudor[0]');";
                        $conexion->query($sql);
                        //Calculamos el nuevo saldo del acredor
                        $saldoAcredor = $rowAcredor[4] + $monto;
                        $sql = "UPDATE `validador`.`Cuenta` SET `saldo` = '$saldoAcredor' WHERE (`numeroDeCuenta` = '$rowAcredor[0]');";
                        $conexion->query($sql);
                        //Calculamos el nuevo saldo del deudor
                        $saldoDeudor = $rowDeudor[4] - $monto;
                        $sql = "UPDATE `validador`.`Cuenta` SET `saldo` = '$saldoDeudor' WHERE (`numeroDeCuenta` = '$rowDeudor[0]');";
                        $conexion->query($sql);
                        //Consultamos cual es la clave de rastreo
                        $sql = "SELECT * FROM movimientos ORDER BY numeroDeMovimiento DESC LIMIT 1;";
                        $resultFolio = $conexion->query($sql);
                        $rowFolio = $resultFolio->fetch_array(MYSQLI_NUM);
                        if($isDevolution){
                            echo '{ "resultado": "true" }';
                        }else{
                            echo $true."\"claveDeRastreo\":\"$rowFolio[0]\" }";
                        }
                    }else{
                        echo $false;
                    }
                }else{
                    echo $false;
                }
        } else {
                echo $false;
        }
    }
?>