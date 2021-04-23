package controller.auth;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.GlobalConstants;
import daos.UserDAO;
import models.User;
import models.UserRole;
import utils.StringUtil;


public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RegisterController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/views/auth/register.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		UserDAO userDAO = new UserDAO();
		String userName = request.getParameter("userName");
		String fullName = request.getParameter("fullName");
		String password = StringUtil.md5(request.getParameter("password"));
		User user = new User(userName, password, fullName, new UserRole(3));
		int countRecordInserted = userDAO.add(user);
		StringBuilder sbd = new StringBuilder();
		String url = " ";
		if(countRecordInserted > 0) {
			url = sbd.append(request.getContextPath()).append("/login.html").toString();
			response.sendRedirect(url);
			return;
		}
		url = sbd.append(request.getContextPath()).append("/auth/register?msg=").append(GlobalConstants.ERROR).toString();
		response.sendRedirect(url);
	}

}
