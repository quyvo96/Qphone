package controller.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CategoryDAO;
import daos.PhoneDAO;
import models.Category;
import models.Phone;
import utils.CartUtil;


public class PublicCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PublicCatController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PhoneDAO phoneDAO = new PhoneDAO();
		CategoryDAO catDAO = new CategoryDAO();
		//Phaan trang
		int idpage = 0;
		int idCat = Integer.parseInt(request.getParameter("idCat"));
		try {
			idpage = Integer.parseInt(request.getParameter("idpage"));
		}catch (Exception e) {
			
		}
		int offset = 0 + idpage;
		List<Phone> listphone = phoneDAO.getAllPageAndIdCat(offset,idCat);
		//--------------
		//search

		//*****
		List<Category> listCat = catDAO.getCategories();
		
		//List<Phone> listphone = phoneDAO.getAll();

		int numCart = CartUtil.getNumCart(request, response);
		String nameCat = catDAO.getById(idCat).getName();
		request.setAttribute("numCart", numCart);
		request.setAttribute("idpage", idpage);
		request.setAttribute("idCat", idCat);
		request.setAttribute("nameCat", nameCat);
		request.setAttribute("listCat", listCat);
		request.setAttribute("listphone", listphone);
		//System.out.println(request.getServletContext().getRealPath(""));
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/cat.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
