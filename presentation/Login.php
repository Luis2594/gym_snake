<?php
session_start();
if (isset($_SESSION['id'])) {
    header("location: ./Home.php");
}
include './reusable/Header.php';
?>

<div id="pageScroll">
    <form id="loginForm" action="../business/LoginAction.php">
        <fieldset>
            <label> Nombre de usuario </label>
            <input id="user" name="user" type="text" placeholder="Nombre de usuario"/> 

            <label> Contraseña </label>
            <input id="pass" name="pass" type="password" placeholder="Contraseña"/> 

            <input type="submit" value="Iniciar"/>
        </fieldset>
    </form>
</div>

<?php
include './reusable/Footer.php';
?>

<script type="text/javascript">
    alertify.genericDialog || alertify.dialog('genericDialog', function () {
        return {
            main: function (content) {
                this.setContent(content);
            },
            setup: function () {
                return {
                    focus: {
                        element: function () {
                            return this.elements.body.querySelector(this.get('selector'));
                        },
                        select: true
                    },
                    options: {
                        basic: true,
                        maximizable: false,
                        resizable: false,
                        padding: false
                    }
                };
            },
            settings: {
                selector: undefined
            }
        };
    });
//force focusing password box
    alertify.genericDialog($('#loginForm')[0]).set('selector', 'input[type="password"]');
</script>