package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import models.Confi;
import utils.ConnectDBUtil;

public class ConfiDAO {
	
	private Connection conn;
	
	private Statement st;
	
	private PreparedStatement pst;
	
	private ResultSet rs;

	public Confi getConfi(int id_phone) {
		Confi confi = null;
		String sql = "SELECT * FROM confi WHERE id_phone = ?";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id_phone);
			rs = pst.executeQuery();
			if(rs.next()) {
				confi = new Confi(rs.getInt("id"), rs.getString("screen"), rs.getString("operating_system"),
						rs.getString("rear_camera"), rs.getString("front_camera"),
						rs.getString("cpu"), rs.getString("ram"), rs.getString("internal_memory"),
						rs.getString("sim"), rs.getString("pin"), id_phone);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(st, rs, conn);

		}
		return confi;
	}

	public int add(Confi confi) {
		String sql = "INSERT INTO confi(screen, operating_system, rear_camera, front_camera, cpu, ram, internal_memory, sim, pin, id_phone) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		int result = 0;
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, confi.getScreen());
			pst.setString(2, confi.getOperating_system());
			pst.setString(3, confi.getRear_camera());
			pst.setString(4, confi.getFront_camera());
			pst.setString(5, confi.getCpu());
			pst.setString(6, confi.getRam());
			pst.setString(7, confi.getInternal_memory());
			pst.setString(8, confi.getSim());
			pst.setString(9, confi.getPin());
			pst.setInt(10, confi.getId_phone());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);
		}
		return result;
	}
	public int edit(Confi confi) {
		String sql = "UPDATE confi SET screen = ?, operating_system = ?, rear_camera = ?, front_camera = ?, cpu = ?, ram = ?, internal_memory = ?, sim = ?, pin = ? WHERE id_phone = ?";
		int result = 0;
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, confi.getScreen());
			pst.setString(2, confi.getOperating_system());
			pst.setString(3, confi.getRear_camera());
			pst.setString(4, confi.getFront_camera());
			pst.setString(5, confi.getCpu());
			pst.setString(6, confi.getRam());
			pst.setString(7, confi.getInternal_memory());
			pst.setString(8, confi.getSim());
			pst.setString(9, confi.getPin());
			pst.setInt(10, confi.getId_phone());
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return result;
	}
	public static void main(String[] args) {
		ConfiDAO confiDAO = new ConfiDAO();
		Confi con = new Confi("23", "23", "23", "23", "23", "23", "23", "23", "23", 2);
		int a = confiDAO.edit(con);
	}
}
