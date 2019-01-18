<?php
include_once __DIR__ . '/../../business/ClientBusiness.php';
$id = $_POST['id'];

if (isset($id)) {
    $clientBusiness = new ClientBusiness();
    if ($clientBusiness->deleteClient($id)) {
        echo TRUE;
    } else {
        echo FALSE;
    }
} else {
    echo FALSE;
}
