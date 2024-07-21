/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Orders;
import java.sql.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author This PC
 */
public class StaffDAO extends DBContext {

    public List<Orders> getAllOrder() {
        List<Orders> ordersList = new ArrayList<>();
        Orders order = null;
        connection = getConnection();
        String sql = "SELECT * \n"
                + "FROM Orders \n"
                + "ORDER BY order_date ASC;";
        try {
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);

            ResultSet rs = pre.executeQuery();

            while (rs.next()) {

                order = new Orders();
                order.order_id = rs.getInt("order_id");
                int account_id = rs.getInt("account_id");
                order.phone_number = rs.getString("phone_number");
                order.full_name = rs.getString("full_name");
                order.status = (new StatusDAO().getStatusByStatusID(rs.getInt("status_id")));
                order.orderDetails = (new OrderDetailsDAO().findByOrderId(rs.getInt("order_id")));
                order.total_amount = rs.getInt("total_amount");
                order.setOrder_date(rs.getTimestamp("order_date"));
                order.note = rs.getString("note");
                order.payment_method = rs.getString("payment_method");
                order.address = rs.getString("address");
                ordersList.add(order);
            }

            rs.close(); // Close ResultSet
            pre.close(); // Close PreparedStatement
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) { // Catch any parsing exceptions
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close(); // Close the database connection
                }
            } catch (SQLException e) {
                Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return ordersList; // Return the list of orders

    }

    public List<Orders> getOrderByStatusId(int status_id) {
        List<Orders> ordersList = new ArrayList<>();
        Orders order = null;
        connection = null; // Obtain database connection
        String sql = "SELECT * \n"
                + "FROM Orders \n"
                + "WHERE status_id = ? \n"
                + "ORDER BY order_date ASC;";

        try {
            connection = getConnection();
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, status_id); // Set the status ID parameter

            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                order = new Orders();
                order.order_id = rs.getInt("order_id");
                order.status = (new StatusDAO().getStatusByStatusID(rs.getInt("status_id")));
                order.orderDetails = (new OrderDetailsDAO().findByOrderId(rs.getInt("order_id")));
                order.total_amount = rs.getInt("total_amount");
                order.setOrder_date(rs.getTimestamp("order_date"));
                order.note = rs.getString("note");
                order.phone_number = rs.getString("phone_number");
                order.full_name = rs.getString("full_name");
                order.address = rs.getString("address");
                order.payment_method = rs.getString("payment_method");
                ordersList.add(order);
            }

            rs.close(); // Close ResultSet
            pre.close(); // Close PreparedStatement
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) { // Catch any parsing exceptions
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close(); // Close the database connection
                }
            } catch (SQLException e) {
                Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return ordersList; // Return the list of orders

    }

    public boolean updateOrderStatus(int orderId, int newStatusId) {
        connection = null;
        String sql = "UPDATE Orders SET status_id = ? WHERE order_id = ?";
        boolean updateSuccessful = false;

        try {
            connection = getConnection();
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, newStatusId); // Set the new status ID
            pre.setInt(2, orderId);     // Set the order ID

            int rowsAffected = pre.executeUpdate();
            updateSuccessful = rowsAffected > 0;

            pre.close(); // Close PreparedStatement
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) { // Catch any parsing exceptions
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close(); // Close the database connection
                }
            } catch (SQLException e) {
                Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return updateSuccessful; // Return whether the update was successful
    }

    public String getVnp_TxnRefFromOrderId(int orderId) {
        String vnp_TxnRef = null; // Initialize the return value
        String sql = "SELECT vnp_TxnRef FROM [dbo].[Orders] WHERE order_id = ?";

        try {
            connection = getConnection();
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, orderId);

            ResultSet rs = pre.executeQuery(); // Execute the query

            if (rs.next()) {
                vnp_TxnRef = rs.getString("vnp_TxnRef"); // Retrieve the vnp_TxnRef value
            }

            rs.close(); // Close ResultSet
            pre.close(); // Close PreparedStatement
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) { // Catch any parsing exceptions
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close(); // Close the database connection
                }
            } catch (SQLException e) {
                Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return vnp_TxnRef; // Return the retrieved value
    }

    public String getTranscationDateFromOrderId(int orderId) {
        String TranscationDate = null; // Initialize the return value
        String sql = "SELECT order_date FROM [dbo].[Orders] WHERE order_id = ?";

        try {
            connection = getConnection();
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, orderId);

            ResultSet rs = pre.executeQuery(); // Execute the query

            if (rs.next()) {
                Timestamp orderDate = rs.getTimestamp("order_date"); // Retrieve the order_date
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
                TranscationDate = sdf.format(orderDate);
            }

            rs.close(); // Close ResultSet
            pre.close(); // Close PreparedStatement
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) { // Catch any parsing exceptions
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close(); // Close the database connection
                }
            } catch (SQLException e) {
                Logger.getLogger(StaffDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return TranscationDate; // Return the retrieved value
    }
}
