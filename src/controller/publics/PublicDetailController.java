package controller.publics;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.AdverDAO;
import daos.CategoryDAO;
import daos.ColorPhoneDAO;
import daos.ConfiDAO;
import daos.OrderDAO;
import daos.OrderDetailDAO;
import daos.PhoneDAO;
import models.Adver;
import models.Category;
import models.ColorPhone;
import models.Confi;
import models.Order;
import models.OrderDetail;
import models.Phone;
import utils.AuthUtil;
import utils.CartUtil;


public class PublicDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PublicDetailController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//quang cao
		AdverDAO adverDAO = new AdverDAO();
		List<Adver> listadver = adverDAO.getAll();
		request.setAttribute("listadver", listadver);
		//-------------------
		CategoryDAO cat = new CategoryDAO();
		List<Category> listCat = cat.getCategories();

		try {
			int numCart = CartUtil.getNumCart(request, response);
			int id = Integer.parseInt(request.getParameter("id"));
			PhoneDAO phoneDAO = new PhoneDAO();
			Phone phone = phoneDAO.getById(id);
			ColorPhoneDAO colorDAO = new ColorPhoneDAO();
			List<ColorPhone> listcolor = colorDAO.getAll(id);
			ConfiDAO confiDAO = new ConfiDAO();
			Confi confi = confiDAO.getConfi(id);
			int numcolor = colorDAO.numerOfItems(id);
			request.setAttribute("confi", confi);
			request.setAttribute("listCat", listCat);
			request.setAttribute("numCart", numCart);
			request.setAttribute("phone", phone);
			request.setAttribute("numcolor", numcolor);
			request.setAttribute("listcolor", listcolor);
			RequestDispatcher rd = request.getRequestDispatcher("views/public/detail.jsp");
			rd.forward(request, response);
			return;
		}catch(Exception e) {

			response.sendRedirect(request.getContextPath()+"/trang-chu/error.html");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/login.html");
			return;
		}
		int id_user = AuthUtil.getIdUser(request, response);
		int id_phone = Integer.parseInt(request.getParameter("id_phone"));
		int numphone = Integer.parseInt(request.getParameter("numphone"));
		String color = request.getParameter("color");
		OrderDAO orderDAO = new OrderDAO();
		OrderDetailDAO orderdetailDAO = new OrderDetailDAO();
		Order getOrderCart = orderDAO.getOrderCart(id_user);
		int id_order = getOrderCart.getId_order();
		
		OrderDetail numDetail = orderdetailDAO.findItems(id_order, id_phone, color);
		if(numDetail != null) {
			int id_detail = numDetail.getId_detail();
			int num = numDetail.getNumber();
			int add = orderdetailDAO.addNum(id_detail, num);
		}else {
			OrderDetail orderDetail = new OrderDetail(id_order,"",0, numphone, color, new Phone(id_phone));
			int addCart = orderdetailDAO.add(orderDetail);
		}

		int numCart = orderdetailDAO.numerOfItems(id_order);
		out.print(numCart);

	}

}
