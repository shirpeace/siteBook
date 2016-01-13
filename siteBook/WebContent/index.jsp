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
<title>Home page</title>

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
function writeFunc() {
	
	 var user = $('#userName').text();
	 var post = $('#postTxt').val();
	
	 var i=0;
	 var flag = 0;
	 
	 $.get("txtfiles/posts.txt",function(data){
		 
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
				 
				  var row = $("<tr/>");
			     
			      $.each (JSON.parse(data), function(rowIndex, res){
			    	 
			    	  var td1=res.user;
			      	  var td2=res.post;
			      	
			      	  if((user == td1) && (post == td2)){
			      	    flag = 1;
			      	 
			      	  }
			    	  
			    	  
			      });
			      
			     
			      			 
			 }	 
		 });	
		 
		 if(flag==0){
			 
		    	 
		    	  $.post('savepost.php',{user:user,posttext:post},
	        				 function(data){
		    		  readFunc();
		    	  });
		      	
		 }
		 
		 
	 });
}
</script>

<script>
function readFunc(){

 	$(document).ready(function(){ 
 		var i=0;
 		
 	
 		$("#table").empty();
 			
 			$.get("txtfiles/posts.txt",function(data){
 				if(jQuery.isEmptyObject(data)){
 	 				alert("data empty");
 	 			}
 				var length = 0;
 				for (var key in data) {
 					  if (data.hasOwnProperty(key)) {
 					    length++;
 					  }
 					}
 				     var array =JSON.parse(data).reverse();
 				    $.each(array, function(rowIndex, r) {
 				    	if(i<array.length){
 				    	
 				        var row = $("<tr id='textRow'/>");
 				        var row2 = $("<tr id='topRow'/>");
 				        var row3 = $("<tr id='bottomRow' />");
 				        var like = $("<button class='likeBtn'>like</button>");
 				        var comment = $("<button class='comBtn'>comment</button>");
 				       var toggle = $("<button class='togBtn'>show/hide comments</button>");
 	 				  
 				       
 				        	
 				        row.append(r.post);
 				   
 				           
 				       
 				       var today= new Date();
 				       var monthNames = ["January", "February", "March", "April", "May", "June",
 				                       "July", "August", "September", "October", "November", "December"
 				                     ];

 				       
 				       
 				      row2.append("Posted by "+r.user+" -   "+today.getDate()+" "+monthNames[today.getMonth()]+" "+today.getFullYear()+":");
 				        
 				    
 				       $("#table").append(row2);
 				  
 				       
 				        $("#table").append(row);
 				     	
 				        like.button();
 				        comment.button();
 				        toggle.button();
 				        row3.append(like);
 				        row3.append(comment);
 				        row3.append(toggle);
 				       $("#table").append(row3);
 				      
 				    
 				    	
 				     
 				       
 				      
 				       $('#btn').click(function() {
 				    	    location.reload();
 				    	});
 				      
 				       i++;
 				    	}
 				        	
 				    });
 				 
 				
 				   
 			});
 			
 		
 		
 	}); 
	
	
}
</script>


