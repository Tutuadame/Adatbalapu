
<?php
session_start();
if($_SESSION["loggedin"] != true){
    echo 'not logged in';
    header("Location: index.php");
    exit;
}
require_once "config/db.php";

$irszam = $_GET["irszam"];
if(!empty($irszam)) {
	$sql = oci_parse($conn, "delete from Telepules where iranyitoszam = '$irszam'");
	
	if(oci_execute($sql))
        {
                // Redirect to login page
                header("location: telepules.php");
        } else{
                echo "Oops! Something went wrong. Please try again later.";
	}
	oci_close($conn);
}

echo '<h2>Az Település tábla adatai: </h2>';


$stid = oci_parse($conn, 'SELECT * FROM Telepules');

oci_execute($stid);


//// -- ujra vegrehajtom a lekerdezest, es kiiratom a sorokat
oci_execute($stid); ?>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        .record:hover {
                background-color: #F0F8FF;
                cursor: pointer;
        }
    </style>
    <body>
<div class="container">
                <div class="row bg-info">
                        <div class="col-sm" style="border-right: solid; border-color: grey">
                                Irányítószám
                	</div>
                	<div class="col-sm" style="border-right: solid; border-color: grey">
                        	Név
                	</div>
                	<div class="col-sm">
                        	Ország
			</div>
		</div>
<?php
while ( $row = oci_fetch_array($stid, OCI_BOTH + OCI_RETURN_NULLS)) {
	echo '<div class="row record" style="display: flex; flex-wrap: wrap;">';
             echo '<div class="col-sm" style="border-right: solid; border-color: lightgrey">';
                  echo "$row[0]";
             echo '</div>';
             echo '<div class="col-sm" style="border-right: solid; border-color: lightgrey">';
                  echo "$row[1]";
             echo '</div>';
             echo '<div class="col-sm" style="border-right: solid; border-color: lightgrey">';
                  echo "$row[2]";
	     echo '</div>';
	     echo '<div class="col-sm">';
	     	echo '<form action="telepules.php?irszam='. $row[0]. '" method="post">';
                	echo '<input type="submit" value="Törlés" style="background-color: red">';
	     	echo '</form>';
	     echo '</div>';
        echo '</div>';
}
//echo '</table>';
echo '</div>';
oci_close($conn);


?>

   </body>
<html>
