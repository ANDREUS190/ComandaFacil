<?php
if(isset($_POST['carrito'])) {
    $carrito = json_decode($_POST['carrito'], true);
    
    $conn = mysqli_connect("localhost", "root", "", "comandafacil");
    if (!$conn) {
        die("Error al conectar con la base de datos: " . mysqli_connect_error());
    }
    
    foreach($carrito as $item) {
        $nombre = mysqli_real_escape_string($conn, $item['nombre']); 
        $precio = floatval($item['precio']); 
        
        $sql = "INSERT INTO Pedidos (nombre_plato, precio_plato) VALUES ('$nombre', $precio)";
        
        if (mysqli_query($conn, $sql)) {
            echo "Pedido insertado correctamente en la base de datos.";
        } else {
            echo "Error al insertar pedido: " . mysqli_error($conn);
        }
    }
    
    mysqli_close($conn);
    
} else {
    echo "No se ha recibido ningún dato del carrito.";
}
?>
