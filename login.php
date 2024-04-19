<?php
session_start();

include '/db_conn.php';
$errors = array();

if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_STRING);
    $password = filter_input(INPUT_POST, 'password', FILTER_SANITIZE_STRING);

    $stmt = $conn->prepare("SELECT * FROM Cocineros WHERE Usuario=?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 1) {
        $user = $result->fetch_assoc();
        if (password_verify($password, $user['Contraseña'])) {
            $_SESSION['loggedin'] = true;
            header('location: /comandas.php');
        } else {
            array_push($errors, "Nombre de usuario o contraseña incorrectos");
        }
    } else {
        array_push($errors, "Nombre de usuario o contraseña incorrectos");
    }
}

if (count($errors) > 0) {
    foreach ($errors as $error) {
        echo "<p>$error</p>";
    }
}
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

  <div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4 bg-light" style="width: 400px;">
      <div class="card-body d-flex flex-column justify-content-between">
        <h2 class="card-title text-center mb-4">Iniciar Sesión</h2>
        <form action="/login.php" method="post">
          <div class="mb-3">
            <label for="username" class="form-label">Nombre de usuario:</label>
            <input type="text" class="form-control" id="username" name="username" required>
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">Contraseña:</label>
            <input type="password" class="form-control" id="password" name="password" required>
          </div>
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
