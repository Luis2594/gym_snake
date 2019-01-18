<!DOCTYPE html>
<html>
    <title>Gym Snake</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Luis Castillo" />
    <meta name="keywords" content="Gym Snake" />
    <meta name="description" content="This a project created with Symfony for Gym Snake." />

    <link rel="icon" href="./../resource/images/app/logo.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="../resource/css/w3.css">
    <link rel="stylesheet" href="../resource/fonts/family=Roboto.css">
    <link rel="stylesheet" href="../resource/fonts/family=Montserrat.css">
    <link rel="stylesheet" href="../resource/fonts/font-awesome.min.css">

    <!--ALERT-->
    <link rel="stylesheet" href="./../resource/css/alertify.css">
    <link rel="stylesheet" href="./../resource/css/alertify.min.css">
    <link rel="stylesheet" href="./../resource/css/alertify.rtl.css">
    <link rel="stylesheet" href="./../resource/css/alertify.rtl.min.css">

    <!--themes-->
    <link rel="stylesheet" href="./../resource/css/themes/bootstrap.css">
    <link rel="stylesheet" href="./../resource/css/themes/bootstrap.min.css">
    <link rel="stylesheet" href="./../resource/css/themes/bootstrap.rtl.css">
    <link rel="stylesheet" href="./../resource/css/themes/bootstrap.rtl.min.css">
    <link rel="stylesheet" href="./../resource/css/themes/default.css">
    <link rel="stylesheet" href="./../resource/css/themes/default.min.css">
    <link rel="stylesheet" href="./../resource/css/themes/default.rtl.css">
    <link rel="stylesheet" href="./../resource/css/themes/default.rtl.min.css">
    <link rel="stylesheet" href="./../resource/css/themes/semantic.css">
    <link rel="stylesheet" href="./../resource/css/themes/semantic.min.css">
    <link rel="stylesheet" href="./../resource/css/themes/semantic.rtl.css">
    <link rel="stylesheet" href="./../resource/css/themes/semantic.rtl.min.css">

    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="jquery-1.8.2.min.js"></script>
    <!-- Scripts -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="./../resource/js/alertify.js"></script>
    <script src="./../resource/js/alertify.min.js"></script>

    <!-- <link href="./../resource/css/table_search/css/addons/datatables.min.css" rel="stylesheet"> -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/>

    <!-- <script type="text/javascript" src="./../resource/css/table_search/js/addons/datatables.min.js"></script> -->
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>

    <style>
        .w3-sidenav a {font-family: "Roboto", sans-serif}
        body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
    </style>
    <body class="w3-content" style="max-width:1200px">

        <!-- Sidenav/menu -->
        <nav class="w3-sidenav w3-white w3-collapse w3-top" style="z-index:3;width:250px" id="mySidenav">
            <div class="w3-container w3-padding-16">
                <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-closebtn w3-hover-text-red"></i>
                <h3 class="w3-wide"><img src="./../resource/images/app/logo.jpg" width="100" height="100"/></h3>
            </div>
            <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
                <a href="./Home.php">Inicio</a>
                <?php
error_reporting(0);
session_start();

if (isset($_SESSION['id'])) {
    ?>
                    <a onclick="myAccFunc()" href="javascript:void(0)" class="w3-text-black" id="myBtn">
                        Registro <i class="fa fa-caret-down"></i>
                    </a>
                    <div id="demoAcc" class="w3-hide w3-padding-large w3-medium">
                        <a href="./CreateClient.php">Nuevo</a>
                        <a href="./SearchClient.php"">Actualizar</a>
                    </div>
                    <a href="./SearchClient.php">Buscar clientes</a>
                    <a href="./Defaulters.php">Morosos</a>
                    <a href="./ShowDetailsGym.php">Detalles</a>
                    <a href="./../business/LogoutAction.php">Salir</a>
                <?php } else {?>
                    <a href="./Login.php">Iniciar sesión</a>
                <?php }
?>
                    <a href="./About.php">Acerca de</a>
            </div>
        </nav>

        <!-- Top menu on small screens -->
        <header class="w3-container w3-top w3-hide-large w3-black w3-xlarge w3-padding-24">
            <span class="w3-left w3-wide">GYM SNAKE</span>
            <a href="javascript:void(0)" class="w3-right w3-opennav" onclick="w3_open()"><i class="fa fa-bars"></i></a>
        </header>

        <!-- Overlay effect when opening sidenav on small screens -->
        <div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:250px">

            <!-- Push down content on small screens -->
            <div class="w3-hide-large" style="margin-top:83px"></div>

            <!-- Image header -->
            <div class="w3-display-container w3-container">
                <img src="./../resource/images/app/bg-home.jpg" alt="Jeans" style="width:100%">
            </div>
            <br>
            <br>