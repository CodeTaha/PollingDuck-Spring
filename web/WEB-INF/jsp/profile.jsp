
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
Cookie[] cookies = request.getCookies();
String handle="";
int uid=0;
//User_Detail user_detail;
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
            //response.sendRedirect("index");
        }
        
       
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      <link rel="stylesheet" href="../pages/resources/css/jquery-ui.css">
  <script src="../pages/resources/js/jquery.min.js"></script>
  <script src="../pages/resources/js/jquery-ui.js"></script>
  <script src="../pages/resources/bootstrap/js/bootstrap.js"></script>
  <link rel="stylesheet" href="../pages/resources/bootstrap/css/bootstrap.css">
    <script>
        var followers,following;
         var profile=${profile}; 
        var loggedin=${loggedin};
        var uid=<%=uid%>;
        followers=${followers};
        following=${following};           
        $(document).ready(function(){
            
            
                if(loggedin)
                {console.log("user is logged in");
                   
                  
                }
        // handle of user
            
      
         var name=profile['name'];
        var fbid=profile['fb'];
        var city=profile['city'];
        var country=profile['country'];
        var dob=profile['dob'];
        var email=profile['email'];
        var sex=profile['sex'];
        var religion=profile['religion'];
        var fish=profile['fish'];
        var handle=profile['handle'];
        var lc=profile['lc'];
        var phone=profile['phone'];
        var profile_pic =profile['profile_pic'];
        var categs = profile['category_list_json'];
        var exp_json = profile['exp_json'];
/*         $("#user_everything").append('<h1> '+name+'</h1><br/><a href="http://www.facebook.com/'+fbid+'" target="_blank">'+fbid+'</a>');
$("#user_everything").append('<br/><b>City </b>: '+city+'<br/><b> Country </b>: '+country+'<br/><b>Date Of Birth </b> : '+dob+'<br/><b> Email </b> : '+email+'<br/><b>Sex </b>: '+sex+'<br/><b> Religion </b>: '+religion+'<br/><b> Fishes </b> : '+fish+'<br/><b> Polling Duck Handle</b> : <i>'+handle+'</i><br/><b> Last Change </b> : '+lc+'<br/><b> Contact : </b>'+phone+'<br/>');
$("#dp").append("<b> Profile Picture</b> <img width='50' height='50' src="+profile_pic+">").append("<br><b> Followers</b>:"+profile['follow']['followers'].length).append("<b> Following</b>:"+profile['follow']['following'].length);

*/
$("#pic").append("<img width='100' height='100'class='img-circle' alt='Cinque Terre'  src="+profile_pic+"><p></p>");
$("#name").append('<h2><b>'+name+'</b></h2><p></p>');
$("#follow").append("<br/><b>"+profile['follow']['followers'].length+"</b>");
$("#followinguser").append("<br/><b>"+profile['follow']['following'].length+"</b>");
$("#fishes").append("<br/><b>"+fish+"</b><p></p>");
$("#handle").append("<p></p>Pollican Handle : @"+handle);
$("#city").append("City : "+city);
$("#country").append("Country : "+country);
$("#sex").append("Gender : "+sex);
$("#dob").append("Date of Birth : "+dob);


if(profile['uid']==uid)
{
    $("#pic").append('<br/><button onclick=editProfile();>Edit Profile</button>');
    
}
else
{
    if(uid!==0)
    {
        if(profile['follow']['followers'].indexOf(uid)!==-1)
        {
            $("#follUnfoll").append('<button id="followUnfollow" onclick="follow(0);">Unfollow</button>');
        }
        else
        {
            $("#follUnfoll").append('<button id="followUnfollow" onclick="follow(1);">Follow</button>');
        }
        if(profile['follow']['following'].indexOf(uid)!==-1)
        {
            $("#pic").append('<br/> <b>Follows you<b>');
        }
        
    }
}

   $.ajax({
           type: "POST",       // the dNodeNameefault
           url: "../viewUsersCategData",
           data:   {   },
           success: function(data){
            
               userCategJSON=JSON.parse(data);
             
                for(var i=0;i<userCategJSON.length;i++)
                {   for (var j=0; j < categs.length ; j++)
                    { if(userCategJSON[i]['cid']===categs[j])
                        { $("#uexp").append( "<b>" + userCategJSON[i]['category_name']  +"</b>") ;
                          $("#uexp").append( " <i> "+ exp_json[j]['exp']+"</i><br/>") ;
                           
                        }
                    }
                }
            }
});

       

$("#createdPolls").append('<h3>Polls Created </h3><br/>');
      
                $.ajax({
           type: "POST",       // the dNodeNameefault
           url: "../viewMyPollsData",
           data: { uidp:profile['uid'] },
           success: function(data){
              
               mypollJSON=JSON.parse(data);
               
                 for(var i=0; i<mypollJSON.length;i++)
                 {  $("#createdPolls").append("<p><b>Title </b>"+mypollJSON[i]['title']+"</p>");
                 $("#createdPolls").append("<p><b>Description </b>"+mypollJSON[i]['description']+"</p>");
                 $("#createdPolls").append('<button type="button" class="btn btn-primary" onclick="pollResult('+parseInt(mypollJSON[i]["pid"])+')">Results</button>');
                 
                 }
            }
});
       
                   
$("#solvedPolls").append('<h3>Polls Solved </h3></br/>');
            
                $.ajax({
           type: "POST",       // the dNodeNameefault
           url: "../viewMySolvedPollsData",
           data: { uidp : profile['uid'] },
           success: function(data){
               
               mysolvedpollJSON=JSON.parse(data);
              
                for(var i=0; i<mysolvedpollJSON.length;i++)
                 {  $("#solvedPolls").append("<p><b>Poll ID : </b>"+mysolvedpollJSON[i]['pid']+"</p>");
                 $("#solvedPolls").append("<p><b>Poll Ans Key: </b>"+mysolvedpollJSON[i]['poll_ans_key']+"</p>");
           $("#solvedPolls").append('<button type="button" class="btn btn-primary" onclick="pollResult('+parseInt(mysolvedpollJSON[i]["pid"])+')">Results</button>');
                     
        }   
            }
           });
           
           
           console.log(profile['follow']['followers']);
           
           console.log(profile['follow']['following']);
 $("#following").append('<h3>Follows</h3></br/>');  
            $.ajax({
           type: "POST",       // the dNodeNameefault
           url: "../viewFollowings",
           data: { uidfollowings : JSON.stringify(profile['follow']['following']) },
           success: function(data){
               
               myFollowings=data;
             // var abc = JSON.stringify(myFollowings);
                $("#following").append(myFollowings);
           
            }
           }); 
$("#followers").append('<h3>Followed By</h3></br/>');  
 $.ajax({
           type: "POST",       // the dNodeNameefault
           url: "../viewFollowers",
           data: { uidfollowings : JSON.stringify(profile['follow']['followers']) },
           success: function(data){
               
               myFollowers=data;
              // var abcd = JSON.stringify(myFollowers);
                $("#followers").append(myFollowers);
               
           
            }
           });

           


});
function pollResult(pid)
           {    
                     var win = window.open("../result/"+pid, '_blank');
                win.focus();    
            }
