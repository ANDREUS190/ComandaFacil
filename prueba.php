<?php
// Parámetros de conexión a la base de datos
$host = "localhost";
$username = "root";
$password = "";
$database = "comandafacil";

// Crear una conexión a la base de datos
$conn = new mysqli($host, $username, $password, $database);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Inicializar variables
$username = "";
$password = "";
$errors = array();

// Si se envía el formulario de inicio de sesión
if (isset($_POST['login'])) {
    // Obtener los datos del usuario
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Validar los datos
    if (empty($username)) {
        array_push($errors, "El nombre de usuario es obligatorio");
    }
    if (empty($password)) {
        array_push($errors, "La contraseña es obligatoria");
    }

    // Autenticar al usuario
    if (count($errors) == 0) {
        $query = "SELECT * FROM Cocineros WHERE Usuario='$username' AND Contraseña='$password'";
        $result = $conn->query($query);

        if ($result->num_rows == 1) {
            // Usuario encontrado, redirigir a otro archivo
            header('location: otro_archivo.php');
        } else {
            array_push($errors, "Nombre de usuario o contraseña incorrectos");
        }
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Iniciar sesión</title>
</head>
<body>
    <h2>Iniciar sesión</h2>
    <form method="post" action="login.php">
        <?php include('errores.php'); ?>
        <div>
            <label for="username">Nombre de usuario:</label>
            <input type="text" name="username" value="<?php echo $username; ?>">
        </div>
        <div>
            <label for="password">Contraseña:</label>
            <input type="password" name="password">
        </div>
        <button type="submit" name="login">Iniciar sesión</button>
    </form>
</body>
</html>
