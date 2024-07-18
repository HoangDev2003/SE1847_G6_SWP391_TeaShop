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
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Pham Toan
 */
public class SaleManagerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String service = req.getParameter("service");
        req.setAttribute("saleManager", "Yes");
        if (service == null) {
            service = "listAll";
        }

        if (service.equals("listAll")) {
            ProductDAO productDAO = new ProductDAO();
            List<Product> listAllProduct = productDAO.findAll();
            req.setAttribute("listAllProduct", listAllProduct);
            req.setAttribute("showSearchProduct", "Yes");
            req.getRequestDispatcher("view/dashboard/admin/SaleManager.jsp").forward(req, resp);
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
            req.getRequestDispatcher("view/dashboard/admin/SaleManager.jsp").forward(req, resp);
        }
        
        if (service.equals("searchByPriceRange")) {
            int priceFrom = Integer.parseInt(req.getParameter("priceFrom"));
            int priceTo = Integer.parseInt(req.getParameter("priceTo"));

            List<Product> products = (new ProductDAO()).getProductByPriceRange(priceFrom, priceTo);

            if (products == null || products.isEmpty()) {
                req.setAttribute("notFoundProduct", "No products found in the given price range");
                products = (new ProductDAO()).findAll();
            }

            req.setAttribute("listAllProduct", products);
            req.setAttribute("priceFrom", priceFrom);
            req.setAttribute("priceTo", priceTo);
            req.setAttribute("showSearchProduct", "Yes");
            req.getRequestDispatcher("view/dashboard/admin/SaleManager.jsp").forward(req, resp);
        }

        if (service.equals("requestUpdate")) {
            List<Category> listCategorys = (new CategoryDAO().findAll());
            int productId = Integer.parseInt(req.getParameter("productId"));
            Product product = (new ProductDAO()).getProductsById(productId);
            req.setAttribute("allCategorys", listCategorys);
            req.setAttribute("productUpdate", product);
            req.getRequestDispatcher("view/dashboard/admin/SaleManager.jsp").forward(req, resp);
        }
        if (service.equals("sendUpdateDetail")) {
            int id = Integer.parseInt(req.getParameter("id"));
            float discount = Float.parseFloat(req.getParameter("discount"));
            Product product = (new ProductDAO()).getProductsById(id);

            product.setDiscount(discount);

            //set new value for product
            (new ProductDAO()).updateProduct(product, id);
            req.setAttribute("UpdateDone", "Update discount for Product (ID = " + id + ") done!\nClick Sale Management to see all changes");
            req.getRequestDispatcher("view/dashboard/admin/SaleManager.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}
