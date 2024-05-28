/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import entity.Product;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author HoangNX
 */
public class ProductDAO extends GenericDAO<Product> {

    @Override
    public List<Product> findAll() {
        return queryGenericDAO(Product.class);
    }

    @Override
    public int insert(Product t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<Product> findProductByCategoryId(String categoryId, int page) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Product]\n"
                + "  Where category_id = ?\n"
                + "  ORDER BY product_id\n"
                + "  OFFSET ? ROWS \n" //(Page - 1) * numberRecord/page
                + "  FETCH NEXT ? ROWS ONLY\n"; //numberRecord/page
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("category_id", categoryId);
        parameterMap.put("OFFSET", (page - 1) * 6);
        parameterMap.put("FETCH", 6);
        return queryGenericDAO(Product.class, sql, parameterMap);
    }

    public List<Product> findProductByName(String keyword, int page) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Product]\n"
                + "  Where product_name like ?"
                + "  ORDER BY product_id\n"
                + "  OFFSET ? ROWS \n" //(Page - 1) * numberRecord/page
                + "  FETCH NEXT ? ROWS ONLY\n"; //numberRecord/page;
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("product_name", "%" + keyword + "%");
        parameterMap.put("OFFSET", (page - 1) * 6);
        parameterMap.put("FETCH", 6);
        return queryGenericDAO(Product.class, sql, parameterMap);
    }

    public int findTotalRecordByCategoryId(String categoryId) {
        String sql = "SELECT count(*)\n"
                + "  FROM [dbo].[Product]\n"
                + "  where category_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("category_id", categoryId);
        return findTotalRecordGenericDAO(Product.class, sql, parameterMap);
    }

    public int findTotalRecordByName(String keyword) {
        String sql = "SELECT count(*)\n"
                + "  FROM [dbo].[Product]\n"
                + "  where product_name like ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("product_name", "%" + keyword + "%");
        return findTotalRecordGenericDAO(Product.class, sql, parameterMap);
    }

    public int findTotalRecord() {
        String sql = "SELECT count(*)\n"
                + "  FROM [dbo].[Product]";
        parameterMap = new LinkedHashMap<>();
        return findTotalRecordGenericDAO(Product.class, sql, parameterMap);
    }

    public List<Product> findByPage(int page) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Product]\n"
                + "  ORDER BY product_id\n"
                + "  OFFSET ? ROWS \n" //(Page - 1) * numberRecord/page
                + "  FETCH NEXT ? ROWS ONLY\n"; //numberRecord/page;
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("OFFSET", (page - 1) * 6);
        parameterMap.put("FETCH", 6);
        return queryGenericDAO(Product.class, sql, parameterMap);
    }

}
