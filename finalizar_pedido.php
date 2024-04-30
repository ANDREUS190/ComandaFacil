<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "comandafacil";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("La conexión ha fallado: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $pedido_id = $_POST['pedido_id'];

    $sql = "UPDATE Pedidos SET finalizado = 1 WHERE id = $pedido_id";
    if ($conn->query($sql) === TRUE) {
        echo "Pedido finalizado con éxito.";
    } else {
        echo "Error al finalizar el pedido: " . $conn->error;
    }
}

$conn->close();
?>
