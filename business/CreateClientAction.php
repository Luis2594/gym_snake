<?php

include './ClientBusiness.php';

$dni = (int) $_POST["dni"];
$name = $_POST["name"];
$first_name = $_POST["firstName"];
$second_name = $_POST["secondName"];
$phone = $_POST["phone"];
$date_registration = $_POST["startDate"];
$date_payment = $_POST["endDate"];
$image = $_POST["file"];

if (is_numeric($dni) &&
        (strlen($dni) == 9) &&
        (strlen($name) > 0) &&
        (strlen($first_name) > 0) &&
        (strlen($second_name) > 0) &&
        (strlen($date_registration) > 0) &&
        (strlen($date_payment) > 0) &&
        isset($dni) &&
        isset($name) &&
        isset($first_name) &&
        isset($second_name) &&
        isset($date_registration) &&
        isset($date_payment)) {

    $clientBusiness = new ClientBusiness();

    if ($clientBusiness->verifyExistClient($dni)) {
        header("location: ../presentation/CreateClient.php?action=0&msg=Ya_existe_un_cliente_con_ese_numero_de_cedula");
    } else {
        //Validate image
        if (!empty($_FILES) && $_FILES["file"]["name"]) {
            $path_parts = pathinfo($_FILES["file"]["name"]);
            $ext = $path_parts['extension'];
            $image_tmp = tempnam("../resource/images/profile/", $dni);

            $path_parts_tmp = pathinfo($image_tmp);
            $name_tmp_image = $path_parts_tmp['basename'];

            $image = $image_tmp . "." . $ext;

            $folder = '../resource/images/profile/'; //folder path
            opendir($folder); //open path server side
            copy($_FILES["file"]["tmp_name"], $image); //copy file to server side storage folder

            $image = $name_tmp_image . "." . $ext;
        } else {
            $image = "image.jpg";
        }

        $client = new Client(0, $dni, $name, $first_name, $second_name, $phone, $date_registration, $date_payment, $image);

        if ($clientBusiness->insertClient($client)) {
            header("location: ../presentation/ShowDetailClient.php?dni=" . $dni . "&action=1&msg=Cliente_creado_correctamente");
        } else {
            header("location: ../presentation/CreateClient.php?action=0&msg=Cliente_no_se_creo_correctamente");
        }
    }
} else {
    header("location: ../presentation/CreateClient.php?action=0&msg=Datos_erroneos");
}


