<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to PollingDuck project</title>
        <script src="pages/resources/js/jquery.min.js"></script>
        <script type="text/javascript">
var name;
var username;
var userid;
var email;
var link; 
var birthdate;
var profile_pic;
     window.fbAsyncInit = function() {
    FB.init({
      appId      : '555702664544677', // App ID
       status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true  // parse XFBML
    });
    
    
	FB.Event.subscribe('auth.authResponseChange', function(response) 
	{
 	 if (response.status === 'connected') 
  	{
  		document.getElementById("message").innerHTML +=  "<br>Connected to Facebook";
  		//SUCCESS
  		
  	}	 
	else if (response.status === 'not_authorized') 
    {
    	document.getElementById("message").innerHTML +=  "<br>Failed to Connect";

		//FAILED
    } else 
    {
    	document.getElementById("message").innerHTML +=  "<br>Logged Out";

    	//UNKNOWN ERROR
    }
	});	
	
    };
    
   	function Login()
	{
	
		FB.login(function(response) {
		   if (response.authResponse) 
		   {
		    	getUserInfo();
  			} else 
  			{
  	    	 console.log('User cancelled login or did not fully authorize.');
   			}
		 },{scope: 'email,user_photos,user_videos,user_location,user_hometown,user_birthday'});
	

	
	}

  function getUserInfo() {
	    FB.api('/me', function(response) {

	var str="<b>Name</b> : "+response.name+"<br>";
	  	  str +="<b>Link: </b>"+response.link+"<br>";
	  	  str +="<b>Username:</b> "+response.username+"<br>";
	  	  str +="<b>id: </b>"+response.id+"<br>";
	  	  str +="<b>Email:</b> "+response.email+"<br>";
                  
	  	
                  
	  	  str +="<b>Location:</b> "+response.location.name+"<br>";
                  
	  	  str +="<b>Birthday:</b> "+response.birthday+"<br>";
                  
	  	  str +="<b>Gender:</b> "+response.gender+"<br>";
	  	  str +="<input type='button' value='Get Photo' onclick='getPhoto();'/>";
	  	  str +="<input type='button' value='Logout' onclick='Logout();'/>"; 
 document.getElementById("status").innerHTML=str;  
 document.getElementById("imgbut").innerHTML="";
    
 name = response.name;
 username=response.username;
 userid = response.id;
 email = response.email;
 link = response.link; 
 birthdate = response.birthday;
 profile_pic;
  FB.api('/me/picture?type=normal', function(response) {
                    
		  var str2 =  "<img src='"+response.data.url+"'/>";
	  	 
                
    });
                  


                  
   console.log(name);
    console.log(username);
   console.log(userid);
    console.log(email);
   console.log(link);
  	$.ajax({
                                type: "POST",       // the dNodeNameefault
                                url: "loginFB",
                                data: {username:username, password:email},
                                success: function(data){//alert(data);
                                        if(data==1)
                                        {//alert(1);
                                           window.location.assign("dashboard");
                                        }
                                        else
                                        {//alert(2);
                                            //console.log(data);
                                            window.location.assign("SignUp");
                                        }
                                        
                                }
                        });    
    });
    }
	function getPhoto()
	{
	  FB.api('/me/picture?type=normal', function(response) {

		  var str2 =  "<br/><b>Pic</b> : <img src='"+response.data.url+"'/>";
	  	  document.getElementById("pic").innerHTML=str2;
	  	  	    
    });
	
	}
	function Logout()
	{
		FB.logout(function(){document.location.reload();});
	}

  // Load the SDK asynchronously
  (function(d){
     var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement('script'); js.id = id; js.async = true;
     js.src = "//connect.facebook.net/en_US/all.js";
     ref.parentNode.insertBefore(js, ref);
   }(document));
</script>

    </head>

    <body>
        
        <div id="status">
    This is really cool <br/></div>
 <div id="details">
     
 </div>
        <div id="imgbut">
<img src="pages/resources/images/LoginWithFacebook.png" style="cursor:pointer;" onclick="Login()"/>
<br/>We respect your hatred towards membership form filling
</div>
<br/><br/><br/><br/><br/>
<div id="message">
Logs:<br/>
</div>

        <form action="login" method="post">
            User id <input type="text" name="username"><br>
            password <input type="password" name="password">
            <input type="submit"/>
        </form>
        
        <a href="SignUp">New User?</a>
      
    </body>
    <script>
        var test=new Array();
        test.push(1);
        test.push(2);
        test.push(3);
        test.push(4);
        console.log(JSON.stringify(test));
        
    </script>
</html>
