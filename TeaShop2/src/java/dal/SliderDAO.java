/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Slider;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class SliderDAO extends DBContext{

    public List<Slider> getAll() {
        List<Slider> sliders = new ArrayList<>();
        String sql = "SELECT [id], [name], [description], [url], [image], "
                + "[status] FROM [dbo].[Slider]";
        PreparedStatement pre;
        connection = getConnection();
        
        try {
            pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {

                int id = rs.getInt(1);
                String name = rs.getString(2);
                String description = rs.getString(3);
                String url = rs.getString(4);
                String image = rs.getString(5);

                Slider sl = new Slider(id,name, description, url, image, id);
                sliders.add(sl);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sliders;
    }
       public static void main(String[] args) {
        SliderDAO sliderDAO = new SliderDAO();
       

                System.out.println(sliderDAO.getAll());
    }
}
