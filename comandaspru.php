<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ComandaFácil</title>

  <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="estilos.css" rel="stylesheet">
</head>

<body class="bg-dark">
  <nav class="bg-dark navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
      <a class="navbar-brand titulo" href="#">ComandaFácil</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Inicio</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Menú</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Empleados</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="container mt-5">
    <div class="row">
      <div class="col-md-9">
        <form id="menu-form" class="row row-cols-1 row-cols-md-3">
          <?php
          $conn = mysqli_connect("localhost", "root", "", "comandafacil");

          if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
          }

          $result = mysqli_query($conn, "SELECT * FROM Comidas");

          while ($row = mysqli_fetch_assoc($result)) {
            echo "<div class='col-6 mb-3'>";
            echo "<div class='card'>";
            echo "<img src='" . $row["Imagen_URL"] . "' class='card-img-top' alt='" . $row["Nombre"] . "'>";
            echo "<div class='card-body'>";
            echo "<h3 class='card-title'>" . $row["Nombre"] . "</h3>";
            echo "<p class='card-text'>" . $row["Descripción"] . "</p>";
            echo "<p class='card-text'>Precio: $" . $row["Precio"] . "</p>";
            echo "<input type='hidden' name='dish_id[]' value='" . $row["ID_Comida"] . "'>";
            echo "<div class='text-center'>";
            echo "<button class='btn btn-primary mt-2 add_to_cart' type='button'>Añadir al carrito</button>";
            echo "</div>";
            echo "</div>";
            echo "</div>";
            echo "</div>";
          }
          mysqli_close($conn);
          ?>
        </form>
      </div>
      <div class="col-md-3">
        <aside id="carrito" class="bg-light p-3" style="height: 100%; overflow-y: auto;">
          <h4>Carrito</h4>
          <ul id="carrito-lista">
          </ul>
          <button id="enviar-carrito" class="btn btn-success mt-3">Enviar carrito</button>
        </aside>
      </div>
    </div>
  </div>
  <form id="enviar-carrito-form" action="procesar_carrito.php" method="POST">
</form>

<script src="./bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="script_comanda.js"></script>
</body>

</html>
