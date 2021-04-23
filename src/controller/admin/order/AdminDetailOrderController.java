package controller.admin.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.GlobalConstants;
import daos.OrderDAO;
import daos.OrderDetailDAO;
import daos.StatusDAO;
import daos.StatusPayDAO;
import models.Order;
import models.OrderDetail;
import models.Status;
import models.StatusPay;
import utils.AuthUtil;


public class AdminDetailOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminDetailOrderController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		int id_order = Integer.parseInt(request.getParameter("id_order"));
		OrderDAO orderDAO = new OrderDAO();
		OrderDetailDAO orderdetailDAO = new OrderDetailDAO();
		Order getOrderCart = orderDAO.getOrderByIdOrder(id_order);
		List<OrderDetail> listorderdetail = orderdetailDAO.getAllByIdOrder(id_order);
		request.setAttribute("getOrderCart", getOrderCart);
		request.setAttribute("listorderdetail", listorderdetail);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/order/detail.jsp");
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
		OrderDAO orderDAO = new OrderDAO();
		StringBuilder sbd = new StringBuilder();
		String url = " ";
		int id_order = Integer.parseInt(request.getParameter("id_order"));
		Order getOrderCart = orderDAO.getOrderByIdOrder(id_order);
		int id_status = getOrderCart.getStatus();
		int id_pay = getOrderCart.getStatus_pay();
		if(id_status == 2){
			id_status = 3;
		}else if(id_status == 3){
			id_status = 4;
			id_pay = 2;
		}else if(id_status == 5){
			id_status = 6;
			if(id_pay == 2) {
				id_pay = 3;
			}
		}
		Order updateOrder = new Order(id_order, id_status, id_pay);
		int update = orderDAO.updateStatus(updateOrder);
		if(update > 0) {
					//success
			url = sbd.append(request.getContextPath()).append("/quan-ly/don-hang-").append(GlobalConstants.SUCCESS).append(".html").toString();
			response.sendRedirect(url);
			return;
		}
				//fail
		url = sbd.append(request.getContextPath()).append("/quan-ly/don-hang-").append(GlobalConstants.ERROR).append(".html").toString();
		response.sendRedirect(url);
	}

}
