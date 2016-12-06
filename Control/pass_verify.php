<?php
session_start();

$con = mysqli_connect("localhost", "root", "") or die(mysql_error()); 
mysqli_select_db($con, "mydb") or die(mysql_error()); 

$password = $_POST['password'];
$name = $_POST['name'];
$_SESSION['name'] = $name;
$query = "SELECT sub.username FROM ( SELECT username,password FROM users WHERE username = '$name' ) sub";
$result = mysqli_query($con, $query); //store query into result
$result = mysqli_fetch_assoc($result); //convert $result into an array

if($result==0)
{
echo "Please enter a valid username<br>";
}
else
{
$dbusername = reset($result); 
if($dbusername == $name)
{
	$userverify=TRUE;
	//echo 'username is correct<br>';
}
else
{
	$userverify=0;
	//echo 'username is WRONG<br>';
}

$query = "SELECT sub.password FROM ( SELECT username,password FROM users WHERE username = '$name' ) sub";
$result = mysqli_query($con, $query); //store query into result
$result = mysqli_fetch_assoc($result); //convert $result into an array
$hash = reset($result); //store the first value into $hash
$verify = true;
if(password_verify($password, $hash)) 
{
	$verify = TRUE;
	//echo 'password is correct<br>';
}
else

{
	$verify = 0;
	//echo 'password is WRONG<br>';
}



if($verify==TRUE)
{
$query = "UPDATE `users` SET `online`=1 WHERE `username` = '$name'";
mysqli_query($con,$query);
$newURL = 'http://localhost/gamepage.php';
header('Location: '.$newURL);
}
else
{
	echo "Please enter a valid username and password<br>";
}

}
?>

<html>
<body background="bg.png">
<form action="index.php" method="post">
<button class="btn btn-primary" type="submit" name="create_acc" value="1">Return to Login</button>
</form>
<body>
<html>