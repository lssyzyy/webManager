package com.zyy.Dao;

import com.zyy.bean.BeanPet;
import com.zyy.bean.BeanUser;
import com.zyy.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PetDao {
	public boolean addPetsInfo(BeanPet pets){
		try {
			Connection conn= DBUtil.getConnection();
			String sql="insert into pet_info(petimg,pettitle,pettopic,petprice,petcontent,petyimiao) "+
			"values(?,?,?,?,?,?);";
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ptmt.setString(1, "暂无");
			ptmt.setString(2, pets.getPettitle());
			ptmt.setString(3, pets.getPettopic());
			ptmt.setString(4, pets.getPetprice());
			ptmt.setString(5, pets.getPetcontent());
			ptmt.setString(6, pets.getPetyimiao());
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
	public boolean delPets(int id) {
		try {
			Connection conn=DBUtil.getConnection();
			String sql="delete from pet_info where petid=? ";
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
	public List<BeanPet> queryAll(){
		try {
			Connection conn=DBUtil.getConnection();
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery("select * from pet_info;");
			List<BeanPet> us=new ArrayList<>();
			BeanPet pet=null;
			while (rs.next()) {
				pet=new BeanPet();
				pet.setPetid(rs.getInt("petid"));
				pet.setPetimg(rs.getString("petimg"));
				pet.setPettitle(rs.getString("pettitle"));
				pet.setPettopic(rs.getString("pettopic"));
				pet.setPetprice(rs.getString("petprice"));
				pet.setPetcontent(rs.getString("petcontent"));
				pet.setPetyimiao(rs.getString("petyimiao"));
				us.add(pet);
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
		PetDao dao=new PetDao();
		List<BeanPet> pets=dao.queryAll();
		for(int i=0;i<pets.size();i++){
			System.out.println(pets.get(i).getPettitle());
		}
	}
}
