<?php
// Iniciar una sesión
session_start();

// Comprobar si el usuario ha iniciado sesión
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header('location: login.php');
    exit;
}
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
  <?php include 'header.php'; ?>
    <p>trabajadores</p>

  <script src="./bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
