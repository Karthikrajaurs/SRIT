package com.dao;
import java.sql.*;
public class UserDAO {






//public class UserDAO {

    private String jdbcURL = System.getenv("MYSQL_URL");
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    public boolean validate(String username, String password) {

        boolean status = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    jdbcURL, jdbcUsername, jdbcPassword);

            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            status = rs.next(); 

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

}
