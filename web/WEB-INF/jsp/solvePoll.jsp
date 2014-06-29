<%-- 
    Document   : solvePoll
    Created on : Apr 1, 2014, 3:44:20 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="User_Manager.User_Detail"%>
<% 
Cookie[] cookies = request.getCookies();
String handle="";
int uid=0;
//User_Detail user_detail;
Gson gson=new Gson();
        boolean foundCookie = false;

        for(int i = 0; i < cookies.length; i++) { 
            Cookie cookie1 = cookies[i];
            if(cookie1.getName().equals("handle"))
            {
                handle=cookie1.getValue();
                foundCookie = true;
            }
            else if(cookie1.getName().equals("uid"))
            {
                uid=Integer.parseInt(cookie1.getValue());
                foundCookie = true;
            }
            else if(cookie1.getName().equals("User_Obj"))
            {
                System.out.println(cookie1.getValue());
               // user_detail=gson.fromJson(cookie1.getValue(), User_Detail.class);
                foundCookie = true;
            }
        }  

        if (!foundCookie) {
            System.out.println("cookies not found 2");
            response.sendRedirect("index");
        }
%>
<!DOCTYPE html>
<html>
    <head>
            <link rel="stylesheet" href="pages/resources/css/jquery-ui.css">
            <script src="pages/resources/js/jquery.min.js"></script>
            <script src="pages/resources/js/jquery-ui.js"></script>
  
  
  
  
        <script src="pages/resources/js/ui.core.js"></script>
        
        
        <link rel="stylesheet" href="pages/resources/css/ui.dropdownchecklist.css" />
        
          <script src="pages/resources/js/ui.dropdownchecklist.js"></script>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            var pollJSON;
                var qtnJSON;
                var ansJSON;
                var pid=${pid};
                var data=${obj};
                var uid=<%= uid %>
            $(document).ready(function(){
                
                console.log("dataIn solvePoll");
               //console.log(data);
               pollJSON=data;//JSON.parse(data);
               console.log(pollJSON);
               qtnJSON=pollJSON['qtn_json'];
               console.log("qtn JSON");
               console.log(qtnJSON);
               //ansJSON=JSON.parse(pollJSON['ans_json']);
                 //alert(data);
                 
              $("#pollArea").append('<h1>'+pollJSON['title']+'</h1><h2>'+pollJSON['description']+'</h2>');
                  for(var i=0; i<qtnJSON.length; i++)
                  {
                      $("#pollArea").append("<p>Qtn "+qtnJSON[i]['qtn_id']+":"+qtnJSON[i]['qtn']+"</p>");
                      switch(qtnJSON[i]['qtn_type'])
                      {
                          case "mcss":{
                                        var answers=qtnJSON[i]['rows'];
                                        for (var j=0; j<answers.length;j++)
                                            {
                                                $("#pollArea").append('<input type="radio" name="qtn'+(i+1)+'" value="'+(j+1)+'"/>'+answers[j]+'<br/>');
                                            }
                                      }break;
                          case "mcms":{//console.log(ansJSON[i][1]);
                                        var answers=qtnJSON[i]['rows'];
                                       
                                        $("#pollArea").append('<select multiple id="qtn'+(i+1)+'" name="qtn'+(i+1)+'"></select>');
                                        for (var j=0; j<answers.length;j++)
                                            {//console.log(answers[j]);
                                                $("#qtn"+(i+1)).append('<option value="'+(j+1)+'">'+answers[j]+'</option>');
                                                //$("#qtn"+(i+1)).append('<option>Hello</option>');
                                                
                                            }
                                            //$("#pollArea").append('</select>');
                                            $("#qtn"+(i+1)).dropdownchecklist({maxDropHeight:120,width:100,emptyText: "select"});
                                            
                                      }break;
                           case "tb":{
                                       //console.log(ansJSON[i]);
                                       $("#pollArea").append('Enter your answer here. If you have multiple answers then separate them with enter<br/><textarea id="qtn'+(i+1)+'" name="qtn'+(i+1)+'"></textarea>');
                                      }break;
                            case "moc":{
                                           
                                           var rows=qtnJSON[i]['rows'];
                                           var columns=qtnJSON[i]['columns'];
                                           
                                           var tableid="moc"+(i+1);
                                           $("#pollArea").append('<table id="'+tableid+'"></table>');
                                           for(var k=0; k<=rows.length; k++)
                                           {var row_id="moctr"+k;
                                               $("#"+tableid).append('<tr id="'+row_id+'"></tr>');
                                               for(var l=0; l<=columns.length; l++)
                                               {
                                                   if(k==0)
                                                   {
                                                       if(l==0)
                                                       {
                                                           $("#"+row_id).append("<th><center>Rows\Columns</center></th>");// top right corner cell
                                                       }
                                                       else
                                                       {
                                                           $("#"+row_id).append("<th><center>"+columns[l-1]+"</center></th>");// naming columns
                                                       }
                                                   }
                                                   else if(l==0)
                                                   {
                                                       $("#"+row_id).append("<th><center>"+rows[k-1]+"</center></th>");//naming rows
                                                   }
                                                   else
                                                   {
                                                       $("#"+row_id).append("<td><center><input type='radio' name='qtn"+(i+1)+" "+(k-1)+"' value='"+(k-1)+","+(l-1)+"'/></center></td>");
                                                   }
                                               }
                                           }
                                           
                                          
                                       
                                      }break;
                          
                    case "momc":{
                            
                                           var rows=qtnJSON[i]['rows'];
                                           var columns=qtnJSON[i]['columns'];
                                           
                                           var tableid="momc"+(i+1);
                                           $("#pollArea").append('<table id="'+tableid+'"></table>');
                                           for(var k=0; k<=rows.length; k++)
                                           {var row_id="momctr"+k;
                                               $("#"+tableid).append('<tr id="'+row_id+'"></tr>');
                                               for(var l=0; l<=columns.length; l++)
                                               {
                                                   if(k==0)
                                                   {
                                                       if(l==0)
                                                       {
                                                           $("#"+row_id).append("<th><center>Rows\Columns</center></th>");// top right corner cell
                                                       }
                                                       else
                                                       {
                                                           $("#"+row_id).append("<th><center>"+columns[l-1]+"</center></th>");// naming columns
                                                       }
                                                   }
                                                   else if(l==0)
                                                   {
                                                       $("#"+row_id).append("<th><center>"+rows[k-1]+"</center></th>");//naming rows
                                                   }
                                                   else
                                                   {
                                                       $("#"+row_id).append("<td><center><input type='checkbox' name='qtn"+(i+1)+" "+(k-1)+"' value='"+(k-1)+","+(l-1)+"'/></center></td>");
                                                   }
                                               }
                                           }
                                          
                                }break;
                              
                      }
                  }
               
            
            });
            
            function submitAns()
            {
                var finalAns=new Array();
                console.log("In submit ans");
                console.log(qtnJSON);
                for(var i=0; i<qtnJSON.length; i++)
                  {
                        var answers=new Array();
                        //answers[0]=qtnJSON[i]['qtn_id'];
                        //answers[1]=qtnJSON[i]['qtn_type'];
                        //answers[2]=new Array();
                      switch(qtnJSON[i]['qtn_type'])
                      {
                          case "mcss":  {
                                            
                                            answers.push($('input[name=qtn'+(i+1)+']:checked').val());
                                            //finalAns.push(answers);
                                        }break;
                          case "mcms":  {
                                            
                                            answers.push($('#qtn'+(i+1)).val());
                                            //finalAns.push(answers);
                                        }break;
                          case "tb":    {
                                           
                                            var temp=$('#qtn'+(i+1)).val().split('\n');
                                            answers.push(temp);
                                            //finalAns.push(answers);
                                        }break;
                          case "moc":   {
                                            
                                            var rows=qtnJSON[i]['rows'];
                                           
                                            for(var k=0; k<rows.length;k++)
                                            {
                                                   answers.push($('input[name="qtn'+(i+1)+' '+k+'"]:checked').val()); 
                                            }
                                           //finalAns.push(answers);
                                        }break;
                          case "momc":  {
                                            
                                            var rows=qtnJSON[i]['rows'];
                                            for(var k=0; k<rows.length;k++)
                                            {
                                                   var temp= new Array();
                                                   $('input[name="qtn'+(i+1)+' '+k+'"]:checked').each(function() {
                                                                                                                //console.log(this.value);
                                                                                                                answers.push(this.value);
                                                                                                             });
                                                   
                                           }
                                           //finalAns.push(answers);
                                        }break;
                      }
                      console.log("i="+i+" qtn id="+qtnJSON[i]['qtn_id']+" qtn type="+qtnJSON[i]['qtn_type']+" answrs="+answers);
                      var ans2={qtn_id:qtnJSON[i]['qtn_id'], qtn_type:qtnJSON[i]['qtn_type'],ans:answers};
                      finalAns.push(ans2);
                  }
                  console.log(finalAns);
                  finalAns=JSON.stringify(finalAns);
                  console.log("finalAns");
                      console.log(finalAns);
                      //console.log(finalAns2);
                  var finalJSON=new Array();
                  finalJSON.push(pid);
                  finalJSON.push(uid);// UID will come here
                  finalJSON.push(finalAns);
                  finalJSON=JSON.stringify(finalJSON);
                  console.log("Final string");
                  console.log(finalJSON);
                  $.ajax({
                                type: "POST",       // the dNodeNameefault
                                url: "submitPollAns",
                                data: { finalJSON: finalJSON},
                                success: function(data){alert(data);
                                        if(data)
                                        {
                                            $("#submitSurvey").empty().append('<button onclick="pollResult('+pid+');">View Result</button>')
                                        }
                                }
                        });
            }
        </script>
    </head>
    <body>
        <div id="pollArea">
            
        </div>
        <div id='submitSurvey'>
            <button onclick="submitAns();">Submit Survey</button>
        </div>
    </body>
</html>
