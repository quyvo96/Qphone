package controller.auth;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.OrderDAO;
import daos.UserDAO;
import models.Order;
import models.User;
import utils.StringUtil;


public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/views/auth/login.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		UserDAO userDAO = new UserDAO();
		String username = request.getParameter("username");
		String password = StringUtil.md5(request.getParameter("password"));
		User userInfo = userDAO.findByUserAndPassword(username, password);
		OrderDAO orderDAO = new OrderDAO();
		try {
			int id_user = userInfo.getId();
			if(userInfo != null) {
				Order getOrderCart = orderDAO.getOrderCart(id_user);
				if(getOrderCart == null) {
					Order orderCart = new Order(id_user,0,"",0,"","",1);
					int addOrderCart = orderDAO.addOrderCart(orderCart);
				}
				session.setAttribute("userInfo", userInfo);
				response.sendRedirect(request.getContextPath()+"/trang-chu.html");
				return;
			}
		}catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/login.html?msg=eror");
		}


	}

}
