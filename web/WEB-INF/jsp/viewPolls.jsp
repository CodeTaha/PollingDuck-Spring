<%-- 
    Document   : viewPolls
    Created on : Apr 1, 2014, 12:44:23 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Polls</title>
        <link rel="stylesheet" href="pages/resources/css/jquery-ui.css">
        <link rel="stylesheet" href="pages/resources/css/jquery-ui.min.css">
        <link rel="stylesheet" href="pages/resources/css/jquery-ui.theme.css">
  <script src="pages/resources/js/jquery.min.js"></script>
  <script src="pages/resources/js/jquery-ui.js"></script>
  
        <script>
    var pollJSON;        
    $(document).ready(function(){
                
                 
                $.ajax({
           type: "POST",       // the dNodeNameefault
           url: "viewPollsData",
           data: { },
           success: function(data){
               //console.log(data);
               pollJSON=JSON.parse(data);
               console.log("pollJSON");
               console.log(pollJSON);
                 //alert(data);
                 for(var i=0; i<pollJSON.length;i++)
                     {  
                       /*  $("#pollList").append('<div id="pid'+pollJSON[i]["pid"]+'"><h3>'+pollJSON[i]["pid"]+":"+pollJSON[i]["title"]+'</h3></div>');
                         $("#pid"+pollJSON[i]["pid"]).append('<button onclick="openPoll('+i+')">Take Poll</button>');
                         $("#pid"+pollJSON[i]["pid"]).append('<button onclick="pollResult('+parseInt(pollJSON[i]["pid"])+')">Results</button>');
                       */
                      $("#pollList").append('<hr><div id="pid'+pollJSON[i]["pid"]+'">\n\
                      <h3>'+pollJSON[i]["pid"]+":"+pollJSON[i]["title"]+'</h3>\n\
                         \n\<a href="/PollingDuck-Spring/profile/'+pollJSON[i]["user"]["handle"]+'"><img width="50" height = "50" src='+pollJSON[i]["user"]["profile_pic"]+"></a>  <a href='/PollingDuck-Spring/profile/"+pollJSON[i]["user"]["handle"]+"'>"+pollJSON[i]["user"]["name"]+"</a>  <a href='/PollingDuck-Spring/profile/"+pollJSON[i]["user"]["handle"]+"'  >@"+pollJSON[i]["user"]["handle"]+'</a>\n\
                          \n\<h4>'+pollJSON[i]["description"] +'</h4><h5>REWARD :'+pollJSON[i]["reward"]+'</h5></div>'
                          );
                  $("#pid"+pollJSON[i]["pid"]).append("<b><i>TAGS</i></b> :  ");
                         for(var j=0;j<pollJSON[i]["cat_list"].length;j++)
                           $("#pid"+pollJSON[i]["pid"]).append('<b>'+pollJSON[i]["cat_list"][j]["category_name"]+"</b> ");
                         $("#pid"+pollJSON[i]["pid"]).append('<br><button onclick="openPoll('+i+')">Take Poll</button>');
                         $("#pid"+pollJSON[i]["pid"]).append('<button onclick="pollResult('+parseInt(pollJSON[i]["pid"])+')">Results</button>');
                      
                         
                     }
                   
            }
            });
            });
            
           function openPoll(i)
       {$( "#dialog-modal").empty();
               var pollJson_obj=pollJSON[i];
               console.log("In OpenPoll");
               console.log(pollJson_obj);
            $( ".selector" ).dialog({  
   open: function(event, ui) {   $( "#dialog-modal").load( 'solvePoll', {pid: pollJson_obj['pid'], obj:JSON.stringify(pollJson_obj), fn:1}, function( response, status, xhr ) 
               {  
  if ( status === "error" ) {
    var msg = "Sorry but there was an error: "; 
    $( "#dialog-modal" ).html( msg + xhr.status + " " + xhr.statusText ); 

  }}
);
           },
       close : function() {location.reload(true);}
   });
   }
          
           function pollResult(pid)
           {
                var win = window.open("result/"+pid, '_blank');
                win.focus();
                /*$( "#dialog-modal").empty().load( 'pollResult.jsp', {pid: pid}, function( response, status, xhr ) {
                if ( status === "error" ) {
                var msg = "Sorry but there was an error: ";
                $( "#dialog-modal" ).html( msg + xhr.status + " " + xhr.statusText );*/
            }
           
        </script>
    </head>
    <body>
        <h1>HEllo World!</h1>
        <div id="pollList" style="float:left">
            
        </div>
     <!--   <div id="dialog-modal" title="Solve Poll" style="float:right">   -->
            <div class="selector">
                <div id="dialog-modal" title="Solve Poll" >
  <p>.</p>
</div>
            </div>
    </body>
</html>
