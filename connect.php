<?php
    function connectDB(){
        
        //Datos para conectarnos a la BD
        $server = "localhost";
        $user = "root";
        $pass = "";
        $bd = "validador";

        $conexion = mysqli_connect($server, $user, $pass,$bd);

        //Si no hubo conexion
        if(!$conexion){
            echo 'Ha sucedido un error inexperado en la conexion de la base de datos';
        }

    return $conexion;
}
?>