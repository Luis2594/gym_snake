<?php

require('../resource/fpdf/fpdf.php');
include '../business/ClientBusiness.php';
date_default_timezone_set('America/Costa_Rica') ;

class PDF extends FPDF {

// Cabecera de p�gina
    function Header() {
        // Logo
        $this->Image('../resource/images/app/logo.png', 10, 10, 10);
        // Arial bold 15
        $this->SetFont('Arial', 'B', 15);
        // Movernos a la derecha
        $this->Cell(70);
        // T�tulo
        $this->Cell(40, 10, 'Gym Snake', 1, 0, 'C');
        // Movernos a la derecha
        $this->Cell(25);
        // T�tulo
        $this->Cell(48, 10, date("d") . " del " . date("m") . " de " . date("Y"), 1, 0, 'C');
        // Salto de l�nea
        $this->Ln(20);
    }

// Pie de p�gina
    function Footer() {
        // Posici�n: a 1,5 cm del final
        $this->SetY(-15);
        // Arial italic 8
        $this->SetFont('Arial', 'I', 8);
        // N�mero de p�gina
        $this->Cell(0, 10, 'Page ' . $this->PageNo() . '/{nb}', 0, 0, 'C');
    }

}

// Creaci�n del objeto de la clase heredada
$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Times', '', 12);
$ids = $_GET["list"];

if (isset($ids)) {
    $array = explode(",", $ids);
    unset($array[count($array) - 1]);
    $clientBusiness = new ClientBusiness();
    $phones = $clientBusiness->getPhoneClient($array);
    foreach ($phones as $phone) {
            $pdf->Cell(0, 10, "Tel: " . $phone["phone"] . "   ".$phone["name"] , 0, 1);
    }
    $pdf->Output();
}
?>
