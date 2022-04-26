<?php
session_start();
if($_SESSION["loggedin"] != true){
    echo 'not logged in';
    header("Location: index.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Document</title>
</head>
<body>
    <ul class="nav">
        <li class="nav-item my-3">
          <a class="nav-link display-6" style="border-bottom: 5px solid #5bc0eb" href="home.php">Home</a>
        </li>
        <li class="nav-item my-3">
          <a class="nav-link display-6" href="search.php">Keresés</a>
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


      
      <div class="container my-5 py-3 border rounded"> 
	<div class="mx-5 d-flex justify-content-center my-3" >
		<h4 class="mb-3">Statisztikák</h4>
        </div>
      </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
