package controller.auth;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import constants.GlobalConstants;
import daos.UserDAO;
import daos.UserRoleDAO;
import models.User;
import models.UserRole;
import utils.AuthUtil;
import utils.StringUtil;


public class SettingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SettingController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher("/views/auth/setting_user.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		UserDAO userDAO = new UserDAO();
		int id_user = AuthUtil.getIdUser(request, response);
		int id_role = AuthUtil.getIdRoleUser(request, response);
		String userName = request.getParameter("userName");
		String fullName = request.getParameter("fullName");
		String password = StringUtil.md5(request.getParameter("password"));
		String repassword = StringUtil.md5(request.getParameter("repassword"));
		User user = new User(userName, password, fullName, new UserRole(3));
		int countRecordInserted = userDAO.add(user);
		StringBuilder sbd = new StringBuilder();
		String url = " ";
		if(countRecordInserted > 0) {
			url = sbd.append(request.getContextPath()).append("/login.html").toString();
			response.sendRedirect(url);
			return;
		}
		url = sbd.append(request.getContextPath()).append("/auth/setting?msg=").append(GlobalConstants.ERROR).toString();
		response.sendRedirect(url);
	}

}
