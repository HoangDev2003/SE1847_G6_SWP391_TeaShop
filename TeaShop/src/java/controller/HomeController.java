/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.BlogDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import dal.SliderDAO;
import entity.Blog;
import entity.Category;
import entity.Product;
import entity.Slider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 *
 * @author ADMIN
 */
public class HomeController extends HttpServlet {
   
    ProductDAO productDAO = new ProductDAO();
    BlogDAO bd = new BlogDAO();
    SliderDAO sl= new SliderDAO();
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        List<Product> listSpecialProduct = productDAO.specialProduct();
        List<Blog> topBog = bd.getTop3Newest();
        List<Slider> listSlide= sl.getAll();
        
        HttpSession session = request.getSession();
        session.setAttribute("listSpecialProduct", listSpecialProduct);
        session.setAttribute("topBog", topBog);
        request.setAttribute("listslider", listSlide);
       request.getRequestDispatcher("view/homepage/home.jsp").forward(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
