package controller.admin.phone;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.GlobalConstants;
import daos.CategoryDAO;
import daos.PhoneDAO;
import models.Category;
import models.Phone;
import utils.AuthUtil;

@MultipartConfig
public class AdminAddPhoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminAddPhoneController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDAO categoryDAO = new CategoryDAO();
		List<Category> categories = categoryDAO.getCategories();
		request.setAttribute("categories", categories);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/phone/add.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PhoneDAO phoneDAO = new PhoneDAO();
		String name = request.getParameter("name");
		String preview_text = request.getParameter("preview_text");
		String description_text = request.getParameter("description_text");
		int catId = Integer.parseInt(request.getParameter("category"));
		double price = Double.parseDouble(request.getParameter("price"));
		Phone phone = new Phone(name, preview_text,description_text, price, new Category(catId));
		int countRecordInserted = phoneDAO.add(phone);
		StringBuilder sbd = new StringBuilder();
		String url = " ";
		if(countRecordInserted > 0) {
					//success
				
			url = sbd.append(request.getContextPath()).append("/admin/phone/index?msg=").append(GlobalConstants.SUCCESS).toString();
			response.sendRedirect(url);
			return;
		}
				//fail
		url = sbd.append(request.getContextPath()).append("/admin/phone/index?msg=").append(GlobalConstants.ERROR).toString();
		response.sendRedirect(url);
	}
}
