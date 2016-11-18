<?php


$con = mysqli_connect("localhost", "root", "") or die(mysql_error()); 
mysqli_select_db($con, "mydb") or die(mysql_error()); 

$password = $_POST['password'];
$name = $_POST['Username'];

$query = "SELECT sub.password FROM ( SELECT username,password FROM users WHERE username = '$name' ) sub";
$result = mysqli_query($con, $query); //store query into result
$result = mysqli_fetch_assoc($result); //convert $result into an array
$hash = reset($result); //store the first value into $hash
$verify = true;
if(password_verify($password, $hash)) 
{
	$verify = TRUE;
	echo 'password is correct<br>';
}
else

{
	$verify = FALSE;
	echo 'password is WRONG<br>';
}

$query = "SELECT sub.username FROM ( SELECT username,password FROM users WHERE username = '$name' ) sub";
$result = mysqli_query($con, $query); //store query into result
$result = mysqli_fetch_assoc($result); //convert $result into an array
$dbusername = reset($result); //store the first value into $hash

if($dbusername == $name)
{
	$userverify=TRUE;
	echo 'username is correct<br>';
}
else
{
	$userverify=FALSE;
	echo 'username is WRONG<br>';
}
?>

