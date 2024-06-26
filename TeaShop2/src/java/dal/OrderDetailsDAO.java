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

    public List<String> getToppingNamesByOrderDetailId(int order_details_id) {
        String sql = "SELECT topping_name FROM Topping "
                + "JOIN ToppingDetails ON Topping.topping_id = ToppingDetails.topping_id "
                + "WHERE order_details_id = ?";
        Connection connection = getConnection(); // Obtain database connection
        List<String> toppingNames = new ArrayList<>();

        try {
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, order_details_id); // Set the order_details_id parameter
            ResultSet rs = pre.executeQuery();

            while (rs.next()) { // Iterate through results
                toppingNames.add(rs.getString("topping_name"));
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

        return toppingNames; // Return the list of topping names
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
        String sql = "SELECT order_details_id, p.product_id, image, product_name, category_id, price, quantity "
                + "FROM OrderDetails od "
                + "JOIN Product p ON od.product_id = p.product_id "
                + "WHERE order_id = ?";

        try {
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, orderId); // Set the order ID parameter
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                OrderDetails orderDetails = new OrderDetails();
                orderDetails.setCategory(new Category());
                orderDetails.setProduct(new Product());
                orderDetails.setTopping(new ArrayList<Topping>());

                orderDetails.setOrder_details_id(rs.getInt("order_details_id"));
                orderDetails.getProduct().setProduct_id(rs.getInt("product_id"));
                orderDetails.getProduct().setImage(rs.getString("image"));
                orderDetails.getProduct().setProduct_name(rs.getString("product_name"));
                orderDetails.getCategory().setCategory_name(getCategoryNameById(rs.getInt("category_id")));
                orderDetails.getProduct().setPrice(rs.getInt("price"));
                orderDetails.setQuantity(rs.getInt("quantity"));

                // Get topping names
                List<String> toppingNames = getToppingNamesByOrderDetailId(rs.getInt("order_details_id"));
                for (String toppingName : toppingNames) {
                    Topping topping = new Topping();
                    topping.setTopping_name(toppingName);
                    orderDetails.getTopping().add(topping);
                }

                infoList.add(orderDetails);
            }

            rs.close(); // Close ResultSet
            pre.close(); // Close PreparedStatement
        } catch (SQLException ex) {
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

    public List<OrderDetails> getAllOrderDetails() {
        List<OrderDetails> list = new ArrayList<>();
        String query = "SELECT od.order_details_id, od.product_id, od.order_id, od.quantity, "
                + "p.product_name, c.category_name, t.topping_id, t.topping_name "
                + "FROM OrderDetails od "
                + "JOIN Product p ON od.product_id = p.product_id "
                + "JOIN Category c ON p.category_id = c.category_id "
                + "LEFT JOIN ToppingDetails td ON od.order_details_id = td.order_details_id "
                + "LEFT JOIN Topping t ON td.topping_id = t.topping_id";

        try {
            Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                OrderDetails orderDetails = new OrderDetails();
                orderDetails.setOrder_details_id(resultSet.getInt("order_details_id"));
                orderDetails.setProduct_id(resultSet.getInt("product_id"));
                orderDetails.setOrder_id(resultSet.getInt("order_id"));
                orderDetails.setQuantity(resultSet.getInt("quantity"));

                Product product = new Product();
                product.setProduct_name(resultSet.getString("product_name"));
                orderDetails.setProduct(product);

                Category category = new Category();
                category.setCategory_name(resultSet.getString("category_name"));
                orderDetails.setCategory(category);

                List<Topping> toppings = new ArrayList<>();
                do {
                    if (resultSet.getString("topping_name") != null) {
                        Topping topping = new Topping();
                        topping.setTopping_id(resultSet.getInt("topping_id"));
                        topping.setTopping_name(resultSet.getString("topping_name"));
                        toppings.add(topping);
                    }
                } while (resultSet.next() && resultSet.getInt("order_details_id") == orderDetails.getOrder_details_id());

                orderDetails.setTopping(toppings);
                list.add(orderDetails);
                resultSet.previous();
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }

}
