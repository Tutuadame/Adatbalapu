<?php

ob_start();

if(!isset($_SESSION)) {
        session_start();
}

$tns = "
(DESCRIPTION =
(ADDRESS_LIST =
  (ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521))
)
    (CONNECT_DATA =
      	(SID = XE)
    )
  )";

$conn = oci_connect('C##ricsi', '123456', $tns,'UTF8')  or die("Database connection not established.");
?>
