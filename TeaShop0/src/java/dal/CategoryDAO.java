/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Category;
import entity.Product;
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author HoangNX
 */
public class CategoryDAO extends DBContext {

    public List<Category> findAll() {
        List<Category> list = new ArrayList<>();
        //ket noi duoc voi database
        connection = getConnection();
        //co cau lenh de goi xuong database
        String sql = "select * from Category";
        try {
            //Tạo đối tượng PrepareStatement
            PreparedStatement statement = connection.prepareStatement(sql);
            //thuc thi cau lenh o tren => tra ve ket qua
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();

                int Category_id = resultSet.getInt("Category_id");
                String Category_name = resultSet.getString("Category_name");

                category.setCategory_id(Category_id);
                category.setCategory_name(Category_name);
                //add to collections
                list.add(category);
            }

        } catch (SQLException ex) {
            System.out.println("Error " + ex.getMessage() + "at DBContext method: findAll");

        }
        return list;
    }

    public Category getCategoryById(int categoryId) {
        connection = getConnection();
        //co cau lenh de goi xuong database
        Category category = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "select * from [Category] where category_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
            rs = stm.executeQuery();
            while (rs.next()) {
                category = new Category();
                int category_id = rs.getInt("category_id");
                String category_name = rs.getString("category_name");
                category.setCategory_id(category_id);
                category.setCategory_name(category_name);
                return category;
            }

        } catch (SQLException ex) {
//            
        }
        return null;
    }

    public static void main(String[] args) {
        int id = 1;
        CategoryDAO categoryDAO = new CategoryDAO();
        Category category = categoryDAO.getCategoryById(id);
        System.out.println(category);
    }

}
