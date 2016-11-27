<?php
require_once "includeAllFunctions.php";
function getHighscore(){
	$username= getUsername();
	$con = mysqli_connect("localhost", "root", "") or die(mysql_error()); 
	mysqli_select_db($con, "mydb") or die(mysql_error()); 
	$results=mysqli_query("SELECT high_score FROM users WHERE username = '$username'");
	mysqli_close($con);
	return $results;
}
?>