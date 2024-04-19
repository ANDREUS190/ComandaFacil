document.addEventListener('DOMContentLoaded', function () {
    actualizarPedidos();
    setInterval(actualizarPedidos, 5000);
});

function actualizarPedidos() {
    fetch('obtener_pedidos.php')
        .then(response => {
            if (response.ok) {
                return response.json();
            }
            throw new Error('Error al obtener los pedidos.');
        })
        .then(data => {
            var tablaPedidos = document.querySelector('.table tbody');
            tablaPedidos.innerHTML = '';
            data.forEach(function (pedido) {
                var fila = document.createElement('tr');
                fila.innerHTML = `
                    <td>${pedido.id_pedido}</td>
                    <td>${pedido.nombre}</td>
                    <td>${pedido.precio_total}</td>
                    <td>${pedido.pagado ? "pagado" : "Pendiente"}</td>
                    <td>
                        <form action='procesar_pago.php' method='post'>
                            <input type='hidden' name='id_pedido' value='${pedido.id_pedido}'>
                            <button type='submit' class='btn btn-success'>Marcar como Pagado</button>
                        </form>
                        <form action='rechazar_pedido.php' method='post'>
                            <input type='hidden' name='id_pedido' value='${pedido.id_pedido}'>
                            <button type='submit' class='btn btn-danger'>Rechazar</button>
                        </form>
                    </td>`;
                tablaPedidos.appendChild(fila);
            });
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

document.querySelectorAll('.btn-success').forEach(button => {
    button.addEventListener('click', function (event) {
        event.preventDefault();

        var form = event.target.closest('form');
        var formData = new FormData(form);

        fetch('procesar_pago.php', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (response.ok) {
                return response.json();
            }
            throw new Error('Error al marcar el pedido como pagado.');
        })
        .then(data => {
            if (data.success) {
                actualizarPedidos();
            } else {
                console.error('Error:', data.error);
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });
});
