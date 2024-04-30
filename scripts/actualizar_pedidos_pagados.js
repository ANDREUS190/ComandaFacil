document.addEventListener('DOMContentLoaded', function () {
    actualizarPedidosPagados();
    setInterval(actualizarPedidosPagados, 5000);
});

function actualizarPedidosPagados() {
    fetch('obtener_pedidos_pagados.php')
        .then(response => {
            if (response.ok) {
                return response.json();
            }
            throw new Error('Error al obtener los pedidos pagados.');
        })
        .then(data => {
            var pedidosPagados = document.querySelector('#pedidosPagados');
            pedidosPagados.innerHTML = '';
            data.forEach(function (pedido) {
                var div = document.createElement('div');
                div.className = 'col-sm-6 col-md-4 col-lg-3 mb-3';
                div.innerHTML = `
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">${pedido.nombre}</h5>
                            <p class="card-text">Código del Pedido: ${pedido.id_pedido}</p>
                            <p class="card-text">Precio Total: $${pedido.precio_total}</p>
                            <button type='button' class='btn btn-success finalizar-pedido' data-id='${pedido.id_pedido}'>Marcar como Finalizado</button>
                        </div>
                    </div>`;
                pedidosPagados.appendChild(div);
            });

            document.querySelectorAll('.finalizar-pedido').forEach(button => {
                button.addEventListener('click', function (event) {
                    event.preventDefault();

                    var id_pedido = this.getAttribute('data-id');

                    var formData = new FormData();
                    formData.append('id_pedido', id_pedido);

                    fetch('finalizar_pedido.php', {
                        method: 'POST',
                        body: formData
                    })
                    .then(response => {
                        if (response.ok) {
                            return response.json();
                        }
                        throw new Error('Error al finalizar el pedido.');
                    })
                    .then(data => {
                        if (data.success) {
                            actualizarPedidosPagados();
                        } else {
                            console.error('Error:', data.error);
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });
                });
            });
        })
        .catch(error => {
            console.error('Error:', error);
        });
}
