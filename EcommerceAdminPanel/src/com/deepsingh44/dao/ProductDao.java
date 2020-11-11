package com.deepsingh44.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.deepsingh44.model.Product;

public class ProductDao {
	private static ProductDao productDao = new ProductDao();

	private ProductDao() {

	}

	public static ProductDao getProductDao() {
		return productDao;
	}

	public int addProduct(Product product) {
		int i = 0;
		try (Connection con = Dao.getConnection();) {
			PreparedStatement ps = con.prepareStatement("insert into product values(default,?,?,?,?,?,?)");
			ps.setString(1, product.getName());
			ps.setString(2, product.getCategory());
			ps.setInt(3, product.getQuantity());
			ps.setFloat(4, product.getPrice());
			ps.setString(5, product.getDate());
			ps.setString(6, product.getMainimage());
			i = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return i;
	}

	public List<Product> getAllProducts() {
		List<Product> listProducts = new ArrayList<>();
		try (Connection con = Dao.getConnection();) {
			PreparedStatement ps = con.prepareStatement("select * from product");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setCategory(rs.getString(3));
				product.setQuantity(rs.getInt(4));
				product.setPrice(rs.getFloat(5));
				product.setDate(rs.getString(6));
				product.setMainimage(rs.getString(7));
				listProducts.add(product);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return listProducts;
	}
	
	public int deleteProduct(String id) {
		int i = 0;
		try (Connection con = Dao.getConnection();) {
			PreparedStatement ps = con.prepareStatement("delete from product where id=?");
			ps.setInt(1, Integer.parseInt(id));
			i = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return i;
	}


}
