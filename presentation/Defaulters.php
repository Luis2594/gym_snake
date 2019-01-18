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
        $cont = 0;
        $clients = $clientBusiness->getClientsDefaulters();
        echo "<h1>Clientes morosos</h1>";
        ?>

    </div>
    <div class="w3-row w3-grayscale">
        <?php
        foreach ($clients as $client) {
            $cont = 1;
            $date = date("d-m-Y", strtotime($client->getDatepayment()));
            ?>
            <div class="w3-col l3 s6">
                <div class="w3-container">
                    <div class="w3-display-container">
                        <img src="../resource/images/profile/<?php echo $client->getImage(); ?>" style="width: 200px; height: 200px;" >
                        <span class="w3-tag w3-display-topleft"><input type="checkbox" name="check" value="<?php echo $client->getId(); ?>"></span>
                        <div class="w3-display-middle w3-display-hover">
                            <a class="w3-btn" href="../presentation/ShowDetailClient.php?id=<?php echo $client->getId(); ?>">Detalles</a>
                        </div>
                    </div>
                    <p>
                        <b>
                            <?php
                            $name = ucwords(strtolower($client->getName())) . " " . ucwords(strtolower($client->getFirstname()));
                            echo $name
                            ?>
                        </b>
                        <br>
                        <b>Tel: <?php echo $client->getPhone(); ?></b>
                        <br>
                        <b>Día de pago: <?php echo $date ?></b>
                        <br>
                    </p>
                </div>
            </div>
            <?php
        }
        
        if ($cont == 0) {
            echo "<h1>No hay clientes morosos</h1>";
        }
        ?>
        <button class="w3-btn-block" onclick="check()">Generar informe</button>
    </div>

</div>

<?php
include './reusable/Footer.php';
?>

<script>
    function check() {
        var listClient = '';
        var cont = 0;
        $("input[name=check]").each(function (index) {
            if ($(this).is(':checked')) {
                listClient += $(this).val() + ",";
                cont++;
            }
        });
        
        if (listClient != '') {
            if (cont < 25) {
                clearCheck();
                open("../Pdf/GenerateInfo.php?list=" + listClient);
            } else {
                alertify.error("Seleccione un máximo de 24 clientes para generar el reporte");
            }
        } else {
            alertify.error("Seleccione al menos un cliente para generar su reporte");
        }
    }

    function open(url) {
        $("<a>").attr("href", url).attr("target", "_blank")[0].click();
    }

    function clearCheck() {
        $("input[name=check]").each(function (index) {
            if ($(this).is(':checked')) {
                $(this).prop("checked", "");
            }
        });
    }

</script>