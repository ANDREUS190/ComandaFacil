document.addEventListener('DOMContentLoaded', function () {

  document.querySelectorAll('.category-button').forEach(button => {
    button.addEventListener('click', function() {
      var category = this.getAttribute('data-category');
      loadProducts(category);
    });
  });

  function loadProducts(category) {
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
        data.forEach(function (item) {
          var div = document.createElement('div');
          div.className = 'flex col-lg-4 col-12 mb-3';
          div.innerHTML = `
            <div class=''>
              <div class='card'>
                <img src='${item.Imagen_URL}' class='card-img-top' alt='${item.Nombre}'>
                <div class='card-body'>
                  <h3 class='card-title'>${item.Nombre}</h3>
                  <p class='card-text'>${item.Descripción}</p>
                  <p class='card-text'>Precio: $${item.Precio}</p>
                  <input type='hidden' name='item_id[]' value='${item.ID_Item}'>
                  <div class='text-center'>
                    <button class='btn btn-primary mt-2 add_to_cart' type='button'>Añadir al carrito</button>
                  </div>
                </div>
              </div>
            </div>`;
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
