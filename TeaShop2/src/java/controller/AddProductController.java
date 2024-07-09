/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import entity.Category;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 *
 * @author Pham Toan
 */
@MultipartConfig // Thêm chú thích này để hỗ trợ xử lý đa phần
public class AddProductController extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String service = req.getParameter("service");

        //Send List Category
        if (service == null) {
            service = "requestInsert";
        }

        if (service.equals("requestInsert")) {
            List<Category> listCategorys = (new CategoryDAO().findAll());
            req.setAttribute("allCategorys", listCategorys);
            req.setAttribute("insertProduct", "insertProduct");
            req.getRequestDispatcher("view/dashboard/admin/InsertProduct.jsp").forward(req, resp);
        }
        

        //Send Information Product
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String service = req.getParameter("service");
        
        if (service == null) {
            service = "sendInsertDetail";
        }
        
        if (service.equals("sendInsertDetail")) {
            List<Category> listCategorys = (new CategoryDAO().findAll());
            
            String name = req.getParameter("name");
            Category category = ((new CategoryDAO()).getCategoryById(Integer.parseInt(req.getParameter("category"))));
            int price = Integer.parseInt(req.getParameter("price"));
            Date create_at = java.sql.Date.valueOf(LocalDate.parse(req.getParameter("create_at"), DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            String description = req.getParameter("description");
            Part filePart = req.getPart("image_url");
            
            
            // Handle file upload
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String filePath = uploadPath + File.separator + fileName;
            Files.copy(filePart.getInputStream(), Paths.get(filePath));

            // Construct the URL for the uploaded image
            String image_url = UPLOAD_DIR + "/" + fileName;

            
            Product product = new Product(name, category, image_url, price, create_at, description);
            int gerenatedProductId = (new ProductDAO()).insertProduct(product);

            req.setAttribute("allCategorys", listCategorys);
            req.setAttribute("InsertDone", "Insert a new Product (ID = " + gerenatedProductId + ") successfully!\nClick Product Management to see all changes");
            req.getRequestDispatcher("view/dashboard/admin/InsertProduct.jsp").forward(req, resp);
        }
    }
}
