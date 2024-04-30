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

do {
    $codigo_pago = rand(100, 999);
    $result = $conn->query("SELECT * FROM pedidos WHERE codigo_pago = '$codigo_pago'");
} while ($result->num_rows > 0);

$sql = "INSERT INTO pedidos (Correo, nombre, numero_Mesa, carrito, codigo_pago, precio_total)
VALUES ('$correo', '$nombre', '$numero_mesa', '" . json_encode($carrito) . "', '$codigo_pago', $precio_total)";

if ($conn->query($sql) === TRUE) {
    echo "Pedido procesado con éxito. Tu código de pago es: $codigo_pago";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
