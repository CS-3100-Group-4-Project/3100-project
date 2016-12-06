<?php
session_start();

$con = mysqli_connect("localhost", "root", "") or die(mysql_error()); 
mysqli_select_db($con, "mydb") or die(mysql_error());

$name = $_SESSION['name'];

$query = "UPDATE `users` SET `online`=0 WHERE `username` = '$name'";
mysqli_query($con,$query);
$newURL = 'http://localhost/index.php';
header('Location: '.$newURL); //redirect to hub

?>