function editProfile()
           {    
                 alert("edit profile func called");
            }
 
function follow(cmd)
{ 
    $.ajax({
        type: "POST",       // the dNodeNameefault
           url: "../follow",
           data: { puid : profile['uid'], cmd:cmd },
           success: function(data)
           {console.log("follow"+data);
               if(data)
               {//id="followUnfollow" <button id="followUnfollow" onclick="follow(0);">Following</button>
                   //$("#followUnfollow").remove();
                   if(cmd===1)
                    {//alert(11);
                        //$("#followUnfollow").empty().append("Following").prop("onclick","follow(0);");
                        $("#follUnfoll").empty().append('<button id="followUnfollow" onclick="follow(0);">Following</button>');
                    }
                    else
                    {//alert(22);
                        //$("#followUnfollow").empty().append("Follow").prop("onclick","follow(1);");//.attr("onclick='follow(1);'");
                        $("#follUnfoll").empty().append('<button id="followUnfollow" onclick="follow(1);">Follow</button>');
                    }
                   
               }
           }
    });
}
    </script>
    </head>
    <body data-spy="scroll" data-target="#info">
        <div id="page-wrapper" >
             <div class="container-fluid" >
                 <div class="row col-md-12"  >
                  
                   
                       <div  id="info"  style="background-color:lavender; height:600px;" class="col-md-4 col-xs-12 col-sm-12 ">
                          
                            <div id="pic_name" >
                                
                                 <div id="pic" >
                               
                                 </div>
                                 
                                  
                                
                                 <div id="name" >
                               
                                 </div>
                                    
                            </div>
                             
                           <div id="fff" >
                                        <div id="follow" class="col-md-4">
                                          <button type="button" class="btn btn-primary">followers</button>
                                        </div>

                                        <div id="followinguser" class="col-md-4">
                                          <button type="button" class="btn btn-primary">followings</button>
                                        </div>

                                        <div id="fishes" class="col-md-4">
                                          <button type="button" class="btn btn-primary">fishes</button>
                                        </div>
                            </div>
                           <div id="follUnfoll" >
                               
                            </div>
                                 
                           <div id="handle_city_country_sex_dob_uexp"  >
                                        <div id="handle" >

                                        </div>

                                        <div id="city" >

                                        </div>

                                        <div id="country">

                                        </div>
                                        
                                        <div id="sex" >

                                        </div>

                                        <div id="dob" >

                                        </div>

                                        <div id="uexp">
                                         <h3 >user experience</h3>
                                        </div>
                            </div>
                        </div>
                             
                      <div id="csff" style="background-color:whitesmoke ; " class="col-md-6 col-xs-12 col-sm-12 ">
                             <ul id="myTab1" class="nav nav-tabs" style="margin-left: 20px ; margin-top: 10px ; ">
                                <li class="active">
                                    <a href="#createdPolls" data-toggle="tab">
                                       Created Polls
                                    </a>
                                </li>
                                <li><a href="#solvedPolls" data-toggle="tab">
                                        Solved Polls
                                    </a>
                                </li>
                                <li><a href="#following" data-toggle="tab">
                                        Following
                                    </a>
                                </li>
                                <li><a href="#followers" data-toggle="tab">
                                        Followers
                                    </a>
                                </li>
                             </ul>
                               
                           <div id="timeline" class="tab-content"  style="margin-left: 20px ; margin-top: 10px ;  "   >
            
                           <div class="tab-pane fade in active" id="createdPolls" style="margin-left: 20px ; margin-top: 10px ; margin-bottom: 30px ">
                           </div>
                               
                           <div class="tab-pane fade" id="solvedPolls"style="margin-left: 20px ; margin-top: 10px; margin-bottom: 30px" >
                           </div>
                
                           <div class="tab-pane fade" id="following" style="margin-left: 20px ; margin-top: 10px ; margin-bottom: 30px ">
                           </div>
                               
                           <div class="tab-pane fade" id="followers" style="margin-left: 20px ; margin-top: 10px ; margin-bottom: 30px ">
                           </div>
            
                           </div>
        
                       </div>
                                
                       <div id="suggestions" style="background-color:lavender; " class="col-md-2 col-xs-12 col-sm-12">
                             Suggestions
                       </div> 
               </div>
             </div>
        </div>
            
       </body>
</html>