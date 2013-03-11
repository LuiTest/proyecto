package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import beans.*;
import Negocio.*;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String message = "";
            LoginBean user = new LoginBean();
            HttpSession session = request.getSession(true);
            String uname = request.getParameter("uname");
            String password = request.getParameter("password");
            if (uname.isEmpty() && password.isEmpty()) {
                message = "User name and/or password cannot be empty.";
                session.setAttribute("errorMessage", message);
            } else {
                user.setUserName(uname);
                user.setPassword(password);
                user = LoginDAO.login(user);
                if (user.isValid()) {
                    session.setAttribute("user", user);
                    response.sendRedirect("menu.jsp");
                } else {
                    message = "User name and/or password are incorrect.";
                    session.setAttribute("errorMessage", message);
                    response.sendRedirect("LoginPage.jsp");
                }
            }
        } catch (Throwable exc) {
            System.out.println(exc);
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }
}