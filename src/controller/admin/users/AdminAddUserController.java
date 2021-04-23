package controller.admin.users;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import constants.GlobalConstants;
import daos.CategoryDAO;
import daos.UserDAO;
import daos.UserRoleDAO;
import models.Category;
import models.User;
import models.UserRole;
import utils.AuthUtil;
import utils.StringUtil;


public class AdminAddUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminAddUserController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StringBuilder sbd = new StringBuilder();
		String url = " ";
		HttpSession session = request.getSession();
    	if(session.getAttribute("userInfo") != null){
    		User userInfor = (User)session.getAttribute("userInfo");
    		int id_role = userInfor.getUserRole().getId();
    		if(id_role == 1) {
				UserRoleDAO roleDao = new UserRoleDAO();
				List<UserRole> listrole = roleDao.getUserRole();
				request.setAttribute("listrole", listrole);
				RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/add.jsp");
				rd.forward(request, response);
			}else {
	    		url = sbd.append(request.getContextPath()).append("/admin/user/index?msg=").append(GlobalConstants.ERROR).toString();
				response.sendRedirect(url);
    	}}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/login.html");
			return;
		}
		StringBuilder sbd = new StringBuilder();
		String url = " ";
    	if(session.getAttribute("userInfo") != null){
    		User userInfor = (User)session.getAttribute("userInfo");
    		int id_role = userInfor.getUserRole().getId();
    		if(id_role == 1) {

				UserDAO userDAO = new UserDAO();
				String userName = request.getParameter("userName");
				String fullName = request.getParameter("fullName");
				String password = StringUtil.md5(request.getParameter("password"));
				int role = Integer.parseInt(request.getParameter("role"));
				User user = new User(userName, password, fullName, new UserRole(role));
				int countRecordInserted = userDAO.add(user);

				if(countRecordInserted > 0) {
					//success
					
					url = sbd.append(request.getContextPath()).append("/quan-ly/nguoi-dung-").append(GlobalConstants.SUCCESS).append(".html").toString();
					response.sendRedirect(url);
					return;
				}
				//fail
				url = sbd.append(request.getContextPath()).append("/admin/user/index?msg=").append(GlobalConstants.ERROR).toString();
				response.sendRedirect(url);
			}else {
	    		url = sbd.append(request.getContextPath()).append("/admin/user/index?msg=").append(GlobalConstants.ERROR).toString();
				response.sendRedirect(url);
    	}
    	}
    }

}
