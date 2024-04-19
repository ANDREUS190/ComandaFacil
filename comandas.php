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
  <?php include 'header.php'; ?>

  <div id="login-form" class="container mt-5">
    <div class="card">
      <div class="card-header">
        <h2>Por favor, introduce tus datos</h2>
      </div>
      <div class="card-body">
        <form>
          <div class="form-group">
            <label for="email">Correo electrónico:</label>
            <input type="email" class="form-control" id="email" placeholder="Introduce tu correo electrónico" required>
          </div>
          <div class="form-group">
            <label for="name">Nombre:</label>
            <input type="text" class="form-control" id="name" placeholder="Introduce tu nombre" required>
          </div>
          <div class="form-group">
            <label for="table-number">Número de mesa:</label>
            <input type="number" class="form-control" id="table-number" placeholder="Introduce el número de tu mesa"
              required>
          </div>
        </form>
      </div>
    </div>
  </div>
  
  <div class="container-fluid mt-5">
    <div class="row">
      <div class="col-md-9">
        <div id="barra-menu" class="bg-dark">
          <div id="category-buttons" class="mb-3 d-flex justify-content-around">
            <button class="btn btn-primary category-button" data-category="Comidas">Comidas</button>
            <button class="btn btn-primary category-button" data-category="Bebidas">Bebidas</button>
            <button class="btn btn-primary category-button" data-category="Postres">Postres</button>
            <button class="btn btn-primary category-button" data-category="Aperitivos">Aperitivos</button>
            <button class="btn btn-primary category-button" data-category="Bocadillos">Bocadillos</button>
          </div>
        </div>

        <form id="menu-form" class="row">
        </form>
      </div>
      <div class="col-md-3">
        <aside id="carrito" class="bg-light p-3">
          <h4>Carrito</h4>
          <ul id="carrito-lista">
          </ul>
          <button id="enviar-carrito" class="btn btn-success mt-3">Enviar carrito</button>
        </aside>
      </div>
    </div>
  </div>
  <form id="enviar-carrito-form" action="procesar_carrito.php" method="POST"></form>

  <script src="./bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="script_comanda.js"></script>
</body>

</html>