<%-- 
    Document   : SignUp
    Created on : Jul 1, 2014, 11:13:27 AM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link href="pages/resources/select2/select2.css" rel="stylesheet"/>
        <link rel="stylesheet" href="pages/resources/css/jquery-ui-timepicker-addon.css" >
        
        <script src="pages/resources/js/jquery.min.js"></script>
        <script src="pages/resources/select2/select2.js"></script>
        <script type="text/javascript" src="pages/resources/js/jquery-ui.js"></script>
        <script type="text/javascript" src="pages/resources/js/jquery-ui-timepicker-addon.js"></script>
        
        <script>
            var cat_json=${cat_list};
            var cat_list=new Array();
            
            $(document).ready(function(){
                $("#dob").datepicker({
           //showSecond: true,
           //timeFormat: 'hh:mm:ss',
           dateFormat:"dd-mm-yy" 
                   });
   for(var i=0; i<cat_json.length; i++)
   {
       cat_list.push({id:cat_json[i]['cid'], text:cat_json[i]['category_name']});
       $("#category").append("<option value="+cat_json[i]['cid']+">"+cat_json[i]['category_name']+"</option>");
   }
    $("#category").select2({
       // multiple: true,
  placeholder:"Select The Categories you are interested in",
  maximumSelectionSize:20
  //allowClear: true,
  //tags: cat_list//[{id: 0, text: 'story'},{id: 1, text: 'bug'},{id: 2, text: 'task'}]
});

  });
  
  function validate()
  {
      var handle=$("#handle").val();
      var email=$("#email").val();
      var country=$("#country").val();
      var state=$("#state").val();
      var city=$("#city").val();
      var zip=$("#zip").val();
      var religion=$("#religion").val();
      var sex=$('input[name=sex]:checked').val();
      var dob=$("#dob").val();
      var phone=$("#phone").val();
      var category=$("#category").val();
      category=JSON.stringify(category);
      $.ajax({
                                type: "POST",       // the dNodeNameefault
                                url: "SignUpReg",
                                data: {handle:handle,email:email,country:country,state:state,city:city,zip:zip,religion:religion,sex:sex,dob:dob,phone:phone,category:category },
                                success: function(data){alert(data);
                                        if(data)
                                        {
                                           
                                        }
                                }
                        });
  }
        </script>
    </head>
    <body>
        <h1>Sign Up!</h1>
        
            <table>
                <tr>
                    <td>Handle</td>
                    <td><input type="text" id="handle" name="handle"/></td>
                </tr>
                <tr>
                    <td>Categories</td>
                    <td><select id="category" multiple="multiple" style="width:300px;" tabindex="-1" class="select2-offscreen"></select></td>
                </tr>
                <tr>
                    <td>E-mail</td>
                    <td><input type="text" id="email" name="email"/></td>
                </tr>
                <tr>
                    <td>Country</td>
                    <td><input type="text" id="country" name="country"/></td>
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
                    <td>Religion</td>
                    <td><input type="text" id="religion" name="religion"/></td>
                </tr>
                <tr>
                    <td>Sex</td>
                    <td> 
                        <input type="radio"  name="sex" value="M" checked/>Male
                        <input type="radio"  name="sex" value="F"/>Female
                        <input type="radio"  name="sex" value="T"/>Transgender
                        <input type="radio"  name="sex" value="O"/>I do not want to mention
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
                <tr>
                    <td></td>
                    <td>
                        <button onclick="validate()">Register</button>
                    </td>
                </tr>
            </table>
        
    </body>
</html>
