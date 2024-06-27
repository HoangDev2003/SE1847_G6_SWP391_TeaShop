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
public class AddProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String service = req.getParameter("service");
        req.setAttribute("manageProduct", "Yes");
        //Send List Category
        
        if (service == null) {
            service = "requestInsert";
        }
        
        if (service.equals("requestInsert")) {
            CategoryDAO categoryDAO = new CategoryDAO();
            List<Category> listCategorys = (new CategoryDAO().findAll());
            req.setAttribute("allCategorys", listCategorys);
            req.setAttribute("insertProduct", "insertProduct");
            req.getRequestDispatcher("view/dashboard/admin/InsertProduct.jsp").forward(req, resp);
        } 
        
        //Send Information Product
        if (service.equals("sendInsertDetail")) {
            String name = req.getParameter("name");
            Category category = ((new CategoryDAO()).getCategoryById(Integer.parseInt(req.getParameter("category"))));
            String image_url = req.getParameter("image_url");  
            int price = Integer.parseInt(req.getParameter("price"));
            Date create_at = java.sql.Date.valueOf(LocalDate.parse(req.getParameter("create_at"), DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            String description = req.getParameter("description");
                               
            Product product = new Product(name, category, image_url, price, create_at, description);

            int gerenatedProductId = (new ProductDAO()).insertProduct(product);
            req.setAttribute("InsertDone", "Insert a new Product (ID = " + gerenatedProductId + ")\nClick Product Management to see all changes");
            req.getRequestDispatcher("view/dashboard/admin/InsertProduct.jsp").forward(req, resp);
        }
    }

}
