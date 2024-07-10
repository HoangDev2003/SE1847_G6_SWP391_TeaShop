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
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author Pham Toan
 */
public class ProductManagerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String service = req.getParameter("service");
        req.setAttribute("productmanager", "Yes");
        if (service == null) {
            service = "listAll";
        }
        
        if (service.equals("listAll")) {
            ProductDAO productDAO = new ProductDAO();
            List<Product> listAllProduct = productDAO.findAll();
            req.setAttribute("listAllProduct", listAllProduct);
            req.setAttribute("showSearchProduct", "Yes");
            req.getRequestDispatcher("view/dashboard/admin/productManagement.jsp").forward(req, resp);
        }
        
        if (service.equals("searchByKeywords")) {
            String keywords = req.getParameter("keywords");

            List<Product> products = (new ProductDAO()).getProductByKeyWords(keywords);

            if (products == null || products.isEmpty()) {
                req.setAttribute("notFoundProduct", "Your keywords do not match with any Product Name");
                products = (new ProductDAO()).findAll();
            }
            
            req.setAttribute("listAllProduct", products);
            req.setAttribute("keywords", keywords);
            req.setAttribute("showSearchProduct", "Yes");
            req.getRequestDispatcher("view/dashboard/admin/productManagement.jsp").forward(req, resp);
        }

        

        

    }
}
