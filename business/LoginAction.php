<?php

include './UserBusiness.php';
session_start();

$username = $_GET['user'];
$pass = $_GET['pass'];

if (isset($username) && isset($pass)) {
    $userBusiness = new UserBusiness();
    if ($userBusiness->isUser($username, $pass)) {
        $user = $userBusiness->getUser($username, $pass);
        $_SESSION['id'] = "" . $user->getId();
        $name = $user->getName();
        header("location: ../presentation/Home.php?action=1&msg=Bienvenido_" . $name . "_que_tengas_un_buen_dia.");
    } else {
        header("location: ../presentation/Home.php?action=0&msg=Usuario_no_existe._Intente_de_nuevo");
    }
} else {
    header("location: ../presentation/Home.php?action=0&msg=Error_al_iniciar_sesion");
}
