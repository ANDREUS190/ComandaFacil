<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ComandaFácil</title>

    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="estilos.css" rel="stylesheet">
</head>

<body>
    <?php include 'header.php'; ?>
    <div class="container-fluid mt-5">
        <div class="row">
            <div id="barra-menu">
                <div id="category-buttons" class="mb-3 d-flex justify-content-around">
                    <button class="btn btn-primary category-button py-md-3 px-md-5"
                        data-category="comidas">Comidas</button>
                    <button class="btn btn-primary category-button py-md-3 px-md-5"
                        data-category="bebidas">Bebidas</button>
                    <button class="btn btn-primary category-button py-md-3 px-md-5"
                        data-category="postres">Postres</button>
                    <button class="btn btn-primary category-button py-md-3 px-md-5"
                        data-category="aperitivos">Aperitivos</button>
                    <button class="btn btn-primary category-button py-md-3 px-md-5"
                        data-category="bocadillos">Bocadillos</button>
                </div>

            </div>
        </div>
        <form id="menu-form" class="row">
        </form>
    </div>

    <script src="./bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="scripts/ver_menu.js"></script>
</body>

</html>