package com.deepsingh44.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.deepsingh44.model.User;

public class UserDao {

	private static UserDao userDao = new UserDao();

	private UserDao() {
	}

	public static UserDao getUserDao() {
		return userDao;
	}

	public int insert(User user) {
		int i = 0;
		try (Connection con = Dao.getConnection();) {
			PreparedStatement ps = con.prepareStatement("insert into user values(?,?,?,?)");
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPass());
			ps.setString(4, user.getImage());
			i = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return i;
	}

	public User login(String email, String pass) {
		User user = null;
		try (Connection con = Dao.getConnection();) {
			PreparedStatement ps = con.prepareStatement("select * from user where email=? and pass=?");
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setName(rs.getString(1));
				user.setEmail(rs.getString(2));
				user.setPass(rs.getString(3));
				user.setImage(rs.getString(4));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return user;
	}

}
