package com.deepsingh44.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.deepsingh44.dao.ProductDao;
import com.deepsingh44.dao.UserDao;
import com.deepsingh44.model.Product;
import com.deepsingh44.model.User;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet("/android")
public class AndroidCrud extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String opt = req.getParameter("opt");
		if (opt != null) {
			int choice = Integer.parseInt(opt);
			switch (choice) {
			case 1:
				login(req, resp);
				break;
			case 2:
				register(req, resp);
				break;
			case 3:
				profile(req, resp);
				break;
			case 4:
				order(req, resp);
				break;
			case 5:
				fetchMapData(req, resp);
				break;
			}
		}

		// 1:login
		// 2:register
		// 3:profile
		// 4:order

	}

	private void fetchMapData(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Map<String, List<Product>> mapsdata = ProductDao.getProductDao().getMapProducts();
		// we need to convert into JSON
		String json = new GsonBuilder().create().toJson(mapsdata);
		System.out.println(json);
		resp.getWriter().print(json);
	}

	private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		
		User user=UserDao.getUserDao().login(email, pass);
		if(user!=null) {
			resp.getWriter().print(new Gson().toJson(user));
		}
	}

	private void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		
		User user=new User();
		user.setName(name);
		user.setEmail(email);;
		user.setPass(pass);
		user.setImage("");
		
		int i=UserDao.getUserDao().insert(user);
		resp.getWriter().print((i>0)?"Successfully Registerd":"Registered Failed");
		
	}

	private void profile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	private void order(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
