package utils;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.OrderDAO;
import daos.OrderDetailDAO;
import models.Order;
import models.User;

public class CartUtil {
	
	public static Integer getNumCart(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		int num = 0;
		if(session.getAttribute("userInfo") != null) {
			User userInfor = (User)session.getAttribute("userInfo");
			int id_user = userInfor.getId();
			OrderDAO orderDAO = new OrderDAO();
			OrderDetailDAO orderdetailDAO = new OrderDetailDAO();
			Order getOrderCart = orderDAO.getOrderCart(id_user);
			int id_order = getOrderCart.getId_order();
			num = orderdetailDAO.numerOfItems(id_order);	
		}
		return num;
	}
}
