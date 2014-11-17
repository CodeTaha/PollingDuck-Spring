<%@page import="controllers.Parent_Controller"%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    Parent_Controller pc=new Parent_Controller();
    boolean foundCookie = false;
    foundCookie=pc.checklogin(request);
    if(foundCookie)
    {
        response.sendRedirect("dashboard");
        //request.getRequestDispatcher("dashboard").forward(request, response);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to PollingDuck project</title>
         <link href="pages/resources/select2/select2.css" rel="stylesheet"/>
        <link rel="stylesheet" href="pages/resources/css/jquery-ui-timepicker-addon.css" >
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
        <script src="pages/resources/js/jquery.min.js"></script>
        <script src="pages/resources/select2/select2.js"></script>
        <script type="text/javascript" src="pages/resources/js/jquery-ui.js"></script>
        <script type="text/javascript" src="pages/resources/js/jquery-ui-timepicker-addon.js"></script>
        
        <script type="text/javascript">
var name;
var username;
var userid;
var email;
var link; 
var birthdate;
var profile_pic;
 var cat_json="";
 var cat_list=new Array();// maintains list for categories
 var red_url=window.location.search.replace("?", "").toString();
 var cat_list=new Array();
   var array2 = new Array();
            var array3 = new Object();
    $(document).ready(function(){
        
        
       
        $("#SignUp").hide();
        $("#dob").datepicker({
          
           dateFormat:"mm/dd/yy" 
                   });
   
   
                                                     
    
    });
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
  		//document.getElementById("message").innerHTML +=  "<br>Connected to Facebook";
  		//SUCCESS
  		
  	}	 
	else if (response.status === 'not_authorized') 
    {
    	//document.getElementById("message").innerHTML +=  "<br>Failed to Connect";

		//FAILED
    } else 
    {
    	//document.getElementById("message").innerHTML +=  "<br>Logged Out";

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
                  
	  	
                  if(response.location!==undefined)
                  {
	  	  str +="<b>Location:</b> "+response.location.name+"<br>";
                  }
                  else 
                  str +="<b>Location:</b> Private <br>";
              
	  	  str +="<b>Birthday:</b> "+response.birthday+"<br>";
                  
	  	  str +="<b>Gender:</b> "+response.gender+"<br>";
	  	  str +="<input type='button' value='Get Photo' onclick='getPhoto();'/>";
	  	  str +="<input type='button' value='Logout' onclick='Logout();'/>"; 
  
 $("#imgbut").hide();
    
 name = response.name;
 username=response.username;
 userid = response.id;
 email = response.email;
 link = response.link; 
 birthdate = response.birthday;
 //profile_pic=response.data.url;
 FB.api('/me/picture?type=normal', function(response) {
                  profile_pic=response.data.url;
                  
                  document.getElementById("profile_pic").value=profile_pic;
                  $("#dp").append("<img src='"+profile_pic+"'/>")
    });
 
                  


                  
   console.log(name);
    console.log(username);
   console.log(userid);
    console.log(email);
   console.log(link);
    	/*$.ajax({
                                type: "POST",       
                                url: "viewUsersCategData",
                                data: {},
                                success: function(data){
                                    cat_json=JSON.parse(data);
                                         //   abc();
                                        }
                                 });*/
  	$.ajax({
                                type: "POST",       // the dNodeNameefault
                                url: "loginFB",
                                data: {username:username, password:email},
                                success: function(data){//alert(data);
                                        if(data==1)
                                        {
                                            if(red_url!=="" && red_url.indexOf("red_url")!==-1)
                                                {

                                                    var tmp=red_url.split("=");
                                                   window.location.assign(tmp[1]);
                                                }
                                            else
                                                {
                                                    window.location.assign("dashboard");
                                                }
                                           
                                           
                                        }
                                       
                                     
                                        else
                                        {
                                            $("#SignUp").show();
                                            cat_json=JSON.parse(data);
                                            document.getElementById("email").value =email;
                                            document.getElementById("email").readOnly = true;
                                            document.getElementById("dob").value =birthdate;
                                            document.getElementById("email").readOnly = true;
                                            document.getElementById("name").value=name;
                                            console.log(cat_json);
                                           
                                          /*    for(var i=0; i<cat_json.length; i++)
                                                        {
                                                            cat_list.push({id:cat_json[i]['cid'], text:cat_json[i]['category_name']});
                                                            $("#category").append("<option value="+cat_json[i]['cid']+">"+cat_json[i]['category_name']+"</option>");
                                                        }
                                                       
                                           */
                                             abc();
                                                         
                                            
                                        }
                                        
                                }
                        });
                        
    });
    }
	function abc()
     {  for(var i=0; i<cat_json.length;i++)
        { if( array2.indexOf(cat_json[i]['group'])===-1)
            {
                array2.push(cat_json[i]['group']);
                array3[cat_json[i]['group']]=new Array();
                array3[cat_json[i]['group']].push(cat_json[i]);
            }
          else
          {
               array3[cat_json[i]['group']].push(cat_json[i]);   
          }  
        }
        console.log("Tahas category list");
        console.log(array2);
        console.log(array3);
    
        for(var i=0;i<array2.length;i++)
       { $("#accordion").append("<h3>"+array2[i]+"</h3><div id='cat_"+i+"'></div>");
        
        for(var j=0;j<array3[array2[i]].length;j++)
        {
            $("#cat_"+i).append("<input class='cat_checkbox' type='checkbox' id='"+array3[array2[i]][j].cid +" 'value='"+array3[array2[i]][j].cid+"'>"+array3[array2[i]][j].category_name+"&nbsp;&nbsp;");
        }
          
       }
        $( "#accordion" ).accordion({
      heightStyle: "fill"
    });
    $( "#accordion-resizer" ).resizable({
      minHeight: 70,
      minWidth: 200,
      maxHeight:130,
      resize: function() {
        $( "#accordion" ).accordion( "refresh" );
      }
    });
    $('.cat_checkbox').click(function() {//for checkbox
       
    var mcCbxCheck = $(this);
    //console.log(mcCbxCheck.val())
    if(mcCbxCheck.is(':checked')) {
        if(cat_list.length<20)
        {
        addRemoveList(mcCbxCheck.val(),1);
        }
        else
        { alert("You can select maximum of 20 categories");
            return false;}
    
    }
    else{
       addRemoveList(mcCbxCheck.val(),0);
        
    }
        });
     }
     
     
    
    function addRemoveList(cat_id,addRemove)
    {
        if(addRemove==1)
        {
           cat_list.push(parseInt(cat_id));
        }
        else
        {
             cat_list.splice(cat_list.indexOf(cat_id), 1);
        }
        console.log(cat_list)
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
   
   function validate()
  {
      var handle=$("#handle").val();
      var name=$("#name").val();
      var email=$("#email").val();
      var country=$("#country").val();
      var state=$("#state").val();
      var city=$("#city").val();
      var zip=$("#zip").val();
      var religion="";
      var sex=$('input[name=sex]:checked').val();
      var dob=$("#dob").val();
      var phone=$("#phone").val();
      var profile_pic=$("#profile_pic").val();
      var category;//$("#category").val();
      for(var i=0; i<cat_list.length; i++)
      {if(i==0)
          {category="["+cat_list[i];}
       else
       {
          category=category+","+cat_list[i];
      }
      }
      var fb=username;// Enter fb username here//it was testfb earlier
      
      category=JSON.stringify(category+"]");
      category=JSON.stringify(cat_list);
      console.log(category);
     
      $.ajax({
                                type: "POST",       // the dNodeNameefault
                                url: "SignUpReg",
                                data: {handle:handle,name:name,email:email,country:country,state:state,city:city,zip:zip,religion:religion,sex:sex,dob:dob,phone:phone,category:category,profile_pic:profile_pic , fb:fb},
                                success: function(data){alert(data);
                                       if(red_url!=="" && red_url.indexOf("red_url")!==-1)
                                                {

                                                    var tmp=red_url.split("=");
                                                   window.location.assign(tmp[1]);
                                                }
                                            else
                                                {
                                                    window.location.assign("dashboard");
                                                }
                                }
                        });
  }
  
</script>
        <style>
             #accordion-resizer {
    padding: 10px;
    width: 150px;
    height: 120px;
  }
        </style>
        
    </head>

    <body>
        <div style="float:left; width:70%; background-color: #222222">
            <br><br><br><br><br><br><br><br><br>
        </div>   

        <div style="float:right; width:30%;"><div id="imgbut">
