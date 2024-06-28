/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import entity.Category;
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
public class CategoryManagerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String service = req.getParameter("Service");

        if (service == null) {
            service = "listAllCategory";
        }

        if (service.equals("listAllCategory")) {
            List<Category> listCategory = (new CategoryDAO().findAll());
            req.setAttribute("listAllcategory", listCategory);
            req.getRequestDispatcher("view/dashboard/admin/categoryManagement.jsp").forward(req, resp);
        }

        if (service.equals("insertCategory")) {
            List<Category> listCategory = (new CategoryDAO().findAll());
            req.setAttribute("listAllcategory", listCategory);
            req.getRequestDispatcher("view/dashboard/admin/categoryManagement.jsp").forward(req, resp);
        }

        if (service.equals("sendRequestInsert")) {
            String name = req.getParameter("name");

            Category category = new Category(name);
            int generatedCategoryId = (new CategoryDAO().insertCategory(category));
            req.setAttribute("InsertDone", "Insert Category (ID =" + generatedCategoryId + ") successfully!\n click Category Management to see all changes");
            req.getRequestDispatcher("view/dashboard/admin/categoryManagement.jsp").forward(req, resp);
        }

    }

}
