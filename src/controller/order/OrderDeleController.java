package controller.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.GlobalConstants;
import daos.OrderDetailDAO;
import utils.AuthUtil;


public class OrderDeleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public OrderDeleController() {
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
		try {
			int id =Integer.parseInt(request.getParameter("id"));
			OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
			int countRecordDel = orderDetailDAO.del(id);
			
			StringBuilder sbd = new StringBuilder();
			String url = " ";
			if(countRecordDel > 0) {
				//success
				
				url = sbd.append(request.getContextPath()).append("/order/cart?msg=").append(GlobalConstants.SUCCESS).toString();
				response.sendRedirect(url);
				return;
			}
			//fail
			url = sbd.append(request.getContextPath()).append("/order/cart?msg=").append(GlobalConstants.ERROR).toString();
			response.sendRedirect(url);
			return;
		}catch(Exception e) {

			response.sendRedirect(request.getContextPath()+"/error.html");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
