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
        String service = req.getParameter("service");

        if (service == null) {
            service = "listAll";
        }

        if (service.equals("listAll")) {
            List<Category> listCategory = (new CategoryDAO().findAll());
            req.setAttribute("listAllCategory", listCategory);
            req.getRequestDispatcher("view/dashboard/admin/categoryManagement.jsp").forward(req, resp);
        }

        if (service.equals("sendRequestInsert")) {
            req.setAttribute("insertCategory", "insertCategory");
            req.getRequestDispatcher("view/dashboard/admin/categoryManagement.jsp").forward(req, resp);
        }

        if (service.equals("sendInsertDetail")) {
            String name = req.getParameter("name");

            // Validation
            String errorMessage = null;
            if (name == null || name.trim().isEmpty()) {
                errorMessage = "Tên danh mục không được để trống hoặc chỉ có khoảng trắng";
            }

            if (errorMessage != null) {
                req.setAttribute("errorMessage", errorMessage);
                req.setAttribute("insertCategory", "insertCategory");
                req.getRequestDispatcher("view/dashboard/admin/categoryManagement.jsp").forward(req, resp);
                return;
            }

            Category category = new Category(name);
            int generatedCategoryId = (new CategoryDAO().insertCategory(category));
            req.setAttribute("InsertDone", "Insert Category (ID =" + generatedCategoryId + ") successfully!\n click Category Management to see all changes");
            req.getRequestDispatcher("view/dashboard/admin/categoryManagement.jsp").forward(req, resp);
        }

        if (service.equals("sendRequestUpdate")) {
            int categoryId = Integer.parseInt(req.getParameter("categoryId"));
            Category category = (new CategoryDAO().getCategoryById(categoryId));
            req.setAttribute("categoryUpdate", category);
            req.getRequestDispatcher("view/dashboard/admin/categoryManagement.jsp").forward(req, resp);
        }

        if (service.equals("sendUpdateDetail")) {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            Category category = (new CategoryDAO().getCategoryById(id));
            category.setCategory_name(name);
            (new CategoryDAO()).updateCategory(category, id);
            req.setAttribute("UpdateDone", "Update information for Category (ID = " + id + ") done!\nClick Category Management to see all changes");
            req.getRequestDispatcher("view/dashboard/admin/categoryManagement.jsp").forward(req, resp);
        }

        if (service.equals("sendRequestDelete")) {
            int categoryId = Integer.parseInt(req.getParameter("categoryId"));
            int n = (new CategoryDAO().deleteCategory(categoryId));
            if (n == 1) {
                req.setAttribute("deleteDone", "Delete Category (Id = " + categoryId + ") done!");
            } else {
                req.setAttribute("deleteDone", "Failed to delete Category (Id  = " + categoryId + ") because this Category is asociated with an order.");
            }
        }

        List<Category> listCategory = (new CategoryDAO().findAll());
        req.setAttribute("listAllcategory", listCategory);
        req.getRequestDispatcher("view/dashboard/admin/categoryManagement.jsp").forward(req, resp);

    }

}
