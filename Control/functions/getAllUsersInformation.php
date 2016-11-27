<?php
require_once "includeAllFunctions.php";
function getUsersInformation(){
	$con = mysqli_connect("localhost", "root", "") or die(mysql_error()); 
	mysqli_select_db($con, "mydb") or die(mysql_error()); 
	$results=mysqli_query("SELECT username,high_score,online,email,num_games FROM users");
	return $results;
}
?>