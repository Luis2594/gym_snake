<?php

session_start();
if (!isset($_SESSION['id'])) {
    header("location: ./Login.php");
}

include './reusable/Header.php';
include '../business/ClientBusiness.php';

$clientBusiness = new ClientBusiness();
?>

<div id="pageScroll">
    <div class="w3-container w3-text-grey" id="jeans">
        <?php
        $total = $clientBusiness->getQuantityClients();
        $toDay = $clientBusiness->getQuantityClientToDay();
        $defaulters = $clientBusiness->getQuantityClientsDefaulters();
        echo "<h1>Información del gimnasio</h1><br>";
        echo "<h2>Total de clientes: " . $total . "</h2>";
        echo "<h2>Clientes que estan al día: " . $toDay . "</h2>";
        echo "<h2>Clientes morosos: " . $defaulters . "</h2>";
        ?>
    </div>
</div>

<?php
include './reusable/Footer.php';
?>