<script>
function appComments(){
	$(document).ready(function(){ 
		
	$.get("txtfiles/comments.txt",function(data){
	 var i=0;
	 var k=0;
     var arrayc =JSON.parse(data);
     var arrayf =JSON.parse(data);
     var flag=0;
     var ar1=[];
     var ar2=[];
     var rowNum=0;
     var inarr=[];
     
     $.each(arrayc, function(rowIndex, r) {
    	
	    		 ar1.push(r.index+","+r.comment);
	    		 
	    		 ar2.push(r.index+","+r.comment);
	    		    		
     }); 		 
     var count=0;
     var row = $("<tr id='commentRow' class='commentRow'/>");
     $.each( ar1, function( key1 , value1 ) {
    	 var str1 = value1;
    	 var res1 = str1.split(",");
    	 var in1=res1[0];
    	 var st1=res1[1];
    
    	 var row = $("<tr id='commentRow' class='commentRow'/>");
    	 
    	 $.each( ar2, function( key2 , value2 ) {
    		 var str2 = value2;
        	 var res2 = str2.split(",");
        	 var in2=res2[0];
        	 var st2=res2[1];
        	
        	var countin1=0;
        	 $.each( ar2, function( key3 , value3) {
        		 var str3 = value3;
            	 var res3 = str3.split(",");
            	 var in3=res3[0];
            	 var st3=res3[1];
        		 if(in2==in3){
        			 countin1++;
        		 }
        	 });
        	
        	 if(in1==in2 && st1!=st2 && jQuery.inArray(in1, inarr) == -1){
        		 
        	   
        		 row.append(st1+"<br>"+st2);
        		 var index= in1;
	    		 rowNum= +index*3 + +index - 2;
	    		
	    		 $('#table > tbody > tr').eq(rowNum).after(row);
	    		 inarr.push(in1);
        		 
	    		 
        	 }
        	 else if(in1==in2 && st1==st2 && jQuery.inArray(in1, inarr) == -1 && countin1==1){
        		
        		
        			 row.append(st1+"<br>");
            		 var index= in1;
    	    		 rowNum= +index*3 + +index - 2;
    	    	
    	    		 $('#table > tbody > tr').eq(rowNum).after(row);
    	    		 inarr.push(in1);
        		 
        	 }
        	
        	 	
        	});
    	 
    	 
    	});
     });
 	});
}

</script>

<script>

	
$(document).on('click','.togBtn',function(e) {
	  
	   e.preventDefault();
	   $(this).parents("tr").next().slideToggle();
	   return false; // it does both preventDefault & stopPropagation.
	});
     

</script>


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
function readFriendsFunc(){

 	$(document).ready(function(){ 
 		var i=0;
 		
 	
 		$("#friendTable").empty();
 			
 			$.get("txtfiles/onlineFriends.txt",function(data){
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
 				    		
 				        var row = $("<tr/>");
 				        
 				        $.each(r, function(colIndex, c) { 
 				        	var img = "<img src='pics/online.png' />";
 				        	row.append(img);
 				        	var res = c.split(" ");
 				        	var link = res[0]+"_"+res[1]+".jsp";
 				        	var alink = '<td><a class="freLinks" href="'+link+'">'+res[0]+" "+res[1]+'</a></td>';
 				            row.append($(alink));
 				           
 				        });
 				        
 				        $("#friendTable").append(row);
 				       
 				       i++;
 				    	}
 				        	
 				    });
 				 
 				
 				   
 			});
 			
 		
 		
 	}); 
	
	
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
 				    		
 				      
 				      	var row=$('<a href="index.jsp" id="liMes" class="liMes"></a>');
 				   	   row.append(r.name+" "+r.not);
				      	$(".drop2").append(row);
 				           
 				        
 				       
 				       
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
 				      row.append(r.firstname+" "+r.lastname);
 				       $("#userName").append(row);
 				           
 				        
 				       
 				       
 				       i++;
 				    	}
 				        	
 				    });
 				 
 				
 				   
 			});
 			
 		
 		
 	});	
	
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
<body>

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
	<img src="pics/friends.png" class=fr_img><label class="theFriendsLabel"><b>Online Friends</b></label>
</div>
<div id="friendList">

	<table id="friendTable">
        <tr>
            <th></th>
           
        </tr>
       
    </table>
</div>

	
<form class="writeLabel">
		<label class="theLabel"><b>What's on your mind?</b></label>
		<input id="postTxt" type="text" class="writeText" >
		<input type="button" class="btn" id="btn" value="Post" onclick="writeFunc();">
		<br>
</form>
</div>

<div class="verticalDiv"></div>

<div class="wrapDiv2">
<div id="textDiv">
	<table id="table">
        <tr>
            <th></th>
        </tr> 
             
    </table>
</div>
</div>









<div id="footer">
<label>Copyright © Alex & Shir</label>
</div>


<script type="text/javascript">
	readFriendsFunc();

    setInterval("readFriendsFunc()", 10000);

   readUsersFunc();
   readFunc();
   readMessagesFunc();
   readNotsFunc();
   appComments();
   hidem();

 
</script>

</body>
</html>