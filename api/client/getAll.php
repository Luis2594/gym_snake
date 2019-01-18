<?php
include_once __DIR__. '/../../business/ClientBusiness.php';
$businessClient = new ClientBusiness();
echo json_encode($businessClient->getClientAll());

