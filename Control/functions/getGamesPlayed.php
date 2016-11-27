<?php
require_once "includeAllFunctions.php";
function getGamesPlayed(){
	$username= getUsername();
	$con = mysqli_connect("localhost", "root", "") or die(mysql_error()); 
	mysqli_select_db($con, "mydb") or die(mysql_error()); 
	$results=mysqli_query("SELECT num_games FROM users WHERE username = '$username'");
	return $results;
}
?>