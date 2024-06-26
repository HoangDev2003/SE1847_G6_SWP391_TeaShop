/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import entity.CartDetails;
import entity.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HuyTD
 */
public class CartDetailsDAO extends DBContext {

    public List getTopping() {
        List<String> toppingList = new ArrayList();
        String sql = "select * from Topping";
        connection = getConnection();
        try {

            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String topping = rs.getString("topping_name");
                toppingList.add(topping);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close the connection, statement, and result set in the finally block to ensure they are closed even if an exception occurs
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CartDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        }
    return toppingList;
    }

    public CartDetails getInfo(int product_id) {
        CartDetails cartDetails = null;
        connection = getConnection();
        String sql = "select product_id, product_name, price, image from Product where product_id = ?";
        try {

            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, product_id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                cartDetails = new CartDetails();
                cartDetails.product = new Product();
                cartDetails.product.product_id = rs.getInt("product_id");
                cartDetails.product.product_name = rs.getString("product_name");
                cartDetails.product.price = rs.getInt("price");
                cartDetails.product.image = rs.getString("image");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close the connection, statement, and result set in the finally block to ensure they are closed even if an exception occurs
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CartDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return cartDetails;
    }

    public String[] accInfo(int orderId) {
        String[] info = new String[4];
        connection = getConnection();
        String sql = "select full_name, gender, email, phone_number from Orders o join Accounts a on o.account_id=a.account_id where order_id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, orderId);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                info[0] = rs.getString("full_name");
                info[1] = rs.getString("gender");
                info[2] = rs.getString("email");
                info[3] = rs.getString("phone_number");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return info;
    }
}
