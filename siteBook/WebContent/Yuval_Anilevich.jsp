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
<title>Yuval Anilevich Profile</title>


<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
%>

<%
	if (session.getAttribute("userid") != null) {
		if (!session.getAttribute("userid").equals("Admin")) {
			response.sendRedirect("login.jsp");
			return;
		} 
	}

	else {
		response.sendRedirect("login.jsp");
		return;
	}
%>

<script>
$(document).ready(function(){ 
	 $(".messages").hover(function(){
		 $('.drop1').show();
		 $('.drop1').parent().append($('.drop1')); 
		 $('.writeLabel').css('z-index', -1); 
         $('.drop1').stop().animate({'height':'150px'},200);
     },
     function hideMenus() {
         $('.drop1').stop().animate({'height':'0px'},200);
         $('.writeLabel').css('z-index', 10);
     }
 );
});

$(document).ready(function(){ 
	 $(".nots").hover(function(){
		 $('.drop2').show();
		 $('.drop2').parent().append($('.drop2')); 
		 $('.writeLabel').css('z-index', -1); 
        $('.drop2').stop().animate({'height':'150px'},200);
    },
    function hideMenus() {
        $('.drop2').stop().animate({'height':'0px'},200);
        $('.writeLabel').css('z-index', 10);
    }
);
});
$(document).ready(function() {
    $('#searchInput').on('keyup', function() {
    	 $('.drop3').show();
		 $('.drop3').parent().append($('.drop3')); 
		 $('.writeLabel').css('z-index', -1); 
 		 $('.imagesDiv').css('z-index', -1); 
       $('.drop3').stop().animate({'height':'190px'},200);
       readText();
      
       
    });
});
$(document).click(function() {
	 $('.drop3').stop().animate({'height':'0px'},200);
     $('.writeLabel').css('z-index', 10);
});
$(".drop3").click(function(e) {
    e.stopPropagation(); // This is the preferred method.
    return false;        // This should not be used unless you do not want
                         // any click events registering inside the div
});
function hidem(){
   
	$('.drop1').hide();
	$('.drop2').hide();
	$('.drop3').hide();
}
    

</script>


<script>
function readMessagesFunc(){

 	$(document).ready(function(){ 
 		var i=0;
 		
 	
 		$(".drop1").empty();
 			
 			$.get("txtfiles/messages.txt",function(data){
 				if(jQuery.isEmptyObject(data)){
 	 				alert("data empty");
 	 			}
 				var length = 0;
 				for (var key in data) {
 					  if (data.hasOwnProperty(key)) {
 					    length++;
 					  }
 					}
 				
 				    $.each(JSON.parse(data), function(rowIndex, r) {
 				    	if(i<JSON.parse(data).length){
 				    		
 				        
 				        
 				      	var row=$('<a href="index.jsp" class="liMes"><li class="liMes"></li></a>');
 				        row.append(r.name+": "+r.message+"<br>");
 				       $(".drop1").append(row);
 				           
 				        
 				       
 				       
 				       i++;
 				    	}
 				        	
 				    });
 				 
 				
 				   
 			});
 			
 		
 		
 	}); 
	
	
}
</script>

