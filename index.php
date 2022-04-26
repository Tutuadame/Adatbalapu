<?php
// Initialize the session
session_start();
 
// Check if the user is already logged in, if yes then redirect him to welcome page
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
    header("location: home.php");
    exit;
}
 
// Include config file
require_once "config/db.php";
 
// Define variables and initialize with empty values
$username = $password = "";
$username_err = $password_err = $login_err = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Check if username is empty
    if(empty(trim($_POST["username"]))){
        $username_err = "Please enter username.";
    } else{
        $username = trim($_POST["username"]);
    }
    
    // Check if password is empty
    if(empty(trim($_POST["password"]))){
        $password_err = "Please enter your password.";
    } else{
        $password = trim($_POST["password"]);
    }
    
    // Validate credentials
    if(empty($username_err) && empty($password_err)){
        $param_username = trim($_POST["username"]);
        // Prepare a select statement
        $sql = oci_parse($conn, "SELECT email, jelszo FROM Ceg2 WHERE email = '$param_username' UNION SELECT email, jelszo FROM Allaskereso WHERE email = '$param_username'  UNION SELECT email, jelszo FROM Adminisztrator WHERE email = '$param_username' ORDER BY email");

        oci_execute($sql);

	$row = oci_fetch_array($sql, OCI_ASSOC);
        // Check if username exists, if yes then verify password
        if($row){     
            $username = oci_result($sql, 'EMAIL');
            $hashed_password = oci_result($sql, 'JELSZO');
            
            if(password_verify($password, $hashed_password)){
                // Password is correct, so start a new session
                session_start();
                
                // Store data in session variables
                $_SESSION["loggedin"] = true;
		$_SESSION["username"] = $username;

		$sql = oci_parse($conn, "SELECT email, jelszo FROM Ceg2 WHERE email = '$param_username'");
		oci_execute($sql);
	        $row_ceg = oci_fetch_array($sql, OCI_ASSOC);
		if($row_ceg != NULL){
			$_SESSION["type"] = 'CEG';
		}

		$sql = oci_parse($conn, "SELECT email, jelszo FROM Allaskereso WHERE email = '$param_username'");
		oci_execute($sql);
                $row_allaskereso = oci_fetch_array($sql, OCI_ASSOC);
		if($row_allaskereso != NULL){
			$_SESSION["type"] = 'EGYEN';
		}

		$sql = oci_parse($conn, "SELECT email, jelszo FROM Adminisztrator WHERE email = '$param_username'");
                oci_execute($sql);
                $row_allaskereso = oci_fetch_array($sql, OCI_ASSOC);
                if($row_admin != NULL){
			$_SESSION["type"] = 'ADMIN';
			header("location: admin.php");
                }

                // Redirect user to welcome page
                header("location: home.php");
            } else{
                // Password is not valid, display a generic error message
		$login_err = "Invalid username or password!";
            }
                
        } else{
            // Username doesn't exist, display a generic error message
            $login_err = "Invalid username or password.";
        }
        oci_close($conn);
    }
}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/login.css">
    <style>
        body{ font: 14px sans-serif;}
        .wrapper{ width: 360px; padding: 20px; margin-right: auto; margin-left: auto; margin-top: 150px;}
    </style>
</head>
<body>
    <div class="wrapper">
        <h2>Login</h2>
        <p>Please fill in your credentials to login.</p>

        <?php 
        if(!empty($login_err)){
            echo '<div class="alert alert-danger">' . $login_err . '</div>';
        }        
        ?>

        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="form-group">
                <label>Email</label>
                <input type="text" name="username" class="form-control <?php echo (!empty($username_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $username; ?>">
                <span class="invalid-feedback"><?php echo $username_err; ?></span>
            </div>    
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" class="form-control <?php echo (!empty($password_err)) ? 'is-invalid' : ''; ?>">
                <span class="invalid-feedback"><?php echo $password_err; ?></span>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Login">
            </div>
            <p>Don't have an account? <a href="register.php">Sign up now</a>.</p>
        </form>
    </div>
</body>
</html>
