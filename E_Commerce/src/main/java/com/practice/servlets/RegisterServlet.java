
package com.practice.servlets;


import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


import com.practice.entities.User;
import com.practice.helper.factoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;


@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    
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
            try(PrintWriter out = response.getWriter()) {
                try {
                    String userName = request.getParameter("user_name");
                    String userEmail = request.getParameter("user_email");
                    String userPass = request.getParameter("user_password"); //normal Password
                    String userPassword = toHexString(getSHA(userPass)); //SHA_256 Password conversion on these line
                    String userPhone = request.getParameter("user_phone");
                    String userAddress = request.getParameter("user_address");
                    
                    //validations
                    if(userName.isEmpty())
                    {
                        out.println("Username cannot be Empty");
                        return;
                    }
                    
                    //creating user object to store the data
                    
                   User user = new User(userName,userEmail, userPassword, userPhone,"default.jpg", userAddress,"normal");
                   Session hibernateSession = factoryProvider.getFactory().openSession();
                   Transaction tx =hibernateSession.beginTransaction();
                   int userId = (int) hibernateSession.save(user);
                      
                   tx.commit();
                   hibernateSession.close();
                   
                    HttpSession session = request.getSession();
                    session.setAttribute("D_message", "Registration Succesfull !! User Id = "+"'"+userId+"'");
                    response.sendRedirect("register.jsp");
                    return;
                   
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
