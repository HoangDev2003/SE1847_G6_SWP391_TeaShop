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
 * @author HoangNX
 */
public class CartDetailsDAO extends DBContext {

    public List getTopping(){
        List toppingList = new ArrayList();
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
    
    public int getCartIdFromAccountId(int accountId) {
        int cartId = 0;
        String sql = "SELECT cart_id FROM Cart WHERE account_id = ?";
        connection = getConnection();

        try {
            // Assuming you have a method to get a connection, like `getConnection()`
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, accountId);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                cartId = rs.getInt("cart_id");
            }
        } catch (SQLException e) {
            e.printStackTrace(); // You might want to handle this differently in a real application
        }
        return cartId;
    }

    public int updateQuantity(int quantity, int cart_id, int product_id) {
        String sql = "UPDATE [dbo].[CartDetails] SET [quantity] = ? WHERE cart_id = ? AND product_id = ?";
        connection = getConnection();
        PreparedStatement pre = null;
        int n = 0;

        try {
            pre = connection.prepareStatement(sql);
            pre.setInt(1, quantity);
            pre.setInt(2, cart_id);
            pre.setInt(3, product_id);

            n = pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions (consider logging in a real application)
        }
        return n;
    }

    public int deleteFromCart(int cart_id, int product_id) {
        String sql = "DELETE FROM [dbo].[CartDetails] WHERE cart_id = ? AND product_id = ?";
        connection = getConnection();
        PreparedStatement pre = null;
        int n = 0;

        try {
            pre = connection.prepareStatement(sql);
            pre.setInt(1, cart_id);
            pre.setInt(2, product_id);

            n = pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions (consider logging in a real application)
        }
        return n;
    }

    public List<String[]> getinfo(int accountId) {
        List<String[]> infoList = new ArrayList<>();
        connection = getConnection();
        String sql = "select p.product_id, product_name, price, quantity, image from CartDetails cd \n"
                + "join Product p on cd.product_id = p.product_id \n"
                + "join Cart c on cd.cart_id = c.cart_id where account_id = ?";
        try {

            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, accountId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String[] info = new String[5]; // Correct the size of the array to match columns in the query
                info[0] = rs.getString("product_id");
                info[1] = rs.getString("product_name");
                info[2] = rs.getString("price");
                info[3] = rs.getString("quantity");
                info[4] = rs.getString("image");
                infoList.add(info);
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
            Logger.getLogger(CartDetailsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return info;
    }
}
