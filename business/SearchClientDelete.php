<?php

include './ClientBusiness.php';

$dni = $_POST['dni'];

if (isset($dni)) {
    $clientBusiness = new ClientBusiness();
    if ($clientBusiness->getClientsDni($dni)) {
        header("location: ../presentation/DeleteClient.php?dni=" . $dni);
    } else {
        header("location: ../presentation/SearchDeleteClient.php?action=0&msg=No_hay_clientes_con_ese_numero_de_cedula");
    }
}
