/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Blog;
import entity.Product;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author HoangPC
 */
public class BlogDAO extends DBContext {

    // tìm tất cả thuộc tính
    public List<Blog> findAll() {

        List<Blog> listblog = new ArrayList<>();
        connection = getConnection();
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Blog]";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet resultSet = pre.executeQuery();

            while (resultSet.next()) {

                int id = resultSet.getInt(1);
                int account_id = resultSet.getInt(2);
                String content = resultSet.getString(3);
                String img = resultSet.getString(4);
                String blog_name = resultSet.getString(5);
                String created_at = resultSet.getString(6);

                Blog pr = new Blog(id, account_id, content, img, blog_name, created_at);

                listblog.add(pr);
            }

        } catch (SQLException e) {
            System.out.println(e);

        }

        return listblog;
    }

    // tìm từng blog theo id
    public Blog getBlogById(int bid) {
        Blog blog = null;
        String sql = """
                     SELECT *
                       FROM [dbo].[Blog]
                       where id= ?
                     """;
       connection = getConnection();
        try  {
          PreparedStatement  pre = connection.prepareStatement(sql);
            pre.setInt(1, bid);
            ResultSet resultSet = pre.executeQuery();
            while (resultSet.next()) {
                int id= resultSet.getInt(1);
                int account_id = resultSet.getInt(2);
                String content = resultSet.getString(3);
                String img = resultSet.getString(4);
                String blog_name = resultSet.getString(5);
                String created_at = resultSet.getString(6);

                blog= new Blog(id, account_id, content, img, blog_name, created_at);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return blog;
    }

    public List<Blog> getBlogBySearch(String search) {
        List<Blog> blog = new ArrayList<>();
        String sql = "select * from Blog where blog_name LIKE ? OR content LIKE ? OR created_at LIKE ? ";
        PreparedStatement pre;
        try {
            pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + search + "%");
            pre.setString(2, "%" + search + "%");
            pre.setString(3, "%" + search + "%");

            ResultSet resultSet = pre.executeQuery();
            while (resultSet.next()) {
                //public int id, account_id;
                //public String  content, img , blog_name ,created_at;
                int id = resultSet.getInt("id");
                int account_id = resultSet.getInt("acount_id");
                String content = resultSet.getString("content");
                String img = resultSet.getString("img");
                String blog_name = resultSet.getString("blog_name");
                String created_at = resultSet.getString("created_at");

                Blog pr = new Blog(id, account_id, content, img, blog_name, created_at);
                blog.add(pr);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return blog;
    }

// chỉnh sửa định dạng
    private String formatDate(Date dateValue) {
        SimpleDateFormat newFormatter = new SimpleDateFormat("dd/MM/yyyy");
        return newFormatter.format(dateValue);
    }

    public static void main(String[] args) {

        String name = "";
        BlogDAO dao = new BlogDAO();
        ProductDAO daa = new ProductDAO();
//        List<Blog> allblog = dao.findAll();
//        List<Product> allpro = daa.findAll();
//        List<Object> parameters = new ArrayList<>();
//        
        
            String bid = "1";
          
            
            int id=Integer.parseInt(bid);
            Blog blog = dao.getBlogById(id);
//    protected List<T> queryGenericDAO(Class<T> clazz, String sql, Map<String, Object> parameterHashmap) {
//  Define the SQL query to fetch products by name
//    
        System.out.println(blog);
        
//     Create a HashMap to store parameters
//    Map<String, Object> parameterMap = new HashMap<>();
//    parameterMap.put("name", name);
// Truy xuất danh mục để cập nhật (thay thế bằng ID thực tế)
//        int categoryIdToUpdate = 1; // Thay thế bằng ID của danh mục bạn muốn cập nhật
//        String sql = "SELECT * FROM products WHERE id = " + categoryIdToUpdate;
////        Blog categoryToUpdate = (Blog) dao.queryGenericDAO(Blog.class,sql, parameterMap);

//        if (categoryToUpdate != null) {
//            // Cập nhật thuộc tính danh mục
//            
//
//            System.out.println("Danh mục được cập nhật thành công!");
//        } else {
//            System.out.println("Không tìm thấy danh mục có ID " + categoryIdToUpdate + "!");
//        }
//
//        for (Blog category1 : allblog) {
//            System.out.println(category1);
//        }
    }
}
