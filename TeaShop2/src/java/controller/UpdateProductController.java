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
import java.util.List;

/**
 *
 * @author Pham Toan
 */
public class UpdateProductController extends HttpServlet{

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

//        if (service.equals("sendUpdateDetail")) {
//
//            int id = Integer.parseInt(req.getParameter("id"));
//            String name = req.getParameter("name");
//            double price = Double.parseDouble(req.getParameter("price"));
//            int quantity = Integer.parseInt(req.getParameter("quantity"));
//            Date release_date = Date.valueOf(req.getParameter("release_date"));
//
//            Product product = (new ProductDAO()).getProductsById(id);
//
//            //set new value for product
//            product.setName(name);
//            product.setPrice(price);
//            product.setQuantity(quantity);
//            product.setRelease_date(release_date);
//
//            (new ProductDAO()).updateProduct(product, id);
//            req.setAttribute("UpdateDone", "Update information for Product (ID = " + id + ") done!\nClick Product Manager to see all changes");
//            req.getRequestDispatcher("view/dashboard/admin/UpdateProduct.jsp").forward(req, resp);
//        }
    }
    
}
