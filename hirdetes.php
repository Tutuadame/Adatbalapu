
<?php
session_start();
if($_SESSION["loggedin"] != true){
    echo 'not logged in';
    header("Location: index.php");
    exit;
}
require_once "config/db.php";

$h_id = $_GET["id"];
if(!empty($h_id)) {
	$sql = oci_parse($conn, "delete from Hirdetes where h_id = '$h_id'");
	
	if(oci_execute($sql))
        {
                // Redirect to login page
                header("location: hirdetes.php");
        } else{
                echo "Oops! Something went wrong. Please try again later.";
	}
	oci_close($conn);
}

echo '<h2>Az Hirdetes tábla adatai: </h2>';
//echo '<table border="0">';


//// -- lekerdezzuk a tabla tartalmat
$stid = oci_parse($conn, 'SELECT * FROM Hirdetes');

oci_execute($stid);

//// -- eloszor csak az oszlopneveket kerem le
/*$nfields = oci_num_fields($stid);
echo '<tr>';
for ($i = 1; $i<=$nfields; $i++){
    $field = oci_field_name($stid, $i);
    echo '<td>' . $field . '</td>';
}
echo '</tr>';*/

//// -- ujra vegrehajtom a lekerdezest, es kiiratom a sorokat
oci_execute($stid); ?>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!--link rel="stylesheet" href="style.css"-->
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
                                H_id
                	</div>
                	<div class="col-sm" style="border-right: solid; border-color: grey">
                        	Munkakör
                	</div>
                	<div class="col-sm" style="border-right: solid; border-color: grey">
                        	Irányítószám
			</div>
			<div class="col-sm" style="border-right: solid; border-color: grey">
                                Min
			</div>
			<div class="col-sm" style="border-right: solid; border-color: grey">
                                Max
			</div>
			<div class="col-sm" style="border-right: solid; border-color: grey">
                                Leírás
			</div>
			<div class="col-sm" style="border-right: solid; border-color: grey">
                                a_mail
			</div>
			<div class="col-sm" style="border-right: solid; border-color: grey">
                                c_mail
			</div>
			<div class="col-sm" style="border-right: solid; border-color: grey">
                              	Dátum
			</div>
			<div class="col-sm">
                                ad_mail
                        </div>
		</div>
<?php
while ( $row = oci_fetch_array($stid, OCI_BOTH + OCI_RETURN_NULLS)) {
    /*echo '<tr>';
    foreach ($row as $item) {
	    echo '<td>' . $item . '</td>';
	    echo '<td>';
	    echo '<form action="hirdetes.php?id='. $row[0]. '" method="get">';
                echo '<input type="submit" value="Törlés" style="background-color: red">';
	    echo '</form>';
	    echo '</td>';
    }
    echo '</tr>';*/
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
	     echo '<div class="col-sm" style="border-right: solid; border-color: lightgrey">';
                  echo "$row[3]";
	     echo '</div>';
	     echo '<div class="col-sm" style="border-right: solid; border-color: lightgrey">';
                  echo "$row[4]";
	     echo '</div>';
	     echo '<div class="col-sm" style="border-right: solid; border-color: lightgrey">';
                  echo "$row[5]";
	     echo '</div>';
	     echo '<div class="col-sm" style="border-right: solid; border-color: lightgrey">';
                  echo "$row[6]";
	     echo '</div>';
	     echo '<div class="col-sm" style="border-right: solid; border-color: lightgrey">';
                  echo "$row[7]";
	     echo '</div>';
	     echo '<div class="col-sm" style="border-right: solid; border-color: lightgrey">';
                  echo "$row[8]";
	     echo '</div>';
	     echo '<div class="col-sm" style="border-right: solid; border-color: lightgrey">';
                  echo "$row[9]";
	     echo '</div>';
	     echo '<div class="col-sm">';
	     	echo '<form action="hirdetes.php?id='. $row[0]. '" method="post">';
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
