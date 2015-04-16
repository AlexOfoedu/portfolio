<?php

	require_once 'dbAccess.php';

/*
	session_start();

	$userstr = "Nobody";

	if (isset($_SESSION['user']))
	{
		
		$user = "";
		$loggedin = TRUE;
		$userstr = "$user";

	}
	else
	{

		$loggedin = FALSE;

	}
*/

	$db_conn = mysqli_connect($dbServer, $dbUsername, $dbPassword);

	if(!$dbServer) {
		die('Fuck nuts...' . mysql_error());
	}
	else {
		if($dbServer) echo 'FUCK YES!';
	}

/*

	$user = isset($_POST['txtUsername']) ? print "No Username set": print "Username set";
	$pass = isset($_POST['txtPassword']) ? print "No Password set": print "Password set";

	mysqli_select_db($db_conn, $dbDatabase);
	//mysqli_select_db($dbDatabase) or die("Fucksticks! It didn't work.");


	$query = "SELECT username, passcode FROM tbl_accounts WHERE username='$user' AND passcode='$pass'";
	
	mysqli_query($db_conn, $query);
	
	session_start();
	$_SESSION['txtLoginUsername'] = $user;
	$_SESSION['txtLoginPassword'] = $pass;

	/*
	$user = isset($_POST['txtLoginUsername']) ? print "" : print "";
	$pass = isset($_POST['txtLoginPassword']) ? print "" : print "";
	*/
	
	$user = isset($_POST['txtUsername']) ? print "No Username set ": print "Username set ";
	$pass = isset($_POST['txtPassword']) ? print "No Password set ": print "Password set ";

	if ((!$user) || (!$pass)) {

		die("You did not enter a Username/Password pair. Please enter your login information.");
			mysqli_close($db_conn);
	/*
	$user = isset($_POST['txtUsername']) ? print "No Username set": print "Username set";
	$pass = isset($_POST['txtPassword']) ? print "No Password set": print "Password set";
	*/

	}
	
	/*
	session_start();
	$_SESSION['txtLoginUsername'] = $user;
	$_SESSION['txtLoginPassword'] = $pass;
	*/

		/*
		$query = "SELECT username, passcode FROM tbl_accounts WHERE username='$user' AND passcode='$pass'";

		print "FUCK... You're logged in!";
		print "How's the water up there, $user. Password to get in the cabana is $pass";
		

	}
	*/
	
	/*
	if ($user == "" || $pass == "") {

		print 'FUCK...';

	}
	*/
	else
	{

		mysqli_select_db($db_conn, $dbDatabase);
	//mysqli_select_db($dbDatabase) or die("Fucksticks! It didn't work.");
	
		$queryUser = "SELECT username FROM tbl_accounts WHERE username='$user'";
		$queryPass = "SELECT passcode FROM tbl_accounts WHERE passcode='$pass'";
	
		$loginResultUser = mysqli_query($db_conn, $queryUser);
		$loginResultPass = mysqli_query($db_conn, $queryPass);

		if ((!$loginResultUser) || (!$loginResultPass)) {
			die("Your Username or Password pair does not match any account details on our system. Feel free to try again?" . mysqli_error());
			mysqli_close($db_conn);
		}

		else {
			echo "Logged in as . $user";
			session_start();
			$_SESSION["userSesh"] = $loginResultUser;
			$_SESSION["passSesh"] = $loginResultPass;
		}
		/*
		mysql_select_db($dbDatabase) or die ("FUCCKKKK!" . mysql_error());

		

		die("You are now logged in, $user ."." Why not get started right away? <a href='.../posts.html'>Click here</a> to go to the Posts page!");
		*/
		

	}

?>
