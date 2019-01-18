<?php

include './ClientBusiness.php';
$id = $_POST['id'];

if (isset($id)) {
    $clientBusiness = new ClientBusiness();

    if ($clientBusiness->deleteClient($id)) {
        header("location: ../presentation/Home.php?action=1&msg=Cliente_eliminado_correctamente");
    } else {
        header("location: ../presentation/DeleteClient.php?action=0&msg=Error_al_eliminar_cliente");
    }
} else {
    header("location: ../presentation/DeleteClient.php?action=0&msg=Error_al_eliminar_cliente");
}

