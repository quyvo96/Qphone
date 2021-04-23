package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import models.Category;
import models.ColorPhone;
import models.Phone;
import utils.ConnectDBUtil;

public class ColorPhoneDAO {
	
	private Connection conn;
	
	private Statement st;
	
	private PreparedStatement pst;
	
	private ResultSet rs;

	public List<ColorPhone> getAll(int idPhone) {
		List<ColorPhone> listcolor = new ArrayList<>();
		String sql = "SELECT * FROM color_phone WHERE id_phone = ?";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, idPhone);
			rs = pst.executeQuery();
			while(rs.next()) {
				ColorPhone colorp = new ColorPhone(rs.getInt("id"),
						rs.getString("color"),
						rs.getString("picture"),
						rs.getInt("id_phone"));
				listcolor.add(colorp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return listcolor;
	}
	public ColorPhone getPiturePhone(int idPhone) {
		ColorPhone colors = null;
		String sql = "SELECT * FROM color_phone WHERE id_phone = ? LIMIT 0, 1";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, idPhone);
			rs = pst.executeQuery();
			if(rs.next()) {
				colors = new ColorPhone(rs.getInt("id"), rs.getString("color"), rs.getString("picture"), idPhone);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);
		}
		return colors;
	}
	public ColorPhone getPitureColorPhone(int idPhone, String colorP) {
		ColorPhone colors = null;
		String sql = "SELECT * FROM color_phone WHERE id_phone = ? AND color = ?";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, idPhone);
			pst.setString(2, colorP);
			rs = pst.executeQuery();
			if(rs.next()) {
				colors = new ColorPhone(rs.getInt("id"), colorP, rs.getString("picture"), idPhone);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);
		}
		return colors;
	}
	public int add(ColorPhone color) {
		String sql = "INSERT INTO color_phone(color, picture, id_phone) VALUES(?, ?, ?)";
		int result = 0;
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, color.getColor());
			pst.setString(2, color.getPicture());
			pst.setInt(3, color.getId_phone());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);
		}
		return result;
	}
	public int edit(ColorPhone color) {
		String sql = "UPDATE color_phone SET color = ?,picture = ?, id_phone = ? WHERE id = ?";
		int result = 0;
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, color.getColor());
			pst.setString(2, color.getPicture());
			pst.setInt(3, color.getId_phone());
			pst.setInt(4, color.getId());
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return result;
	}
	public int del(int id) {
		String sql = "DELETE FROM color_phone WHERE id = ?";
		int result = 0;
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return result;
	}
	public ColorPhone getById(int id) {
		ColorPhone colors = null;
		String sql = "SELECT * FROM color_phone WHERE id = ?";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				colors = new ColorPhone(id, rs.getString("color"), rs.getString("picture"), rs.getInt("id_phone"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return colors;
	}
	public int numerOfItems(int id) {
		String sql = "SELECT COUNT(*) AS count FROM color_phone WHERE id_phone = ?";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				int count = rs.getInt("count");
				return count;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return 0;
	}
	public static void main(String[] args) {
		ColorPhoneDAO cd = new ColorPhoneDAO();
		List<ColorPhone> c = cd.getAll(2);
		for(ColorPhone a: c) {
			System.out.println(a);
		}
		
	}
}
