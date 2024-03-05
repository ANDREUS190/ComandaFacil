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

  <div class="container mt-5">
    <form action="procesar_pedido.php" method="post">
      <div class="mb-3">
        <label for="bebida" class="form-label">Elige tu bebida</label>
        <select class="form-select" id="bebida" name="bebida">
          <?php
          $mysqli = new mysqli('localhost', 'root', '', 'comandafacil');

          if ($mysqli->connect_error) {
            die("La conexión falló: " . $mysqli->connect_error);
          }

          $result = $mysqli->query("SELECT id_bebida, nombre FROM bebidas");

          while ($row = $result->fetch_assoc()) {
            echo "<option value=\"" . $row['id_bebida'] . "\">" . $row['nombre'] . "</option>";
          }

          $mysqli->close();
          ?>
        </select>
      </div>
      <div class="mb-3">
        <label for="tamaño" class="form-label">Elige el tamaño</label>
        <select class="form-select" id="tamaño" name="tamaño">
          <?php
          $mysqli = new mysqli('localhost', 'root', '', 'comandafacil');

          if ($mysqli->connect_error) {
            die("La conexión falló: " . $mysqli->connect_error);
          }

          $result = $mysqli->query("SELECT id_tamaño, nombre FROM tamaños");

          while ($row = $result->fetch_assoc()) {
            echo "<option value=\"" . $row['id_tamaño'] . "\">" . $row['nombre'] . "</option>";
          }

          $mysqli->close();
          ?>
        </select>
      </div>
      <button type="submit" class="btn btn-primary">Enviar pedido</button>
    </form>
  </div>

  <script src="./bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
