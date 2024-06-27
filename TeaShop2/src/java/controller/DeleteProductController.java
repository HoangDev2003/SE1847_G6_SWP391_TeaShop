/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.ProductDAO;
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
public class DeleteProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String service = req.getParameter("service");
        if (service == null) {
            service = "requestDelete";
        }
        if (service.equals("requestDelete")) {
            String productId_raw = req.getParameter("productId");
            int productId = Integer.parseInt(productId_raw);

            int n = (new ProductDAO()).deleteProduct(productId);
            if (n == 1) {
                req.setAttribute("deleteDone", "Delete Product (Id = " + productId + ") done!\nClick Product Management to see all changes");
            } else {
                req.setAttribute("deleteDone", "Failed to delete Product (Id  = " + productId + ") because this product is asociated with an order.");
            }
            List<Product> products = (new ProductDAO()).findAll();
            
            req.setAttribute("allProducts", products);
            req.getRequestDispatcher("view/dashboard/admin/productManagement.jsp").forward(req, resp);
        }

    }
}
