<?php
$password = $_POST['password'];
//$password = 'password123';
$hash = password_hash($password,PASSWORD_DEFAULT);
$verify = true;
if(password_verify($password, $hash))
{
	$verify = TRUE;
	echo 'password is valid';
}
else

{
	$verify = FALSE;
	echo 'password is WRONG';
}
?>