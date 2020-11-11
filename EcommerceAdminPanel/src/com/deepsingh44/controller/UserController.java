package com.deepsingh44.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
			case 4:
				HttpSession hs = req.getSession(false);
				hs.removeAttribute("user");
				hs.removeAttribute("products");
				hs.invalidate();
				resp.sendRedirect("index.jsp");
				break;
			}
		}
	}

	private void registerProcess(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		System.out.println(name + "" + email + "" + pass);
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
		String name = null;
		String email = null;
		String pass = null;
		String filename = null;
		String rootlocation = req.getServletContext().getRealPath("/");
		File folder = new File(rootlocation, "profileimages");
		if (!folder.exists()) {
			folder.mkdir();
		}

		HttpSession hs = req.getSession(false);
		User user = (User) hs.getAttribute("user");

		filename = user.getEmail() + ".jpg";

		if (ServletFileUpload.isMultipartContent(req)) {
			DiskFileItemFactory fileFactory = new DiskFileItemFactory();
			fileFactory.setRepository(folder);
			ServletFileUpload upload = new ServletFileUpload(fileFactory);

			try {
				List<FileItem> fileItemsList = upload.parseRequest(req);
				Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();

				while (fileItemsIterator.hasNext()) {
					FileItem item = fileItemsIterator.next();
					if (item.isFormField()) {
						// get name email password here

						if (item.getFieldName().equals("name")) {
							name = item.getString();
						}

						if (item.getFieldName().equals("email")) {
							email = item.getString();
						}

						if (item.getFieldName().equals("pass")) {
							pass = item.getString();
						}
					} else {
						// upload file code here
						if (item.getSize() > 0) {
							try {
								File file = new File(folder + File.separator + filename);
								if (file.exists()) {
									file.delete();
								}
								item.write(file);
							} catch (Exception e) {
								System.out.println(e);
							}
						}
					}
				}
				user.setName(name);
				user.setPass(pass);
				user.setImage(filename);

				int i = UserDao.getUserDao().update(user);
				if (i > 0) {
					resp.getWriter().print("Successsfully update");
				} else {
					resp.getWriter().print("Updatation Failed");
				}

			} catch (FileUploadException e) {
				System.out.println(e);
			}
		}

		System.out.println(rootlocation);

	}

}
