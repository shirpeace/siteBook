function check()
{
	var user = document.getElementById("user");
	var pass = document.getElementById("pass");

	if(user.value != "Admin" || pass.value!="Admin")
	{
		var err=document.getElementById("err");
		err.innerHTML="Username or password are incorrect.";
		err.style.display="inline";
		err.style.fontSize="smaller";
		err.style.color="pink";
		return false;
	}
	
	return true;
}

function validForm(){
	var result = true;
	
	if(!validName(FirstName,info1))
		result = false;
	if(!validName(LastName,info2))
		result = false;
	if(!validUser(UserName,info3))
		result = false;
	if(!validMail(Email,info4))
		result = false;
	if(!validatePass(Password,ConfirmPassword,info5,info6))
		result = false;
	
	if(result){
		alert("Your information has been received");
		return true;
	}
	
	else{
		return false;
	}
}

function validName(obj,errInfo){
	if(!isValueEmpty(obj)){
		
		var result = /^[a-zA-Z]+$/.test(obj.value);
		if (!result) {
			errInfo.innerHTML = "Name must be english letters only!";
			err.style.color="pink";
			return false;
		}
		else {
			errInfo.style.display = "none";
			return true;
		}
	}
	else {
		errInfo.innerHTML = "Please enter a name";
		err.style.color="pink";
		return false;
	}
}

function validMail(obj,errInfo){
	if(!isValueEmpty(obj)){
		
		var result = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(obj.value);
		if (!result) {
			errInfo.innerHTML = "Invalid email!Enter name@mail.domain";
			
			return false;
		}
		else {
			errInfo.style.display = "none";
			return true;
		}
	}
	else {
		errInfo.innerHTML = "Please enter your E-mail address";
		
		return false;
	}
}

function validUser(obj,errInfo){
	if(!isValueEmpty(obj)){
		if(obj.value.charAt(0) != "." && obj.value.charAt((obj.value.length - 1)) != "."){
			var result = /^[a-zA-Z\d.]+$/.test(obj.value);
			if (!result) {
				errInfo.innerHTML = "User name must be english letters, numbers or . !";
				
				return false;
			}
			else {
				errInfo.style.display = "none";
				return true;
			}
			
		}
		else{
			errInfo.innerHTML = "User name can not start or end with . !";
			
			return false;
		}		
	}
	else {
		errInfo.innerHTML = "Please enter a user name";
		
		return false;
	}
}

function validatePass(obj1,obj2,errInfo1,errInfo2){
	if(isValueEmpty(obj1)){
		errInfo1.innerHTML = "Please enter a password";
	
		if(isValueEmpty(obj2)){
			errInfo2.innerHTML = "And re-enter the password here";	
		}
		return false;
	} 
	else if(isValueEmpty(obj2)){
		errInfo1.style.display = "none";
		errInfo2.innerHTML = "Please re-enter the password";
	
		return false;
	}
	else if(obj1.value != obj2.value){
		errInfo1.style.display = "none";
		errInfo2.innerHTML = "Password does not match";
	
		return false;
		
	}
	else{
		errInfo1.style.display = "none";
		errInfo2.style.display = "none";
		return true;		
	}
}

function isValueEmpty(obj) {

	if (obj.value.trim().length == 0)
		return true;

	return false;
}