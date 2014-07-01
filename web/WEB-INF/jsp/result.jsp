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
        <title>JSP Page</title>
        <script>
            var poll=${poll};// Poll Object
            var result=${result};// Result of the poll
            console.log("Poll_Ans_Tbl");
            console.log(poll);
            console.log(result);
            var expJson=new Array();
            var temp=new Array();
            temp['cid']=1;
            temp['exp']=10;
            expJson.push(temp);
            temp['cid']=2;
            temp['exp']=20;
            expJson.push(temp);
            temp['cid']=3;
            temp['exp']=30;
            expJson.push(temp);
            console.log(expJson);
            
            
        </script>
    </head>
    <body>
        <h1>Poll Result!</h1>
        
    </body>
</html>
