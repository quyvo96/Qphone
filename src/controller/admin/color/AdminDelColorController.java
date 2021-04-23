package controller.admin.color;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.GlobalConstants;
import daos.ColorPhoneDAO;
import models.ColorPhone;
import utils.AuthUtil;


public class AdminDelColorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminDelColorController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id =Integer.parseInt(request.getParameter("id"));
			int idPhone = Integer.parseInt(request.getParameter("idPhone"));
			ColorPhoneDAO colorDAO = new ColorPhoneDAO();
			String rootPath = request.getServletContext().getRealPath("");
			String dirUploadPath = rootPath + "uploads";
			StringBuilder sb = new StringBuilder();
			ColorPhone getNamePicture = colorDAO.getById(id);
			String fileName =  getNamePicture.getPicture();
			String FilePath = sb.append(dirUploadPath).append(File.separator).append(fileName).toString();
		      try{
		          File file = new File(FilePath);
		          /*the delete() method returns true if the file is
		           * deleted successfully else it returns false
		           */
		          if(file.delete()){
		             System.out.println(file.getName() + " is deleted!");
		          }else{
		             System.out.println("Delete failed: File didn't delete");
		           }
		        }catch(Exception e){
		            System.out.println("Exception occurred");
		            e.printStackTrace();
		         }
			int countRecordDel = colorDAO.del(id);
			
			StringBuilder sbd = new StringBuilder();
			String url = " ";
			if(countRecordDel > 0) {
				//success
				
				url = sbd.append(request.getContextPath()).append("/admin/color/index?msg=").append(GlobalConstants.SUCCESS).append("&id=").append(idPhone).toString();
				response.sendRedirect(url);
				return;
			}
			//fail
			url = sbd.append(request.getContextPath()).append("/admin/color/index?msg=").append(GlobalConstants.ERROR).append("&id=").append(idPhone).toString();
			response.sendRedirect(url);
		}catch(Exception e) {

			response.sendRedirect(request.getContextPath()+"/error.html");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
