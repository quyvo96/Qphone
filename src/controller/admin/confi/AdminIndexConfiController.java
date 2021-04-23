package controller.admin.confi;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.GlobalConstants;
import daos.ConfiDAO;
import daos.PhoneDAO;
import models.Confi;
import models.Phone;
import utils.AuthUtil;


public class AdminIndexConfiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminIndexConfiController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		int id = Integer.parseInt(request.getParameter("id"));
		PhoneDAO phoneDAO = new PhoneDAO();
		ConfiDAO confiDAO = new ConfiDAO();
		try {
			Confi confi1 = new Confi("thay đổi", "thay đổi", "thay đổi", "thay đổi", "thay đổi", "thay đổi", "thay đổi", "thay đổi", "thay đổi", id);
			int countRecordInserted1 = confiDAO.add(confi1);
		}catch(Exception e) {
			
		}

		Phone phone = phoneDAO.getById(id);
		Confi confi = confiDAO.getConfi(id);
		request.setAttribute("phone", phone);
		request.setAttribute("confi", confi);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/confi/index.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}
		int idPhone = Integer.parseInt(request.getParameter("idPhone"));
		ConfiDAO confiDAO = new ConfiDAO();
		String screen = request.getParameter("screen");
		String operating_system = request.getParameter("operating_system");
		String rear_camera = request.getParameter("rear_camera");
		String front_camera = request.getParameter("front_camera");
		String cpu = request.getParameter("cpu");
		String ram = request.getParameter("ram");
		String internal_memory = request.getParameter("internal_memory");
		String sim = request.getParameter("sim");
		String pin = request.getParameter("pin");
		
		Confi confi = new Confi(screen, operating_system, rear_camera, front_camera, cpu, ram, internal_memory, sim, pin, idPhone);
		int countRecordInserted = confiDAO.edit(confi);
		StringBuilder sbd = new StringBuilder();
		String url = " ";
		if(countRecordInserted > 0) {
			//success
			url = sbd.append(request.getContextPath()).append("/admin/phone/index?msg=").append(GlobalConstants.SUCCESS).toString();
			response.sendRedirect(url);
			return;
		}
				//fail
		url = sbd.append(request.getContextPath()).append("/admin/phone/index?msg=").append(GlobalConstants.ERROR).toString();
		response.sendRedirect(url);
	}

}
