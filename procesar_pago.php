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
    header("Location: empleados.php");
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
