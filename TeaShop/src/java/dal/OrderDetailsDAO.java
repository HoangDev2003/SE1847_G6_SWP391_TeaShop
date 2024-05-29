/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import entity.OrderDetails;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HoangNX
 */
public class OrderDetailsDAO extends DBContext {

    public List<OrderDetails> findByOrderId(int orderId) {
        List<OrderDetails> orderDetailsList = new ArrayList<>();
        connection = getConnection();
        String sql = "SELECT * FROM OrderDetails WHERE order_id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, orderId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                OrderDetails orderDetails = new OrderDetails();
                orderDetails.order_details_id = rs.getInt("order_details_id");
                orderDetails.product_id = rs.getInt("product_id");
                orderDetails.order_id = rs.getInt("order_id");
                orderDetails.quantity = rs.getInt("quantity");
                orderDetails.topping_id = rs.getInt("topping_id");
                orderDetailsList.add(orderDetails);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderDetailsList;
    }

    public List<String[]> getinfo(int orderId) {
        List<String[]> infoList = new ArrayList<>();
        connection = getConnection();
        String sql = "SELECT order_details_id, image, product_name, category_name, price, quantity, topping_name FROM OrderDetails od "
                + "JOIN Product p ON od.product_id=p.product_id "
                + "JOIN Topping t ON od.topping_id=t.topping_id "
                + "JOIN Category c ON p.category_id=c.category_id WHERE order_id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, orderId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String[] info = new String[7];
                info[0] = rs.getString("order_details_id");
                info[1] = rs.getString("image");
                info[2] = rs.getString("product_name");
                info[3] = rs.getString("category_name");
                info[4] = rs.getString("price");
                info[5] = rs.getString("quantity");
                info[6] = rs.getString("topping_name");
                infoList.add(info);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return infoList;
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
            Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return info;
    }
}
