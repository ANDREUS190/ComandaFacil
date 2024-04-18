document.addEventListener('DOMContentLoaded', function () {
  var carrito = [];
  var carritoLista = document.getElementById('carrito-lista');
  var enviarCarritoForm = document.getElementById('enviar-carrito-form');

  function agregarAlCarrito(nombre, precio) {
    carrito.push({ nombre: nombre, precio: precio });
    actualizarCarrito();
  }

  function actualizarCarrito() {
    carritoLista.innerHTML = '';
    carrito.forEach(function (item) {
      var li = document.createElement('li');
      li.textContent = item.nombre + ' - $' + item.precio;
      carritoLista.appendChild(li);
    });
  }

  var botonesAñadir = document.querySelectorAll('.add_to_cart');
  botonesAñadir.forEach(function (boton) {
    boton.addEventListener('click', function (event) {
      var card = event.target.closest('.card');
      var nombre = card.querySelector('.card-title').textContent;
      var precio = parseFloat(card.querySelector('.card-text').textContent.split('$')[1]);
      agregarAlCarrito(nombre, precio);
    });
  });

  document.getElementById('enviar-carrito').addEventListener('click', function () {
    var formData = new FormData();
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
      console.log(data);
    })
    .catch(error => {
      console.error('Error:', error);
    });
  });
});
