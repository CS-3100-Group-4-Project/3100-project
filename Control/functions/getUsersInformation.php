<?php
require_once "includeAllFunctions.php";
function getUsersInformation(){
	$username= getUsername();
	$con = mysqli_connect("localhost", "root", "") or die(mysql_error()); 
	mysqli_select_db($con, "mydb") or die(mysql_error()); 
	//(`username`, `password`, `hash`, `high_score`, `online`, `email`, `num_games`)
	$results=mysqli_query("SELECT username,high_score,online,email,num_games FROM users WHERE username = '$username'");
	return $results;
}
?>