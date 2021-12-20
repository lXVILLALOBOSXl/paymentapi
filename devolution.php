<?php
    include("connect.php");
    include("disconnect.php");
    include("check.php");
    //Almacena la informacion necesaria que requiere el sistema para realizar devoluciones
    if(isset($_GET['rastreo'])){
        $claveDeRastreo = $_GET['rastreo'];

        $conexion = connectDB();
        //Verifica que los datos ingresados de la tarjeta del deudor existan en el sistema
        $sql = "SELECT * FROM validador.Movimientos WHERE numeroDeMovimiento = '$claveDeRastreo';";
        //Almacenamos el resultado de la consulta
        $result = $conexion->query($sql);
        $row = $result->fetch_array(MYSQLI_NUM);

        //Verifica que los datos ingresados de la tarjeta del deudor existan en el sistema
        $sql = "SELECT * FROM validador.Cuenta WHERE numeroDeCuenta = '$row[4]';";
        //Almacenamos el resultado de la consulta
        $resultDeudor = $conexion->query($sql);
        //Verifica que los datos de la cuenta del acredor existan en el sistema
        $sql = "SELECT * FROM validador.Cuenta WHERE numeroDeCuenta = '$row[5]';";
        //Almacenamos el resultado de la consulta
        $resultAcredor = $conexion->query($sql);
        checkData($resultDeudor, $resultAcredor, $row[2], $row[1], true);
        
        disconnectDB($conexion);

    }
?>