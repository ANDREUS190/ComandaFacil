<?php
header('Content-Type: application/json');

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "comandafacil";

$conn = new mysqli($servername, $username, $password, $dbname);


$sql = "SELECT * FROM pedidos WHERE pagado = TRUE AND finalizado = FALSE";
$result = $conn->query($sql);
$pedidos = array();

while ($row = $result->fetch_assoc()) {
    $pedidos[] = $row;
}

echo json_encode($pedidos);

$conn->close();
?>
