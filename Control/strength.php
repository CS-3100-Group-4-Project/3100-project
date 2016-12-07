<html>
<body background="bg.png">
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<style>
.center {
    padding: 70px 0;
    text-align: center;
}
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div class="center">


<form action="index.php" method="post">
<button class="btn btn-primary" type="submit" name="create" value="1">Proceed to Login</button>
<form>
<br>
<br>
<form action="create_account.php" method="post">
<button class="btn btn-primary" type="submit" name="create" value="1">Return to Create Account</button>
<form>
<br>
<br>
<body>
<html>


<?php
function checkPassword($pwd) 
{
    $count=0;
    if (strlen($pwd) < 4) 
    {
        echo "Password too short!". "<br>";
	$count=1;
    }

    if (!preg_match("#[0-9]+#", $pwd)) 
    {
        echo "Password must include at least one number!"."<br>";
	$count=1;
	
    }

    if (!preg_match("#[a-zA-Z]+#", $pwd)) 
    {
        echo "Password must include at least one letter!";"<br>";
	$count=1;
    }     
    if ($count==0)
    {
	echo "Account Created";
	echo "<br>";
	echo "Please Check Your Email";
    }
}



$error = "error fam";
$con = mysqli_connect("localhost", "root", "") or die(mysql_error()); 
mysqli_select_db($con, "mydb") or die(mysql_error()); 

$msg = 'Your account has been made, <br /> please verify it by clicking the activation link that has been send to your email.';
$password = $_POST['password'];
$email = $_POST['email'];
$name = $_POST['name'];
//checkPassword($password);
$randompassword = rand(1000,7000);
$addhash = md5(rand(0,1000));
$hash = password_hash($password,PASSWORD_DEFAULT);

$query = mysqli_query($con, "SELECT * FROM users WHERE username='$name'");
$count = mysqli_num_rows($query);


$query = mysqli_query($con, "SELECT * FROM users WHERE email='$email'");
$count2 = mysqli_num_rows($query);


if($count>0)
{
	echo"This Username is taken<br>";
	if($count2>0)
	{
		echo "This email is taken<br>";
	}
}
else
{
checkPassword($password);
mysqli_query($con, "INSERT INTO users (username, password, email, hash) VALUES(
'". mysqli_escape_string($con, $name) ."', 
'". mysqli_escape_string($con, $hash) ."', 
'". mysqli_escape_string($con, $email) ."', 
'". mysqli_escape_string($con, $addhash) ."') ") or die(mysqli_error($con));



$verify = true;
if(password_verify($password, $hash))
{
	$verify = TRUE;
	//echo 'password is valid';
}
else

{
	$verify = FALSE;
//	echo 'password is WRONG';
}


$to      = $email; // Send email to our user
$subject = 'Signup | Verification'; // Give the email a subject 
$message = '
 
Thanks for signing up!
Your account has been created, you can login with the following credentials after you have activated your account by pressing the url below.
 
------------------------
Username: '.$name.'
Password: '.$password.'
------------------------
 
Please click this link to activate your account:
http://localhost/verifyemailandstuff.php?email='.$email.'&hash='.$hash.'
 
'; // Our message above including the link
                     
$headers = 'From:noreply@yourwebsite.com' . "\r\n"; // Set from headers
mail($to, $subject, $message, $headers); // Send our email
}
?>






