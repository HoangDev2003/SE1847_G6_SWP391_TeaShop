/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.ManageSlider;

import dal.SliderDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;



@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 50,      // 50MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class addSlider extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
//        request.getRequestDispatcher("./view/dashboard/admin/AddSlider.jsp").forward(request, response);
        // Retrieves form data
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String url = request.getParameter("url");
        String status = request.getParameter("status");
        
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
        SliderDAO sd = new SliderDAO();
        sd.insertSlider(name, description, url, fileName, status);
        
        request.setAttribute("updateMessage", "Add Successfully!");
        // Redirects to the management page
        //response.sendRedirect("manageSlider");  
        request.getRequestDispatcher("AddSlider.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
        File folderUpload = new File("F:\\Swp\\git clone\\SE1847_G6_SWP391_TeaShop\\TeaShop\\web\\img");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
