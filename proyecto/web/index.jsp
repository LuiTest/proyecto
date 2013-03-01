
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login MRB hola</title>
    </head>
    
    <script type="text/javascript" src="JavaScript/jquery-1.8.2.js" ></script>
    <script type="text/javascript" src="JavaScript/jquery-ui-1.9.1.custom.js" ></script> 
    <link rel="stylesheet" type="text/css" href="Css/jquery-ui-1.9.1.custom.css" />
    
     
    <script type="text/javascript" >
        
    $(document).ready(function(){
        
        /*$("#myDiv").show('slow');
        $("#myDiv").show(500);    
        $("#myDiv").css("color","Red"); */
        
            $("#myButton").click(function(){               
            $("#myDiv2").dialog('open');
            return false;          
            });// button click
        
      
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
    
    

    
    <body id="imagenLogin" class="index" style="background-repeat: repeat">


        <form id="myForm" method="post" >

  
    <center>
  
    <div id="myDiv2" style="display:none;">Esta seguro de validar estos datos?</div>
    
    <div id="myDiv3" style="display:none;"></div>
     
         
         <br><br><br><br><br><br><br><br>
         
         Usuario <input type="text"/>
         
         Password <input type="password"/>
         
       <br><br>
       
        <button id="myButton" class="ui-button ui-button-text-only ui-widget ui-state-default ui-corner-all">Submit</button>
       
       
      </center>
        
    
     </form>

      
    </body>
</html>