<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to PollingDuck project</title>
    </head>

    <body>
        <form action="login" method="post">
            Login id <input type="text" name="username"><br>
            password <input type="password" name="password">
            <input type="submit"/>
        </form>
        <ul>
            <li>
                <a href="createPoll">Create</a>
            </li>
            <li>
                <a href="viewPolls">View</a>
            </li>
        </ul>
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
