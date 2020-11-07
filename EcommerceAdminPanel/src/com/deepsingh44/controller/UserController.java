package com.deepsingh44.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.deepsingh44.dao.UserDao;
import com.deepsingh44.model.User;

@WebServlet("/user")
public class UserController extends HttpServlet {

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
				registerProcess(req, resp);
				break;
			case 2:
				loginProcess(req, resp);
				break;
			case 3:
				updateProcess(req, resp);
				break;
			}
		}
	}

	private void registerProcess(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");

		User user = new User();
		user.setName(name);
		user.setEmail(email);
		user.setPass(pass);
		user.setImage("");

		int i = UserDao.getUserDao().insert(user);

		if (i > 0) {
			resp.getWriter().print("Successfully Registerd.");
		} else {
			resp.getWriter().print("Registerd Failed.");
		}

	}

	private void loginProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");

		User user = UserDao.getUserDao().login(email, pass);
		if (user != null) {
			HttpSession hs = req.getSession();
			hs.setAttribute("user", user);
		} else {
			resp.getWriter().print("Invalid email id or password");
		}

	}

	private void updateProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
