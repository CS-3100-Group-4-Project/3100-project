<!DOCTYPE html>
<html>
	<head>
		<title>View Statistics</title>
	</head>

	<body>
	<form action="gamepage.php" method="post">
	<button class="btn btn-primary" type="submit" name="create_acc" value="1">Return to Game</button>
	</form>
		<?php
		$username="root";
		$password="";
		$database="mydb";
		$con = mysqli_connect("localhost", "root", "", "mydb");
		
		$query = "select  from users";
		$data = mysqli_query($con, "SELECT `username`,`high_score`,`online`,`num_games` FROM `users` ");
		$num = mysqli_num_rows($data);
		//$data = mysql_fetch_assoc($data);
		?>
		
		<h3><center>Clicker Statistics</center></h3>
		<table border = 1px cellspacing = "2" cellpadding = "2" align = "center">
			<tr>
				<th>Username</th>
				<th>High Score</th>
				<th>Online?</th>
				<th>Number of Games</th>
			</tr>
			<?php
			
			
			$i = 0;
			
			while($row = $data->fetch_assoc())
			{
				//$f1 = mysql_result($data,$i,'username');
				//$f2 = mysql_result($data,$i,'high_score');
				//$f3 = mysql_result($data,$i,'online');
				//$f4 = mysql_result($data,$i,'num_games');
			
			?>
			<tr>
				<td> <?php echo $row["username"]?> </td>
				<td> <?php echo $row["high_score"]?> </td>
				<td> <?php echo $row["online"]?> </td>
				<td> <?php echo $row["num_games"]?> </td>	
			</tr>
		<?php	$i++;} ?>
		</table>
	</body>
</html>