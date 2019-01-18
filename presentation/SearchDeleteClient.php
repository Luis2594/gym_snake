<?php
session_start();
if (!isset($_SESSION['id'])) {
    header("location: ./Login.php");
}

include './reusable/Header.php';

?>

<div id="pageScroll">
    <div class="w3-row-padding">
        <!--FORM-->
        <div class="w3-col s4">
            <h4>Buscar cliente por cédula</h4>
            <form action="../business/SearchClientDelete.php" method="POST">
                <p><input id="dni" class="w3-input w3-border" type="number"  placeholder="Cédula con formato de 9 digitos" name="dni" required></p>
                <button type="submit" class="w3-btn-block w3-padding w3-black" onclick="return setValueDni();">Buscar</button>
            </form>
        </div>
    </div>
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

    function setValueDni() {
        var dni = document.getElementById("dni");
        if (dni.value.length !== 9) {
            alertify.error("FORMATO DE 9 CIFRAS PARA CEDULA");
            return false;
        }
        return true;
    }
</script>