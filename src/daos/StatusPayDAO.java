package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import models.Category;
import models.Status;
import models.StatusPay;
import utils.ConnectDBUtil;

public class StatusPayDAO {
	
	private Connection conn;
	
	private Statement st;
	
	private PreparedStatement pst;
	
	private ResultSet rs;
	
	public StatusPay getById(int id) {
		StatusPay statusPay = null;
		String sql = "SELECT id_pay, name_pay FROM status_pay WHERE id_pay = ?";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()){
				statusPay = new StatusPay(rs.getInt("id_pay"), rs.getString("name_pay"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return statusPay;
	}

}