<script>
function readNotsFunc(){

 	$(document).ready(function(){ 
 		var i=0;
 		
 	
 		$(".drop2").empty();
 			
 			$.get("txtfiles/notifications.txt",function(data){
 				if(jQuery.isEmptyObject(data)){
 	 				alert("data empty");
 	 			}
 				var length = 0;
 				for (var key in data) {
 					  if (data.hasOwnProperty(key)) {
 					    length++;
 					  }
 					}
 				
 				    $.each(JSON.parse(data), function(rowIndex, r) {
 				    	if(i<JSON.parse(data).length){
 				    		
 				        
 				        
 				      	var row=$('<a href="index.jsp" class="liMes"><li class="liMes"></li></a>');
 				        row.append(r.name+" "+r.not+"<br>");
 				       $(".drop2").append(row);
 				           
 				        
 				       
 				       
 				       i++;
 				    	}
 				        	
 				    });
 				 
 				
 				   
 			});
 			
 		
 		
 	}); 
	
	
}
</script>
<script>
function readFriends(){

 	$(document).ready(function(){ 
 		var i=0;
 		
 	
 		$(".friendList").empty();
 			
 			$.get("txtfiles/friends.txt",function(data){
 				if(jQuery.isEmptyObject(data)){
 	 				alert("data empty");
 	 			}
 				var length = 0;
 				for (var key in data) {
 					  if (data.hasOwnProperty(key)) {
 					    length++;
 					  }
 					}
 				
 				    $.each(JSON.parse(data), function(rowIndex, r) {
 				    	if(i<JSON.parse(data).length){
 				    		
 				        
 				        
 				      	var row=$('<tr/>');
 				        var flag = 0;
 				      	
 				      	$.each(r, function(colIndex, c) { 
				        	
				        	var res = c.split(" ");
				        	var link = res[0]+"_"+res[1]+".jsp";
				        	var alink = '<td><a class="freLinks" href="'+link+'">'+res[0]+" "+res[1]+'</a></td>';
				        	var user = $(".userName").text();
				        	
				        	if(c==user){
				        		alink='<td><a class="freLinks" href="profile.jsp">'+res[0]+" "+res[1]+'</a></td>';
				        	}
				        	row.append($(alink));
				            var g = $('#nameLabel').text();
				            var gg = g.split(" ");
				            if(res[0]==gg[0] && res[1]==gg[1]){
				            	flag=1;
				            }
				           
				        });
 				      	if(flag==0){
 				      	 $("#friendTable").append(row);
 				      	}
 				      
 				           
 				        
 				       
 				       
 				       i++;
 				    	}
 				        	
 				    });
 				 
 				
 				   
 			});
 			
 		
 		
 	}); 
	
	
}
</script>
<script>
function readUsersFunc(){

 	$(document).ready(function(){ 
 		var i=0;
 		
 	
 		$(".userName").empty();
 			
 			$.get("txtfiles/users.txt",function(data){
 				if(jQuery.isEmptyObject(data)){
 	 				alert("data empty");
 	 			}
 				var length = 0;
 				for (var key in data) {
 					  if (data.hasOwnProperty(key)) {
 					    length++;
 					  }
 					}
 				
 				    $.each(JSON.parse(data), function(rowIndex, r) {
 				    	if(i<JSON.parse(data).length){
 				    		
 				        
 				      var row=$("<a href='profile.jsp'></a>");
 				      var row2=$("<a href='profile.jsp' class='nameLabel'><label></label></a>");
 				      row.append(r.firstname+" "+r.lastname);
 				      row2.append(r.firstname+" "+r.lastname);
 				       $("#userName").append(row);

 				           
 				       i++;
 				    	}
 				        	
 				    });
 				 
 				
 				   
 			});
 			
 		
 		
 	}); 
	
	
}
</script>
<script>
function userProfileName(){
	
	var title = document.title;
	var res = title.split(" ");
	var name = "<a href='profile.jsp' class='nameLabel'><label>"+res[0]+" "+res[1]+"</label></a>";
	$(".nameLabel").append(name);
	$(".theFriendsLabel").append(res[0]+"'s friends");
	$(".ftl").append(res[0]+"'s likes and interests");
	$(".groupTitle").append(res[0]+"'s groups");
	
}
</script>
<script>
function readText(){

 	$(document).ready(function(){ 
 		var i=0;
 		var txt = $('.searchTxt').val();
        
        
 	
 		$(".drop3").empty();
 			
 			$.get("txtfiles/friends.txt",function(data){
 				if(jQuery.isEmptyObject(data)){
 	 				alert("data empty");
 	 			}
 				var length = 0;
 				for (var key in data) {
 					  if (data.hasOwnProperty(key)) {
 					    length++;
 					  }
 					}
 					var flag=0;
 				    $.each(JSON.parse(data), function(rowIndex, r) {
 				    	if(i<JSON.parse(data).length){
 				    		
 				    	var str = r.name;		
 				    	var res = str.split(" ");
 				    	var link = res[0]+"_"+res[1]+".jsp"
 				      	var row=$('<a href="'+link+'" id="drop3Links" class="drop3Links"></a>');
 				      	
 				    	var g = $('#userName').text();
 				    	
 				    	if(g==str){
 				    		
 				    		flag=1;
 				    	}
 				      	if (str.indexOf(txt) >= 0 || (str.toLowerCase().indexOf(txt) >= 0)){
 				      		if(flag==0){
 				      		row.append(r.name);
 					      	$(".drop3").append(row);
 				      		} 					    
 				      	}
 				      	
 				           
 				        
 				       
 				       
 				       i++;
 				    	}
 				        	
 				    });
 				 
 				
 				   
 			});
 			
 		
 		
 	}); 
	
	
}
</script>
</head>
<body class="profileBody">

