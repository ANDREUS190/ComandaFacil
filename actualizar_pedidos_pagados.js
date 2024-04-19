function actualizarPedidosPagados() {
    fetch('obtener_pedidos_pagados.php')
        .then(response => {
            if (response.ok) {
                return response.json();
            }
            throw new Error('Error al obtener los pedidos.');
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
                            <form action='finalizar_pedido.php' method='post'>
                                <input type='hidden' name='id_pedido' value='${pedido.id_pedido}'>
                                <button type='submit' class='btn btn-success'>Marcar como Finalizado</button>
                            </form>
                        </div>
                    </div>`;
                pedidosPagados.appendChild(div);
            });
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

setInterval(actualizarPedidosPagados, 1000);
