/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import entity.Orders;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;

/**
 *
 * @author HoangNX
 */
public class OrdersDAO extends DBContext {

    public List<Orders> findByAccountId(int accountId) {
        List<Orders> ordersList = new ArrayList<>();
        connection = getConnection();
        String sql = "SELECT * FROM Orders WHERE account_id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, accountId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Orders order = new Orders();
                order.order_id = rs.getInt("order_id");
                order.account_id = rs.getInt("account_id");
                order.status = rs.getInt("status");
                order.total_amount = rs.getInt("total_amount");
                String orderDateString = rs.getString("order_date");

                // Parse the date string into a Date object
                SimpleDateFormat dbDateFormat = new SimpleDateFormat("yyyy-MM-dd"); // assuming the date from DB is in this format
                Date date = dbDateFormat.parse(orderDateString);

                // Format the Date object into dd/MM/yyyy format
                SimpleDateFormat displayDateFormat = new SimpleDateFormat("dd/MM/yyyy");
                String formattedDate = displayDateFormat.format(date);

                // Set the formatted date to the order object
                order.order_date = formattedDate;
                order.note = rs.getString("note");
                ordersList.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, e);
            }
            return ordersList;
        }
    }

    public Orders findByOrderId(int orderId) {
        Orders order = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM Orders WHERE order_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, orderId);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                order = new Orders();
                order.order_id = rs.getInt("order_id");
                order.account_id = rs.getInt("account_id");
                order.status = rs.getInt("status");
                order.total_amount = rs.getInt("total_amount");
                String orderDateString = rs.getString("order_date");

                // Parse the date string into a Date object
                SimpleDateFormat dbDateFormat = new SimpleDateFormat("yyyy-MM-dd"); // assuming the date from DB is in this format
                Date date = dbDateFormat.parse(orderDateString);

                // Format the Date object into dd/MM/yyyy format
                SimpleDateFormat displayDateFormat = new SimpleDateFormat("dd/MM/yyyy");
                String formattedDate = displayDateFormat.format(date);

                // Set the formatted date to the order object
                order.order_date = formattedDate;
                order.note = rs.getString("note");
            }

            rs.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, e);
            }

            return order;
        }
    }
}
