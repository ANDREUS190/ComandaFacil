document.addEventListener('DOMContentLoaded', function () {

  document.querySelectorAll('.category-button').forEach(button => {
    button.addEventListener('click', function() {
      var category = this.getAttribute('data-category');
      loadProducts(category);
    });
  });

  function loadProducts(category) {
    console.log(category);
    fetch('load_products.php?category=' + category)
        .then(response => {
            if (response.ok) {
                return response.json();
            }
            throw new Error('Error al cargar los productos.');
        })
        .then(data => {
            var menuForm = document.getElementById('menu-form');
            menuForm.innerHTML = '';
            data.forEach(function(item) {
                var imageUrl = item.imagen_url ? item.imagen_url : 'img/noDefinido.png';
                var div = document.createElement('div');
                div.className = 'flex col-lg-4 col-12 mb-3';
                div.innerHTML = `
                <div class='card h-100 d-flex flex-column'>
                    <img src='${imageUrl}' class='card-img-top img-fluid' alt='${item.nombre}'>
                    <div class='card-body align-text-bottom'>
                        <h3 class='card-title'>${item.nombre}</h3>
                        <p class='card-text'>${item.descripcion}</p>
                        <p class='card-text precio'>Precio: $${item.precio}</p>
                        <input type='hidden' name='item_id[]' value='${item.id_item}'>
                        <div class='text-center'>
                            <button class='btn btn-primary mt-2 add_to_cart' type='button'>Añadir al carrito</button>
                        </div>
                    </div>
                </div>

            
                  `;
                menuForm.appendChild(div);
            });
        var botonesAñadir = document.querySelectorAll('.add_to_cart');
        botonesAñadir.forEach(function (boton) {
          boton.addEventListener('click', function (event) {
            var card = event.target.closest('.card');
            var nombre = card.querySelector('.card-title').textContent;
            var precio = parseFloat(card.querySelector('.card-text').textContent.split('$')[1]);
            agregarAlCarrito(nombre, precio);
          });
        });
      })
  }

});
