<%-- 
    Document   : result
    Created on : Jun 30, 2014, 3:06:32 PM
    Author     : abc
--%>

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
 <script type="text/javascript" src="http://canvg.googlecode.com/svn/trunk/canvg.js"></script> 
 <script type="text/javascript" src="http://canvg.googlecode.com/svn/trunk/rgbcolor.js"></script> 
<script type="text/javascript" src="http://canvg.googlecode.com/svn/trunk/StackBlur.js"></script>

        
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
            console.log("Poll_Ans_Tbl");
            console.log(poll);// use poll to get all the qtns,answers, title etc which defines the poll
            console.log(result);// use result which is the compilation of all the answers users have submitted
            
            // using the above parameteres
            
         //   console.log("Displays title of poll");
       
          //  console.log("Displays qtn 1 and qtn type of poll");
          //  console.log(poll['qtn_json'][0]['qtn']);
          //  console.log(poll['qtn_json'][0]['qtn_type']);
           // console.log("mere upar mcss hai ?");
           
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
    //console.log(noOfoptnEachmcss.length);
    
   // console.log(poll['qtn_json'][0]['rows'].length);   //no of options
     //       console.log("Displays options 1 and 4 of qtn 1 from poll");
       //     console.log(poll['qtn_json'][0]['rows'][0]);
         // +  console.log(poll['qtn_json'][0]['rows'][3]);
            
           // console.log("Displays all parameteres a user has entered from result");
            //console.log(result[0]);
            //console.log("whats this?: this is answer given by first solver to the first question");
            //console.log(result[0]['qtn'][0]['ans']);
            //console.log("no. of questions ");
            //console.log(result[0]['qtn'].length);
            //console.log("no. of options in qtype=mcss ");
            //console.log(result[0]['ans'].length);
            //console.log("the main logic begins");
          
               
                 for(var io=0;io < noOfques ;io++)
                               {  if(poll['qtn_json'][io]['qtn_type']==="mcss")
                                      noOfmcss = noOfmcss + 1 ; }
                
            for(var io=0;io < noOfques ;io++)
                               {  if(poll['qtn_json'][io]['qtn_type']==="mcms")
                                      noOfmcms = noOfmcms + 1 ; }
                             
            
    
    
        </script>
    </head>
    <body>
        <script src="../../pages/resources/js/d3.min.js"></script>   
    <!--    <script type="text/javascript"  src="/.../WEB-INF/pages/resources/js/d3/d3.min.js"</script>  -->
        <h1>Poll Result!</h1>
        <script>
  // $(document).ready(function(){       
                $("body").append("<h1><center>TITLE : <b>"+poll['title']+"</b></center></h1>");
                $("body").append("<h2><center>POLL BY : <a href='../../profile/"+poll['user']['handle']+"'><img height='40px' width='40px' src='"+poll['user']['profile_pic']+"'></a> <b><a href='../../profile/"+poll['user']['handle']+"'>"+poll['user']['name']+"</a> <i><a href='../../profile/"+poll['user']['handle']+"'>@"+poll['user']['handle']+"</a></i></b></h2>");
                for(var jw=0;jw<result[0]['qtn'].length;jw++)
                {
                     var bot=0;
                     var colmax=0;
                    var q_id=poll['qtn_json'][jw]['qtn_id'];
                  
                var choice=poll['qtn_json'][jw]['qtn_type'];    
                switch(choice)
                {
                    
                    
                    
                    
                    case ( (choice.match(/mcss/) )? choice : undefined ) :
                                {
                                    
                   // if(flagmcss===1)
            {
                      flagmcss=0;              
                 var k=0;
                var count = new Array(noOfmcss);
               // var count = new Array([]);
                for(var j=0;j<result[0]['qtn'].length;j++)
                {
                if(poll['qtn_json'][j]['qtn_type']==="mcss")
                {
                    if(poll['qtn_json'][j]['qtn_id']===q_id)
                    {
                    var noOfOptions=poll['qtn_json'][j]['rows'].length;
                   
                 
                    count[k]=new Array(noOfOptions);
                       for(var l=0;l<noOfOptions;l++)
                            count[k][l]=0;
                       for(var l=0;l<noOfOptions;l++)
                           
                 k++;
             }
                }
                }
            
         
            for(var i=0;i<result.length;i++)
            {
                 k=0;
                for(var j=0;j<result[0]['qtn'].length;j++)
                {
                if(poll['qtn_json'][j]['qtn_type']==="mcss")
                { 
                    if(poll['qtn_json'][j]['qtn_id']===q_id)
                    {
                    var ans=result[i]['qtn'][j]['ans'];
                    count[k][ans-1]=count[k][ans-1]+1;
                     if(count[k][ans-1]>colmax)
                    {
                        colmax=count[k][ans-1];
                    }
                    k++;
                    
                }
            }
                }
                
            }
                  var maxticks=0;
          
            var p=0;
            //for(var p=0;p<noOfmcss;p++)
                        for(var l=0;l<noOfOptions;l++)
                    { 
                       
                        if(count[p][l]>maxticks)
                            maxticks=count[p][l];
                        
                    }
                if(maxticks>10)
                {
                  
                    maxticks=5;
                  
                }
             
               
             
     var k=0;
                for(var j=0;j<result[0]['qtn'].length;j++)
                {
                if(poll['qtn_json'][j]['qtn_type']==="mcss")
                { 
                    if(poll['qtn_json'][j]['qtn_id']===q_id)
                    {
                    var arrayOptions=poll['qtn_json'][j]['rows'];
                
                     var noOfOptions=poll['qtn_json'][j]['rows'].length;
                     var jsonArr = [];
                    for(i=0;i<noOfOptions ;i++)
                    {
                        jsonArr.push({
                             label:arrayOptions[i],
                             n: count[k][i]
                                    });
                        if(arrayOptions[i].length>bot)
                        {
                            var bot= arrayOptions[i].length;
                      
                    }
                   

                    }
                    k++;
                  
                    var qtn_div="qtn_div_"+j;
                     $("body").append("<b>Question : "+poll['qtn_json'][j]['qtn']+"</b>");
                    $("body").append("<div id='"+qtn_div+"'></div>");
                    var ret=plotBar(qtn_div,j);
                    
                    var retu=tablegen(qtn_div,j);
                }
                }
                
                }
            }
                                }//case1
                                break;
                                
                                
                                
             case ( (choice.match(/mcms/) )? choice : undefined ) :
                    {
                     //   if(flagmcms===1)
                {
                       
                        flagmcms=0;
                     
                         var k=0;
                var count = new Array(noOfmcms);
               // var count = new Array([]);
                for(var j=0;j<result[0]['qtn'].length;j++)
                {
                if(poll['qtn_json'][j]['qtn_type']==="mcms")
                {
                    if(poll['qtn_json'][j]['qtn_id']===q_id)
                    {
                    var noOfOptions=poll['qtn_json'][j]['rows'].length;
                   
               
                    count[k]=new Array(noOfOptions);
                       for(var l=0;l<noOfOptions;l++)
                            count[k][l]=0;
                       for(var l=0;l<noOfOptions;l++)
                         
                 k++;
             }
                }
                }
                    
                    
                 //   console.log("finished declarations");
                    var pieOptions=[];
                    var pieCount=new Array();
            for(var i=0;i<result.length;i++)
            {
                 k=0;
                for(var j=0;j<result[0]['qtn'].length;j++)
                {
                if(poll['qtn_json'][j]['qtn_type']==="mcms")
                { 
                    if(poll['qtn_json'][j]['qtn_id']===q_id)
                    {
                    var ans=result[i]['qtn'][j]['ans'];
                //    console.log("ans[0]"+ans[0]);
                    if(ans[0]!==null)
                    {
                 //   console.log(ans[0].length);
                    
                    for(io=0;io<ans[0].length;io++)
                    {
                        count[k][ans[0][io]-1]=count[k][ans[0][io]-1]+1;
                         if(count[k][ans[0][io]-1]>colmax)
                    {
                        colmax=count[k][ans[0][io]-1];
                    }
                    }
                    
                    var ret=-1;
                    var n=pieOptions.length;
                //    console.log("length");
                 //   console.log(n);
                    for(var test=0;test<n;test++)
                    {
                   //     console.log("this is it");
                        var t1=pieOptions[test].toString();
                     //   console.log(t1);
                        var t2=ans[0].toString();
                       // console.log(t2);
                        if(t1===t2)
                        {
                            ret=test;
                         //   console.log("aaaaya");
                            test=1000;
                        }
                        else
                        {
                            ret=-1;
                        }
                    }
                        
                   
                    //var ret=pieOptions.indexOf(ans[0].valueOf());
                  //  console.log("ret"+ret);
                  ////  console.log("original"+ans[0].valueOf());
                  //  console.log(ans[0].valueOf());
                    
                    if(ret===-1)
                        {
                  //          console.log("in if -1"+ans[0]);
                   //         console.log(ans[0]);
                            pieOptions[pieOptions.length]=ans[0];
                            pieCount[pieOptions.indexOf(ans[0])]=1;
                        }
                        else
                            pieCount[ret]++;
                    
                 //   console.log("piearr"+pieOptions+"piecount"+pieCount);
                     var pieArr = [];
                    for(var iq=0;iq<pieOptions.length ;iq++)
                    {
                        var str=pieOptions[iq].toString();
                        var chr=str.split('');
                    //    console.log(chr+"len"+chr.length);
                        var lab="";
                        for(var iw=0;iw<chr.length;)
                        {
                            
                             lab=lab.concat(poll['qtn_json'][j]['rows'][chr[iw]-1]+",");
                        //     console.log("lab"+lab);
                     iw=iw+2;
                        }
                        pieArr.push({
                            label:lab,
                             n: pieCount[iq]
                                    });
                    }
                    
                    
                    //count[k][ans-1]=count[k][ans-1]+1;
                    k++;
                }
            }
                }
                }
                
            }
           // console.log("pieArrseo"+pieArr);
          //  console.log(pieArr);
            
              var maxticks=0;
          //  console.log("ansarray");
            //for(var p=0;p<noOfmcms;p++)
                        for(var l=0;l<noOfOptions;l++)
                    { 
                 //       console.log(count[0][l]);
                        if(count[0][l]>maxticks)
                            maxticks=count[0][l];
                        
                    }
                if(maxticks>10)
                {
                 //   console.log("maxticks"+maxticks);
                    maxticks=5;
                 //   console.log("maxticks"+maxticks);
                }
             //  console.log("finish counting started d3"); 
               
             
     var k=0;
                for(var j=0;j<result[0]['qtn'].length;j++)
                {
                if(poll['qtn_json'][j]['qtn_type']==="mcms")
                {
                    if(poll['qtn_json'][j]['qtn_id']===q_id)
                    {
                    var arrayOptions=poll['qtn_json'][j]['rows'];
                  //  console.log(arrayOptions);
                     var noOfOptions=poll['qtn_json'][j]['rows'].length;
                     var jsonArr = [];
                    for(i=0;i<noOfOptions ;i++)
                    {
                        jsonArr.push({
                            label:arrayOptions[i],
                             n: count[k][i]
                                    });
                         if(arrayOptions[i].length>bot)
                        {
                            var bot= arrayOptions[i].length;
                      //      console.log("bot"+bot);
                    }
                    
                    }
                    
                  //  console.log(jsonArr.slice(0));
                    k++;
                  //  console.log("call");
                 //   //console.log(jsonArr);
                    
                    //logic of pie label
                   /* 
                    
                    var pieOptions=new Array();
                    var pieCount=new Array();
                    var ret;
                    for(var ii=0;ii<ans[0].length;ii++)
                    {
                        //console.log(ans[0]);
                        
                                        
                        ret=pieOptions.indexOf(ans[0].[ii]);
                        if(ret===-1)
                        {
                            
                            pieOptions.push(ans[0][ii]);
                            pieCount[indexOf[ans[0][ii]]]=1;
                        }
                        else
                            pieCount[ret]++;
                    }
                    //console.log("piearr"+piearr);
                                        
                     */                   
                                        
                    var first=[];
                    var second=[];
                    var third=[];
                    var temp=[];
                    var kk=noOfOptions;
                    
                    var cc=0;
                    first=arrayOptions;
                    
                    second=arrayOptions;
                    /*for(var u=0;u<noOfOptions;u++)
                    {
                        var te=0;
                        
                        third=third.concat(first);
                        temp=[];
                        for(var ii=0;ii<first.length;ii++)
                        {
                            for(jj=ii+cc+1;jj<second.length;jj++)
                        {
                            var tit=jj;
                           // //console.log(temp);
                            
                           // //console.log("empty"+temp);
                            temp[te]=first[ii]+second[jj];
                            //console.log("first"+first[ii]+"second"+second[jj]);
                            kk++;
                            te++;
                            if(jj===second.length-1 && ii!==first.length-1 )
                            {
                                jj=tit+1;
                                //console.log("inside if");
                            }
                            
                        }
                        
                        }
                        ////console.log(temp);
                        first=[];
                        first=temp;
                        cc++;
                    }
                    //console.log("third"+third);*/
                      var qtn_div="qtn_div_"+j;
                      $("body").append("<b>Question : "+poll['qtn_json'][j]['qtn']+"</b>");
                    $("body").append("<div id='"+qtn_div+"'></div>");
                      var ret=plotBar(qtn_div,j);
                      plotpie();
                    var retu=tablegen(qtn_div,j);
                }
                }
                
                }
            }        
                     }//case 2
                     
                     break;
                     
                     case ( (choice.match(/moc/) )? choice : undefined ) :
                                {
                  for(var j=0;j<result[0]['qtn'].length;j++)
                {
                if(poll['qtn_json'][j]['qtn_type']==="moc")
                {
                    if(poll['qtn_json'][j]['qtn_id']===q_id)
                    {
                    var noOfRows=poll['qtn_json'][j]['rows'].length;
                    var noOfColumns=poll['qtn_json'][j]['columns'].length;
                    var count=new Array(noOfRows);
                    for(var l=0;l<count.length;l++)
                        count[l]=new Array(noOfColumns);
                    for(var k=0;k<noOfRows;k++)
                        for(var l=0;l<noOfColumns;l++)
                    {
                        count[k][l]=0;
                    }
                     for(var k=0;k<noOfRows;k++)
                        for(var l=0;l<noOfColumns;l++)
                    {
                        //console.log(count[k][l]);
                    }
                }
                     }
            
                    
                }   
                
                    
                    for(var i=0;i<result.length;i++)
            {
                for(var j=0;j<result[0]['qtn'].length;j++)
                {
                    //console.log("question no"+q_id);
                if(poll['qtn_json'][j]['qtn_type']==="moc")
                { 
                  
                    if(poll['qtn_json'][j]['qtn_id']===q_id)
                    {
                        //console.log("q_id working");
                    var arrayRows=poll['qtn_json'][j]['rows'];
                    //console.log(arrayRows);
                     var noOfRows=poll['qtn_json'][j]['rows'].length;
                     var arrayColumns=poll['qtn_json'][j]['columns'];
                    //console.log(arrayColumns);
                     var noOfColumns=poll['qtn_json'][j]['columns'].length;
                    var ans=result[i]['qtn'][j]['ans'];
                    //console.log(ans);
                  //  for(var ii=0;ii<noOfRows;ii++)
                    //    for(var jj=0;jj<noOfColumns;jj++)
                    for(var ii=0;ii<ans.length;ii++)
                    {
                        //console.log(ans[0][0]+"poi"+ans[0][2]);
                        count[ans[ii][0]][ans[ii][2]]++;
                    }
                }
                }
                }
                }
            
           for(var k=0;k<noOfRows;k++)
                        for(var l=0;l<noOfColumns;l++)
                    {
                        //console.log(count[k][l]);
                         if(count[k][l]>colmax)
                    {
                        colmax=count[k][l];
                    }
                    }
                    var maxticks=0;
            //console.log("ansarray");
            var p=0;
            for( p=0;p<noOfRows;p++)
                        for(var l=0;l<noOfColumns;l++)
                    { 
                        //console.log(count[p][l]);
                        if(count[p][l]>maxticks)
                            maxticks=count[p][l];
                        
                    }
                if(maxticks>10)
                {
                    //console.log("maxticks"+maxticks);
                    maxticks=5;
                    //console.log("maxticks"+maxticks);
                }
               //console.log("finish counting started d3"); 
                    
                     var k=0;
                for(var j=0;j<result[0]['qtn'].length;j++)
                {
                if(poll['qtn_json'][j]['qtn_type']==="moc")
                {
                    if(poll['qtn_json'][j]['qtn_id']===q_id)
                    {
                    
                     var jsonArr = [];
                    for(ii=0;ii<noOfRows ;ii++)
                    for(jj=0;jj<noOfColumns;jj++)
                    {
                       
                        jsonArr.push({
                             label:arrayRows[ii]+"+"+arrayColumns[jj],
                             n: count[ii][jj]
                                    });
                                  
                       if((arrayRows[ii].length+arrayColumns[jj].length)>bot)
                        {
                            var bot= (arrayRows[ii].length+arrayColumns[jj].length)+1;
                            //console.log("bot"+bot);
                    }
                  

                    }
                    k++;
                    //console.log("call");
                    //console.log(jsonArr);
                    var qtn_div="qtn_div_"+j;
                    $("body").append("<b>Question : "+poll['qtn_json'][j]['qtn']+"</b>");
                    $("body").append("<div id='"+qtn_div+"'></div>");
                    var ret=plotBar(qtn_div,j);
                    var retu=tablegen(qtn_div,j);
                }
            }
                }
            
                    break;
                                 }//case moc
                                 
                                  case ( (choice.match(/momc/) )? choice : undefined ) :
                                {
                  for(var j=0;j<result[0]['qtn'].length;j++)
                {
                if(poll['qtn_json'][j]['qtn_type']==="momc")
                {
                    if(poll['qtn_json'][j]['qtn_id']===q_id)
                    {   
                    var noOfRows=poll['qtn_json'][j]['rows'].length;
                    var noOfColumns=poll['qtn_json'][j]['columns'].length;
                    var count=new Array(noOfRows);
                    for(var l=0;l<count.length;l++)
                        count[l]=new Array(noOfColumns);
                    for(var k=0;k<noOfRows;k++)
                        for(var l=0;l<noOfColumns;l++)
                    {
                        count[k][l]=0;
                    }
                     for(var k=0;k<noOfRows;k++)
                        for(var l=0;l<noOfColumns;l++)
                    {
                        //console.log(count[k][l]);
                    }
                }
                     }
            
                    
                }   
                
                    
                    for(var i=0;i<result.length;i++)
            {
                for(var j=0;j<result[0]['qtn'].length;j++)
                {
                if(poll['qtn_json'][j]['qtn_type']==="momc")
                { 
                    if(poll['qtn_json'][j]['qtn_id']===q_id)
                    {
                    var arrayRows=poll['qtn_json'][j]['rows'];
                    //console.log(arrayRows);
                     var noOfRows=poll['qtn_json'][j]['rows'].length;
                     var arrayColumns=poll['qtn_json'][j]['columns'];
                    //console.log(arrayColumns);
                     var noOfColumns=poll['qtn_json'][j]['columns'].length;
                    var ans=result[i]['qtn'][j]['ans'];
                    //console.log(ans);
                  //  for(var ii=0;ii<noOfRows;ii++)
                    //    for(var jj=0;jj<noOfColumns;jj++)
                    for(var ii=0;ii<ans.length;ii++)
                    {
                        //console.log(ans[0][0]+"poi"+ans[0][2]);
                        count[ans[ii][0]][ans[ii][2]]++;
                    }
                }
                }
                }
                }
            
           for(var k=0;k<noOfRows;k++)
                        for(var l=0;l<noOfColumns;l++)
                    {
                        //console.log(count[k][l]);
                        if(count[k][l]>colmax)
                    {
                        colmax=count[k][l];
                    } 
                    }
                    
                    
                         var maxticks=0;
            //console.log("ansarray");
            var p=0;
            for( p=0;p<noOfRows;p++)
                        for(var l=0;l<noOfColumns;l++)
                    { 
                        //console.log(count[p][l]);
                        if(count[p][l]>maxticks)
                            maxticks=count[p][l];
                        
                    }
                if(maxticks>10)
                {
                    //console.log("maxticks"+maxticks);
                    maxticks=5;
                    //console.log("maxticks"+maxticks);
                }
                    
                     var k=0;
                for(var j=0;j<result[0]['qtn'].length;j++)
                {
                if(poll['qtn_json'][j]['qtn_type']==="momc")
                {
                    if(poll['qtn_json'][j]['qtn_id']===q_id)
                    {
                    
                     var jsonArr = [];
                    for(ii=0;ii<noOfRows ;ii++)
                    for(jj=0;jj<noOfColumns;jj++)
                    {
                       
                        jsonArr.push({
                             label:arrayRows[ii]+"+"+arrayColumns[jj],
                             n: count[ii][jj]
                                    });
                                                                
                       if((arrayRows[ii].length+arrayColumns[jj].length)>bot)
                        {
                            var bot= (arrayRows[ii].length+arrayColumns[jj].length);
                            
                    }
                   

                    }
                    
                    k++;
                    
                    var qtn_div="qtn_div_"+j;
                    $("body").append("<b>Question : "+poll['qtn_json'][j]['qtn']+"</b>");
                    $("body").append("<div id='"+qtn_div+"'></div>");
                    var ret=plotBar(qtn_div,j);
                    var retu=tablegen(qtn_div,j);
                }
                }
                    
                }
            
                    
                                 }//case momc
                                 break;
                }//switch  
               
        }//forloop
    //});
    
 function plotBar(qtn_div,p)
 {
     qtn_div="#"+qtn_div;
     var svg_id="svg_"+p;
     //console.log("in");
var margin = {top: 20, right: 20, bottom: 15+bot*7, left: 40},
width = 350 - margin.left - margin.right,
height = 300 - margin.top - margin.bottom;
// Parse the label / time
//var parseDate = d3.time.format("%Y-%m").parse;
var animheight=height;
color = d3.scale.ordinal()
        //.range(["red", "orange", "green", "violet", "blue", "steelblue", "grey"])
  .range(["grey", "blue", "steelblue", "yellow", "green", "indigo", "orange"])
  .domain([0,1,2,3,4,5,6]);
var x = d3.scale.ordinal().rangeRoundBands([0, width], .6);
var y = d3.scale.linear().range([height, 0]);

var xAxis = d3.svg.axis()
.scale(x)
.orient("bottom")
.ticks(4);
var yAxis = d3.svg.axis()
.scale(y)
.orient("left")
.ticks(maxticks);

var svg = d3.select(qtn_div).append("svg")
.attr("id", "svg_"+p)
.attr("width", width + margin.left + margin.right)
.attr("height", height + margin.top + margin.bottom)
.append("g")
.attr("transform",
"translate(" + margin.left + "," + margin.top + ")");

//d3.json("bars", function() {
  
  var data=jsonArr.slice();
data.forEach(function(d) {
d.label = d.label;
d.n = +d.n;
});
x.domain(data.map(function(d) { return d.label; }));
y.domain([0, d3.max(data, function(d) { return d.n; })]);

svg.append("g")
.attr("class", "x axis")
.attr("transform", "translate(0," + height + ")")
.call(xAxis)
.selectAll("text")
.style("text-anchor", "end")
.attr("dx", "-.8em")
.attr("dy", "-.55em")
.attr("transform", "rotate(-90)" );
svg.append("g")
.attr("class", "y axis")
.call(yAxis)
.append("text")
.attr("transform", "rotate(-90)")
.attr("y", 6)
//Bar Charts 254
.attr("dy", ".71em")
.style("text-anchor", "end")
.text("no of votes");
svg.selectAll("bar")
.data(data)
.enter().append("rect")
.style("fill", function(d) { return color(d.n*6/colmax); })
.attr("x", function(d) { return x(d.label); })
.attr("width", x.rangeBand())
.attr("y", function(d) { return height; })
.attr("height", function(d) { return 0; })

.transition().delay(function (d,i){ return i * 300;})
 .duration(3000)
 .attr("height", function(d) {  return +animheight-y(d.n) + .1; })
 .attr("y", function(d) { return +y(d.n) - .1; })

 ;
//});
//console.log("colmax"+colmax);
//console.log("out");
var canvasvar="canvas_"+p;
console.log(canvasvar);
var mylink="myALink_"+p;
var imgname="qtn"+p+".png";
 $("#qtn_div_"+p).append('<br> <a id="myALink_'+p+'">Download as image</a> ');
 $("#qtn_div_"+p).append('<div hidden id="can"> <canvas id="canvas_'+p+'" width="1000px" height="600px"></canvas> </div>');
 
        document.getElementById(mylink).addEventListener('click', function() {
    downloadCanvas(this, canvasvar, imgname); // <- this can be a dynamic name
}, false);
return (0);
 }
 
 function downloadCanvas(link, canvasId, filename) {
   for(var lkj=0;lkj<result[0]['qtn'].length;lkj++)
    canvg('canvas_'+lkj, $("#qtn_div_"+lkj).html());
    link.href = document.getElementById(canvasId).toDataURL();
    link.download = filename;
}
 
 function plotpie()
 {
 
var width = 350,
    height = 350,
    radius = Math.min(width, height) / 2;

var color = d3.scale.ordinal()
    //.range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);
      .range([ "#6b486b", "#a05d56", "#d0743c"]);

var arc = d3.svg.arc()
    .outerRadius(radius - 10)
    .innerRadius(0);

var pie = d3.layout.pie()
    .sort(null)
    .value(function(d) { return d.n; });

var svg = d3.select("body").append("svg")
    .attr("width", width)
    .attr("height", height)
  .append("g")
    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

//d3.json("json/bars.json", function(error, jsonarr) {
    var data=pieArr.slice();
  data.forEach(function(d) {
    d.n = +d.n;
  });

  var g = svg.selectAll(".arc")
      .data(pie(data))
    .enter().append("g")
      .attr("class", "arc");

  g.append("path")
      .attr("d", arc)
      .style("fill", function(d) { return color(d.data.label); });

  g.append("text")
      .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
      .attr("dy", ".35em")
      .style("text-anchor", "middle")
      .text(function(d) { return (d.data.label+'('+d.data.n+')'); });

//});

 }
 
    function tablegen(qtn_div, p)
 {
      
        var tbl_id='#tbl_'+p;
        var btn_id='#btn_'+p;
     $("#"+qtn_div).append("<table id='tbl_"+p+"'></table>");
 //var tbl2=$("<table/>").attr("id","mytable26");
       //$(tbl_id).append("<tr></tr>");
      
      var td1="<th>"+"USER"+"</th>";
    //  console.log(poll);// use poll to get all the qtns,answers, title etc which defines the poll
      //      console.log(result);// use result which is the compilation of all the answers users have submitted
            
        var tableAligns=["left","center","right"];
   
         //  var table;
             
        
         if(poll['qtn_json'][j]['qtn_type']==="mcss" || poll['qtn_json'][j]['qtn_type']==="mcms" )
       {
           var clistJSON=new Array();
           var header=new Array();
           header[0]="USER";
            for(var i=1;i<jsonArr.length+1;i++)
       {
        header[i]=jsonArr[i-1]["label"];
         //td1=td1+"<th>"+jsonArr[i]["label"]+"</th>";
        // var td2="<td>"+jsonArr[i]["n"]+"</td>";
             //clistJSON.push(jsonArr[i]["label"]);
        } 
 
        for(var i=0;i<header.length;i++)
            clistJSON.push(header[i]);
        
        
            var Tcolumns = [];
                                              
                             for (var i=0; i< clistJSON.length; i++ ) 
                             {
                         Tcolumns.push({
                               "sTitle": clistJSON[i],
                               "aTargets": [i]
                               //"sClass":tableAligns[i]
                             });
       }
var relist=new Array();
       //var tst=[1,2,0,1,0];
      // relist.push()
     // relist[jsonArr.length][result.length]=rlistJSON[jsonArr.length][result.length];
      // $(tbl_id).append("<thead><tr>"+td1+"</tr></thead>"); 
      
       if(poll['qtn_json'][j]['qtn_type']==="mcss" )
        {   
            
       for(var i=0;i<result.length;i++)
      {
          //var tUID="<td>"+result[i]['uid']+"</td>"; 
          
              
          
          
         var nOptn = jsonArr.length;
         var mcssArr = new Array(nOptn+1);
         
         for(var t = 0 ; t < nOptn+1 ; t++)
         {     mcssArr[t]=0; }
          mcssArr[0]="<i><a href='../../profile/"+result[i]['user']['handle']+"'>@"+result[i]['user']['handle']+"</a></i>";
       //  var  tANS = "<td>"+result[i]['qtn'][p]['ans'][0]+"</td>";
         mcssArr[result[i]['qtn'][p]['ans'][0]]=1;
         
              //  tUID = tUID + "<td>"+mcssArr[i1]+"</td>";
         
                 relist.push(mcssArr);   
                    
           
        // $(tbl_id).append("<tbody><tr>"+tUID+"</tr></tbody>"); 
         
         console.log("relist data");
         console.log(relist);
      }
      
        
        
            //var td11="<td>TOTAL :</td>";
      // $(tbl_id).append("<td>"+poll['uid']+"</td>");
      var mcssTotal=new Array(jsonArr.length+1);
      mcssTotal[0]="TOTAL";
        for(var i=1;i<jsonArr.length+1;i++)
       {
        
         //td11=td11+"<td>"+jsonArr[i]["n"]+"</td>";
       mcssTotal[i]=jsonArr[i-1]["n"];
      }
        
        //$(tbl_id).append("<tbody><tr>"+td11+"</tr></tbody>"); 

       
         //td11=td11+"<td>"+jsonArr[i]["n"]+"</td>";
       relist.push(mcssTotal);
      
      
        
        
        //$(tbl_id).append("<tbody><tr>"+td11+"</tr></tbody>"); 

       
         }
         if( poll['qtn_json'][j]['qtn_type']==="mcms" )
         {
              for(var i=0;i<result.length;i++)
      {
          //var tUID="<td>"+result[i]['uid']+"</td>"; 
          
         var nOptn = jsonArr.length;
         var mcmsArr = new Array(nOptn+1);
         
         for(var t = 0 ; t < nOptn+1 ; t++)
         {     mcmsArr[t]=0; }
          mcmsArr[0]="<i><a href='../../profile/"+result[i]['user']['handle']+"'>@"+result[i]['user']['handle']+"</a></i>";
          
       for(var i1new=0; i1new < result[i]['qtn'][p]['ans'][0].length; i1new++)
       {
           mcmsArr[result[i]['qtn'][p]['ans'][0][i1new]]=1;
       }
       
           relist.push(mcmsArr);
         // $(tbl_id).append("<tbody><tr>"+tUID+"</tr></tbody>"); 
          }
         
        
        
      var mcmsTotal=new Array(jsonArr.length+1);
      mcmsTotal[0]="TOTAL";
        for(var i=1;i<jsonArr.length+1;i++)
       {
        
         //td11=td11+"<td>"+jsonArr[i]["n"]+"</td>";
       mcmsTotal[i]=jsonArr[i-1]["n"];
      }
        

       
         //td11=td11+"<td>"+jsonArr[i]["n"]+"</td>";
       relist.push(mcmsTotal);
     

       
            }
        
        
        }
        
        
           if(poll['qtn_json'][j]['qtn_type']==="moc" || poll['qtn_json'][j]['qtn_type']==="momc" )
       {
           
           
           
           var clistJSON=new Array();
           var header=new Array();
           header[0]="USER";
        
       
var relist=new Array();

           
           
           
           
           
           if(poll['qtn_json'][j]['qtn_type']==="moc" )
           {
           var x=0,h=0;
            var y=1,g=0;
            var i12=1;
        for(var i=0;i<jsonArr.length;i++)
        {
            x=0;
            y=1;
            h=0;
            g=0;
            //i12=1;
            for(var j1=0;j1<jsonArr[i]["label"].length;j1++)
            {   
                if(jsonArr[i]["label"].slice(x,y)==="+")
            {
                h=x;
                g=y;            
                
               // td1=td1+"<th>"+"row: "+jsonArr[i]["label"].slice(0,h)+" and column: "+jsonArr[i]["label"].slice(g,jsonArr[i]["label"].length)+"</th>";       
                 // for(var i=1;i<jsonArr.length+1;i++)
      // {
        header[i12]="row: "+jsonArr[i]["label"].slice(0,h)+" and column: "+jsonArr[i]["label"].slice(g,jsonArr[i]["label"].length);
            i12++;
       // }     
             }
            x++;
            y++;
        
            }       
         }
       // console.log("values of moc");
       // console.log(h);console.log(g);console.log(jsonArr.length);
       // console.log("values of jsonArr");
        //for(var i=0;i<jsonArr.length;i++)
          //  console.log("TK"+jsonArr[i]["label"]);
        
        //console.log("rows :  " + noOfRows);
        //console.log("columns :  " + noOfColumns);
            //for(var i=0;i<jsonArr.length;i++)
       //{
        
         //td1=td1+"<th>"+"row: "+jsonArr[i]["label"].slice(0,h)+" and column: "+jsonArr[i]["label"].slice(g,jsonArr[i]["label"].length)+"</th>";
        // var td2="<td>"+jsonArr[i]["n"]+"</td>";
 
       //}
      
       //$(tbl_id).append("<thead><tr>"+td1+"</tr></thead>"); 
       
       for(var i=0;i<header.length;i++)
            clistJSON.push(header[i]);
        
        
            var Tcolumns = [];
                                              
                             for (var i=0; i< clistJSON.length; i++ ) 
                             {
                         Tcolumns.push({
                               "sTitle": clistJSON[i],
                               "aTargets": [i]
                               //"sClass":tableAligns[i]
                             });
                        }
       
       
        var myArr = new Array(noOfRows);
        for(var pdr=0;pdr<noOfRows;pdr++)
          myArr[pdr]=new Array(noOfColumns);
        for(var pdr = 0; pdr < noOfRows ; pdr++)
            for(var pdc=0; pdc <noOfColumns ; pdc++ )
        {
            myArr[pdr][pdc]=0;
        }
     
       // for(var pdr = 0; pdr < noOfRows ; pdr++)
         //   for(var pdc=0; pdc <noOfColumns ; pdc++ )
       // {
          // console.log("alia"+myArr[pdr][pdc]);
       // }
       
       
        for(var i=0 ; i < result.length;i++ )
        {
               var mocArr=new Array(noOfColumns*noOfRows+1);
             for(var t=0 ; t < mocArr.length;t++ )
        { 
            mocArr[t]=0;
        }
             
                    //var tUID="<td>"+result[i]['uid']+"</td>"; 
           mocArr[0]="<i><a href='../../profile/"+result[i]['user']['handle']+"'>@"+result[i]['user']['handle']+"</a></i>";
           console.log("f1 "+mocArr[0]);
           var i12=1;
                    
            for(var pdr = 0; pdr < noOfRows ; pdr++)
            {  for(var pdc=0; pdc <noOfColumns ; pdc++ )
               {  
                    myArr[pdr][pdc]=0;
                 for(var temp2 = 0; temp2 < result[i]['qtn'][p]['ans'].length; temp2++)
                 {
                     if(result[i]['qtn'][p]['ans'][temp2] ===(pdr+","+pdc))
                     { 
                         myArr[pdr][pdc] = 1;
                         
                     }    
             
                 }
                 //tUID = tUID + "<td>"+myArr[pdr][pdc]+"</td>";
               //for(i12=1 ; i12<mocArr.length;i12++)
                 mocArr[i12++]=myArr[pdr][pdc]; 
                 
               }
            }
           // $(tbl_id).append("<tbody><tr>"+tUID+"</tr></tbody>"); 
         //  console.log("lll "+mocArr);
            relist.push(mocArr);
          //    console.log("ll2 "+relist);
        }

                
          //      var td11="<td>TOTAL :</td>";
      
       // for(var i=0;i<jsonArr.length;i++)
      // {
        
      //   td11=td11+"<td>"+jsonArr[i]["n"]+"</td>";
       
     // }
        
      //  $(tbl_id).append("<tbody><tr>"+td11+"</tr></tbody>"); 

  var mocTotal=new Array(jsonArr.length+1);
      mocTotal[0]="TOTAL";
        for(var i5=1;i5<jsonArr.length+1;i5++)
       {
        
         //td11=td11+"<td>"+jsonArr[i]["n"]+"</td>";
       mocTotal[i5]=jsonArr[i5-1]["n"];
      }
        

       
         //td11=td11+"<td>"+jsonArr[i]["n"]+"</td>";
       relist.push(mocTotal);
     

       
        }
          if(poll['qtn_json'][j]['qtn_type']==="momc" )
           {
           var x=0,h=0;
            var y=1,g=0;var i12=1;
        for(var i=0;i<jsonArr.length;i++)
        {
            x=0;
            y=1;
            h=0;
            g=0;
            for(var j1=0;j1<jsonArr[i]["label"].length;j1++)
            {   
                if(jsonArr[i]["label"].slice(x,y)==="+")
            {
                h=x;
                g=y;            
                
               // td1=td1+"<th>"+"row: "+jsonArr[i]["label"].slice(0,h)+" and column: "+jsonArr[i]["label"].slice(g,jsonArr[i]["label"].length)+"</th>";       
                header[i12]="row: "+jsonArr[i]["label"].slice(0,h)+" and column: "+jsonArr[i]["label"].slice(g,jsonArr[i]["label"].length);
            i12++;     
             }
            x++;
            y++;
        
            }       
         }
       // console.log("values of moc");
        //console.log(h);console.log(g);console.log(jsonArr.length);
        //console.log("values of jsonArr");
        //for(var i=0;i<jsonArr.length;i++)
          //  console.log("TK"+jsonArr[i]["label"]);
        
       // console.log("rows :  " + noOfRows);
        //console.log("columns :  " + noOfColumns);
            //for(var i=0;i<jsonArr.length;i++)
       //{
        
         //td1=td1+"<th>"+"row: "+jsonArr[i]["label"].slice(0,h)+" and column: "+jsonArr[i]["label"].slice(g,jsonArr[i]["label"].length)+"</th>";
        // var td2="<td>"+jsonArr[i]["n"]+"</td>";
 
       //}
      
      // $(tbl_id).append("<thead><tr>"+td1+"</tr></thead>"); 
       
          var clistJSON=new Array();      
                for(var i=0;i<header.length;i++)
            clistJSON.push(header[i]);
        
        
            var Tcolumns = [];
        
                             for (var i=0; i< clistJSON.length; i++ ) 
                             {
                         Tcolumns.push({
                               "sTitle": clistJSON[i],
                               "aTargets": [i]
                               //"sClass":tableAligns[i]
                             });
                        }
     
        
        
        
              var myArr = new Array(noOfRows);
        for(var pdr=0;pdr<noOfRows;pdr++)
          myArr[pdr]=new Array(noOfColumns);
        for(var pdr = 0; pdr < noOfRows ; pdr++)
            for(var pdc=0; pdc <noOfColumns ; pdc++ )
        {
            myArr[pdr][pdc]=0;
        }
        for(var pdr = 0; pdr < noOfRows ; pdr++)
            for(var pdc=0; pdc <noOfColumns ; pdc++ )
        {
           //console.log("alia"+myArr[pdr][pdc]);
        }
        for(var i=0 ; i < result.length;i++ )
        {   
           // var tUID="<td>"+result[i]['uid']+"</td>"; 
               var momcArr=new Array(noOfColumns*noOfRows+1);
             for(var t=0 ; t < momcArr.length;t++ )
        { 
            momcArr[t]=0;
        }
             
                    //var tUID="<td>"+result[i]['uid']+"</td>";
                    //<i><a href='../../profile/"+poll['user']['handle']+"'>@"+poll['user']['handle']+"</a></i>
           momcArr[0]="<i><a href='../../profile/"+result[i]['user']['handle']+"'>@"+result[i]['user']['handle']+"</a></i>";
           console.log("f1 "+momcArr[0]);
           var i12=1;
           
                    
                    
            for(var pdr = 0; pdr < noOfRows ; pdr++)
            {  for(var pdc=0; pdc <noOfColumns ; pdc++ )
               {  
                    myArr[pdr][pdc]=0;
                 for(var temp2 = 0; temp2 < result[i]['qtn'][p]['ans'].length; temp2++)
                 {
                     if(result[i]['qtn'][p]['ans'][temp2] ===(pdr+","+pdc))
                     { 
                         myArr[pdr][pdc] = 1;
                         
                     }    
             
                 }
                 //tUID = tUID + "<td>"+myArr[pdr][pdc]+"</td>"; 
                  momcArr[i12++]=myArr[pdr][pdc]; 
               }
            }
           // $(tbl_id).append("<tbody><tr>"+tUID+"</tr></tbody>"); 
           relist.push(momcArr);
        }
        for(var pdr = 0; pdr < noOfRows ; pdr++)
            for(var pdc=0; pdc <noOfColumns ; pdc++ )
        {
           //console.log("bhatt"+myArr[pdr][pdc]);
        }
                
              //  var td11="<td>TOTAL :</td>";
      // $(tbl_id).append("<td>"+poll['uid']+"</td>");
      
      //  for(var i=0;i<jsonArr.length;i++)
      // {
        
     //    td11=td11+"<td>"+jsonArr[i]["n"]+"</td>";
       
     // }
        
     //   $(tbl_id).append("<tbody><tr>"+td11+"</tr></tbody>"); 


      var momcTotal=new Array(jsonArr.length+1);
      momcTotal[0]="TOTAL";
        for(var i5=1;i5<jsonArr.length+1;i5++)
       {
        
         //td11=td11+"<td>"+jsonArr[i]["n"]+"</td>";
       momcTotal[i5]=jsonArr[i5-1]["n"];
      }
        

       
         //td11=td11+"<td>"+jsonArr[i]["n"]+"</td>";
       relist.push(momcTotal);
 
       
        }
      }  
        $(tbl_id).dataTable(
          {  
              
             bJQueryUI: true,
             sPaginationType: "full_numbers",
             "bPaginate": true,
    "bLengthChange": true,
    "bFilter": true,
    "bSort": true,
    "bInfo": true,
    "bAutoWidth": true,
    "asStripClasses": null , 
      "aoColumnDefs":Tcolumns ,
        "sDom": 'T<"H"fr>t<"F"ip>',
                      "oTableTools": { "sSwfPath": "../../pages/resources/media/swf/eightpixel.swf", 
                                       "aButtons": [ 
                                                  {
                                                      "sExtends": "xls",
                                                      "sButtonText": "EXCEL",
                                                      "sFileName" : "*.xls"
                                                     
					           },
                                                   {
                                                      "sExtends": "pdf",
                                                      "sButtonText": "PDF",
                                                      "sPdfOrientation": "landscape",
                                                   //   "sPdfMessage":   "FromTime:" +fromT+" "+ "ToTime:"+toT ,
                                                   //   "sTitle" : text1,
                                                   //   "sPdfSize":pdfsize
                                                     
					           },
                                                  {
                                                      "sExtends": "csv",
                                                      "sButtonText": "CSV"
                                                     
					           } ]
                                      }  ,
        
            
            "aaData": relist
                
              
            
            
            
        });

   
        
        
        return(0);
        
   
    }

        
        </script>
       
        <div id="mytable2"></div>

    </body>
</html>