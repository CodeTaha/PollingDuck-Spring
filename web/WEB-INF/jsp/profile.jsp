<%-- 
    Document   : profile
    Created on : 4 Jul, 2014, 4:16:37 PM
    Author     : Taha
--%>


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
            response.sendRedirect("index");
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
    <script>
        $(document).ready(function(){
                
        var profile=${profile};  // handle of user
            console.log("profile");
            console.log(profile);
        //   console.log(profile[]);
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
         $("#user_everything").append('<h1>'+name+'</h1><br/><a href="http://www.facebook.com/'+fbid+'" target="_blank">'+fbid+'</a>');
// <br/><p>'+city+'<br/>'+country+'<br/>'+dob+'<br/>'+email+'<br/>'+sex+'<br/>'+religion+'<br/>'+fish+'<br/>'+handle+'<br/>'+lc+'<br/>'+phone+'<br/>''<img src="'+profile_pic+'"></p>'    
$("#user_everything").append('<br/>'+city+'<br/>'+country+'<br/>'+dob+'<br/>'+email+'<br/>'+sex+'<br/>'+religion+'<br/>'+fish+'<br/>'+handle+'<br/>'+lc+'<br/>'+phone+'<br/>');
$("#dp").append("<img src="+profile_pic+">");

if(profile['uid']==<%=uid%>)
{
    $("body").append("<button>Edit Profile</button>");
}
});
    </script>
    </head>
    <body>
        
        <div id="user_everything"></div>
        <div id="dp"></div>
        
        
    </body>
</html>
