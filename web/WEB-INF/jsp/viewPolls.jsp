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
                     {   /*
                         $("#pollList").append('<div id="pid'+pollJSON[i][0]+'"><h3>'+pollJSON[i][0]+":"+pollJSON[i][3]+'</h3></div>')
                         $("#pid"+pollJSON[i][0]).append('<button onclick="openPoll('+parseInt(pollJSON[i][0])+')">Take Poll</button>');
                         $("#pid"+pollJSON[i][0]).append('<button onclick="pollResult('+parseInt(pollJSON[i][0])+')">Results</button>');
                         */
                         $("#pollList").append('<div id="pid'+pollJSON[i]["pid"]+'"><h3>'+pollJSON[i]["pid"]+":"+pollJSON[i]["title"]+'</h3></div>');
                         $("#pid"+pollJSON[i]["pid"]).append('<button onclick="openPoll('+i+')">Take Poll</button>');
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
 /*    $('#dialog-modal').dialog({
         resizable: false,
         height: 300,
         width: 500,
         dialogClass: 'noTitle',
         modal: true
      });
      $('#dialog-modal').dialog('show');   */
  // $("#dialog-modal").dialog('open');
  }}
);
           },
       close : function() {location.reload(true);}
   });
   /* 
    resizable: false,
            modal: true,
            width: 400,
            height: 450,
            overlay: { backgroundColor: "#000", opacity: 0.5 },
            buttons:{ "Close": function() { $(this).dialog("close"); } },
            close: function(ev, ui) { $(this).remove(); },*/
       
       
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
