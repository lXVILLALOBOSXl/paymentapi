<?php
    function disconnectDB($conexion){

        $close = mysqli_close($conexion);
    
            if(!$close){
                echo 'Ha sucedido un error inexperado en la desconexion de la base de datos';
            }  
    
        return $close;
    }
?>