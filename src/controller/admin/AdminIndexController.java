package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CategoryDAO;
import daos.PhoneDAO;
import daos.UserDAO;
import models.Category;
import models.Phone;
import models.User;
import utils.AuthUtil;


public class AdminIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminIndexController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		CategoryDAO cats = new CategoryDAO();
		List<Category> cat = cats.getCategories();
		int lenCat = cat.size();
		PhoneDAO phone = new PhoneDAO();
		List<Phone> listphone = phone.getAll();
		int lenphone = listphone.size();
		UserDAO users = new UserDAO();
		List<User> user = users.getUser();
		int lenUser = user.size();
		
		request.setAttribute("lenCat", lenCat);
		request.setAttribute("lenphone", lenphone);
		request.setAttribute("lenUser", lenUser);

		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/index.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
