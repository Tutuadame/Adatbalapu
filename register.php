<?php
// Include config file
require_once "config/db.php";
 
// Define variables and initialize with empty values
$username = $password = $confirm_password = $name = $phonenumber = $birthdate = $postalcode = "";
$username_err = $password_err = $confirm_password_err = $name_err = $phonenumber_err = "";
$allaskereso = $_GET["allaskereso"];
if(empty($allaskereso)) {
	$allaskereso = "true";
}
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Validate username
    if(empty(trim($_POST["username"]))){
        $username_err = "Please enter a username.";
    } elseif(!preg_match('/^[a-zA-Z0-9_@.]+$/', trim($_POST["username"]))){
        $username_err = "Username can only contain letters, numbers,@ and underscores.";
    } else{
	$param_username = trim($_POST["username"]);
	// Prepare a select statement
        $sql = oci_parse($conn, "SELECT email FROM Ceg2 WHERE email = '$param_username' UNION SELECT email FROM Allaskereso WHERE email = '$param_username' ORDER BY email");
	$number_of_rows=0;
	oci_execute($sql);
	$row = oci_fetch_array($sql, OCI_ASSOC);
	if($row){
        	$username_err = "This username is already taken.";
        } else{
		$username = trim($_POST["username"]);
		$name = trim($_POST["name"]);
		$phonenumber = trim($_POST["phonenumber"]);
		if($allaskereso == "true") {
                	$birthdate = trim($_POST["birthdate"]);
        	}
        	if($allaskereso == "false") {
                	$postalcode = trim($_POST["postalcode"]);
        	}
        }
        oci_close($conn);
}
    
    // Validate password
    if(empty(trim($_POST["password"]))){
        $password_err = "Please enter a password.";     
    } elseif(strlen(trim($_POST["password"])) < 6){
        $password_err = "Password must have atleast 6 characters.";
    } else{
        $password = trim($_POST["password"]);
    }
    
    // Validate confirm password
    if(empty(trim($_POST["confirm_password"]))){
        $confirm_password_err = "Please confirm password.";     
    } else{
        $confirm_password = trim($_POST["confirm_password"]);
        if(empty($password_err) && ($password != $confirm_password)){
            $confirm_password_err = "Password did not match.";
        }
    }
    
    // Check input errors before inserting in database
    if(empty($username_err) && empty($password_err) && empty($confirm_password_err) && empty($name_err) && empty($phonenumber_err)){
        $password=password_hash($password, PASSWORD_DEFAULT);
    	
	if($allaskereso == "true") {
        	$sql = oci_parse($conn, "insert into Allaskereso values('$username','$password',$phonenumber,'aktiv','$name',TO_DATE('$birthdate', 'yyyy-mm-dd'),'allker.png')");
        }
	else {
		$sql = oci_parse($conn, "insert into Ceg2 values('$username', '$password', '$name', $phonenumber, 'logo.png', '$postalcode')");
	}

            // Attempt to execute the prepared statement
	if(oci_execute($sql))
	{
                // Redirect to login page
                header("location: index.php");
	} else{
        	echo "Oops! Something went wrong. Please try again later.";
        }

	// Close statement
	oci_free_statement($sql);
        oci_close($conn);
    }
}
?>

<title>Sign Up</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body{ font: 14px sans-serif; }
        .wrapper{ width: 360px; padding: 20px; margin: auto;}
    </style>
</head>
<body>
    <div class="wrapper">
	<ul class="nav">
        	<li class="nav-item my-3">
		<a class="nav-link display-6 btn <?php if($allaskereso=="true"){?>btn-primary<?php }?> <?php if($allaskereso=="false"){?>btn-secondary<?php }?>" href="register.php?allaskereso=true">Álláskereső</a>
		</li>
		<li class="nav-item my-3">
			<a class="nav-link display-6 btn <?php if($allaskereso=="true"){?>btn-secondary<?php }?> <?php if($allaskereso=="false"){?>btn-primary<?php }?>" href="register.php?allaskereso=false" >Cég</a>
		</li>
	</ul>
        <h2>Sign Up</h2>
        <p>Please fill this form to create an account.</p>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]."?allaskereso=$allaskereso"); ?>" method="post">
            <div class="form-group">
                <label>email</label>
                <input type="text" name="username" class="form-control <?php echo (!empty($username_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $username; ?>">
                <span class="invalid-feedback"><?php echo $username_err; ?></span>
            </div>    
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" class="form-control <?php echo (!empty($password_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $password; ?>">
                <span class="invalid-feedback"><?php echo $password_err; ?></span>
            </div>
            <div class="form-group">
                <label>Confirm Password</label>
                <input type="password" name="confirm_password" class="form-control <?php echo (!empty($confirm_password_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $confirm_password; ?>">
                <span class="invalid-feedback"><?php echo $confirm_password_err; ?></span>
	    </div>
	    <div class="form-group">
                <label>Name</label>
                <input type="text" name="name" class="form-control <?php echo (!empty($name_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $name; ?>">
                <span class="invalid-feedback"><?php echo $name_err; ?></span>
            </div>
	    <div class="form-group">
		<label>Phone number</label>
                <input type="tel" placeholder="301234567" name="phonenumber" class="form-control <?php echo (!empty($phonenumber_err)) ? 'is-invalid' : ''; ?>" value="<?php echo $phonenumber; ?>">
                <span class="invalid-feedback"><?php echo $phonenumber_err; ?></span>
	    </div>
	<?php if($allaskereso == "true") {?>
	    <div class="form-group">
	 	<label>Birth date</label>
		<br><input type="date" id="datemin" name="birthdate" min="1940-01-01" value="<?php echo $birthdate; ?>" style="border-style: solid; border-color: lightgrey; padding: 5px; border-radius: 5px; min-width: 320px;"><br><br>
		</div>
	    </div>
	<?php }?>
	<?php if($allaskereso == "false") {?>
	<div class="form-group">
                <label>Postal code</label>
                <input type="number" name="postalcode" class="form-control" value="<?php echo $postalcode; ?>">
	    </div>
	<?php }?>
            <div class="form-group col text-center">
                <input type="submit" class="btn btn-primary" value="Submit">
            </div>
            <p style="text-align: center;">Already have an account? <a href="index.php">Login here</a>.</p>
        </form>
    </div>    
</body>
</html>
