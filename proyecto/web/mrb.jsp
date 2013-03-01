
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Negocio.Administrator"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MRB Table</title>
    </head>
    
    <script type="text/javascript" src="JavaScript/jquery-1.8.2.js" ></script>
    <script type="text/javascript" src="JavaScript/jquery-ui-1.9.1.custom.js" ></script> 
    <link rel="stylesheet" type="text/css" href="Css/jquery-ui-1.9.1.custom.css" />
    
    <script type="text/javascript" >
        
    $(document).ready(function(){
     
    $("#myTable").css("position","relative"); 
    $("#myTable").css("left","300px"); 
     
    }); //end
         
    </script>
    
    <% 
    Administrator gestor = new Administrator();
    gestor.conectar();
    String matrix[][] = gestor.desplegarMatriz();

    String field = "";
    %>
   
    
    <body id="imagenLogin" class="index" style="background-repeat: repeat">
 
 
    <div id="myDiv2" style="display:none">test</div>
    
    
<%
                            if (matrix != null) {
       %>
       <table id="myTable" border="1" class="ui-widget">
       <tr>
                    <%
                                                    for (int i = 0; i < matrix[0].length; i++) {                                                        
                    %>
                    <th class="ui-widget-header"><%=matrix[0][i]%></th>
                    <%
                                                    }
                    %>
                </tr>
                <tr>
                    <%
        for (int i = 1; i < matrix.length; i++) {
         for(int j = 0; j < matrix[i].length; j++)
         {
          %>
          <td><%=matrix[i][j]%></td>
          <%
         }
         %>
         </tr>
         <%
        }
                    %>
    </table>
                <%
                                }
    %>
               

    </body>
</html>