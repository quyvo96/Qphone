package controller.admin.phone;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.GlobalConstants;
import daos.CategoryDAO;
import daos.PhoneDAO;
import models.Category;
import models.Phone;
import utils.AuthUtil;


public class AdminIndexPhoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminIndexPhoneController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PhoneDAO phoneDAO = new PhoneDAO();
		CategoryDAO catDAO = new CategoryDAO();
		//Phaan trang
		int idCat = 0;
		if(!"".equals(request.getParameter("idCat")) && request.getParameter("idCat") != null) {
			try {
				idCat = Integer.parseInt(request.getParameter("idCat"));
			} catch (Exception e) {
				response.sendRedirect(request.getContextPath()+"/error.html");
				return;
			}
		}
		int numerOfItems = phoneDAO.numerOfItems();
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
		List<Phone> listphone = phoneDAO.getAllPagination(offset, idCat);
		//--------------
		//search
		String sname = "";
		int scat = 0;
		if(!"".equals(request.getParameter("sname"))&&request.getParameter("sname") != null) {
			 sname = request.getParameter("sname");
		}
		if(request.getParameter("scat") != null) {
			scat = Integer.parseInt(request.getParameter("scat"));
		}

		List<Phone> listSearch = phoneDAO.findAllByName(sname);
		//*****
		List<Category> listCat = catDAO.getCategories();
		
		//List<Phone> listphone = phoneDAO.getAll();
		
		if(scat > 0 || !"".equals(sname)) {
			listphone = listSearch;
		}
		
		request.setAttribute("numerOfItems", numerOfItems);
		request.setAttribute("numerOfPages", numerOfPages);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("listCat", listCat);
		request.setAttribute("listphone", listphone);
		request.setAttribute("idCat", idCat);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/phone/index.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
