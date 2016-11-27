<html>
<body>

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
	<form action="pass_verify.php" method="post">
	<td width="150" align="left" valign="top" class="FormText"> 
	<div>Username</div></td>
	<td width="250"> <input name="Username" type="name" id="Username" class="FormText"></td>
	</tr>
	<tr>
	<td width="150" align="left" valign="top" class="FormText"> 
	<div >Password</div></td>
	<td width="250"> <input name="password" type="password" id="password" class="FormText"></td>
	</tr>
	<tr>
	<br>
	<br>
	<button class="btn btn-primary" type="submit" name="login" value="1">Login</button>
	</form>

	<form action="create_account.php" method="post">
	<button class="btn btn-primary" type="submit" name="create_acc" value="1">Create Account</button>

	</form>
</div>

<body>
<html>