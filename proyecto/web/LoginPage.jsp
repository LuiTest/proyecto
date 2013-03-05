<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
        <title>Login Page</title> </head>
    <script type="text/javascript" src="JavaScript/jquery-1.8.2.js" ></script>
    <script type="text/javascript" src="JavaScript/jquery-ui-1.9.1.custom.js" ></script> 
    <link rel="stylesheet" type="text/css" href="Css/jquery-ui-1.9.1.custom.css" />
    <body id="imagenLogin" class="index" style="background-repeat: repeat">
        <form name="actionForm" action="LoginServlet" method ="GET">      
            <center>
                <h3 class="ui-state-default ui-corner-all">Main Menu</h3><br><br>
                <h4>Username</h4><input type="text" name="uname" class="ui-corner-all"/>
                <h4>Password</h4><input type="password" name="password" class="ui-corner-all"/><br><br>
                <input type="submit" class="ui-button ui-button-text-only ui-state-default ui-corner-all" value="Login">    
            </center>
        </form>
    </body>
</html>