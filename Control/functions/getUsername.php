<?php
function setLoggedOut(){
	//return "meow";
	$con = mysqli_connect("localhost", "root", "") or die(mysql_error()); 
	mysqli_select_db($con, "mydb") or die(mysql_error()); 
	$results=mysqli_query("SELECT username FROM users WHERE online = 'online'");
	mysqli_close($con);
	return $results;
}
?>