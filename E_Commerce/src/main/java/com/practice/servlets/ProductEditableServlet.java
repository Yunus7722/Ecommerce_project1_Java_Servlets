package com.practice.servlets;

import com.practice.dao.CategoryDao;
import com.practice.dao.ProductDao;
import com.practice.entities.Category;
import com.practice.entities.Product;
import com.practice.helper.factoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "ProductEditableServlet", urlPatterns = {"/ProductEditableServlet"})
public class ProductEditableServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            // I am adding both category and products into 1 Servlet (current)
            // as i am creating one hidden input in admin page see it wher i am passing that values here and applying some condition and using depending on the situation
            String op = request.getParameter("operation");
//            String op2 = request.getParameter("operation");
            if (op.trim().equalsIgnoreCase("deleteProduct")) {

                try {
//                    out.println("delete");
                    Product pro = new Product();
                    String pId = request.getParameter("productIdToDelete");
                    int FinalpId = Integer.parseInt(pId);
                    ProductDao proDao = new ProductDao(factoryProvider.getFactory());
                    int deletedpId = proDao.deleteProduct(pro, FinalpId);
                    if (deletedpId != 0) {
//                        out.println("Product Deleted Succesfully");
                          HttpSession session = request.getSession();
                    session.setAttribute("D_message", "Product Deleted Successfully...");
                    response.sendRedirect("login.jsp");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
             

            } else if (op.trim().equalsIgnoreCase("editProduct")) {

                out.println("Edit");
//                //add products 
//
//                String pName = request.getParameter("pName");
//                String pDescription = request.getParameter("pDescription");
//                int catId = Integer.parseInt(request.getParameter("catId"));
//                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
//                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
//                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
//                int pRatings = Integer.parseInt(request.getParameter("pRatings"));
//                Part part = request.getPart("pPic");
//
//                Product p = new Product();
//                p.setpName(pName);
//                p.setpDesc(pDescription);
//                p.setpPrice(pPrice);
//                p.setpDiscount(pDiscount);
//                p.setpQuantity(pQuantity);
//                p.setpRatings(pRatings);
//                p.setpPhoto(part.getSubmittedFileName());
//
//                // we are creating a method in dao for getting category by Id
//                CategoryDao cDao = new CategoryDao(factoryProvider.getFactory());
//                Category category = cDao.getCategoryById(catId);
//                p.setCategory(category);
//
//                // Saving the Products
//                ProductDao pDao = new ProductDao(factoryProvider.getFactory());
//                pDao.saveProduct(p);
//
//                /* //**** note - the commented code was from actual source but not working
//                                    as image is sving in folder but it is being corrupted if u follow
//                                    these method (just for reference for further implementation)
//                
//                try {
//                      String path =request.getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName() ;
//               // System.out.println(path);
//                
//                // Uploading Code (we can also make a function and utilize it but we are not doing it as we are writing directly)
//                FileOutputStream fos = new FileOutputStream(path);
//                InputStream is = part.getInputStream();
//                
//                // reading the data
//                byte [] data = new byte[is.available()];
//                is.read();
//                
//                // writing the data
//                fos.write(data);
//                
//                fos.close();
//                //is.close();
//             
//                
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//                 */
//                
//                
//// uploading the photo (photo is saved in the folder and it is not saved in the databases but the name is been saved in the database)
//                //First finding out the path where the image is storing 
//               // alternative from stack overflow link : https://stackoverflow.com/questions/41399525/i-have-stored-image-to-inputstream-from-html-so-i-want-to-store-the-inputstream
//                   //which is working fine
//                //start
//                
//                // however it was stated that if u clean and build the code the images stored in the deploying target folder wil be deleted hence ignore rebuilding
//                OutputStream os = null;
//                InputStream filecontent = null;
//                String path =request.getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName() ;
//
//                try {
//                    os = new FileOutputStream(new File(path));
//                    filecontent = part.getInputStream();
//
//                    int read = 0;
//                    final byte[] bytes = new byte[filecontent.available()];
//
//                    while ((read = filecontent.read(bytes)) != -1) {
//                        os.write(bytes, 0, read);
//                    }
//                } catch (FileNotFoundException f) {
//
//                } finally {
//                    if (os != null) {
//                        os.close();
//                    }
//                }
//                //end
//
//                HttpSession session = request.getSession();
//                session.setAttribute("s_message", "Product Created Successfully.....");
//                response.sendRedirect("admin.jsp");

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
