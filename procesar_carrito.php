<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "comandafacil";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$correo = $_POST['correo'];
$nombre = $_POST['nombre'];
$numero_mesa = $_POST['numero_mesa'];
$carrito = json_decode($_POST['carrito'], true);

$precio_total = 0;
foreach ($carrito as $item) {
    $precio_total += $item['precio'];
}

$codigo_pago = uniqid();

$sql = "INSERT INTO Pedidos (Correo, Nombre, Numero_Mesa, Carrito, Codigo_Pago, Precio_Total)
VALUES ('$correo', '$nombre', '$numero_mesa', '" . json_encode($carrito) . "', '$codigo_pago', $precio_total)";

if ($conn->query($sql) === TRUE) {
    echo "Pedido procesado con éxito. Tu código de pago es: $codigo_pago";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
