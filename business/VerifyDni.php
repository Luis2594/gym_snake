<?php

include './ClientBusiness.php';
$dni = $_POST['dni'];
if (isset($dni)) {
    $clientBusiness = new ClientBusiness();
    if ($clientBusiness->verifyExistClient($dni)) {
        echo "1";
    }else{
        echo "0";
    }
}
?>