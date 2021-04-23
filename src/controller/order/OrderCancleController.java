package controller.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.GlobalConstants;
import daos.CategoryDAO;
import daos.OrderDAO;
import daos.OrderDetailDAO;
import models.Category;
import models.Order;
import models.OrderDetail;
import utils.AuthUtil;
import utils.CartUtil;


public class OrderCancleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public OrderCancleController() {
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
		OrderDAO orderDAO = new OrderDAO();
		StringBuilder sbd = new StringBuilder();
		String url = " ";
		int id_order = Integer.parseInt(request.getParameter("id_order"));
		int update = orderDAO.cancelOrder(id_order);
		if(update > 0) {
					//success
			url = sbd.append(request.getContextPath()).append("/lich-su-mua-hang-").append(GlobalConstants.SUCCESS).append(".html").toString();
			response.sendRedirect(url);
			return;
		}
				//fail
		url = sbd.append(request.getContextPath()).append("/lich-su-mua-hang-").append(GlobalConstants.ERROR).append(".html").toString();
		response.sendRedirect(url);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
