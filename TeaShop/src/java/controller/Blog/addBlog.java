/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Blog;

import dal.BlogDAO;
import entity.Accounts;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author ADMIN
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 50,      // 50MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class addBlog extends HttpServlet {

    
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Retrieves form data
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        
        HttpSession session = request.getSession();
        
        int authorID = 1;
        
        String title = request.getParameter("title");
       
        
        String content = request.getParameter("content");

        // Retrieves the file part
        Part filePart = request.getPart("image");
        
        // Obtains the file name
        String fileName = extractFileName(filePart);
        
        // Refines the file name
        fileName = new File(fileName).getName();
        
        // Writes the file to disk
        String uploadPath = getFolderUpload().getAbsolutePath();
        filePart.write(uploadPath + File.separator + fileName);
        
        // Saves slider data to the database   
        BlogDAO bd = new BlogDAO();
        bd.addNewBlog(authorID,content,  fileName, title, categoryID);
        
        // Redirects to the management page
        request.getRequestDispatcher("addBlog.jsp").forward(request, response);
     }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {


    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
// Extracts file name from HTTP header content-disposition
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
    
    // Defines the upload directory
    public File getFolderUpload() {
        File folderUpload = new File("F:\\Swp\\Git\\SE1847_G6_SWP391_TeaShop\\TeaShop0\\web\\img");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
