package com.zyy.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
    private static final String jdbcUrl="jdbc:mysql://localhost:3306/petmanager?useUnicode=true&characterEncoding=utf-8&useSSL=false";
    private static final String dbUser="root";
    private static final String dbPwd="123456";
    public static Connection getConnection() throws java.sql.SQLException{
        Connection conn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        if (conn==null) {
            conn= DriverManager.getConnection(jdbcUrl,dbUser,dbPwd);
            return conn;
        }
        return conn;
    }
}
