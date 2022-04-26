<?php
// Include config file
require_once "config/db.php";
$sql = oci_parse($conn, "DELETE FROM Hirdetes WHERE h_id='A6115'");
if(oci_execute($sql)) {
	echo "sikerult";
}
else {
	echo "bazd meg";
}
	oci_close($conn);
?>
