/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import Negocio.Administrator;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author FJMCI
 */
@WebServlet(name = "TestServlet", urlPatterns = {"/TestServlet"})
public class TestServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TestServlet</title>");
            out.println("</head>");
            out.println("<script type=\"text/javascript\" src=\"JavaScript/jquery-1.8.2.js\" >");
            out.println("</script>");
            out.println("<script type=\"text/javascript\" src=\"JavaScript/jquery-ui-1.9.1.custom.js\" >");
            out.println("</script>");
            out.println("<link rel='stylesheet' href='Css/jquery-ui-1.9.1.custom.css' type='text/css' />");
            //jquery
            out.println("<script type='text/javascript'>");
            out.println("$(document).ready(function(){");
            out.println("$(\"#myButtonLogin\").click(function(){ ");
            out.println("username = $('input#userName').val();");
            out.println("password = $('input#passWord').val();");
            out.println("$.ajax({");
            out.println("type: \"POST\",");
            out.println("url: \"index.jsp?AJUsername=\"+username,");
            out.println("data: {");
            out.println("AJPassword : password");
            out.println("},");
            out.println("success: function(response) {  ");
            out.println("alert('Testing');");
            out.println("}");
            out.println("});");
            out.println("return false;");              
            out.println("});");//button click function
            out.println("});");
            out.println("</script>");
            //jquery          
            out.println("<body id=\"imagenLogin\" class=\"index\" style=\"background-repeat: repeat\" >");
            out.println("<form id=\"myForm\" method=\"post\" >");
            out.println("<center>");
            out.println("<div id=\"myDiv2\" style=\"display:none;\">Esta seguro de validar estos datos?</div>");
            out.println("<div id=\"myDiv3\" style=\"display:none;\"></div>");
            out.println("<br><br><br><br><br><br><br><br>");
            out.println("Usuario <input id=\"userName\" type=\"text\"/>");
            out.println("Password <input id=\"passWord\" type=\"password\"/>");
            out.println("<br><br>");
            out.println("<button id=\"myButtonLogin\" class=\"ui-button ui-button-text-only ui-widget ui-state-default ui-corner-all\" type=\"submit\">Submit");
            out.println("</button>");
            out.println("</center>");
            out.println("</form>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Administrator gestor = new Administrator();

        String AJUsername = request.getParameter("AJUsername");
        String AJPassword = request.getParameter("AJPassword");

        boolean state = gestor.login(AJUsername, AJPassword);
      
        if (state) {
            response.sendRedirect("menu.jsp");
            System.out.println("Usuario existe");
        } else {
            System.out.println("El Usuario y/o Contraseña Ingresados son Inválidos");
        }   
 
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
