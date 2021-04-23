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
import daos.UserDAO;
import daos.UserRoleDAO;
import models.User;
import models.UserRole;
import utils.AuthUtil;
import utils.StringUtil;


public class AdminEditUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminEditUserController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StringBuilder sbd = new StringBuilder();
		String url = " ";
		HttpSession session = request.getSession();
    	if(session.getAttribute("userInfo") != null){
    		User userInfor = (User)session.getAttribute("userInfo");
    		int id_role = userInfor.getUserRole().getId();
    		
    			UserRoleDAO roleDao = new UserRoleDAO();
    			List<UserRole> listrole = roleDao.getUserRole();
    			try {
    				int id = Integer.parseInt(request.getParameter("id"));
    				UserDAO userDAO = new UserDAO();
    				User user =userDAO.getById(id);
    				int role = user.getUserRole().getId();
    				if((id_role == 1 || (id_role == 2 && role == id_role)) && user != null) {
	    				request.setAttribute("user", user);
	    				request.setAttribute("listrole", listrole);
	    				RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/edit.jsp");
	    				rd.forward(request, response);
	    				return;

    				}else {
    		    		url = sbd.append(request.getContextPath()).append("/admin/user/index?msg=").append(GlobalConstants.ERROR).toString();
    					response.sendRedirect(url);
    				}
    			}catch(Exception e) {

    				response.sendRedirect(request.getContextPath()+"/error.html");
    			}

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
		HttpSession session = request.getSession();
    	if(session.getAttribute("userInfo") != null){
    		User userInfor = (User)session.getAttribute("userInfo");
    		int id_role = userInfor.getUserRole().getId();
    		
    			UserDAO userDAO = new UserDAO();
    			try {
    				int id = Integer.parseInt(request.getParameter("id"));
    				String username = request.getParameter("userName");
    				String fullname = request.getParameter("fullName");
    				String password = StringUtil.md5(request.getParameter("password"));
    				int role = Integer.parseInt(request.getParameter("role"));
    				if(id_role == 1 || (id_role == 2 && role == id_role)) {
	    				User user = new User(id, username, password, fullname, new UserRole(role));
	    				int countRecordEdit = userDAO.edit(user);
	    				if(countRecordEdit > 0) {
	    					//success
	    					
	    					url = sbd.append(request.getContextPath()).append("/quan-ly/nguoi-dung-").append(GlobalConstants.SUCCESS).append(".html").toString();
	    					response.sendRedirect(url);
	    					return;
	    				}
	    				//fail
	    				url = sbd.append(request.getContextPath()).append("/quan-ly/nguoi-dung-").append(GlobalConstants.ERROR).append(".html").toString();
	    				response.sendRedirect(url);
    				}else {
    		    		url = sbd.append(request.getContextPath()).append("/admin/user/index?msg=").append(GlobalConstants.ERROR).toString();
    					response.sendRedirect(url);
    					}
    			}catch(Exception e) {

    				response.sendRedirect(request.getContextPath()+"/error.html");
    			}

			}

	}
}
