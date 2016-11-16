<html>
<body>

<form action="login.php" method="post">
<button type="submit" name="login" value="1">Proceed to Log In</button>
</form>

<form action="create_account.php" method="post">
<button type="submit" name="login" value="1">Return to Create Account</button>
</form>

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
?>

<?php
$error = "error fam";
$con = mysqli_connect("localhost", "root", "") or die(mysql_error()); 
mysqli_select_db($con, "mydb") or die(mysql_error()); 

$msg = 'Your account has been made, <br /> please verify it by clicking the activation link that has been send to your email.';
$password = $_POST['password'];
$email = $_POST['email'];
$name = $_POST['name'];
checkPassword($password);
$randompassword = rand(1000,7000);
$addhash = md5(rand(0,1000));
$hash = password_hash($password,PASSWORD_DEFAULT);


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
?>



?>



<?php
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

?>






