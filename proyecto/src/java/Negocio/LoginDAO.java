/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

import beans.LoginBean;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class LoginDAO {

    private static String CONNECTION_STRING = "jdbc:mysql://";
    private static String URL = "localhost:3306/MRB";
    private static String USER = "root";
    private static String PASSWORD = "admin";
    private static String DRIVER = "com.mysql.jdbc.Driver";
    private Connection conn;
    static Connection currentCon = null;
    static ResultSet rs = null;

    public static LoginBean login(LoginBean bean) {
        Statement stmt = null;
        String username = bean.getUsername();
        String password = bean.getPassword();
        String searchQuery = "select * from USER where USERNAME='" + username + "' AND PASSWORD='" + password + "'";

        try {
            Class.forName(DRIVER);
            currentCon = DriverManager.getConnection(CONNECTION_STRING + URL, USER, PASSWORD);
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean userExists = rs.next();

            if (!userExists) {
                System.out.println("Username/Password entered is Incorrect or User doesnot Exists.");
                bean.setValid(false);
            } else if (userExists) {
                String firstName = rs.getString("FIRSTNAME");
                String lastName = rs.getString("LASTNAME");
                System.out.println("Welcome " + firstName);
                bean.setFirstName(firstName);
                bean.setLastName(lastName);
                bean.setValid(true);
            }

        } catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }
        return bean;
    }
}