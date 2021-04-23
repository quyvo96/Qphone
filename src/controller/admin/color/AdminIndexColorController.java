package controller.admin.color;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CategoryDAO;
import daos.ColorPhoneDAO;
import daos.PhoneDAO;
import models.Category;
import models.ColorPhone;
import models.Phone;
import utils.AuthUtil;


public class AdminIndexColorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminIndexColorController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		ColorPhoneDAO colorDAO = new ColorPhoneDAO();
		PhoneDAO phoneDAO = new PhoneDAO();
		Phone phone = phoneDAO.getById(id);
		List<ColorPhone> listcolor = colorDAO.getAll(id);
		request.setAttribute("phone", phone);
		request.setAttribute("listcolor", listcolor);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/colors/index.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
