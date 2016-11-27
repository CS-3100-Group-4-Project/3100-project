<?php
require_once "includeAllFunctions.php";
function setHighscore($score){
	$username= getUsername();
	$con = mysqli_connect("localhost", "root", "") or die(mysql_error()); 
	mysqli_select_db($con, "mydb") or die(mysql_error()); 
	$currentHighscore=mysqli_query("SELECT high_score FROM users WHERE username = '$username'");
	$currentGamesPlayed=mysqli_query("SELECT num_games FROM users WHERE username = '$username'");
	$currentGamesPlayed+=1;
	if($currentHighscore < $score)
	{
		mysqli_query("UPDATE users SET high_score='$score' WHERE username = '$username' ");
		mysqli_query("UPDATE users SET num_games='$currentGamesPlayed' WHERE username = '$username' ");
	}	
	mysqli_close($con);
}
?>