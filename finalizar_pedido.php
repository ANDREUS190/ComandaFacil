<?php
header('Content-Type: application/json');

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "comandafacil";

$conn = new mysqli($servername, $username, $password, $dbname);


if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}


$id_pedido = $_POST['id_pedido'];


$sql = "UPDATE pedidos SET Finalizado = TRUE WHERE id_pedido = $id_pedido";


if ($conn->query($sql) === TRUE) {
    echo json_encode(array("success" => true));
} else {
    echo json_encode(array("success" => false, "error" => $conn->error));
}

$conn->close();
?>
