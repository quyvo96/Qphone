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


public class OrderIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public OrderIndexController() {
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
		request.setAttribute("id_order", id_order);
		request.setAttribute("listCat", listCat);
		request.setAttribute("numCart", numCart);
		request.setAttribute("listorderdetail", listorderdetail);
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/cart.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/login.html");
			return;
		}
		StringBuilder sbd = new StringBuilder();
		String url = "";
		int id_user = AuthUtil.getIdUser(request, response);
		double sumPirce = Double.parseDouble(request.getParameter("sumPirce"));
		int numberPhone = Integer.parseInt(request.getParameter("numberPhone"));
		String nameUser = request.getParameter("nameUser");
		String addres = request.getParameter("addres");
		String other = request.getParameter("other");
		OrderDAO orderDAO = new OrderDAO();
		OrderDetailDAO orderdetailDAO = new OrderDetailDAO();
		Order getOrderCart = orderDAO.getOrderCart(id_user);
		int id_order = getOrderCart.getId_order();
		Order orderCart = new Order(id_order,id_user,sumPirce,nameUser,numberPhone,addres,other,1);
		int addOrderCart = orderDAO.updateOrderCart(orderCart);
		if(addOrderCart > 0) {

			url = sbd.append(request.getContextPath()).append("/thanh-toan.html").toString();
			response.sendRedirect(url);
			return;
		}
	}
}
