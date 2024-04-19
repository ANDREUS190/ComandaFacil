<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "comandafacil";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("La conexión ha fallado: " . $conn->connect_error);
}

session_start();

$error = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['action']) && $_POST['action'] == 'logout') {
        session_destroy();
        header("Location: login.php");
        exit;
    } else {
        $username = $_POST['username'];
        $password = $_POST['password'];

        $sql = "SELECT id_cocinero FROM cocineros WHERE username = '$username' and password = '$password'";
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();

        if ($row) {
            $_SESSION['login_user'] = $username;
        } else {
            $error = "Tu nombre de usuario o contraseña es inválida.";
        }
    }
}

if (isset($_SESSION['login_user'])) {
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="./estilos.css" rel="stylesheet">
</head>

<body class="bg-dark">
    <header>
        <nav class="bg-dark navbar navbar-expand-lg navbar-dark">
            <div class="container">
                <a class="navbar-brand titulo" href="index.php">ComandaFácil</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="comandas.php">Pedir Comida</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="menu.php">Menú</a>
                        </li>
                        <li class="nav-item">
                            <form action="#" method="post">
                                <input type="hidden" name="action" value="logout">
                                <button type="submit" class="btn btn-danger">Cerrar Sesión</button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>


    <div class="d-flex justify-content-center align-items-center vh-100 mt-0">
        <img src="./img/video_publi.gif" alt="publi">
    </div>

    <script src="./bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>

<?php
} else {
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Iniciar Sesión</title>
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="./estilos.css" rel="stylesheet">
</head>

<body class="bg-dark">
    <?php include 'header.php'; ?>

    <div class="container d-flex justify-content-center align-items-center">
        <div class="card bg-light" style="width: 400px;">
            <div class="card-body d-flex flex-column justify-content-between">
                <h2 class="card-title text-center mb-4">Iniciar Sesión</h2>
                <form id="loginForm" action="#" method="post">
                    <div class="mb-3">
                        <label for="username" class="form-label">Nombre de usuario:</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Contraseña:</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <?php if (!empty($error)) { ?>
                    <div class="alert alert-danger" role="alert">
                        <?php echo $error; ?>
                    </div>
                    <?php } ?>
                    <div class="d-grid gap-2 mt-4">
                        <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="./bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>

<?php
}
?>