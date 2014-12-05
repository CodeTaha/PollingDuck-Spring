<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../../pages/resources/js/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../../pages/resources/css/jquery.dataTables.css">
  <link rel="stylesheet" type="text/css" href="../../pages/resources/media/css/TableTools.css">


<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="../../pages/resources/js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="../../pages/resources/media/js/TableTools.js"></script>

 <script type="text/javascript" charset="utf8" src="../../pages/resources/media/js/ZeroClipboard.js"></script>
 <script type="text/javascript" charset="utf8" src="../../pages/resources/js/canvg.js"></script>


 
        
              <title>JSP Page</title>
        <style>
        .axis {
        font: 12px sans-serif;
              }
            .axis path,
            .axis line {
            fill: none;
            stroke: #000;
            shape-rendering: crispEdges;
}
</style>
        <script>
            var poll=${poll};// Poll Object
            var result=${result};// Result of the poll
            var logged=${logged};
            console.log("Poll_Ans_Tbl");
            console.log(poll);// use poll to get all the qtns,answers, title etc which defines the poll
            console.log(result);// use result which is the compilation of all the answers users have submitted
            console.log("logged"+logged);
          
           
   // console.log("mere niche no of options hai un questions k jinka type mcss hai. ");
    var noOfques = poll['qtn_json'].length;        
   // console.log(noOfques); 
   var mcss = 0 ;
   var mcms=0;
   var i = 0;
   var noOfmcss=0;
   var noOfmcms=0;
   var flagmcss=1;
   var flagmcms=1;
   
   
     
    //c is the no. of ques jinka type mcss hai
    //now finding no. of options in each. array of length c
    var noOfoptnEachmcss = new Array(noOfmcss);
  
          
               
                 for(var io=0;io < noOfques ;io++)
                               {  if(poll['qtn_json'][io]['qtn_type']==="mcss")
                                      noOfmcss = noOfmcss + 1 ; }
                
            for(var io=0;io < noOfques ;io++)
                               {  if(poll['qtn_json'][io]['qtn_type']==="mcms")
                                      noOfmcms = noOfmcms + 1 ; }
                             
            
    
    
        </script>
    </head>
    <body>
        <div id="whole" style="background-color:white">
        <script src="../../pages/resources/js/d3.min.js"></script> 
        <script src="../../pages/resources/js/jspdf.js"></script>
        <script src="../../pages/resources/js/canvg.js"></script>
        

<script src="http://html2canvas.hertzen.com/build/html2canvas.js"></script>
<script type="text/javascript" charset="utf8" src="../../pages/resources/js/jspdf.plugin.addimage.js"></script>
<script type="text/javascript" charset="utf8" src="../../pages/resources/js/jspdf.plugin.png_support.js"></script>
<script type="text/javascript" charset="utf8" src="../../pages/resources/js/jspdf.plugin.cell.js"></script>
<script type="text/javascript" charset="utf8" src="../../pages/resources/js/png.js"></script>
<script type="text/javascript" charset="utf8" src="../../pages/resources/js/zlib.js"></script>
<script type="text/javascript" charset="utf8" src="../../pages/resources/js/FileSaver.js"></script>
