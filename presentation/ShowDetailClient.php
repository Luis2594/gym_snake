<?php

session_start();
if (!isset($_SESSION['id'])) {
    header("location: ./Login.php");
}

include_once __DIR__. '/./reusable/Header.php';
include_once __DIR__. '/../business/ClientBusiness.php';

$clientBusiness = new ClientBusiness();
$clients = array();
if (isset($_GET['dni'])) {
    $dni = $_GET['dni'];
    $clients = $clientBusiness->getClientsDni($dni);
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $clients = $clientBusiness->getClientId($id);
    
}
?>

<div id="pageScroll">
    <div class="w3-row-padding">

        <?php
        foreach ($clients as $client) {
            ?>
            <!--FORM-->
            <div class="w3-col s4">
                <h4>Detalles del cliente</h4>
                <form>
                    <input id="id" name="id"  readonly value="<?php echo $client->getId(); ?>" readonly  autocomplete="off" type="hidden" style="visibility:hidden"/>
                    <p><input id="dni" class="w3-input w3-border" type="number"  name="dni" readonly  autocomplete="off" type="hidden" placeholder="Cédula con formato de 9 digitos" required value="<?php echo $client->getDni(); ?>"></p>
                    <p><input id="name" name="name" class="w3-input w3-border" type="text" readonly  autocomplete="off" type="hidden" placeholder="Nombre"  required value="<?php echo $client->getName(); ?>"></p>
                    <p><input id="firstName" name="firstName" class="w3-input w3-border" type="text" readonly  autocomplete="off" type="hidden" placeholder="Primer apellido"  required value="<?php echo $client->getFirstname(); ?>"></p>
                    <p><input id="secondName" name="secondName" class="w3-input w3-border" type="text" readonly  autocomplete="off" type="hidden" placeholder="Segundo apellido" required value="<?php echo $client->getSecondname(); ?>"></p>
                    <p><input id="phone" name="phone" class="w3-input w3-border" type="text" readonly  autocomplete="off" type="hidden" placeholder="Telefono" value="<?php echo $client->getPhone(); ?>" ></p>
                    <p>Fecha de ingreso</p>
                    <p><input id="startDate" name="startDate" class="w3-input w3-border" type="date" readonly  autocomplete="off" type="hidden" placeholder="Fecha ingreso" required value="<?php echo $client->getDateregistration(); ?>"></p>
                    <p>Fecha de pago</p>
                    <p><input id="endDate" name="endDate" class="w3-input w3-border" type="date" readonly  autocomplete="off" type="hidden" placeholder="Fecha de pago" required value="<?php echo $client->getDatepayment(); ?>"></p>
                </form>
            </div>
            <div class="w3-col s4" style="margin-top: 55px;">
                <div class="w3-display-container">
                    <img id="img" width="200" height="200" src="../resource/images/profile/<?php echo $client->getImage(); ?>" style="width:100%"/>
                    <br>
                    <br>
                    <button class="w3-btn-block" onclick="loadUpdate(<?php echo $client->getId(); ?>)">Actualizar</button>
                    <br>
                    <br>
                    <button class="w3-btn-block" onclick="loadDelete(<?php echo $client->getId(); ?>)">Eliminar</button>
                </div>
            </div>
        <?php } ?>
    </div>
</div>

<?php
include_once __DIR__. '/./reusable/Footer.php';
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
    var action = $.get("action");
    var msg = $.get("msg");
    if (action === "1") {
        msg = msg.replace(/_/g, " ");
        alertify.success(msg);
    }
    if (action === "0") {
        msg = msg.replace(/_/g, " ");
        alertify.error(msg);
    }

    function loadUpdate(id) {
        window.location = '../presentation/UpdateClient.php?id=' + id;
    }
    function loadDelete(id) {
        window.location = '../presentation/DeleteClient.php?id=' + id;
    }


</script>