/**
 * 
 */
$(document).ready(function(){
	$("#msgMenu").mouseenter(function(){
        $("#pMsgMenu").slideDown(100);
    });
    
    $("#msgMenu").mouseleave(function(){
        $("#pMsgMenu").slideUp(100);
    });
    
    $("#notfMenu").mouseenter(function(){
        $("#pNotfMenu").slideDown(100);
    });
    
    $("#notfMenu").mouseleave(function(){
        $("#pNotfMenu").slideUp(100);
    });
   
});