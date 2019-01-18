<?php
session_start();
if (!isset($_SESSION['id'])) {
    header("location: ./Login.php");
}
include './reusable/Header.php';

?>

<div id="pageScroll">
   
</div>

<?php
include './reusable/Footer.php';
?>

<script type="text/javascript">

</script>