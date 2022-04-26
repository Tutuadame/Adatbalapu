<?php
session_start();
if($_SESSION["loggedin"] != true){
    header("Location: index.php");
    exit;
}
require_once "config/db.php";
$sql = "select * from Hirdetes where";
if(trim($_POST['pozicio']) != NULL) {
	$pozicio = trim($_POST['pozicio']);
	$pozicio = strtolower($pozicio);
	$pozicio = ucfirst($pozicio);
	$sql .= " munkakor='$pozicio'";
}

if(trim($_POST['telepules']) != NULL) {
	$telepules = trim($_POST['telepules']);
	$telepules = strtolower($telepules);
	$telepules = ucfirst($telepules);
	$telep_query = "select iranyitoszam from Telepules where nev='$telepules'";
	$stid = oci_parse($conn, $telep_query);
	oci_execute($stid);

	$row = oci_fetch_array($stid, OCI_ASSOC);
        // Check if username exists, if yes then verify password
        if($row){
		$irszam = oci_result($stid, 'IRANYITOSZAM');
	
		if(trim($_POST['pozicio']) != NULL) {
			$sql .= " and iranyitoszam=$irszam";
		}
		else{
			$sql .= " iranyitoszam=$irszam";
		}
	}
}

if(trim($_POST['minfizetes']) != NULL) {
	echo "MIN FIZ NEM URES";
	$minfizetes = trim($_POST['minfizetes']);
	if(trim($_POST['pozicio']) != NULL || trim($_POST['telepules']) != NULL) {
                $sql .= " and min>=$minfizetes";
        }
        else{
                $sql .= " min>=$minfizetes";
        }
}
$stid = oci_parse($conn, $sql);




?>
<!DOCTYPE html>
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
    <title>Document</title>
</head>
<body>
    <ul class="nav">
        <li class="nav-item my-3">
          <a class="nav-link display-6" href="home.php">Home</a>
        </li>
        <li class="nav-item my-3">
          <a class="nav-link display-6" style="border-bottom: 5px solid #5bc0eb" href="#">Keresés</a>
        </li>
        <li class="nav-item my-3">
          <a class="nav-link display-6" href="#">Hirdetés</a>
        </li>
        <li class="nav-item my-3">
          <a class="nav-link display-6" href="#">Üzenet</a>
        </li>
        <li class="nav-item my-3">
        <a class="nav-link display-6" href="logout.php">Kilépés</a>
        </li>
        <li class="nav-item ms-auto border border-5 rounded-circle mx-4 my-3">
          <a class="nav-link display-6 d-inline proflink" href="#">
            <img src="" alt="kép" class="img-fluid">
          </a>
        </li>
      </ul>



      <div class="container my-5 py-3 border">
        <!--div class="mx-5 d-flex justify-content-center my-3" >
          <button type="button" class="btn btn-outline-primary mx-2">Állást keresek</button>
          <button type="button" class="btn btn-outline-primary mx-2">Munkavállalót keresek</button>
        </div-->

	  <form action="search.php" method="post">
           <div class="col d-flex justify-content-center">
              <input type="text" placeholder="Pozíció" name="pozicio" id="poz" class="mx-2">
              <input type="text" placeholder="Település" name="telepules" id="telp" class="mx-2">
              <input type="text" placeholder="Minimum fizetés"name="minfizetes" id="minf" class="mx-2">
           </div>
           <div class="row d-flex justify-content-center">
                <button type="submit" class="btn btn-outline-primary mx-4 my-3 w-25">Keresés</button>
	   </div>
	  </form>
	  <div class="container">
	  	<div class="row bg-info">
    			<div class="col-sm" style="border-right: solid; border-color: grey">
      				Név
    		</div>
    		<div class="col-sm" style="border-right: solid; border-color: grey">
      			Pozíció
    		</div>
    		<div class="col-sm">
      			Minimum-Maximum fizetés
    		</div>
  	</div>

	  <?php
		oci_execute($stid);
			
			while ( $row = oci_fetch_array($stid, OCI_BOTH + OCI_RETURN_NULLS)) {
			
			$cegmail = $row[7];
			$allaskeresomail = $row[6];
			$felado_query="select nev from ";

			if($cegmail != NULL) {
				$felado_query .= "Ceg2 where email='$cegmail'";
			}

			if($allaskeresomail != NULL) {
				$felado_query .= "Allaskereso where email='$allaskeresomail'";
			}
			
			$stid2 = oci_parse($conn, $felado_query);
			oci_execute($stid2);
			$row2 = oci_fetch_array($stid2, OCI_BOTH);

			$felado = $row2[0];
  				echo '<div class="row record">';
    					echo '<div class="col-sm" style="border-right: solid; border-color: lightgrey">';
      						echo "$felado";	
    					echo '</div>';
    					echo '<div class="col-sm" style="border-right: solid; border-color: lightgrey">';
      						echo "$row[1]";
    					echo '</div>';
					echo '<div class="col-sm">';
                                                echo "$row[3] - $row[4]";
                                        echo '</div>';
  				echo '</div>';
			}
			
		
		oci_close($conn);
	?>
      </div>
      </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
