/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import entity.Accounts;
import java.sql.Connection;
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
public class AccountDAO extends DBContext {

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
                + "a.phone_number\n"
                + "a.created_at,\n"
                + "a.full_name\n"
                + "FROM Accounts a\n"
                + "JOIN AccountStatuses acs ON a.status_id = acs.status_id\n"
                + "JOIN Role r ON a.role_id = r.role_id;";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {

            }
        } catch (Exception e) {
            e.printStackTrace(); // Xử lý ngoại lệ bằng cách in ra stack trace
        }
        return list;
    }

    public Accounts login(String email, String password) {

        String query = "SELECT * FROM Accounts WHERE email = ? AND pass_word = ?";

        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, email);
            statement.setString(2, password);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return new Accounts(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getInt(4),
                        resultSet.getString(5), resultSet.getInt(6), resultSet.getString(7),
                        resultSet.getString(8), resultSet.getString(9), resultSet.getDate(10), resultSet.getString(11));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Xử lý ngoại lệ bằng cách in ra stack trace
        }
        return null;
    }

    public Accounts checkAccountExist(String email) {
        String query = "select * from Accounts where email = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, email);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return new Accounts(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getInt(4),
                        resultSet.getString(5), resultSet.getInt(6), resultSet.getString(7),
                        resultSet.getString(8), resultSet.getString(9), resultSet.getDate(10), resultSet.getString(11));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Xử lý ngoại lệ bằng cách in ra stack trace
        }
        return null;
    }
      public Accounts checkAccountName(String user_name) {
        String query = "select * from Accounts where user_name = ? ";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, user_name);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                return new Accounts(user_name);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Xử lý ngoại lệ bằng cách in ra stack trace
        }
        return null;
    }


    public void Signup(String user_name, String pass_word, String email, String gender, String address, String phone_number) {
        String query = "   INSERT INTO [dbo].[Accounts]\n"
                + "           ([user_name]\n"
                + "           ,[pass_word]\n"
                + "           ,[role_id]\n"
                + "           ,[email]\n"
                + "           ,[status_id]\n"
                + "           ,[gender]\n"
                + "           ,[address]\n"
                + "           ,[phone_number]\n"
                + "           ,[created_at])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?)";
               
        try {
            LocalDate curDate = java.time.LocalDate.now();
            String date = curDate.toString();
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, user_name);
            statement.setString(2, pass_word);
            statement.setInt(3, 2);
            statement.setString(4, email);
            statement.setInt(5, 1);
            statement.setString(6, gender);
            statement.setString(7, address);
            statement.setString(8, phone_number);
            statement.setString(9, date);
            statement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace(); // Xử lý ngoại lệ bằng cách in ra stack trace
        }
    }
     public boolean changePass(String email, String newpass) {
        String query = "UPDATE Accounts SET pass_word = ? WHERE email = ? ";
        boolean rowUpdated = false;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, newpass);
            statement.setString(2, email);
            rowUpdated = statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace(); // Xử lý ngoại lệ bằng cách in ra stack trace
        }
        return rowUpdated;
    }
     public int getAccountIdByEmail(String email) {
        String query = "SELECT account_id FROM Accounts where email= ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(query);
            statement.setString(1, email);

            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int accountId = resultSet.getInt(1);
                return accountId;
            }
        } catch (Exception e) {
            e.printStackTrace(); // Xử lý ngoại lệ bằng cách in ra stack trace
        }
        return 0;
    }


    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
       dao.login("huientranq@gmail.com","trang123");

    }
}
