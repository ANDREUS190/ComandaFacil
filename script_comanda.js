document.addEventListener('DOMContentLoaded', function () {
  var carrito = [];
  var carritoLista = document.getElementById('carrito-lista');
  var enviarCarritoForm = document.getElementById('enviar-carrito-form');
  var enviarCarritoButton = document.getElementById('enviar-carrito');
  var errorMessage = document.createElement('p');
  errorMessage.style.color = 'red';
  errorMessage.textContent = 'Por favor, completa todos los campos del formulario antes de enviar el carrito.';
  errorMessage.hidden = true;
  enviarCarritoButton.parentNode.insertBefore(errorMessage, enviarCarritoButton);

  function agregarAlCarrito(nombre, precio) {
      carrito.push({ nombre: nombre, precio: precio });
      actualizarCarrito();
  }

  function calcularTotal() {
      var total = 0;
      carrito.forEach(function (item) {
          total += item.precio;
      });
      return total;
  }

  function actualizarCarrito() {
      carritoLista.innerHTML = '';
      carrito.forEach(function (item) {
          var li = document.createElement('li');
          li.textContent = item.nombre + ' - $' + item.precio;
          carritoLista.appendChild(li);
      });

      var totalDiv = document.createElement('div');
      totalDiv.textContent = 'Total: $' + calcularTotal();
      carritoLista.appendChild(totalDiv);
  }

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
                                  <p class='card-text precio'>Precio: $${item.Precio}</p>
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
                      var precio = parseFloat(card.querySelector('.card-text.precio').textContent.split('$')[1]);
                      agregarAlCarrito(nombre, precio);
                  });
              });
          })
  }

  enviarCarritoButton.addEventListener('click', function () {
      var email = document.getElementById('email').value;
      var name = document.getElementById('name').value;
      var tableNumber = document.getElementById('table-number').value;

      if (!email || !name || !tableNumber) {
          errorMessage.hidden = false;
          return;
      }

      errorMessage.hidden = true;
      var formData = new FormData();
      formData.append('correo', email);
      formData.append('nombre', name);
      formData.append('numero_mesa', tableNumber);
      formData.append('carrito', JSON.stringify(carrito));

      fetch('procesar_carrito.php', {
          method: 'POST',
          body: formData
      })
      .then(response => {
          if (response.ok) {
              return response.text();
          }
          throw new Error('Error al enviar el carrito al servidor.');
      })
      .then(data => {
          var body = document.querySelector('body');
          var header = document.querySelector('header');
          var headerClone = header.cloneNode(true);
          body.innerHTML = '';
          body.appendChild(headerClone);

          var codigoPagoDiv = document.createElement('div');
          codigoPagoDiv.style.fontSize = '50px';
          codigoPagoDiv.style.color = 'white';
          codigoPagoDiv.textContent = 'Tu código de pago es: ' + data;
          body.appendChild(codigoPagoDiv);
      })
      .catch(error => {
          console.error('Error:', error);
      });
  });
});
