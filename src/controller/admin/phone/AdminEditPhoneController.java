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
public class AdminEditPhoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminEditPhoneController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDAO categoryDAO = new CategoryDAO();
		List<Category> categories = categoryDAO.getCategories();
		request.setAttribute("categories", categories);
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			
			PhoneDAO phoneDAO = new PhoneDAO();
			Phone phone = phoneDAO.getById(id);
			StringBuilder sbd = new StringBuilder();
			String url = " ";
			if(phone != null) {
				request.setAttribute("categories", categories);
				request.setAttribute("phone", phone);
				request.setAttribute("id", id);
				RequestDispatcher rd = request.getRequestDispatcher("/views/admin/phone/edit.jsp");
				rd.forward(request, response);
				return;
			}
			url = sbd.append(request.getContextPath()).append("/admin/phone/index").toString();
			response.sendRedirect(url);
		}catch(Exception e) {

			response.sendRedirect(request.getContextPath()+"/error.html");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/login.html");
			return;
		}
		StringBuilder sbd = new StringBuilder();
		String url = " ";
		PhoneDAO phoneDAO = new PhoneDAO();
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String preview_text = request.getParameter("preview_text");
			String description_text = request.getParameter("description_text");
			int catId = Integer.parseInt(request.getParameter("category"));
			System.out.println(id);
			double price = Double.parseDouble(request.getParameter("price"));
			Phone phone = new Phone(id, name, preview_text,description_text, price, new Category(catId));
			int countRecordInserted = phoneDAO.edit(phone);
			System.out.println(countRecordInserted);

			if(countRecordInserted > 0) {
						//success
				url = sbd.append(request.getContextPath()).append("/quan-ly/dien-thoai-").append(GlobalConstants.SUCCESS).append(".html").toString();
				response.sendRedirect(url);
				return;
			}
					//fail
			url = sbd.append(request.getContextPath()).append("/quan-ly/dien-thoai-").append(GlobalConstants.ERROR).append(".html").toString();
			response.sendRedirect(url);
		}catch(Exception e) {

			response.sendRedirect(request.getContextPath()+"/error.html");
		}
	}
}
