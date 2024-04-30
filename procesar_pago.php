<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "comandafacil";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("La conexión ha fallado: " . $conn->connect_error);
}

$id_pedido = $_POST['id_pedido'];

$sql = "UPDATE Pedidos SET pagado = TRUE WHERE id_pedido = $id_pedido";

if ($conn->query($sql) === TRUE) {
    // Devuelve un mensaje JSON indicando éxito
    echo json_encode(array("success" => true));
} else {
    // En caso de error, devuelve un mensaje JSON con el error
    echo json_encode(array("success" => false, "error" => "Error al marcar el pedido como pagado."));
}

$conn->close();
?>
