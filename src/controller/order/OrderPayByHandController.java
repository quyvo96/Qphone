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


public class OrderPayByHandController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public OrderPayByHandController() {
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
		OrderDAO orderDAO = new OrderDAO();
		
		List<Category> listCat = cat.getCategories();

		int id_user = AuthUtil.getIdUser(request, response);
		Order getOrderCart = orderDAO.getOrderCart(id_user);
		int id_order = getOrderCart.getId_order();
		Order orderByHand = new Order(id_order,2,1);
		int addOrderCart = orderDAO.updateStatus(orderByHand);
		OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
		List<OrderDetail> listorderdetail = orderDetailDAO.getAllByIdOrder(id_order);
		int update = 0;
		for(OrderDetail o:listorderdetail) {
			int id_detail = o.getId_detail();
			String name_phone = o.getPhone().getName();
			double price = o.getPhone().getPrice();
			OrderDetail orderDetail = new OrderDetail(id_detail, name_phone, price);
			 update = orderDetailDAO.edit(orderDetail);
		}
		if(addOrderCart>0 && update!=0) {
			Order CheckOrderCart = orderDAO.getOrderCart(id_user);
			if(CheckOrderCart == null) {
				Order newOrderCart = new Order(id_user,0,"",0,"","",1);
				int addNewOrderCart = orderDAO.addOrderCart(newOrderCart);
				if(addNewOrderCart>0) {
					List<Order> listOrder = orderDAO.getOrderNotCart(id_user);
					int numCart = CartUtil.getNumCart(request, response);
					request.setAttribute("listCat", listCat);
					request.setAttribute("numCart", numCart);
					request.setAttribute("listOrder", listOrder);
					RequestDispatcher rd = request.getRequestDispatcher("/views/public/history.jsp");
					rd.forward(request, response);
					return;
				}
			}
		}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
