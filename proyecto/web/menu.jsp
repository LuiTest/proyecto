<jsp:useBean id="user" class="beans.LoginBean" scope="session"/>
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
    
    <style type="text/css">
input
{
    text-align: center;
}
</style> 

    <script type="text/javascript" >
        
    $(document).ready(function(){
  
            $("#myButton").click(function(){   
               
               TagNumber = $('input#TagNumber').val();
               DatePicker = $('input#DatePicker').val();
               Shift = $('#Shift option:selected').val();
               NumberOperation = $('#NumberOperation option:selected').val();
               LotNumber = $('input#LotNumber').val();
               Quantity = $('input#Quantity').val();
               DollarsPerPiece = $('input#DollarsPerPiece').val();
               Modelo = $('#Modelo option:selected').val();
               WhoTagged = $('input#WhoTagged').val();
               DiscCode = $('input#DiscCode').val();
               DatePicker2 = $('input#DatePicker2').val();
               WhoDisposition = $('input#WhoDisposition').val();
               DispositionCode = $('input#DispositionCode').val();
               NonConformingParts = $('input#NonConformingParts').val();
               QtyScrapped = $('input#QtyScrapped').val();
               DollarsScrapped = $('input#DollarsScrapped').val();
           
                $("#myTableAll tr:first").after("<tr><td>"+ TagNumber +"</td><td>"+ DatePicker +"</td><td>"+ Shift +
                "</td><td>"+ NumberOperation +"</td><td>"+ LotNumber +"</td><td>"+ Quantity +"</td><td>"+ DollarsPerPiece +
                "</td><td>"+ Modelo +"</td><td>"+ WhoTagged +"</td><td>"+ DiscCode +"</td><td>"+ DatePicker2 +"</td><td>"+ 
                WhoDisposition +"</td><td>"+ DispositionCode +"</td><td>"+ NonConformingParts +"</td><td>"+ QtyScrapped +"</td><td>"+ DollarsScrapped +"</td></tr>");
    
                $.ajax({
                     url: "menu.jsp?AJTagNumber="+TagNumber,
                    data: { 
                        AJDatePicker : DatePicker,
                        AJShift : Shift,
                        AJNumberOperation : NumberOperation,
                        AJLotNumber : LotNumber,
                        AJQuantity : Quantity,
                        AJDollarsPerPiece : DollarsPerPiece,
                        AJModelo : Modelo,
                        AJWhoTagged : WhoTagged,
                        AJDiscCode : DiscCode,
                        AJDatePicker2 : DatePicker2,
                        AJWhoDisposition : WhoDisposition,
                        AJDispositionCode : DispositionCode,
                        AJNonConformingParts : NonConformingParts,
                        AJQtyScrapped : QtyScrapped,
                        AJDollarsScrapped : DollarsScrapped
                          },
                    success: function(response) {
                    alert("La linea ha sido insertada exitosamente");
                    }
                    
                    });
                
                return false;       
            });// button click
            
            $.ajaxSetup ({  
                cache: false  
            });  
            
            $("#myButton2").click(function(){ return false;}); 
            
            $("#NumberOperation").attr('title', 'DWG00507 DWG00508');
            
            //$( "#myDiv3" ).datepicker({ altFormat: "yy-mm-dd" });            
            //$("#DatePicker").datepicker();
            $("#DatePicker").datepicker({ altFormat: "yy-mm-dd" });       
            $("#DatePicker2").datepicker({ altFormat: "yy-mm-dd" });   
         
    }); //end
    
    
    </script>
    
   
<% 
Administrator gestor = new Administrator();

String [][] matrizModelos = gestor.desplegarModelos();
int resultado = 34;

//retornar el ID del nuevo row de MRB
//Rellenar toda la informacion

String AJTagNumber = request.getParameter( "AJTagNumber" );
String AJDatePicker = request.getParameter( "AJDatePicker" );
String AJShift = request.getParameter( "AJShift" );
String AJNumberOperation = request.getParameter( "AJNumberOperation" );
String AJLotNumber = request.getParameter( "AJLotNumber" );
String AJQuantity = request.getParameter( "AJQuantity" );
String AJDollarsPerPiece = request.getParameter( "AJDollarsPerPiece" );
String AJModelo = request.getParameter( "AJModelo" );
String AJWhoTagged = request.getParameter( "AJWhoTagged" );
String AJDiscCode = request.getParameter( "AJDiscCode" );
String AJDatePicker2 = request.getParameter( "AJDatePicker2" );
String AJWhoDisposition = request.getParameter( "AJWhoDisposition" );
String AJDispositionCode = request.getParameter( "AJDispositionCode" );
String AJNonConformingParts = request.getParameter( "AJNonConformingParts" );
String AJQtyScrapped = request.getParameter( "AJQtyScrapped" );
String AJDollarsScrapped = request.getParameter( "AJDollarsScrapped" );
    
System.out.println( "Entrando a menu.jsp");
  
