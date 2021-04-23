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


public class PublicIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PublicIndexController() {
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
		try {
			idpage = Integer.parseInt(request.getParameter("idpage"));
		}catch (Exception e) {
			
		}
		int offset = 0 + idpage;
		List<Phone> listphone = phoneDAO.getAllPage(offset);
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
		int numCart = CartUtil.getNumCart(request, response);
		request.setAttribute("numCart", numCart);
		request.setAttribute("idpage", idpage);
		request.setAttribute("listCat", listCat);
		request.setAttribute("listphone", listphone);
		//System.out.println(request.getServletContext().getRealPath(""));
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/index.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
