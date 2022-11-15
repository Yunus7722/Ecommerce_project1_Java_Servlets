
package com.practice.servlets;

import com.practice.dao.UserDao;
import com.practice.entities.User;
import com.practice.helper.factoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    
    public static byte[] getSHA(String input) throws NoSuchAlgorithmException
    {
        // Static getInstance method is called with hashing SHA
        MessageDigest md = MessageDigest.getInstance("SHA-256");
 
        // digest() method called
        // to calculate message digest of an input
        // and return array of byte
        return md.digest(input.getBytes(StandardCharsets.UTF_8));
    }
     
    public static String toHexString(byte[] hash)
    {
        // Convert byte array into signum representation
        BigInteger number = new BigInteger(1, hash);
 
        // Convert message digest into hex value
        StringBuilder hexString = new StringBuilder(number.toString(16));
 
        // Pad with leading zeros
        while (hexString.length() < 64)
        {
            hexString.insert(0, '0');
        }
 
        return hexString.toString();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try ( PrintWriter out = response.getWriter()) {
            try {
               String email = request.getParameter("email");
               String pass = request.getParameter("password");
               String password =toHexString(getSHA(pass));
               
              UserDao userdao = new UserDao(factoryProvider.getFactory());
              User user = userdao.getUserByEmailAndPassword(email, password); //getting the user here --> if user is there it will return all the user values if not present it will return null value
              
                HttpSession session = request.getSession();
              if(user==null)
              {
                  session.setAttribute("l_message", "Invalid details !! ");
                  response.sendRedirect("login.jsp");
              }
              else
              {
                  //login
                  session.setAttribute("current-user", user);
                  
                  if(user.getUserType().equalsIgnoreCase("admin"))
                  {
                      //admin user
                      response.sendRedirect("admin.jsp");
                  }else if(user.getUserType().equalsIgnoreCase("normal"))
                  {
                      //normal user
                      response.sendRedirect("normal.jsp");
                  }else
                  {
                      out.println("<h1>The User type is not made yet</h1>");
                  }
                  
              }
                 
            } catch (Exception e) {
                e.printStackTrace();
            }
           
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