<div class="wrapDiv1">
<nav id="nav">
  	 <ul>
     <li><a href="index.jsp"><img src="pics/Facebook_Logo.png"  border="0"></a></li> 
      <li class="userName" id="userName"><li>
     <li class="search" id="searchInput" ><input class="searchTxt" type="text">
     	<ul class="drop3">
     	
     	</ul>
     <li>
     <li class="home"><a href="index.jsp">Home</a><li>
      <li class="profile"><a href="profile.jsp">Profile</a><li>
     <li class="messages"><a href="index.jsp">Messages</a>
     	<ul class="drop1">
     	   		
     	</ul>     
     <li>
     <li class="nots"><a href="index.jsp">Notifications</a>
     	<ul class="drop2">
     		   		
     	</ul> 
     
     <li>
     <li class="log"><a href="logout.jsp">Log out</a><li>
     </ul>
  
</nav>

<div class="onFriends">
	<img src="pics/friendslist.png" class="flimg"/><b><label class="theFriendsLabel" id="someProFreLabel"></label></b>
</div>
<div id="friendList">

	<table id="friendTable" class="frTable">
        <tr>
            <th></th>
           
        </tr>
       
    </table>
</div>
<div class="groupDiv">
<img class="groupPic"  src="pics/groups.png"/><b><Label class="groupTitle"></Label></b>
</div>
 <div class="contentGroupDiv">
 <a href="http://www.technion.ac.il/en/"><img class="group1" src="pics/groupTechnion.png"/></a> <a href="http://www.idf.il/english/"><img class="group1" src="pics/groupIDF.png"/></a>
    
 </div>

<div class="imagesDiv">
<img src="pics/yuvalProfpic.jpg" class="profpic"/>
<img src="pics/yuvalBack.jpg" class="backpic"/>
<Label class="nameLabel" id="nameLabel"></Label>
</div>	





</div>

<div class="verticalDiv"></div>

<div class="fTitleDiv">
<img class="smile" src="pics/likeSmile.png"/><Label class="ftl"></Label>
</div>
<div class="friendListTableDiv">
	
	<a href="https://en.wikipedia.org/wiki/Engineering"><img class="interest1" src="pics/interestIsEngineering.png"/></a><a href="http://www.sciencemag.org/"><img class="interest2" src="pics/interestScience.png"/></a><a href="https://en.wikipedia.org/wiki/Spirituality"><img class="interest3" src="pics/interestSpirit.png"/></a><a href="http://www.israel-music.com"><img class="interest4" src="pics/interestIsMusic.png"/></a>
	
</div>






<div id="footer">
<label>Copyright © Alex & Shir</label>
</div>


<script type="text/javascript">

   
   readMessagesFunc();
   readNotsFunc();
   readUsersFunc();
   readFriends();
   hidem();
  
   userProfileName();
</script>

</body>
</html>