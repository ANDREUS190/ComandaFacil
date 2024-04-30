<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "comandafacil";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("La conexión ha fallado: " . $conn->connect_error);
}

$sql = "SELECT * FROM pedidos WHERE Finalizado = 0";
$result = $conn->query($sql);
$pedidos = array();

while ($row = $result->fetch_assoc()) {
    $pedidos[] = $row;
}

echo json_encode($pedidos);

$conn->close();
?>
