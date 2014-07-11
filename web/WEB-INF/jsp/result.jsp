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
         <!--<script src="http://d3js.org/d3.v3.min.js"></script>  -->
        <script src="../../pages/resources/js/d3/d3.min.js"></script>
         <title>JSP Page</title>
        <style>
        .axis {
        font: 10px sans-serif;
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
            
            console.log("Displays title of poll");
            console.log(poll['title']);
            
            console.log("Displays qtn 1 and qtn type of poll");
            console.log(poll['qtn_json'][0]['qtn']);
            console.log(poll['qtn_json'][0]['qtn_type']);
            console.log("mere upar mcss hai ?");
           
    console.log("mere niche no of options hai un questions k jinka type mcss hai. ");
    var noOfques = poll['qtn_json'].length;        
    console.log(noOfques); 
   var mcss = 0 ;
   var mcms=0;
   var i = 0;
   var noOfmcss=0;
   var noOfmcms=0;
   var flagmcss=1;
   var flagmcms=1;
   
   
     
   console.log(noOfmcss);  //c is the no. of ques jinka type mcss hai
    //now finding no. of options in each. array of length c
    var noOfoptnEachmcss = new Array(noOfmcss);
    console.log(noOfoptnEachmcss.length);
    
    console.log(poll['qtn_json'][0]['rows'].length);   //no of options
            console.log("Displays options 1 and 4 of qtn 1 from poll");
            console.log(poll['qtn_json'][0]['rows'][0]);
          +  console.log(poll['qtn_json'][0]['rows'][3]);
            
            console.log("Displays all parameteres a user has entered from result");
            console.log(result[0]);
            console.log("whats this?: this is answer given by first solver to the first question");
            console.log(result[0]['qtn'][0]['ans']);
            console.log("no. of questions ");
            console.log(result[0]['qtn'].length);
            console.log("no. of options in qtype=mcss ");
            //console.log(result[0]['ans'].length);
            console.log("the main logic begins");
          
               
                 for(var io=0;io < noOfques ;io++)
                               {  if(poll['qtn_json'][io]['qtn_type']==="mcss")
                                      noOfmcss = noOfmcss + 1 ; }
                
            for(var io=0;io < noOfques ;io++)
                               {  if(poll['qtn_json'][io]['qtn_type']==="mcms")
                                      noOfmcms = noOfmcms + 1 ; }
                             
            
    
    
        </script>
    </head>
    <body>
        
    <!--    <script type="text/javascript"  src="/.../WEB-INF/pages/resources/js/d3/d3.min.js"</script>  -->
        <h1>Poll Result!</h1>
        <script>
   //$(document).ready(function(){              
                for(var jw=0;jw<result[0]['qtn'].length;jw++)
                {
                    var q_id=poll['qtn_json'][jw]['qtn_id'];
                    console.log("question no"+q_id);
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
                   
                    console.log(count);
                    console.log("no of option"+noOfOptions);
                    console.log("no of mcss"+noOfmcss);
                    console.log("kth no"+k);
                    count[k]=new Array(noOfOptions);
                       for(var l=0;l<noOfOptions;l++)
                            count[k][l]=0;
                       for(var l=0;l<noOfOptions;l++)
                            console.log(count[k][l]);
                 k++;
             }
                }
                }
            
            console.log("finished declarations");
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
                    k++;
                }
            }
                }
                
            }
                  var maxticks=0;
            console.log("ansarray");
            var p=0;
            //for(var p=0;p<noOfmcss;p++)
                        for(var l=0;l<noOfOptions;l++)
                    { 
                        console.log(count[p][l]);
                        if(count[p][l]>maxticks)
                            maxticks=count[p][l];
                        
                    }
                if(maxticks>10)
                {
                    console.log("maxticks"+maxticks);
                    maxticks=5;
                    console.log("maxticks"+maxticks);
                }
               console.log("finish counting started d3"); 
               
             
     var k=0;
                for(var j=0;j<result[0]['qtn'].length;j++)
                {
                if(poll['qtn_json'][j]['qtn_type']==="mcss")
                { 
                    if(poll['qtn_json'][j]['qtn_id']===q_id)
                    {
                    var arrayOptions=poll['qtn_json'][j]['rows'];
                    console.log(arrayOptions);
                     var noOfOptions=poll['qtn_json'][j]['rows'].length;
                     var jsonArr = [];
                    for(i=0;i<noOfOptions ;i++)
                    {
                        jsonArr.push({
                             label:arrayOptions[i],
                             n: count[k][i]
                                    });
                    }
                    k++;
                    console.log("call");
                    console.log(jsonArr);
                    var qtn_div="qtn_div_"+j;
                    $("body").append("<div id='"+qtn_div+"'></div>");
                    plotBar(qtn_div,j);
                    tablegen(qtn_div,j);
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
                         console.log("mcms");
                                  
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
                   
                    console.log(count);
                    console.log("no of option"+noOfOptions);
                    console.log("no of mcms"+noOfmcms);
                    console.log("kth no"+k);
                    count[k]=new Array(noOfOptions);
                       for(var l=0;l<noOfOptions;l++)
                            count[k][l]=0;
                       for(var l=0;l<noOfOptions;l++)
                            console.log(count[k][l]);
                 k++;
             }
                }
                }
                    
                    
                    console.log("finished declarations");
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
                    console.log("ans[0]"+ans[0]);
                    if(ans[0]!==null)
                    {
                    console.log(ans[0].length);
                    
                    for(io=0;io<ans[0].length;io++)
                    {
                        count[k][ans[0][io]-1]=count[k][ans[0][io]-1]+1;
                    }
                    var ret=-1;
                    var n=pieOptions.length;
                    console.log("length");
                    console.log(n);
                    for(var test=0;test<n;test++)
                    {
                        console.log("this is it");
                        var t1=pieOptions[test].toString();
                        console.log(t1);
                        var t2=ans[0].toString();
                        console.log(t2);
                        if(t1===t2)
                        {
                            ret=test;
                            console.log("aaaaya");
                            test=1000;
                        }
                        else
                        {
                            ret=-1;
                        }
                    }
                        
                   
                    //var ret=pieOptions.indexOf(ans[0].valueOf());
                    console.log("ret"+ret);
                    console.log("original"+ans[0].valueOf());
                    console.log(ans[0].valueOf());
                    
                    if(ret===-1)
                        {
                            console.log("in if -1"+ans[0]);
                            console.log(ans[0]);
                            pieOptions[pieOptions.length]=ans[0];
                            pieCount[pieOptions.indexOf(ans[0])]=1;
                        }
                        else
                            pieCount[ret]++;
                    
                    console.log("piearr"+pieOptions+"piecount"+pieCount);
                     var pieArr = [];
                    for(var iq=0;iq<pieOptions.length ;iq++)
                    {
                        var str=pieOptions[iq].toString();
                        var chr=str.split('');
                        console.log(chr+"len"+chr.length);
                        var lab="";
                        for(var iw=0;iw<chr.length;)
                        {
                            
                             lab=lab.concat(poll['qtn_json'][j]['rows'][chr[iw]-1]+",");
                             console.log("lab"+lab);
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
            console.log("pieArrseo"+pieArr);
            console.log(pieArr);
            
              var maxticks=0;
            console.log("ansarray");
            //for(var p=0;p<noOfmcms;p++)
                        for(var l=0;l<noOfOptions;l++)
                    { 
                        console.log(count[0][l]);
                        if(count[0][l]>maxticks)
                            maxticks=count[0][l];
                        
                    }
                if(maxticks>10)
                {
                    console.log("maxticks"+maxticks);
                    maxticks=5;
                    console.log("maxticks"+maxticks);
                }
               console.log("finish counting started d3"); 
               
             
     var k=0;
                for(var j=0;j<result[0]['qtn'].length;j++)
                {
                if(poll['qtn_json'][j]['qtn_type']==="mcms")
                {
                    if(poll['qtn_json'][j]['qtn_id']===q_id)
                    {
                    var arrayOptions=poll['qtn_json'][j]['rows'];
                    console.log(arrayOptions);
                     var noOfOptions=poll['qtn_json'][j]['rows'].length;
                     var jsonArr = [];
                    for(i=0;i<noOfOptions ;i++)
                    {
                        jsonArr.push({
                            label:arrayOptions[i],
                             n: count[k][i]
                                    });
                    }
                    console.log(jsonArr.slice(0));
                    k++;
                    console.log("call");
                    console.log(jsonArr);
                    
                    //logic of pie label
                   /* 
                    
                    var pieOptions=new Array();
                    var pieCount=new Array();
                    var ret;
                    for(var ii=0;ii<ans[0].length;ii++)
                    {
                        console.log(ans[0]);
                        
                                        
                        ret=pieOptions.indexOf(ans[0].[ii]);
                        if(ret===-1)
                        {
                            
                            pieOptions.push(ans[0][ii]);
                            pieCount[indexOf[ans[0][ii]]]=1;
                        }
                        else
                            pieCount[ret]++;
                    }
                    console.log("piearr"+piearr);
                                        
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
                           // console.log(temp);
                            
                           // console.log("empty"+temp);
                            temp[te]=first[ii]+second[jj];
                            console.log("first"+first[ii]+"second"+second[jj]);
                            kk++;
                            te++;
                            if(jj===second.length-1 && ii!==first.length-1 )
                            {
                                jj=tit+1;
                                console.log("inside if");
                            }
                            
                        }
                        
                        }
                        //console.log(temp);
                        first=[];
                        first=temp;
                        cc++;
                    }
                    console.log("third"+third);*/
                      var qtn_div="qtn_div_"+j;
                    $("body").append("<div id='"+qtn_div+"'></div>");
                      plotBar(qtn_div,j);
                      plotpie();
                    tablegen(qtn_div,j);
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
                        console.log(count[k][l]);
                    }
                }
                     }
            
                    
                }   
                
                    
                    for(var i=0;i<result.length;i++)
            {
                for(var j=0;j<result[0]['qtn'].length;j++)
                {
                    console.log("question no"+q_id);
                if(poll['qtn_json'][j]['qtn_type']==="moc")
                { 
                  
                    if(poll['qtn_json'][j]['qtn_id']===q_id)
                    {
                        console.log("q_id working");
                    var arrayRows=poll['qtn_json'][j]['rows'];
                    console.log(arrayRows);
                     var noOfRows=poll['qtn_json'][j]['rows'].length;
                     var arrayColumns=poll['qtn_json'][j]['columns'];
                    console.log(arrayColumns);
                     var noOfColumns=poll['qtn_json'][j]['columns'].length;
                    var ans=result[i]['qtn'][j]['ans'];
                    console.log(ans);
                  //  for(var ii=0;ii<noOfRows;ii++)
                    //    for(var jj=0;jj<noOfColumns;jj++)
                    for(var ii=0;ii<ans.length;ii++)
                    {
                        console.log(ans[0][0]+"poi"+ans[0][2]);
                        count[ans[ii][0]][ans[ii][2]]++;
                    }
                }
                }
                }
                }
            
           for(var k=0;k<noOfRows;k++)
                        for(var l=0;l<noOfColumns;l++)
                    {
                        console.log(count[k][l]);
                    }
                    var maxticks=0;
            console.log("ansarray");
            var p=0;
            for( p=0;p<noOfRows;p++)
                        for(var l=0;l<noOfColumns;l++)
                    { 
                        console.log(count[p][l]);
                        if(count[p][l]>maxticks)
                            maxticks=count[p][l];
                        
                    }
                if(maxticks>10)
                {
                    console.log("maxticks"+maxticks);
                    maxticks=5;
                    console.log("maxticks"+maxticks);
                }
               console.log("finish counting started d3"); 
                    
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
                    }
                    k++;
                    console.log("call");
                    console.log(jsonArr);
                    var qtn_div="qtn_div_"+j;
                    $("body").append("<div id='"+qtn_div+"'></div>");
                    plotBar(qtn_div,j);
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
                        console.log(count[k][l]);
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
                    console.log(arrayRows);
                     var noOfRows=poll['qtn_json'][j]['rows'].length;
                     var arrayColumns=poll['qtn_json'][j]['columns'];
                    console.log(arrayColumns);
                     var noOfColumns=poll['qtn_json'][j]['columns'].length;
                    var ans=result[i]['qtn'][j]['ans'];
                    console.log(ans);
                  //  for(var ii=0;ii<noOfRows;ii++)
                    //    for(var jj=0;jj<noOfColumns;jj++)
                    for(var ii=0;ii<ans.length;ii++)
                    {
                        console.log(ans[0][0]+"poi"+ans[0][2]);
                        count[ans[ii][0]][ans[ii][2]]++;
                    }
                }
                }
                }
                }
            
           for(var k=0;k<noOfRows;k++)
                        for(var l=0;l<noOfColumns;l++)
                    {
                        console.log(count[k][l]);
                    }
                    
                    
                         var maxticks=0;
            console.log("ansarray");
            var p=0;
            for( p=0;p<noOfRows;p++)
                        for(var l=0;l<noOfColumns;l++)
                    { 
                        console.log(count[p][l]);
                        if(count[p][l]>maxticks)
                            maxticks=count[p][l];
                        
                    }
                if(maxticks>10)
                {
                    console.log("maxticks"+maxticks);
                    maxticks=5;
                    console.log("maxticks"+maxticks);
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
                    }
                    k++;
                    console.log("call");
                    console.log(jsonArr);
                    var qtn_div="qtn_div_"+j;
                    $("body").append("<div id='"+qtn_div+"'></div>");
                    plotBar(qtn_div,j);
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
     console.log("in");
