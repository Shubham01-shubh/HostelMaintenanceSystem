package com.hostel.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBConnection {

    public static Connection getConnection() {
        Connection con = null;

        try {
            Properties props = new Properties();

            InputStream in = DBConnection.class
                    .getClassLoader()
                    .getResourceAsStream("db.properties");

            if (in == null) {
                throw new RuntimeException("db.properties file not found in classpath");
            }

            props.load(in);

            String url = props.getProperty("db.url");
            String user = props.getProperty("db.username");
            String pass = props.getProperty("db.password");

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);

            System.out.println(" Database connection successful");

        } catch (Exception e)  {
            System.out.println(" Database connection failed");
            e.printStackTrace();
        }

        return con;
    }
}
