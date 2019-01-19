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
            <h4>Crear cliente</h4>

            <form action="../business/CreateClientAction.php" method="POST" enctype="multipart/form-data">
                <input type="file" id="file" name="file" accept=".png, .jpg">
                <p><input id="dni" class="w3-input w3-border" type="number"  placeholder="Cédula con formato de 9 digitos" name="dni" required></p>
                <p><input id="name" name="name" class="w3-input w3-border" type="text" placeholder="Nombre"  required></p>
                <p><input id="firstName" name="firstName" class="w3-input w3-border" type="text" placeholder="Primer apellido"  required></p>
                <p><input id="secondName" name="secondName" class="w3-input w3-border" type="text" placeholder="Segundo apellido" required></p>
                <p><input id="phone" name="phone" class="w3-input w3-border" type="text" placeholder="Telefono" ></p>
                <p>Fecha de ingreso</p>
                <p><input id="startDate" name="startDate" class="w3-input w3-border" type="date" placeholder="Fecha ingreso" required></p>
                <p>Fecha de pago</p>
                <p><input id="endDate" name="endDate" class="w3-input w3-border" type="date" placeholder="Fecha de pago" required></p>
                <button type="submit" class="w3-btn-block w3-padding w3-black" onclick="return setValueItems();">Crear</button>
            </form>
        </div>
        <div class="w3-col s4" style="margin-top: 65px;">
            <video id="cam" autoplay controls width="200" height="200"></video>
            <canvas id="photo" name="photo" width="200" height="200"></canvas>
            <input id='botonFoto' type='button' value = 'Tomar foto'/>
            <br>
            <br>
            <div class="w3-display-container">
                <img id="img" style="width:100%"/>
            </div>
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

    function setValueItems() {
        var dni = document.getElementById("dni");
        var name = document.getElementById("name");
        var first_name = document.getElementById("firstName");
        var second_name = document.getElementById("secondName");
        var phone = document.getElementById("phone");
        var date_registration = document.getElementById("startDate");
        var date_payment = document.getElementById("endDate");
        
        if (dni.value.length !== 9) {
            alertify.error("FORMATO DE 9 CIFRAS PARA CEDULA");
            return false;
        }
        if (name.value.length < 1) {
            alertify.error("VERIFIQUE SU NOMBRE");
            return false;
        }

        if (first_name.value.length < 1) {
            alertify.error("VERIFIQUE SU PRIMER APELLIDO");
            return false;
        }

        if (second_name.value.length < 1) {
            alertify.error("VERIFIQUE SU SEGUNDO APELLIDO");
            return false;
        }

        if (phone.value.length !== 0) {
            if (phone.value.length !== 8) {
                alertify.error("FORMATO DE 8 CIFRAS PARA NUMERO DE TELEFONO");
                return false;
            }
        }

        if (date_registration.value.length < 1) {
            alertify.error("VERIFIQUE LA FECHA DE INGRESO");
            return false;
        }

        if (date_payment.value.length < 1) {
            alertify.error("VERIFIQUE LA FECHA DE PAGO");
            return false;
        }

        return true;
    }

    function verifyDni() {
        $.ajax({
            type: "Post",
            url: "../business/VerifyDni.php",
            data: {"dni": $("#dni").val()},
            success: function (result) {
                if (result === "1") {
                    alertify.error("Ya existe un cliente con ese numero de cedula");
                    return false;
                } else {
                    return true;
                }
            }
        });
    }

    //Nos aseguramos que estén definidas
    //algunas funciones básicas
    window.URL = window.URL || window.webkitURL;
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia || function () {
        alertify.error('Su navegador no soporta navigator.getUserMedia().');
    };

    function startCam() {
        $('#photo').hide();
        $('#img').hide();

        var video = document.getElementById('cam');
        
        // Get access to the camera!
        if(navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
            // Not adding `{ audio: true }` since we only want video now
            navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream) {
                video.srcObject = stream;
                video.play();
            });
        }
    }

    jQuery(document).ready(function () {
        startCam();
        //Este objeto guardará algunos datos sobre la cámara
        window.datosVideo = {
            'StreamVideo': null,
            'url': null
        };
        jQuery('#botonFoto').on('click', function (e) {
            var oCamara, oFoto, oContexto;
            oCamara = jQuery('#cam');
            oFoto = jQuery('#photo');
            oContexto = oFoto[0].getContext('2d');
            oContexto.drawImage(oCamara[0], 0, 0, 200, 200);
            save();
        });
    });

    function save() {
        var canvas = document.getElementById("photo");
        var img = document.getElementById("img");
        img.src = canvas.toDataURL("image/png");
        img.width = "200";
        img.height = "200";
        $("#img").show();
    }
</script>
