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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Pham Toan
 */
public class UpdateProductController extends HttpServlet {

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

        if (service.equals("sendUpdateDetail")) {

            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            Category category = ((new CategoryDAO()).getCategoryById(Integer.parseInt(req.getParameter("category"))));
            String image_url = req.getParameter("image_url");
            int price = Integer.parseInt(req.getParameter("price"));
            Date create_at = java.sql.Date.valueOf(LocalDate.parse(req.getParameter("create_at"), DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            String description = req.getParameter("description");
            
            Product product = (new ProductDAO()).getProductsById(id);
            
            
            product.setProduct_name(name);
            product.setCategory(category);
            product.setImage(image_url);
            product.setPrice(price);
            product.setCreate_at(create_at);
            product.setDescription(description);
            

            //set new value for product
            (new ProductDAO()).updateProduct(product, id);
            req.setAttribute("UpdateDone", "Update information for Product (ID = " + id + ") done!\nClick Product Management to see all changes");
            req.getRequestDispatcher("view/dashboard/admin/UpdateProduct.jsp").forward(req, resp);
        }
    }

}
