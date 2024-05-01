document.addEventListener('DOMContentLoaded', function () {
    actualizarPedidosCocina();
    setInterval(actualizarPedidosCocina, 5000);
});

function actualizarPedidosCocina() {
    fetch('obtener_pedidos_pagados.php')
        .then(response => {
            if (response.ok) {
                return response.json();
            } else {
                throw new Error('Error en la respuesta del servidor');
            }
        })
        .then(data => {
            var pedidosPagados = document.querySelector('#pedidosPagados');
            pedidosPagados.innerHTML = '';
            data.forEach(function (pedido) {
                var card = document.createElement('div');
                card.className = 'card';
                card.innerHTML = `
    <div class="card-body">
        <h5 class="card-title">Código del Pedido: ${pedido.codigo_Pago}</h5>
        <p class="card-text">Número de Mesa: ${pedido.numero_mesa}</p>
        <form action='finalizar_pedido.php' method='post'>
            <input type='hidden' name='id_pedido' value='${pedido.id_pedido}'>
            <button type='submit' class='btn btn-success'>Finalizar</button>
        </form>
    </div>`;
                pedidosPagados.appendChild(card);
            });

            document.querySelectorAll('.btn-success').forEach(button => {
                button.addEventListener('click', function (event) {
                    event.preventDefault();

                    var form = event.target.closest('form');
                    var formData = new FormData(form);

                    fetch('finalizar_pedido.php', {
                            method: 'POST',
                            body: formData
                        })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Error al marcar el pedido como finalizado.');
                            }
                            actualizarPedidosCocina();
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
