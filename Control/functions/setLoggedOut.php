<!DOCTYPE html>
<html>
<?php
require_once "includeAllFunctions.php";
function setLoggedOut($username){
	$con = mysqli_connect("localhost", "root", "") or die(mysql_error()); 
	mysqli_select_db($con, "mydb") or die(mysql_error()); 
	mysqli_query("UPDATE users SET online='0' WHERE username = '$username' ");
	mysqli_close($con);
}
?>
	<head>
		<title>Logged Out</title>
	</head>
	
	<body>
		<p>You have been succesfully logged out.</p>
		<form align="center" name="form1" method="post" action="..\index.php">
			<label>
				<input name="submit2" type="submit" id="submit2" value="Return to Login">
			</label>
		</form>