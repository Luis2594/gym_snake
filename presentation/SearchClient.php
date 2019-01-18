<?php
session_start();
if (!isset($_SESSION['id'])) {
    header("location: ./Login.php");
}
include './reusable/Header.php';
?>

<div id="pageScroll">
<table id="dtBasicExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Foto</th>
      <th class="th-sm">Cédula</th>
      <th class="th-sm">Nombre</th>
      <th class="th-sm">Teléfono</th>
      <th class="th-sm">Fec. Inicio</th>
      <th class="th-sm">Fec. Pago</th>
      <th class="th-sm">Actualizar</th>
      <th class="th-sm">Eliminar</th>
    </tr>
  </thead>
  <tbody id="tableBody">
  </tbody>
  <tfoot>
  <tr>
      <th class="th-sm">Foto</th>
      <th class="th-sm">Cédula</th>
      <th class="th-sm">Nombre</th>
      <th class="th-sm">Teléfono</th>
      <th class="th-sm">Fec. Inicio</th>
      <th class="th-sm">Fec. Pago</th>
      <th class="th-sm">Actualizar</th>
      <th class="th-sm">Eliminar</th>
    </tr>
  </tfoot>
</table>
</div>

<?php
include './reusable/Footer.php';
?>

<script type="text/javascript">

    (function ($) {
        $.get = function (key) {
            key = key.replace(/[\[]/, '\\[');
            key = key.replace(/[\]]/, '\\]');
            var pattern = "[\\?&]" + key + "=([^&#]*)";
            var regex = new RegExp(pattern);
            var url = unescape(window.location.href);
            var results = regex.exec(url);
            if (results === null) {
                return null;
            } else {
                return results[1];
            }
        }
    })(jQuery);
    var msg = $.get("msg");
    if(msg !== null){
      msg = msg.replace(/_/g, " ");
      alertify.success(msg);
    }
   

    $(document).ready(function () {
      getAllClients();
    });

    function getAllClients() {
        $.ajax({
            type: 'GET',
            url: "../api/client/getAll.php",
            success: function (data)
            {
                var clients = JSON.parse(data);
                var html = '';
                $("#tableBody").html(html);
                $.each(clients, function (i, item) {
                  html += '<tr>';
                  html += '<td><img width="80" height="60" src="../resource/images/profile/'+ item.image+'"/></td>'
                  html += "<td>" + item.dni + "</td>";
                  html += '<td><a href="./ShowDetailClient.php?id=' + item.id + '">' + item.name +' ' + item.firstname + '</a></td>';
                  html += "<td>" + item.phone + "</td>";
                  html += "<td>" + item.dateregistration + "</td>";
                  html += "<td>" + item.datepayment + "</td>";
                  html += '<td><a href="./UpdateClient.php?id=' + item.id + '">actualizar</a></td>';
                  html += '<td><a href="javascript:confirmDelete(' + item.id + ')">Eliminar</a></td>';
                  html += "</tr>";
                });
                $("#tableBody").html(html);
                $('#dtBasicExample').DataTable();
                $('.dataTables_length').addClass('bs-select');
            },
            error: function ()
            {
                alertify.error("Error ...");
            }
        });
    }

    function confirmDelete(id) {
        alertify.confirm("", "¿Seguro que desea eliminar este cliente?.",
                function () {
                    deleteClient(id);
                },
                function () {
                    alertify.error("Cancelado");
                });
    }

    function deleteClient(id) {
        $.ajax({
            type: 'POST',
            url: "../api/client/delete.php",
            data: {id: id},
            success: function (data)
            {
                if(data == true){
                  var url = new URL(window.location.href);
                  url.searchParams.set('msg','Usuario_eliminado_correctamente');
                  window.location.href = url.href;
                }else{
                  alertify.error("No se pudo eliminar al usuario.");
                }
            },
            error: function ()
            {
              alertify.error("No se pudo eliminar al usuario.");
            }
        });
    }

</script>