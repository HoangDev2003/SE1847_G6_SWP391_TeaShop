/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Accounts;
import entity.Category;
import entity.OrderDetails;
import entity.Product;
import entity.Topping;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HuyTD
 */
public class OrderDetailsDAO extends DBContext {

    /**
     * Finds order details by order ID.
     *
     * @param orderId The ID of the order for which to retrieve order details.
     * @return A list of OrderDetails objects associated with the given order
     * ID.
     */
    public List<OrderDetails> findByOrderId(int orderId) {
        List<OrderDetails> orderDetailsList = new ArrayList<>();
        Connection connection = getConnection(); // Obtain database connection
        String sql = "SELECT * FROM OrderDetails WHERE order_id = ?";

        try {
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, orderId); // Set the order ID parameter
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                OrderDetails orderDetails = new OrderDetails();
                orderDetails.order_details_id = rs.getInt("order_details_id");
                orderDetails.product_id = rs.getInt("product_id");
                orderDetails.order_id = rs.getInt("order_id");
                orderDetails.quantity = rs.getInt("quantity");
                orderDetails.topping_id = rs.getInt("topping_id");
                orderDetailsList.add(orderDetails); // Add the order details to the list
            }

            rs.close(); // Close ResultSet
            pre.close(); // Close PreparedStatement
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) { // Catch any parsing exceptions
            Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close(); // Close the database connection
                }
            } catch (SQLException e) {
                Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return orderDetailsList; // Return the list of order details
    }

    public String getCategoryNameById(int category_id) {
        String sql = "select category_name from Category where category_id=?";
        Connection connection = getConnection(); // Obtain database connection
        String categoryName = null;

        try {
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, category_id); // Set the product_id parameter
            ResultSet rs = pre.executeQuery();

            if (rs.next()) { // Check if a result is found
                categoryName = rs.getString("category_name");
            }

            rs.close(); // Close ResultSet
            pre.close(); // Close PreparedStatement
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close the connection in the finally block to ensure it's closed even if an exception occurs
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return categoryName; // Return the product entity
    }

    public String getToppingNameById(int topping_id) {
        String sql = "select topping_name from topping where topping_id=?";
        Connection connection = getConnection(); // Obtain database connection
        String toppingName = null;

        try {
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, topping_id); // Set the product_id parameter
            ResultSet rs = pre.executeQuery();

            if (rs.next()) { // Check if a result is found
                toppingName = rs.getString("topping_name");
            }

            rs.close(); // Close ResultSet
            pre.close(); // Close PreparedStatement
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close the connection in the finally block to ensure it's closed even if an exception occurs
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return toppingName; // Return the product entity
    }

    /**
     * Retrieves detailed information about an order.
     *
     * @param orderId The ID of the order for which to retrieve detailed
     * information.
     * @return A list of string arrays, each containing detailed information
     * about a product in the order.
     */
    public List<OrderDetails> getinfo(int orderId) {
        List<OrderDetails> infoList = new ArrayList<>();
        Connection connection = getConnection(); // Obtain database connection
        String sql = "SELECT order_details_id, p.product_id, image, product_name, category_id, price, quantity, topping_id FROM OrderDetails od "
                + "JOIN Product p ON od.product_id=p.product_id WHERE order_id = ?";

        try {
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, orderId); // Set the order ID parameter
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                OrderDetails orderDetails = new OrderDetails();
                orderDetails.category = new Category();
                orderDetails.product = new Product();
                orderDetails.topping = new Topping();
                
                orderDetails.order_details_id = rs.getInt("order_details_id");
                orderDetails.product.product_id = rs.getInt("product_id");
                orderDetails.product.image = rs.getString("image");
                orderDetails.product.product_name = rs.getString("product_name");
                orderDetails.category.category_name = getCategoryNameById(rs.getInt("category_id"));
                orderDetails.product.price = rs.getInt("price");
                orderDetails.quantity = rs.getInt("quantity");
                orderDetails.topping.topping_name = getToppingNameById(rs.getInt("topping_id"));
                infoList.add(orderDetails);
            }

            rs.close(); // Close ResultSet
            pre.close(); // Close PreparedStatement
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) { // Catch any parsing exceptions
            Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close(); // Close the database connection
                }
            } catch (SQLException e) {
                Logger.getLogger(OrderDetailsDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return infoList; // Return the list of detailed information
    }

    /**
     * Retrieves account information associated with a specific order.
     *
     * @param orderId The ID of the order for which to retrieve account
     * information.
     * @return An array of strings containing account information: full name,
     * gender, email, and phone number.
     */
    public Accounts accInfo(int orderId) {
        Accounts info = new Accounts();
        Connection connection = getConnection(); // Obtain database connection
        String sql = "SELECT a.user_name, a.gender, a.email, a.phone_number FROM Orders o "
                + "JOIN Accounts a ON o.account_id = a.account_id WHERE o.order_id = ?";

        try {
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, orderId); // Set the order ID parameter
            ResultSet rs = pre.executeQuery();

            if (rs.next()) {
                // Populate the Accounts object with data from the ResultSet
                info.setUser_name(rs.getString("user_name"));
                info.setGender(rs.getString("gender"));
                info.setEmail(rs.getString("email"));
                info.setPhone_number(rs.getString("phone_number"));
            }

            rs.close(); // Close ResultSet
            pre.close(); // Close PreparedStatement
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) { // Catch any parsing exceptions
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close(); // Close the database connection
                }
            } catch (SQLException e) {
                Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return info; // Return the account information object
    }

}
