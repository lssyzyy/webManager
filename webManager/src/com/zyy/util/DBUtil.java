package com.zyy.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
    private static final String jdbcUrl="jdbc:mysql://localhost:3306/petmanager?useUnicode=true&characterEncoding=utf-8&useSSL=false";
    private static final String dbUser="root";
    private static final String dbPwd="123456";
    private static Connection conn=null;
    static{
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    public static Connection getConnection() throws java.sql.SQLException{
        if (conn==null) {
            conn= DriverManager.getConnection(jdbcUrl,dbUser,dbPwd);
            return conn;
        }
        return conn;
    }
    public static void main(String[] args) {
        try{
            Connection connection=DBUtil.getConnection();
            if (conn!=null) {
                System.out.println("数据库连接正常");
            }
            else {
                System.out.println("数据库连接异常");
            }
            connection.close();
        }
        catch (Exception e) {
            e.printStackTrace();
            // TODO: handle exception
        }
    }
}
