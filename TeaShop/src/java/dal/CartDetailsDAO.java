/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import entity.CartDetails;
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
    /**
     * Retrieves a list of all topping names.
     *
     * @return A list of strings representing the topping names.
     */
    public List<String> getTopping() {
        List<String> toppingList = new ArrayList<String>();
        String sql = "select * from Topping";
        Connection connection = getConnection(); // Obtain database connection

        try {
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                String topping = rs.getString("topping_name");
                toppingList.add(topping); // Add topping name to the list
            }

            rs.close(); // Close ResultSet
            pre.close(); // Close PreparedStatement
        } catch (SQLException ex) {
            Logger.getLogger(CartDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close the connection in the finally block to ensure it's closed even if an exception occurs
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CartDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return toppingList; // Return the list of toppings
    }

    /**
     * Retrieves the cart ID associated with a given account ID.
     *
     * @param accountId The ID of the account.
     * @return The cart ID associated with the account ID.
     */
    public int getCartIdFromAccountId(int accountId) {
        int cartId = 0;
        String sql = "SELECT cart_id FROM Cart WHERE account_id = ?";
        Connection connection = getConnection(); // Obtain database connection

        try {
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, accountId); // Set the account ID parameter
            ResultSet rs = pre.executeQuery();

            if (rs.next()) {
                cartId = rs.getInt("cart_id"); // Retrieve the cart ID
            }

            rs.close(); // Close ResultSet
            pre.close(); // Close PreparedStatement
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions (consider logging in a real application)
        }

        return cartId; // Return the cart ID
    }

    /**
     * Updates the quantity of a product in the cart.
     *
     * @param quantity The new quantity of the product.
     * @param cart_id The ID of the cart.
     * @param product_id The ID of the product.
     * @return The number of rows affected by the update.
     */
    public int updateQuantity(int quantity, int cart_id, int product_id) {
        String sql = "UPDATE [dbo].[CartDetails] SET [quantity] = ? WHERE cart_id = ? AND product_id = ?";
        Connection connection = getConnection(); // Obtain database connection
        PreparedStatement pre = null;
        int n = 0;

        try {
            pre = connection.prepareStatement(sql);
            pre.setInt(1, quantity); // Set the new quantity
            pre.setInt(2, cart_id); // Set the cart ID
            pre.setInt(3, product_id); // Set the product ID

            n = pre.executeUpdate(); // Execute the update
            pre.close(); // Close PreparedStatement
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions (consider logging in a real application)
        } catch (Exception ex) { // Catch any parsing exceptions
            Logger.getLogger(CartDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close(); // Close the database connection
                }
            } catch (SQLException e) {
                Logger.getLogger(CartDetailsDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return n; // Return the number of rows affected
    }

    /**
     * Deletes a product from the cart.
     *
     * @param cart_id The ID of the cart.
     * @param product_id The ID of the product to be deleted.
     * @return The number of rows affected by the delete operation.
     */
    public int deleteFromCart(int cart_id, int product_id) {
        String sql = "DELETE FROM [dbo].[CartDetails] WHERE cart_id = ? AND product_id = ?";
        Connection connection = getConnection(); // Obtain database connection
        PreparedStatement pre = null;
        int n = 0;

        try {
            pre = connection.prepareStatement(sql);
            pre.setInt(1, cart_id); // Set the cart ID
            pre.setInt(2, product_id); // Set the product ID

            n = pre.executeUpdate(); // Execute the delete operation
            pre.close(); // Close PreparedStatement
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions (consider logging in a real application)
        } catch (Exception ex) { // Catch any parsing exceptions
            Logger.getLogger(CartDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close(); // Close the database connection
                }
            } catch (SQLException e) {
                Logger.getLogger(CartDetailsDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return n; // Return the number of rows affected
    }

    /**
     * Retrieves detailed information about the products in the cart associated
     * with a specific account.
     *
     * @param accountId The ID of the account.
     * @return A list of string arrays, each containing detailed information
     * about a product in the cart.
     */
    public List<String[]> getinfo(int accountId) {
        List<String[]> infoList = new ArrayList<>();
        Connection connection = getConnection(); // Obtain database connection
        String sql = "SELECT p.product_id, product_name, price, quantity, image FROM CartDetails cd "
                + "JOIN Product p ON cd.product_id = p.product_id "
                + "JOIN Cart c ON cd.cart_id = c.cart_id WHERE account_id = ?";

        try {
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, accountId); // Set the account ID parameter
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                String[] info = new String[5]; // Correct the size of the array to match columns in the query
                info[0] = rs.getString("product_id");
                info[1] = rs.getString("product_name");
                info[2] = rs.getString("price");
                info[3] = rs.getString("quantity");
                info[4] = rs.getString("image");
                infoList.add(info); // Add the info array to the list
            }

            rs.close(); // Close ResultSet
            pre.close(); // Close PreparedStatement
        } catch (SQLException ex) {
            Logger.getLogger(CartDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) { // Catch any parsing exceptions
            Logger.getLogger(CartDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close(); // Close the database connection
                }
            } catch (SQLException e) {
                Logger.getLogger(CartDetailsDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }

        return infoList; // Return the list of detailed information
    }
}