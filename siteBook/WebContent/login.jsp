<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet" href="jq-ui/jquery-ui.min.css">
<script src="jq-ui/external/jquery/jquery.js"></script>
<script src="jq-ui/jquery-ui.min.js"></script>
<script src="js/mainJS.js" type="text/javascript" ></script>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/mainstyle.css">
<script src="js/loginCheck.js" type="text/javascript" ></script>
<title>Login page</title>


<script>
$(document).on('click','.logoBtn',function(e) {
	
	if(!check()) { 
	e.preventDefault();
	alert("you must login first");
	}
	  
	});
</script>

</head>
<body class="loginBody">

<div class="wrapDiv1">
<nav id="nav">
  	 <ul>
     <li><a href="index.jsp" class="logoBtn"><img src="pics/Facebook_Logo.png"  border="0"></a></li> 
    <li>	
    	<form class="logForm" action="validateLogin.jsp"  method="get">
		<label class="uLabel" for="userName">Username:</label>
		<input class="uinput" type="text" name="userName" id="user">
		<label class="pLabel" for="pass">Password:</label>
		<input type="password" name="pass" id="pass">
		<button class="logBtn" id="login" type="submit">Login</button>
		
		<br>
		<div id="err"></div>
	</form>
    </li>
    </ul>
</nav>

</div>

<div class="loginFormDiv">

<form  class="theLogForm" name="myform" id="myform" action="index.jsp">
	<h1 class="formTitle">Register</h1>
	
		First name: <input class="inName" type="text" id="FirstName" /><span id="info1" class="info"></span><br>
		Last name: <input class="inLName" type="text" id="LastName" /><span id="info2" class="info"></span><br>
		User name: <input class="inUName" type="text" id="UserName" /><span id="info3" class="info"></span><br>
		E-mail: <input class="inEmail" type="text" id="Email" /><span id="info4" class="info"></span><br>
		Password: <input class="inPass" type="password" id="Password" /><span id="info5" class="info"></span><br>
		Confirm password: <input class="confPass" type="password" id="ConfirmPassword" /><span id="info6" class="info"></span><br>
		<input class="submitTheFormBtn" type="submit" value="Submit" onclick="return validForm()">
	
</form>


</div>
<div>
<img src="pics/socMedia.png" class="homeImg">
</div>

<div id="footer">
<label>Copyright © Alex & Shir</label>
</div>



</body>
</html>