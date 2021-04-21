package com.zyy.Dao;

import com.zyy.bean.BeanUser;
import com.zyy.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
	public boolean addUsersfromregister(BeanUser users){
		try {
			Connection conn= DBUtil.getConnection();
			String sql="insert into pet_user(username,userpassword,status) "+
			"values(?,?,?);";
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ptmt.setString(1, users.getUsername());
			ptmt.setString(2, users.getUserpwd());
			ptmt.setString(3, "信息管理员");
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean delUsers(int id) {
		try {
			Connection conn=DBUtil.getConnection();
			String sql="delete from pet_user where userid=? ";
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ptmt.setInt(1, id);
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean updateUsers(BeanUser users){
		try {
			Connection conn=DBUtil.getConnection();
			String sql="update pet_user set username=?,userpassword=?,status=?"
					+" where userid=?";
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ptmt.setString(1, users.getUsername());
			ptmt.setString(2, users.getUserpwd());
			ptmt.setString(3, users.getStatus());
			ptmt.setInt(4, users.getUserid());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public List<BeanUser> queryAll(){
		try {
			Connection conn=DBUtil.getConnection();
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery("select * from pet_user;");
			List<BeanUser> us=new ArrayList<>();
			BeanUser user=null;
			while (rs.next()) {
				user=new BeanUser();
				user.setUserid(rs.getInt("userid"));
				user.setUsername(rs.getString("username"));
				user.setUserpwd(rs.getString("userpassword"));
				user.setStatus(rs.getString("status"));
				us.add(user);
			}
			return us;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("SQL语句出现问题");
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static void main(String[] args) {
		UserDao dao=new UserDao();
		List<BeanUser> users=dao.queryAll();
		for(int i=0;i<users.size();i++){
			System.out.println(users.get(i).getUsername());
		}
	}
}
