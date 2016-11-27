<?php
// Create connection
$con = mysqli_connect("localhost", "root", "") or die(mysql_error()); 
// Check connection
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}
$tablemaker = file_get_contents('users.sql');
if (mysqli_multi_query($con, $tablemaker)) {
    //echo "mytable created successfully";
} else {
	//echo "Error creating table: " . mysqli_error($con);
}

mysqli_close($con);
?>