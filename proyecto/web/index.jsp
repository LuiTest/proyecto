
<%@page import="Negocio.Administrator"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login MRB</title>
    </head>

    <script type="text/javascript" src="JavaScript/jquery-1.8.2.js" ></script>
    <script type="text/javascript" src="JavaScript/jquery-ui-1.9.1.custom.js" ></script> 
    <link rel="stylesheet" type="text/css" href="Css/jquery-ui-1.9.1.custom.css" />


    <script type="text/javascript" >
        
        $(document).ready(function(){
        
            /*$("#myDiv").show('slow');
        $("#myDiv").show(500);    
        $("#myDiv").css("color","Red"); */
        
            $("#myButtonLogin").click(function(){               
            
                username = $('input#userName').val();
                password = $('input#passWord').val();
          
                //$("#myDiv2").dialog('open');
                
                $.ajax({
                    url: "index.jsp?AJUsername="+username,
                    data: { 
                        AJPassword : password
                    },
                    success: function(response) {
                        //$("#myDiv2").dialog('open');
                        //alert("El usuario existe");
                    }
                    
                });
                
                return false;          
            });// button click
        
            $.ajaxSetup ({  
                cache: false  
            });  
      
            $("#myDiv2").dialog({
            
                height: 250,
                width: 400,
                autoOpen: false,
                modal: true,
                show: "fade",
                draggable: false,
                position: "center",
                hide: "explode",
                resizable: false,
                title:'Login Information',
             
                buttons: {
                    'Ok': function() {         
                        location.href='menu.jsp';             
                    },
                    'Cancel': function() {
                        $(this).dialog('close');        
                    }
                }
        
            }); //dialog
             
    
        }); //end
         
    </script>

    <%
        Administrator gestor = new Administrator();

        String AJUsername = request.getParameter("AJUsername");
        String AJPassword = request.getParameter("AJPassword");

        boolean state = gestor.login(AJUsername, AJPassword);
     
        if (state) {
            response.sendRedirect("menu.jsp");
        } else {
            out.write("<script>alert('El Usuario y/o Contraseña Ingresados son Inválidos')</script>");
            System.out.println( "El Usuario y/o Contraseña Ingresados son Inválidos");
        }

    %>


    <body id="imagenLogin" class="index" style="background-repeat: repeat">


        <form id="myForm" method="post" >


            <center>

                <div id="myDiv2" style="display:none;">Esta seguro de validar estos datos?</div>

                <div id="myDiv3" style="display:none;"></div>


                <br><br><br><br><br><br><br><br>

                Usuario <input id="userName" type="text"/>

                Password <input id="passWord" type="password"/>

                <br><br>

                <button id="myButtonLogin" class="ui-button ui-button-text-only ui-widget ui-state-default ui-corner-all" type="submit">Submit</button>


            </center>


        </form>


    </body>
</html>