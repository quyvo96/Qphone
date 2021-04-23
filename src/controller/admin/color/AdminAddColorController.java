package controller.admin.color;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import constants.GlobalConstants;
import daos.CategoryDAO;
import daos.ColorPhoneDAO;
import daos.PhoneDAO;
import models.Category;
import models.ColorPhone;
import models.Phone;
import utils.AuthUtil;

@MultipartConfig
public class AdminAddColorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminAddColorController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idPhone = Integer.parseInt(request.getParameter("idPhone"));
		PhoneDAO phoneDAO = new PhoneDAO();
		Phone phone = phoneDAO.getById(idPhone);
		request.setAttribute("phone", phone);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/colors/add.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		ColorPhoneDAO colorDAO = new ColorPhoneDAO();
		String color = request.getParameter("color");
		Part filePart = request.getPart("picture");
		int idPhone = Integer.parseInt(request.getParameter("idPhone"));
		String fileName = filePart.getSubmittedFileName();
		if (!"".equals(fileName)) {
			 String rootPath = request.getServletContext().getRealPath("");
			 String dirUploadPath = rootPath + "uploads";
			 File createDir = new File(dirUploadPath);
			 if (!createDir.exists()) {
				 createDir.mkdir();
			 }
			 //string, string builder
			 StringBuilder sb = new StringBuilder();
			 StringBuilder sbNew = new StringBuilder();
			 LocalDateTime myDatePictuer = LocalDateTime.now();  
			 DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd_MM_yy_HH_mm_ss");  
			 String formattedDate = myDatePictuer.format(myFormatObj);
			 String newFileName = idPhone + formattedDate + ".jpg";
			 String newFilePath = sbNew.append(dirUploadPath).append(File.separator).append(newFileName).toString();
			 String filePath = sb.append(dirUploadPath).append(File.separator).append(fileName).toString();
		      try{
		    	  	File oldFile = new File(filePath);
		    	  	File newFile = new File(newFilePath);
		    		if (oldFile.renameTo(newFile)) {
		    			System.out.println("�?ổi tên thành công!");
		    		} else {
		    			System.out.println("�?ổi tên bị lỗi!");
		    		}

		        }catch(Exception e){
		            System.out.println("Exception occurred");
		            e.printStackTrace();
		         }
			 filePart.write(newFilePath); // Truy�?n vào đư�?ng dẫn upload file
			 fileName = newFileName;  
			 System.out.println("dirUploadPath :" + dirUploadPath);
		 }
		ColorPhone colorphone = new ColorPhone(color, fileName, idPhone);
		int countRecordInserted = colorDAO.add(colorphone);
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