if(AJTagNumber == null){
//System.out.println( "Es Nulo");
}else{
resultado = gestor.insertarLinea(AJTagNumber, AJDatePicker, AJShift, AJNumberOperation, AJLotNumber, AJQuantity, AJDollarsPerPiece, AJModelo, AJWhoTagged, AJDiscCode, AJDatePicker2, AJWhoDisposition, AJDispositionCode, AJNonConformingParts, AJQtyScrapped, AJDollarsScrapped);
System.out.println("Resultado: "+resultado);
}

String field = "Modelos";
String variable = "Fill";

%>
        
    
    <body id="imagenLogin" class="index" style="background-repeat: repeat">
            
        
        <label id="User-FullName"><%= user.getFirstName()%></label>
        <label id="User-FullLastName"><%= user.getLastName()%></label>
        
        <form id="myForm" method="get" action="mrb.jsp" onsubmit="">

  
    <center>
     
         <br><br><br><br><br><br><br><br>
         
      <table id="myTable" border="1" class="ui-widget">
       <tr>   
        <th class="ui-widget-header">Tag <br> Number</th>
        <th class="ui-widget-header">Date</th>
        <th class="ui-widget-header">Shift</th>
        <th class="ui-widget-header">Number <br> Operation</th>
        <th class="ui-widget-header">Lot <br> Number</th>
        <th class="ui-widget-header">Quantity</th>
        <th class="ui-widget-header">Dollars <br> per Piece ($)</th>
        <th class="ui-widget-header">Modelo</th>
        <th class="ui-widget-header">Who <br> Tagged</th>
        <th class="ui-widget-header">Discrepancy <br> Code</th>
        <th class="ui-widget-header">Date <br> Disposition</th>
        <th class="ui-widget-header">Who <br> Disposition</th>
        <th class="ui-widget-header">Disposition <br> Code</th>
        <th class="ui-widget-header"> Non conforming <br> Parts</th>
        <th class="ui-widget-header"> Qty <br> Scrapped</th>
        <th class="ui-widget-header"> Dollars <br> Scrapped ($)</th>
      </tr>
        <tr>       
          <td><input id="TagNumber" type="text"/></td>   
          <td><input id="DatePicker"/></td>   
          <td><select id="Shift"><%for(int i = 1; i < 4; i++){%><option><%=i%></option><%}%></select></td>  
          <td><select id="NumberOperation"><%for(int i = 1; i < 19; i++){%><option><%=i%></option><%}%></select></td> 
          <td><input id="LotNumber" type="text"/></td>    
          <td><input id="Quantity" type="text"/></td>    
          <td><input id="DollarsPerPiece" type="text" value=""/></td>   
          <td><select id="Modelo"><%for(int i = 1; i < matrizModelos[0].length; i++){%><option><%=matrizModelos[0][i]%></option><%}%></select></td>   
          <td><input id="WhoTagged" type="text"/></td>   
          <td><input id="DiscCode" type="text"/></td>    
          <td><input id="DatePicker2"/></td>   
          <td><input id="WhoDisposition" type="text"/></td>   
          <td><input id="DispositionCode" type="text"/></td>    
          <td><input id="NonConformingParts" type="text"/></td>   
          <td><input id="QtyScrapped" type="text"/></td>   
          <td><input id="DollarsScrapped" type="text" value=""/></td>  
         </tr>
    </table>
     
       <br><br>
       
        <button id="myButton" type="submit" class="ui-button ui-button-text-only ui-widget ui-state-default ui-corner-all">Insertar</button>
        <button id="myButton2" type="submit" class="ui-button ui-button-text-only ui-widget ui-state-default ui-corner-all">MRB</button>
       

          
       <br><br>
          
     <table id="myTableAll" border="1" class="ui-widget">
       <tr>   
        <th class="ui-widget-header">Tag <br> Number</th>
        <th class="ui-widget-header">Date</th>
        <th class="ui-widget-header">Shift</th>
        <th class="ui-widget-header">Number <br> Operation</th>
        <th class="ui-widget-header">Lot <br> Number</th>
        <th class="ui-widget-header">Quantity</th>
        <th class="ui-widget-header">Dollars <br> per Piece ($)</th>
        <th class="ui-widget-header">Modelo</th>
        <th class="ui-widget-header">Who <br> Tagged</th>
        <th class="ui-widget-header">Discrepancy <br> Code</th>
        <th class="ui-widget-header">Date <br> Disposition</th>
        <th class="ui-widget-header">Who <br> Disposition</th>
        <th class="ui-widget-header">Disposition <br> Code</th>
        <th class="ui-widget-header"> Non conforming <br> Parts</th>
        <th class="ui-widget-header"> Qty <br> Scrapped</th>
        <th class="ui-widget-header"> Dollars <br> Scrapped ($)</th>
      </tr>
      <tr>
      
        <%
        for (int i = 0; i < 16; i++) {
        %>
        <td><%=variable%></td>
        <%
        }
        %>
       
        </tr>
      
    </table>
           </center>
    
     </form>

      
    </body>
</html>