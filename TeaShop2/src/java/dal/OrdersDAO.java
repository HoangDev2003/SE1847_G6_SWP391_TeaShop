package dal;

import dal.DBContext;
import entity.Accounts;
import entity.Orders;
import entity.Product;
import entity.Status;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;

/**
 * Data Access Object cho Orders.
 */
public class OrdersDAO extends DBContext {

    public int insertOrder(Integer accountId, String orderDate, String estimatedDeliveryDate, int totalAmount, int statusId, String note, String paymentMethod, String phoneNumber, String fullName, String address) {
        String insertSQL = "INSERT INTO [dbo].[Orders] ([account_id], [order_date], [estimated_delivery_date], [total_amount], [status_id], [note], [payment_method], [phone_number], [full_name], [address]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        int orderId = -1; // Default value if insertion fails

        try {
            connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);

            // Set the parameters for the query
            if (accountId == null) {
                statement.setNull(1, Types.INTEGER);
            } else {
                statement.setInt(1, accountId);
            }
            statement.setString(2, orderDate);
            statement.setString(3, estimatedDeliveryDate);
            statement.setInt(4, totalAmount);
            statement.setInt(5, statusId);
            statement.setString(6, note);
            statement.setString(7, paymentMethod);
            statement.setString(8, phoneNumber);
            statement.setString(9, fullName);
            statement.setString(10, address);

            // Execute the update
            int affectedRows = statement.executeUpdate();

            if (affectedRows > 0) {
                // Retrieve the generated key
                ResultSet generatedKeys = statement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    orderId = generatedKeys.getInt(1);
                }
            }

            connection.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return orderId;
    }

    public List<Orders> getAllListOrder() {
        List<Orders> ordersList = new ArrayList<>();
        Orders order = null;
        //ket noi duoc voi database
        connection = getConnection();
        //co cau lenh de goi xuong database
        String sql = "select * from Orders";
        try {
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);

            ResultSet rs = pre.executeQuery();

            while (rs.next()) {

                order = new Orders();
                order.order_id = rs.getInt("order_id");
                order.account = (new AccountDAO().getAccountByAccountID(rs.getInt("account_id")));
                order.status = (new StatusDAO().getStatusByStatusID(rs.getInt("status_id")));
                order.total_amount = rs.getInt("total_amount");
                order.setOrder_date(rs.getTimestamp("order_date"));
                order.setEstimated_delivery_date(rs.getTimestamp("estimated_delivery_date"));
                order.note = rs.getString("note");
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
                Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return ordersList; // Return the list of orders

    }

    /**
     * Finds orders by account ID.
     *
     * @param accountId The ID of the account for which to retrieve orders.
     * @return A list of orders associated with the given account ID.
     */
    public List<Orders> findByAccountId(int accountId) {
        List<Orders> ordersList = new ArrayList<>();
        Orders order = null;
        String sql = "SELECT * FROM Orders WHERE account_id = ?";

        try {
            connection = getConnection();
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, accountId); // Set the account ID parameter
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                order = new Orders();
                order.order_id = rs.getInt("order_id");
                order.account = (new AccountDAO().getAccountByAccountID(rs.getInt("account_id")));
                order.status = (new StatusDAO().getStatusByStatusID(rs.getInt("status_id")));
                order.total_amount = rs.getInt("total_amount");
                order.setOrder_date(rs.getTimestamp("order_date"));
                order.setEstimated_delivery_date(rs.getTimestamp("estimated_delivery_date"));
                // Retrieve the note
                order.note = rs.getString("note");

                // Add the order to the list
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
                Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return ordersList; // Return the list of orders
    }

    public List<Orders> findByAccountIdAndStatusId(int accountId, int statusId) {
        List<Orders> ordersList = new ArrayList<>();
        Orders order = null;
        String sql = "SELECT * FROM Orders WHERE account_id = ? and status_id = ?";

        try {
            connection = getConnection();
            PreparedStatement pre = connection.prepareStatement(
                    sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            pre.setInt(1, accountId);
            pre.setInt(2, statusId);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                order = new Orders();
                order.order_id = rs.getInt("order_id");
                order.account = (new AccountDAO().getAccountByAccountID(rs.getInt("account_id")));
                order.status = (new StatusDAO().getStatusByStatusID(rs.getInt("status_id")));
                order.total_amount = rs.getInt("total_amount");
                order.setOrder_date(rs.getTimestamp("order_date"));
                order.setEstimated_delivery_date(rs.getTimestamp("estimated_delivery_date"));
                // Retrieve the note
                order.note = rs.getString("note");

                // Add the order to the list
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
                Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return ordersList; // Return the list of orders
    }

    /**
     * Finds an order by order ID.
     *
     * @param orderId The ID of the order to retrieve.
     * @return The order associated with the given order ID, or null if not
     * found.
     */
    public Orders findByOrderId(int orderId) {
        Orders order = null;
        connection = getConnection(); // Obtain database connection
        String sql = "SELECT * FROM Orders WHERE order_id = ?";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, orderId); // Set the order ID parameter
            ResultSet rs = pre.executeQuery();

            if (rs.next()) {
                order = new Orders();
                order.order_id = rs.getInt("order_id");
                order.account = (new AccountDAO().getAccountByAccountID(rs.getInt("account_id")));
                order.status = (new StatusDAO().getStatusByStatusID(rs.getInt("status_id")));
                order.total_amount = rs.getInt("total_amount");
                order.setOrder_date(rs.getTimestamp("order_date"));
                order.setEstimated_delivery_date(rs.getTimestamp("estimated_delivery_date"));
                order.note = rs.getString("note");
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
                Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return order; // Return the order object
    }

    public void updateOrderStatus(int orderId, int statusId) {
        connection = getConnection();
        String sql = "UPDATE Orders SET status_id = ? WHERE order_id = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, statusId);
            pre.setInt(2, orderId);
            pre.executeUpdate();
            pre.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
