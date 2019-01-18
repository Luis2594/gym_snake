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
            <form action="../business/SearchClient.php" method="POST">
                <p><input id="dni" class="w3-input w3-border" type="number"  placeholder="Cédula con formato de 9 digitos" name="dni" required></p>
                <button type="submit" class="w3-btn-block w3-padding w3-black" onclick="return setValueDni();">Buscar</button>
            </form>
        </div>
        <div class="w3-col s4">
            <h4>Buscar cliente por nombre</h4>
            <form action="../business/SearchClient.php" method="POST">
                <p><input id="name" class="w3-input w3-border" type="text"  placeholder="Nombre" name="name" required></p>
                <button type="submit" class="w3-btn-block w3-padding w3-black" onclick="return setValueName();">Buscar</button>
            </form>
        </div>
    </div>
</div>

<?php
include './reusable/Footer.php';
?>

<script type="text/javascript">
    function setValueDni() {
        var dni = document.getElementById("dni");
        if (dni.value.length !== 9) {
            alertify.error("FORMATO DE 9 CIFRAS PARA CEDULA");
            return false;
        }
        return true;
    }
    function setValueName() {
        var name = document.getElementById("name");
        if (name.value.length < 1) {
            alertify.error("Nombre vacio. Por favor ingrese un nombre");
            return false;
        }
        return true;
    }
</script>