<img src="pages/resources/img/fbconnect.png" style="cursor:pointer; width:50px;" onclick="Login()"/>
<br/>
</div>

<div id="SignUp">
    <div id="signUpForm">
             <h2>Register!</h2>
            <table>
                <tr>
                    <td>Profile <input type="hidden" id="profile_pic" name="profile_pic"/></td></td>
                    <td id="dp"></td>
                </tr>
                <tr>
                    <td>Handle @:</td>
                    <td><input type="text" id="handle" name="handle" required/></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" id="name" name="name" required/></td>
                </tr>
                
                <tr>
                    <td>E-mail</td>
                    <td><input type="text" id="email" name="email" required/></td>
                </tr>
                <tr>
                    <td>Country</td>
                    <td><input type="text" id="country" name="country" required/></td>
                </tr>
                <tr>
                    <td>State</td>
                    <td><input type="text" id="state" name="state"/></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><input type="text" id="city" name="city"/></td>
                </tr>
                <tr>
                    <td>Zip</td>
                    <td><input type="text" id="zip" name="zip"/></td>
                </tr>
              
                <tr>
                    <td>Sex</td>
                    <td> 
                        <input type="radio"  name="sex" value="M" checked/>Male
                        <input type="radio"  name="sex" value="F"/>Female
                    </td>
                </tr>
                <tr>
                    <td>Date Of Birth</td>
                    <td></td><td></td><td></td><td></td>
                    <td><input type="text" id="dob" name="dob"/></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="text" id="phone" name="phone"/></td>
                </tr>
             
            </table>
                <div id="accordion">
    
                </div>
             <button onclick="validate()">Register</button>
            </div>
</div>
        <!--<form action="login" method="post">
            User id <input type="text" name="username"><br>
            password <input type="password" name="password">
            <input type="submit"/>
        </form>-->
        
       
        </div>
    </body>
</html>
