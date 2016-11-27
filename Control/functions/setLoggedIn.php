<?php
require_once "includeAllFunctions.php";
function setLoggedIn($username){
	$con = mysqli_connect("localhost", "root", "") or die(mysql_error()); 
	mysqli_select_db($con, "mydb") or die(mysql_error()); 
	mysqli_query("UPDATE users SET online='online' WHERE username = '$username' ");
}
?>