var margin = {top: 20, right: 20, bottom: 70, left: 40},
width = 350 - margin.left - margin.right,
height = 250 - margin.top - margin.bottom;
// Parse the label / time
//var parseDate = d3.time.format("%Y-%m").parse;
var color = d3.scale.ordinal()
    .range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);
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
console.log("maxticks3"+maxticks);
var svg = d3.select(qtn_div).append("svg")
.attr("id", "svg_"+p)
.attr("width", width + margin.left + margin.right)
.attr("height", height + margin.top + margin.bottom)
.append("g")
.attr("transform",
"translate(" + margin.left + "," + margin.top + ")");
console.log("just above d3fucntion");
//d3.json("bars", function() {
  console.log("just above split"+jsonArr);
  var data=jsonArr.slice();
data.forEach(function(d) {
d.label = d.label;
d.n = +d.n;
});
x.domain(data.map(function(d) { return d.label; }));
y.domain([0, d3.max(data, function(d) { return d.n; })]);
console.log(data);
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
.style("fill", function(d) { return color(d.label); })
.attr("x", function(d) { return x(d.label); })
.attr("width", x.rangeBand())
.attr("y", function(d) { return y(d.n); })
.attr("height", function(d) { return height - y(d.n); });
//});
console.log("out");
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
     $("#"+qtn_div).append("<table id='tbl_"+p+"'></table>");
 //var tbl2=$("<table/>").attr("id","mytable26");
       //$(tbl_id).append("<tr></tr>");
      
      var td1="<th>"+"uid"+"</th>";
        for(var i=0;i<jsonArr.length;i++)
       {
        
         td1=td1+"<th>"+jsonArr[i]["label"]+"</th>";
        // var td2="<td>"+jsonArr[i]["n"]+"</td>";
 
       }
       $(tbl_id).append("<tr>"+td1+"</tr>"); 
       $(tbl_id).append("<td>"+poll['uid']+"</td>");
      
        for(var i=0;i<jsonArr.length;i++)
       {
        
        var td1="<td>"+jsonArr[i]["n"]+"</td>";
        // var td2="<td>"+jsonArr[i]["n"]+"</td>";
        
        
        $(tbl_id).append(td1); 

       }
       //$(tbl_id).append("</tr>");
       
    }

        
        </script>
        
        <div id="mytable2"></div>

    </body>
</html>
