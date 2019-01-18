<?php

$dni = $_POST['dni'];
$name = $_POST['name'];

if (isset($dni)) {
    header("location: ../presentation/ShowSearchResult.php?dni=" . $dni);
}

if ($name) {
    header("location: ../presentation/ShowSearchResult.php?name=" . $name);
}
