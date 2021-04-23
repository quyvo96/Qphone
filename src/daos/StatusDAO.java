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
import utils.ConnectDBUtil;

public class StatusDAO {
	
	private Connection conn;
	
	private Statement st;
	
	private PreparedStatement pst;
	
	private ResultSet rs;
	
	public Status getById(int id) {
		Status status = null;
		String sql = "SELECT id_status, name_status FROM status WHERE id_status = ?";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()){
				status = new Status(rs.getInt("id_status"), rs.getString("name_status"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return status;
	}
	public List<Status> getStatus() {
		List<Status> liststatus = new ArrayList<>();
		String sql = "SELECT id_status, name_status FROM status Where id_status != 1";
		conn = ConnectDBUtil.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Status status = new Status(rs.getInt("id_status"), rs.getString("name_status"));
				liststatus.add(status);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(st, rs, conn);

		}
		return liststatus;
	}

}
