package controller.admin.order;

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
import daos.PhoneDAO;
import daos.StatusDAO;
import models.Category;
import models.Order;
import models.Phone;
import models.Status;
import utils.AuthUtil;


public class AdminIndexOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminIndexOrderController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDAO orderDAO = new OrderDAO();
		StatusDAO statusDAO = new StatusDAO();
		//Phaan trang
		int idStatus = 0;
		if(!"".equals(request.getParameter("idStatus")) && request.getParameter("idStatus") != null) {
			try {
				idStatus = Integer.parseInt(request.getParameter("idStatus"));
			} catch (Exception e) {
				response.sendRedirect(request.getContextPath()+"/error.html");
				return;
			}
		}
		int numerOfItems = orderDAO.numerOfItems();
		int numerOfPages = (int)Math.ceil((float)((float)numerOfItems/(float)GlobalConstants.NUMBER_PER_PAGE));
		int currentPage = 1;
		if(!"".equals(request.getParameter("page")) && request.getParameter("page") != null) {
			try {
				currentPage = Integer.parseInt(request.getParameter("page"));
			} catch (Exception e) {
				response.sendRedirect(request.getContextPath()+"/error.html");
				return;
			}
		}
		if(currentPage < 1 || currentPage > numerOfPages){
			response.sendRedirect(request.getContextPath()+"/error.html");
			return;
		}
		int offset = (currentPage-1)*GlobalConstants.NUMBER_PER_PAGE;
		if(currentPage > numerOfPages || currentPage < 1) {
			currentPage = 1;
		}
		List<Order> listorder = orderDAO.getAllPagination(offset, idStatus);
		//--------------
		//search
		int idOrder = 0;

		if(request.getParameter("idOrder") != null) {
			idOrder = Integer.parseInt(request.getParameter("idOrder"));
		}

		List<Order> listSearch = orderDAO.findAllByIdOder(idOrder);
		//*****
		List<Status> listStatus = statusDAO.getStatus();
		
		//List<Phone> listphone = phoneDAO.getAll();
		
		if(idOrder > 0) {
			listorder = listSearch;
		}
		
		request.setAttribute("numerOfItems", numerOfItems);
		request.setAttribute("numerOfPages", numerOfPages);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("listStatus", listStatus);
		request.setAttribute("listorder", listorder);
		request.setAttribute("idOrder", idOrder);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/order/index.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
