<?php
function checkPassword($pwd) 
{
    if (strlen($pwd) < 4) 
    {
        echo "Password too short!". "<br>";
    }

    if (!preg_match("#[0-9]+#", $pwd)) 
    {
        echo "Password must include at least one number!"."<br>";
    }

    if (!preg_match("#[a-zA-Z]+#", $pwd)) 
    {
        echo "Password must include at least one letter!";"<br>";
    }     

    return 0;
}
?>

<?php
$password = $_POST['password'];
checkPassword($password);
?>