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
@MultipartConfig
public class UpdateProductController extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String service = req.getParameter("service");
        //Send list Category and RequestUpdate
        if (service == null) {
            service = "requestUpdate";
        }
        if (service.equals("requestUpdate")) {
            List<Category> listCategorys = (new CategoryDAO().findAll());
            int productId = Integer.parseInt(req.getParameter("productId"));
            Product product = (new ProductDAO()).getProductsById(productId);
            req.setAttribute("allCategorys", listCategorys);
            req.setAttribute("productUpdate", product);
            req.getRequestDispatcher("view/dashboard/admin/UpdateProduct.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String service = req.getParameter("service");
        //Send list Category and RequestUpdate
        if (service == null) {
            service = "sendUpdateDetail";
        }
        if (service.equals("sendUpdateDetail")) {
            List<Category> listCategorys = (new CategoryDAO().findAll());
            int id = Integer.parseInt(req.getParameter("id"));
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

            Product product = (new ProductDAO()).getProductsById(id);

            product.setProduct_name(name);
            product.setCategory(category);
            product.setImage(image_url);
            product.setPrice(price);
            product.setCreate_at(create_at);
            product.setDescription(description);

            //set new value for product
            (new ProductDAO()).updateProduct(product, id);
            req.setAttribute("allCategorys", listCategorys);
            req.setAttribute("UpdateDone", "Update information for Product (ID = " + id + ") done!\nClick Product Management to see all changes");
            req.getRequestDispatcher("view/dashboard/admin/UpdateProduct.jsp").forward(req, resp);
        }
    }

}
