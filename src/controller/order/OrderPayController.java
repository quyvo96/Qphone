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
import daos.OrderDetailDAO;
import models.Category;
import models.Order;
import models.OrderDetail;
import utils.AuthUtil;
import utils.CartUtil;


public class OrderPayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public OrderPayController() {
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
		OrderDetailDAO orderdetailDAO = new OrderDetailDAO();
		Order getOrderCart = orderDAO.getOrderCart(id_user);
		int id_order = getOrderCart.getId_order();
		List<OrderDetail> listorderdetail = orderdetailDAO.getAllByIdOrder(id_order);
		request.setAttribute("getOrderCart", getOrderCart);
		request.setAttribute("listCat", listCat);
		request.setAttribute("numCart", numCart);
		request.setAttribute("listorderdetail", listorderdetail);
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/pay.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
