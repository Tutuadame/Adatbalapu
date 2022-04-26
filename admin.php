<?php
session_start();
if($_SESSION["loggedin"] != true){
    echo 'not logged in';
    header("Location: index.php");
    exit;
}
?>

<html>
<head>
    <link rel=stylesheet type="text/css" href="mystyle.css" />
</head>
<body>
	<form action="hirdetes.php" method="get">
		<input type="submit" value="Hirdetes">
	</form>
	<form action="allaskereso.php" method="get">
                <input type="submit" value="Allaskereso">
        </form>
	<form action="ceg.php" method="get">
                <input type="submit" value="Ceg">
        </form>
	<form action="adminisztrator.php" method="get">
                <input type="submit" value="Adminisztrator">
        </form>
	<form action="jelentkezes.php" method="get">
                <input type="submit" value="Jelentkezes">
        </form>
	<form action="telepules.php" method="get">
                <input type="submit" value="Telepules">
        </form>
	<form action="uzenet.php" method="get">
                <input type="submit" value="Uzenet">
        </form>
	<form action="cv.php" method="get">
                <input type="submit" value="CV">
        </form>
</body>
</html>
