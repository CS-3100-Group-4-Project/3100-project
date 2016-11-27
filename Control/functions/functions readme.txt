setHighscore($score)
	-should be called everytime a game is finished with the score as the paramater
	-calling this function will also increment games played
	
setLoggedIn($username)
	-should be called when a user logs in with the username as a paramater

setLoggedOut($username)
	-should be called when a user logs out with the username as a paramater

getUsersInformation()
	-returns the information of the currently logged in user

getAllUsersInformation()
	-returns the information of all users

getUsername()
	-returns the username of the currently logged in user
	-currently assumes only one player is logged in at a time, otherwise may return wrong username
	
getHighscore()
	-returns the highscore of the currently logged in user
	
getGamesPlayed()
	-return the number of games played by the currently logged in user
		
includeAllFunctions
	-includes all the php files in control/functions/ directory
	
createDatabase
	-runs the users.sql code in the mydb database within mySQL