package controller.admin.color;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import constants.GlobalConstants;
import daos.ColorPhoneDAO;
import daos.PhoneDAO;
import models.ColorPhone;
import models.Phone;
import utils.AuthUtil;

@MultipartConfig
public class AdminEditColorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminEditColorController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		int idPhone = Integer.parseInt(request.getParameter("idPhone"));
		ColorPhoneDAO colorsDAO = new ColorPhoneDAO();
		ColorPhone colors = colorsDAO.getById(id);
		PhoneDAO phoneDAO = new PhoneDAO();
		Phone phone = phoneDAO.getById(idPhone);
		request.setAttribute("phone", phone);
		request.setAttribute("colors", colors);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/colors/edit.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		int id = Integer.parseInt(request.getParameter("id"));
		ColorPhoneDAO colorDAO = new ColorPhoneDAO();
		String color = request.getParameter("color");
		Part filePart = request.getPart("picture");
		int idPhone = Integer.parseInt(request.getParameter("idPhone"));
		String fileName = filePart.getSubmittedFileName();
		ColorPhone getNamePicture = colorDAO.getById(id);
		System.out.println(getNamePicture);
		if (!"".equals(fileName)) {
			 String rootPath = request.getServletContext().getRealPath("");
			 String fileNameOld =  getNamePicture.getPicture();
			 String dirUploadPath = rootPath + "uploads";
			 File createDir = new File(dirUploadPath);
			 if (!createDir.exists()) {
				 createDir.mkdir();
			 }
			 //string, string builder
			 StringBuilder sb = new StringBuilder();
			 StringBuilder sbOld = new StringBuilder();
			 StringBuilder sbNew = new StringBuilder();
			 LocalDateTime myDatePictuer = LocalDateTime.now();  
			 DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd_MM_yy_HH_mm_ss");  
			 String formattedDate = myDatePictuer.format(myFormatObj);
			 String newFileName = idPhone + formattedDate + ".jpg";
			 String newFilePath = sbNew.append(dirUploadPath).append(File.separator).append(newFileName).toString();
			 String filePath = sb.append(dirUploadPath).append(File.separator).append(fileName).toString();
			 String filePathOld = sbOld.append(dirUploadPath).append(File.separator).append(fileNameOld).toString();
		      try{
		    	  	File oldFile = new File(filePath);
		    	  	File newFile = new File(newFilePath);
		    		if (oldFile.renameTo(newFile)) {
		    			System.out.println("Ä?á»•i tÃªn thÃ nh cÃ´ng!");
		    		} else {
		    			System.out.println("Ä?á»•i tÃªn bá»‹ lá»—i!");
		    		}
		    		File file = new File(filePathOld);
			        if(file.delete()){
				             System.out.println(file.getName() + " is deleted!");
				          }else{
				             System.out.println("Delete failed: File didn't delete");
				           }
		        }catch(Exception e){
		            System.out.println("Exception occurred");
		            e.printStackTrace();
		         }
			 filePart.write(newFilePath); 
			 fileName = newFileName;  
			 System.out.println("dirUploadPath :" + dirUploadPath);
		 }else {
			 fileName =  getNamePicture.getPicture();
		 }
		ColorPhone colorphone = new ColorPhone(id, color, fileName, idPhone);
		int countRecordInserted = colorDAO.edit(colorphone);
		StringBuilder sbd = new StringBuilder();
		String url = " ";
		if(countRecordInserted > 0) {
			//success
			url = sbd.append(request.getContextPath()).append("/admin/color/index?msg=").append(GlobalConstants.SUCCESS).append("&id=").append(idPhone).toString();
			response.sendRedirect(url);
			return;
		}
				//fail
		url = sbd.append(request.getContextPath()).append("/admin/color/index?msg=").append(GlobalConstants.ERROR).append("&id=").append(idPhone).toString();
		response.sendRedirect(url);
	}
}
