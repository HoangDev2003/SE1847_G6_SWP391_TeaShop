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

        if (service.equals("searchByPriceRange")) {
            String priceFromStr = req.getParameter("priceFrom");
            String priceToStr = req.getParameter("priceTo");

            String errorMessage = null;

            // Validate priceFrom and priceTo
            if (priceFromStr == null || !priceFromStr.matches("\\d+") || priceFromStr.startsWith("0")) {
                errorMessage = "Giá sản phẩm phải là số nguyên dương và không được bắt đầu từ số 0.";
            } else if (priceToStr == null || !priceToStr.matches("\\d+") || priceToStr.startsWith("0")) {
                errorMessage = "Giá sản phẩm phải là số nguyên dương và không được bắt đầu từ số 0.";
            } else {
                int priceFrom = Integer.parseInt(priceFromStr);
                int priceTo = Integer.parseInt(priceToStr);

                if (priceFrom >= priceTo) {
                    errorMessage = "Khoảng giá bắt đầu phải nhỏ hơn giá lớn nhất muốn lọc.";
                } else {
                    List<Product> products = (new ProductDAO()).getProductByPriceRange(priceFrom, priceTo);

                    if (products == null || products.isEmpty()) {
                        req.setAttribute("notFoundProduct", "Không có sản phẩm nào trong khoảng giá");
                        products = (new ProductDAO()).findAll();
                    }

                    req.setAttribute("listAllProduct", products);
                    req.setAttribute("priceFrom", priceFrom);
                    req.setAttribute("priceTo", priceTo);
                    req.setAttribute("showSearchProduct", "Yes");
                    req.getRequestDispatcher("view/dashboard/admin/productManagement.jsp").forward(req, resp);
                    return;
                }
            }

            // If validation failed, set error message and forward to JSP
            req.setAttribute("errorMessage", errorMessage);
            req.setAttribute("listAllProduct", (new ProductDAO()).findAll()); // or use existing list if applicable
            req.setAttribute("showSearchProduct", "Yes");
            req.getRequestDispatcher("view/dashboard/admin/productManagement.jsp").forward(req, resp);
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
}
