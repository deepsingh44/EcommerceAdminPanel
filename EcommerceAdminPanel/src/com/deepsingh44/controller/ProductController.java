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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.deepsingh44.dao.ProductDao;
import com.deepsingh44.model.Product;

@WebServlet("/product")
public class ProductController extends HttpServlet {

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
				addProduct(req, resp);
				break;
			case 2:
				deleteProduct(req, resp);
				break;
			case 3:
				// updateProcess(req, resp);
				break;
			case 4:
				getAllProducts(req, resp);
				break;
			}
		}
	}

	private void getAllProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		getProducts(req, resp);
		resp.sendRedirect("productlist.jsp");
	}
	
	private void getProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Product> listproducts = ProductDao.getProductDao().getAllProducts();
		req.getSession(false).setAttribute("products", listproducts);
	} 

	private void addProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = "", quantity = "", price = "", date = "", category = "";

		String rootlocation = req.getServletContext().getRealPath("/");
		File folder = new File(rootlocation, "products");
		if (!folder.exists()) {
			folder.mkdir();
		}
		String filename = System.currentTimeMillis() + ".jpg";
		/*
		 * File catfolder = new File(folder, category.toLowerCase()); if
		 * (!folder.exists()) { folder.mkdir(); }
		 */

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

						if (item.getFieldName().equals("price")) {
							price = item.getString();
						}

						if (item.getFieldName().equals("quantity")) {
							quantity = item.getString();
						}
						if (item.getFieldName().equals("category")) {
							category = item.getString();
						}
						if (item.getFieldName().equals("date")) {
							date = item.getString();
						}
					} else {
						if (item.getSize() > 0) {
							try {
								File file = new File(folder + File.separator + filename);
								item.write(file);
							} catch (Exception e) {
								System.out.println(e);
							}
						}
					}
				}
			} catch (Exception e) {
				System.out.println(e);
			}

			System.out.println(name + quantity + category + price + date);
			System.out.println(folder.getAbsolutePath());

			Product product = new Product();
			product.setName(name);
			product.setCategory(category);
			product.setQuantity(Integer.parseInt(quantity));
			product.setPrice(Float.parseFloat(price));
			product.setMainimage(filename);
			product.setDate(date);

			int i = ProductDao.getProductDao().addProduct(product);
			if (i > 0) {
				resp.getWriter().print("Successfully Product Added");
			} else {
				resp.getWriter().print("Product Added Failed");
			}

		}
	}
	
	private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		int i=ProductDao.getProductDao().deleteProduct(id);
		if(i>0) {
			getProducts(req, resp);
			resp.getWriter().print("Successfully Deleted.");
		}else {
			resp.getWriter().print("Deleted Failed.");
		}
	}

}
