/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Accounts;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Huyen Tranq
 */
public class AdminDAO extends DBContext {

    protected PreparedStatement statement;
    protected ResultSet resultSet;

    public List<Accounts> getAllAccount() {
        //khởi tạo 1 list để load sản phẩm lên và lưu trong đấy
        List<Accounts> list = new ArrayList<>();
        String query = "SELECT a.account_id,\n"
                + "a.user_name,\n"
                + "r.role_name,\n"
                + "a.email,\n"
                + "acs.status_name, \n"
                + "a.gender,\n"
                + "a.address,\n"
                + "a.phone_number,\n"
                + "a.created_at\n"
                + "FROM Accounts a\n"
                + "JOIN AccountStatuses acs ON a.status_id = acs.status_id\n"
                + "JOIN Role r ON a.role_id = r.role_id where a.role_id = 2";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(new Accounts(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
                        resultSet.getString(4), resultSet.getString(5),
                        resultSet.getString(6), resultSet.getString(7), resultSet.getString(8), resultSet.getDate(9)));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Xử lý ngoại lệ bằng cách in ra stack trace
        }
        return list;
    }

    public Accounts getAccountById(int id) {
        String query = "SELECT a.account_id,\n"
                + "                a.user_name,\n"
                + "                r.role_name,\n"
                + "                a.email,\n"
                + "                acs.status_name,\n"
                + "                a.gender,\n"
                + "                a.address,\n"
                + "                a.phone_number,\n"
                + "                a.created_at,\n"
                + "                a.full_name,\n"
                + "                a.avartar\n"
                + "                FROM Accounts a\n"
                + "                JOIN AccountStatuses acs ON a.status_id = acs.status_id\n"
                + "                JOIN Role r ON a.role_id = r.role_id\n"
                + "                WHERE a.account_id = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return new Accounts(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
                        resultSet.getString(4), resultSet.getString(5),
                        resultSet.getString(6), resultSet.getString(7), resultSet.getString(8),
                        resultSet.getDate(9), resultSet.getString(10), resultSet.getString(11));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Accounts getUserInfor(String email) {
        String query = "SELECT a.account_id,\n"
                + "                a.user_name,\n"
                + "                r.role_name,\n"
                + "                a.email,\n"
                + "                acs.status_name,\n"
                + "                a.gender,\n"
                + "                a.address,\n"
                + "                a.phone_number,\n"
                + "                a.created_at,\n"
                + "                a.full_name,\n"
                + "                a.avartar\n"
                + "                FROM Accounts a\n"
                + "                JOIN AccountStatuses acs ON a.status_id = acs.status_id\n"
                + "                JOIN Role r ON a.role_id = r.role_id\n"
                + "                WHERE a.email = ?";
        try {

            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, email);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return new Accounts(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
                        resultSet.getString(4), resultSet.getString(5),
                        resultSet.getString(6), resultSet.getString(7), resultSet.getString(8),
                        resultSet.getDate(9), resultSet.getString(10), resultSet.getString(11));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public String getProductImage1ById(int id) {
        String query = "select [avartar] from Accounts\n"
                + " where account_id = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return resultSet.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void editUserById(int role, int status, int id) {
        String query = "Update Accounts\n"
                + "  set\n"
                + "  [role_id]=?\n"
                + " ,[status_id]=?\n"
                + "from Accounts\n"
                + "where account_id=?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, role);
            statement.setInt(2, status);
            statement.setInt(3, id);
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteUser(int id) {
        String query = "Delete from Accounts where account_id = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
        } catch (Exception e) {
        }

    }

    public void addUser(String email, String pass, String name, int role, int status, String phone, String gender, String address) {
        String query = "insert into Accounts (email, pass_word, user_name, role_id, created_at, status_id, phone_number, gender, address)\n"
                + "values(?,?,?,?,?,?,?,?,?)";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            LocalDate curDate = java.time.LocalDate.now();
            String date = curDate.toString();
            statement.setString(1, email);
            statement.setString(2, pass);
            statement.setString(3, name);
            statement.setInt(4, role);
            statement.setString(5, date);
            statement.setInt(6, status);
            statement.setString(7, phone);
            statement.setString(8, gender);
            statement.setString(9, address);
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Accounts> searchUser(String search) {
        List<Accounts> list = new ArrayList<>();
        String query = "SELECT a.account_id,\n"
                + "a.user_name,\n"
                + "r.role_name,\n"
                + "a.email,\n"
                + "acs.status_name, \n"
                + "a.gender,\n"
                + "a.address,\n"
                + "a.phone_number,\n"
                + "a.created_at\n"
                + "FROM Accounts a\n"
                + "JOIN AccountStatuses acs ON a.status_id = acs.status_id\n"
                + "JOIN Role r ON a.role_id = r.role_id where a.user_name LIKE ? or a.email LIKE ? or a.phone_number LIKE ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, "%" + search + "%");
            statement.setString(2, "%" + search + "%");
            statement.setString(3, "%" + search + "%");
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(new Accounts(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
                        resultSet.getString(4), resultSet.getString(5),
                        resultSet.getString(6), resultSet.getString(7), resultSet.getString(8), resultSet.getDate(9)));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Xử lý ngoại lệ bằng cách in ra stack trace
        }
        return list;
    }
    
     public List<Accounts> getAllStaff() {
        //khởi tạo 1 list để load sản phẩm lên và lưu trong đấy
        List<Accounts> list = new ArrayList<>();
        String query = "SELECT a.account_id,\n"
                + "a.user_name,\n"
                + "r.role_name,\n"
                + "a.email,\n"
                + "acs.status_name, \n"
                + "a.gender,\n"
                + "a.address,\n"
                + "a.phone_number,\n"
                + "a.created_at\n"
                + "FROM Accounts a\n"
                + "JOIN AccountStatuses acs ON a.status_id = acs.status_id\n"
                + "JOIN Role r ON a.role_id = r.role_id where a.role_id = 3";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(new Accounts(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
                        resultSet.getString(4), resultSet.getString(5),
                        resultSet.getString(6), resultSet.getString(7), resultSet.getString(8), resultSet.getDate(9)));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Xử lý ngoại lệ bằng cách in ra stack trace
        }
        return list;
    }

    public static void main(String[] args) {
       AdminDAO dao = new AdminDAO();
       List<Accounts> staffList = dao.getAllStaff();
        for (Accounts staff : staffList) {
            System.out.println(staff);
        }
    
    }

}
