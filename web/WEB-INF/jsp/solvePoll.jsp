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
                
                
               console.log(data);
               pollJSON=data;//JSON.parse(data);
               console.log(pollJSON);
               qtnJSON=JSON.parse(pollJSON['qtn_json']);
               ansJSON=JSON.parse(pollJSON['ans_json']);
                 //alert(data);
                 
              $("#pollArea").append('<h1>'+pollJSON['title']+'</h1><h2>'+pollJSON['description']+'</h2>');
                  for(var i=0; i<qtnJSON.length; i++)
                  {
                      $("#pollArea").append("<p>Qtn "+qtnJSON[i][0]+":"+qtnJSON[i][2]+"</p>");
                      switch(qtnJSON[i][1])
                      {
                          case "mcss":{
                                        var answers=ansJSON[i][1].split("\n");
                                        for (var j=0; j<answers.length;j++)
                                            {
                                                $("#pollArea").append('<input type="radio" name="qtn'+(i+1)+'" value="'+(j+1)+'"/>'+answers[j]+'<br/>');
                                            }
                                      }break;
                          case "mcms":{//console.log(ansJSON[i][1]);
                                        var answers=ansJSON[i][1].split("\n");
                                       
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
                                       $("#pollArea").append('Enter your answer here. If you have multiple answers then separete them with enter<br/><textarea id="qtn'+(i+1)+'" name="qtn'+(i+1)+'"></textarea>');
                                      }break;
                            case "moc":{
                                           var matrix=JSON.parse(ansJSON[i][1]);
                                           console.log("matrix");
                                           console.log(matrix);
                                           $("#pollArea").append('<table id="moc'+(i+1)+'"></table>');
                                           for(var k=0; k<matrix.length;k++)
                                           {$("#moc"+(i+1)).append('<tr id="moctr'+k+'"></tr>');
                                            for(var l=0; l<matrix[0].length;l++) 
                                               {
                                                   if(k===0)
                                                   {
                                                       $("#moctr"+k).append("<th><center>"+matrix[k][l]+"</center></th>");
                                                   }
                                                   else if(l===0)
                                                   {
                                                       $("#moctr"+k).append("<td><b><center>"+matrix[k][l]+"</center></b></td>");
                                                   }
                                                   else
                                                   {
                                                       $("#moctr"+k).append("<td><center><input type='radio' name='qtn"+(i+1)+" "+k+"' value='"+k+","+l+"'/></center></td>");
                                                   }
                                               }
                                           }
                                       
                                      }break;
                          
                    case "momc":{
                                           var matrix=JSON.parse(ansJSON[i][1]);
                                           console.log("matrix");
                                           console.log(matrix);
                                           $("#pollArea").append('<table id="momc'+(i+1)+'"></table>');
                                           for(var k=0; k<matrix.length;k++)
                                           {$("#momc"+(i+1)).append('<tr id="momctr'+k+'"></tr>');
                                            for(var l=0; l<matrix[0].length;l++) 
                                               {
                                                   if(k===0)
                                                   {
                                                       $("#momctr"+k).append("<th><center>"+matrix[k][l]+"</center></th>");
                                                   }
                                                   else if(l===0)
                                                   {
                                                       $("#momctr"+k).append("<td><b><center>"+matrix[k][l]+"</center></b></td>");
                                                   }
                                                   else
                                                   {
                                                       $("#momctr"+k).append("<td><center><input type='checkbox' name='qtn"+(i+1)+" "+k+"' value='"+k+","+l+"'/></center></td>");
                                                   }
                                               }
                                           }
                                }break;
                              
                      }
                  }
               
            
            });
            
            function submitAns()
            {var finalAns=new Array();
                for(var i=0; i<qtnJSON.length; i++)
                  {var answers=new Array(3);
                      switch(qtnJSON[i][1])
                      {
                          case "mcss":  {
                                            answers[0]=i+1;
                                            answers[1]='mcss';
                                            answers[2]=new Array();
                                            answers[2].push($('input[name=qtn'+(i+1)+']:checked').val());
                                            finalAns.push(answers);
                                        }break;
                          case "mcms":  {
                                            answers[0]=i+1;
                                            answers[1]='mcms';
                                            answers[2]=new Array();
                                            answers[2].push($('#qtn'+(i+1)).val());
                                            finalAns.push(answers);
                                        }break;
                          case "tb":    {
                                            answers[0]=i+1;
                                            answers[1]='tb';
                                            answers[2]=new Array();
                                            var temp=$('#qtn'+(i+1)).val().split('\n');
                                            answers[2].push(temp);
                                            finalAns.push(answers);
                                        }break;
                          case "moc":   {
                                            answers[0]=i+1;
                                            answers[1]='moc';
                                            answers[2]=new Array();
                                            var matrix=JSON.parse(ansJSON[i][1]);
                                            console.log("matrix");
                                            console.log(matrix);
                                            for(var k=1; k<matrix.length;k++)
                                            {
                                                   answers[2].push($('input[name="qtn'+(i+1)+' '+k+'"]:checked').val());
                                                   console.log(answers[2]);
                                                
                                            }
                                           finalAns.push(answers);
                                        }break;
                          case "momc":  {
                                            answers[0]=i+1;
                                            answers[1]='momc';
                                            answers[2]=new Array();
                                            var matrix=JSON.parse(ansJSON[i][1]);
                                            for(var k=1; k<matrix.length;k++)
                                            {
                                                   var temp= new Array();
                                                   $('input[name="qtn'+(i+1)+' '+k+'"]:checked').each(function() {
                                                                                                                //console.log(this.value);
                                                                                                                answers[2].push(this.value);
                                                                                                             });
                                                   console.log(answers[2]);
                                           }
                                           finalAns.push(answers);
                                        }break;
                      }
                      
                  }
                  finalAns=JSON.stringify(finalAns);
                  console.log("finalAns");
                      console.log(finalAns);
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
