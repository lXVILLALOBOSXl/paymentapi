<?php
    header ("Content-Type: application/json");
    include("connect.php");
    include("disconnect.php");
    include("check.php");

        //Almacena la informacion necesaria que requiere el sistema para realizar los pagos en formato JSON
        $_POST = json_decode(file_get_contents('php://input', true));
        //Separamos la informacion por campos
        $resultado = $_POST;
        $concepto = $resultado->{'concepto'};
        $monto = $resultado->{'monto'};
        $numeroDeTarjetaDeudor = $resultado->{'numeroDeTarjetaDeudor'};
        $cvvDeudor = $resultado->{'cvvDeudor'};
        $fechaDeVencimientoDeudor = $resultado->{'fechaDeVencimientoDeudor'}."-01";
        $numeroDeCuentaAcredor = $resultado->{'numeroDeCuentaAcredor'};

        $conexion = connectDB();
        try {
            //Verifica que los datos ingresados de la tarjeta del deudor existan en el sistema
            $sql = "SELECT * FROM validador.Cuenta WHERE numeroDeTarjeta = '$numeroDeTarjetaDeudor' AND cvv = '$cvvDeudor' AND  fechaDeVencimiento = '$fechaDeVencimientoDeudor';";
            //Almacenamos el resultado de la consulta
            $resultDeudor = $conexion->query($sql);
            //Verifica que los datos de la cuenta del acredor existan en el sistema
            $sql = "SELECT * FROM validador.Cuenta WHERE numeroDeCuenta = '$numeroDeCuentaAcredor';";
            //Almacenamos el resultado de la consulta
            $resultAcredor = $conexion->query($sql);
            checkData($resultDeudor, $resultAcredor, $monto, $concepto, false);
        } catch (\Throwable $th) {
            echo json_encode(array("error" => $th->getMessage()));
        }
        
        disconnectDB($conexion);
    
    
?>