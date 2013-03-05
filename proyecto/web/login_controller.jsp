<%@page import="Negocio.Administrator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String userN = request.getParameter("userName");
            String passW = request.getParameter("passWord");

            Administrator gestor = new Administrator();

            boolean state = gestor.login(userN, passW);

            if (state) {
                response.sendRedirect("menu.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }

        %>
    </body>
</html>
