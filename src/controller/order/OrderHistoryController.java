package controller.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CategoryDAO;
import daos.OrderDAO;
import models.Category;
import models.Order;
import utils.AuthUtil;
import utils.CartUtil;


public class OrderHistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public OrderHistoryController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/login.html");
			return;
		}
		CategoryDAO cat = new CategoryDAO();
		List<Category> listCat = cat.getCategories();
		int numCart = CartUtil.getNumCart(request, response);
		int id_user = AuthUtil.getIdUser(request, response);
		OrderDAO orderDAO = new OrderDAO();
		
		List<Order> listOrder = orderDAO.getOrderNotCart(id_user);
	
		request.setAttribute("listCat", listCat);
		request.setAttribute("numCart", numCart);
		request.setAttribute("listOrder", listOrder);
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/history.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
