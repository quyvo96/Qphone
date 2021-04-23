package controller.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.GlobalConstants;
import daos.CategoryDAO;
import daos.ContactDAO;
import models.Category;
import models.Contact;

public class PublicContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PublicContactController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		CategoryDAO cat = new CategoryDAO();
		List<Category> listCat = cat.getCategories();
		request.setAttribute("listCat", listCat);
		RequestDispatcher rd = request.getRequestDispatcher("views/public/contact.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String website = request.getParameter("website");
		String message = request.getParameter("message");
		ContactDAO contact = new ContactDAO();
		Contact con = new Contact(name, email, website, message);
		int countRecordSubmit = contact.submit(con);
		StringBuilder sbd = new StringBuilder();
		String url = " ";
		if(countRecordSubmit > 0) {
			//success
			url = sbd.append(request.getContextPath()).append("/lien-he-").append(GlobalConstants.SUCCESS).append(".html").toString();
			response.sendRedirect(url);
			return;
		}
		//fail
		url = sbd.append(request.getContextPath()).append("/lien-he-").append(GlobalConstants.ERROR).append(".html").toString();
		response.sendRedirect(url);
	
	}

}
