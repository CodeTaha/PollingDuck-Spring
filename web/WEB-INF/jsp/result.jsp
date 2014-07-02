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
            console.log(poll);// use poll to get all the qtns,answers, title etc which defines the poll
            console.log(result);// use result which is the compilation of all the answers users have submitted
            
            // using the above parameteres
            
            console.log("Displays title of poll");
            console.log(poll['title']);
            
            console.log("Displays qtn 1 and qtn type of poll");
            console.log(poll['qtn_json'][0]['qtn']);
            console.log(poll['qtn_json'][0]['qtn_type']);
            
            console.log("Displays options 1 and 4 of qtn 1 from poll");
            console.log(poll['qtn_json'][0]['rows'][0]);
            console.log(poll['qtn_json'][0]['rows'][3]);
            
            console.log("Displays all parameteres a user has entered from result");
            console.log(result[0]);
            
            console.log(result[0]['qtn'][0]['ans']);
            
        </script>
    </head>
    <body>
        <h1>Poll Result!</h1>
        
    </body>
</html>
