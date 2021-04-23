package controller.admin.phone;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.GlobalConstants;
import daos.PhoneDAO;
import utils.AuthUtil;


public class AdminDelPhoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminDelPhoneController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id =Integer.parseInt(request.getParameter("id"));
			PhoneDAO phoneDAO = new PhoneDAO();
			int countRecordDel = phoneDAO.del(id);
			
			StringBuilder sbd = new StringBuilder();
			String url = " ";
			if(countRecordDel > 0) {
				//success
				
				url = sbd.append(request.getContextPath()).append("/quan-ly/dien-thoai-").append(GlobalConstants.SUCCESS).append(".html").toString();
				response.sendRedirect(url);
				return;
			}
			//fail
			url = sbd.append(request.getContextPath()).append("/quan-ly/dien-thoai-").append(GlobalConstants.ERROR).append(".html").toString();
			response.sendRedirect(url);
		}catch(Exception e) {

			response.sendRedirect(request.getContextPath()+"/error.html");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
