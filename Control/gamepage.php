<!DOCTYPE html>
<html>
	<head>
		<title>Play the Game!</title>
	</head>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<body>
	<div style="background-color:deepskyblue; float:center; 
	width:1500px; height:150px; text-align:center;" >
	<br><br><strong><font size="25">Click Me!</font><strong><br>
	<style type="text/css">
		.square {
			float: left;
			background-color: deepskyblue;
			width: 250px;
			height: 650px;
			text-align: center;
		}
	</style>
	<div class="square">
		<br>
		<br>
		<?php
			$con = mysqli_connect("localhost", "root", ""); 
			mysqli_select_db($con, "mydb"); 
			$results=mysqli_query($con,"SELECT username FROM users WHERE online = '1'");
			$results=mysqli_fetch_assoc($results);
			$results=reset($results);
			echo "Welcome, $results!";
			mysqli_close($con);
		?>
		<br>
		<br>
		<form action="statspage.php">
			<button class="btn btn-primary" href=>View User Statistics</button>
		</form>
		<br>
		<br>
		<form align="center" name="form1" method="post" action="Functions\setLoggedOut.php">
			<label>
				<button class="btn btn-primary" type="submit" id="submit2" name="login" value="1">Log out</button>
			</label>
		</form>
	</div>
	<style> .center {
				text-align: center;
				float: center;
			}
	</style>
	<div class= "center">
	<br><br><br>
		<object width="700" height="550">
			<param name="game" value="groupGame.swf">
			<embed src="..\Interface\groupGame\bin\groupGame.swf" width="700" height="550">
			</embed>
		</object>
	</div>
	</body>
</html>