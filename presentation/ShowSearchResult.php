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
        $clients = array();
        if (isset($_GET['dni'])) {
            $dni = $_GET['dni'];
            $clients = $clientBusiness->getClientsDni($dni);
            echo "<h1>Resultados que considen con la cédula: '" . $dni . "'</h1>";
        }

        if (isset($_GET['name'])) {
            $name = $_GET['name'];
            $clients = $clientBusiness->getClientName($name);
            echo "<h1>Resultados que considen con el nombre: '" . $name . "'</h1>";
        }
        ?>

    </div>
    <div class="w3-row w3-grayscale">
        <?php
        foreach ($clients as $client) {
            $date = new DateTime($client->getDatepayment());
            ?>
            <div class="w3-col l3 s6">
                <div class="w3-container">
                    <div class="w3-display-container">
                        <img src="../resource/images/profile/<?php echo $client->getImage(); ?>" style="width: 200px; height: 200px;">
                        <div class="w3-display-middle w3-display-hover">
                            <a class="w3-btn" href="../presentation/ShowDetailClient.php?id=<?php echo $client->getId(); ?>">Detalles</a>
                        </div>
                    </div>
                    <p>
                        <b><?php
                            $name = ucwords(strtolower($client->getName())) . " " . ucwords(strtolower($client->getFirstname()));
                            echo $name
                            ?></b><br>
                        <b>Tel: <?php echo $client->getPhone(); ?></b><br>
                        <b>Día de pago: <?php echo $date->format("d-m-Y"); ?></b><br>
                    </p>
                </div>
            </div>
        <?php } ?>

    </div>
</div>

<?php
include './reusable/Footer.php';
?>
