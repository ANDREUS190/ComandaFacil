<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ComandaFacil</title>
  <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="./estilos.css" rel="stylesheet">
</head>

<body class="bg-dark">
<?php include 'header.php'; ?>

  <div class="container">
    <h2 class="text-center text-light">Comanda Fácil</h2>
    <p class="text-justify text-light">La aplicación permitirá a los clientes realizar pedidos desde sus mesas mediante un código QR. Cada mesa tendrá un enlace que redirigirá a los clientes a una página web específica para realizar sus pedidos. Además, una vez que el cliente haya realizado su pedido, se generará un número de pedido único. El cliente deberá presentar este número en el mostrador al momento de pagar.</p>
  </div>

  <div class="container mt-5">
    <div class="row">
      <div class="col-md-4 d-flex align-items-stretch">
        <div class="card">
          <img class="card-img-top" src="img/noticias/restaurante.png" alt="Nuevo restaurante">
          <div class="card-body">
            <h5 class="card-title">Nuevo restaurante en Vila-real</h5>
            <p class="card-text">Ven a descubrir nuestro nuevo restaurante en Vila-real. Disfruta de una experiencia gastronómica única en un ambiente acogedor.</p>
          </div>
        </div>
      </div>
      <div class="col-md-4 d-flex align-items-stretch">
        <div class="card">
          <img class="card-img-top" src="img/noticias/paella.png" alt="Publicidad de nuestra paella">
          <div class="card-body">
            <h5 class="card-title">Nuestra deliciosa paella</h5>
            <p class="card-text">Prueba nuestra auténtica paella valenciana, preparada con ingredientes frescos y mucho amor.</p>
          </div>
        </div>
      </div>
      <div class="col-md-4 d-flex align-items-stretch">
        <div class="card">
          <img class="card-img-top" src="img/noticias/descuento.png" alt="Oferta de cumpleaños">
          <div class="card-body">
            <h5 class="card-title">Oferta de cumpleaños</h5>
            <p class="card-text">Celebra tu cumpleaños con nosotros y disfruta de un 50% de descuento en tu comida. ¡Te esperamos!</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="./bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
