package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import constants.GlobalConstants;
import models.Category;
import models.Phone;
import utils.ConnectDBUtil;

public class PhoneDAO {
	
	private Connection conn;
	
	private Statement st;
	
	private PreparedStatement pst;
	
	private ResultSet rs;

	public List<Phone> getAll() {
		List<Phone> listphone = new ArrayList<>();
		String sql = "SELECT p.*, c.name AS catName FROM phone AS p INNER JOIN categories AS c ON p.cat_id = c.id ORDER BY p.id DESC";
		conn = ConnectDBUtil.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Phone phone = new Phone(rs.getInt("id"),
							rs.getString("name"),
							rs.getString("preview_text"),
							rs.getString("description_text"),
							rs.getDouble("price"),
							new Category(rs.getInt("cat_id"), rs.getString("catName")));
				listphone.add(phone);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(st, rs, conn);

		}
		return listphone;
	}

	public int add(Phone phone) {
		String sql = "INSERT INTO phone(name, preview_text,description_text, price, cat_id) VALUES(?, ?, ?, ?, ?, ?)";
		int result = 0;
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, phone.getName());
			pst.setString(2, phone.getPreview_text());
			pst.setString(3, phone.getDescription_text());
			pst.setDouble(4, phone.getPrice());
			pst.setInt(6, phone.getCat().getId());
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return result;
	}
	public Phone getById(int id) {
		Phone phone = null;
		String sql = "SELECT p.*, c.name AS catName FROM phone AS p INNER JOIN categories AS c ON p.cat_id = c.id Where p.id = ?";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				 phone = new Phone(rs.getInt("id"),
						rs.getString("name"),
						rs.getString("preview_text"),
						rs.getString("description_text"),
						rs.getDouble("price"),
						new Category(rs.getInt("cat_id"), rs.getString("catName")));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(st, rs, conn);

		}
		return phone;
	}
	public int edit(Phone phone) {
		String sql = "UPDATE phone SET name = ?, preview_text = ?, description_text = ?, price = ?, cat_id = ? WHERE id = ?";
		int result = 0;
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, phone.getName());
			pst.setString(2, phone.getPreview_text());
			pst.setString(3, phone.getDescription_text());
			pst.setDouble(4, phone.getPrice());
			pst.setInt(5, phone.getCat().getId());
			pst.setInt(6, phone.getId());
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
		String sql = "DELETE FROM phone WHERE id = ?";
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
	public List<Phone> getByCatId(int id) {
		List<Phone> listphone = new ArrayList<>();
		String sql ="SELECT p.*, c.name AS catName FROM phone AS p INNER JOIN categories AS c ON p.cat_id = c.id WHERE p.cat_id = ? ORDER BY p.id DESC";
		//String sql = "SELECT id, name, preview_text, detail_text, date_create, counter FROM songs Where cat_id = ?";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				Phone phone = new Phone(rs.getInt("id"),
						rs.getString("name"),
						rs.getString("preview_text"),
						rs.getString("description_text"),
						rs.getDouble("price"),
						new Category(rs.getInt("cat_id"), rs.getString("catName")));
			listphone.add(phone);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return listphone;
	}

	public List<Phone> findAllByName(String sname) {
		List<Phone> listphone = new ArrayList<>();
		String sql = "SELECT p.*, c.name AS catName FROM phone AS p INNER JOIN categories AS c ON p.cat_id = c.id WHERE 1";
		if(!"".equals(sname)) {
			sql += " AND p.name LIKE ?";
		}

		sql +=  " ORDER BY p.id DESC LIMIT 0, 4" ;
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			if(!"".equals(sname)) {
				pst.setString(1,"%"+sname+"%");

			}

			rs = pst.executeQuery();
			while(rs.next()) {
				Phone phones = new Phone(rs.getInt("id"),
						rs.getString("name"),
						rs.getString("preview_text"),
						rs.getString("description_text"),
						rs.getDouble("price"),
						new Category(rs.getInt("cat_id"), rs.getString("catName")));
			listphone.add(phones);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return listphone;
	}
	public List<Phone> findAllByDetailAndName(String sname) {
		List<Phone> listphone = new ArrayList<>();
		String sql = "SELECT p.*, c.name AS catName FROM phone AS p INNER JOIN categories AS c ON p.cat_id = c.id WHERE 1";
		if(!"".equals(sname)) {
			sql += " AND (p.name LIKE ?)";
		}
		sql +=  " ORDER BY p.id DESC LIMIT 0, 4" ;
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			if(!"".equals(sname)) {
				pst.setString(1,"%"+sname+"%");
				}
			rs = pst.executeQuery();
			while(rs.next()) {
				Phone phones = new Phone(rs.getInt("id"),
						rs.getString("name"),
						rs.getString("preview_text"),
						rs.getString("description_text"),
						rs.getDouble("price"),
						new Category(rs.getInt("cat_id"), rs.getString("catName")));
				listphone.add(phones);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return listphone;
	}

	public int numerOfItems() {
		String sql = "SELECT COUNT(*) AS count FROM phone";
		conn = ConnectDBUtil.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				int count = rs.getInt("count");
				return count;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(st, rs, conn);

		}
		return 0;
	}

	public List<Phone> getAllPagination(int offset,int idCat) {
		List<Phone> listphone = new ArrayList<>();
		String sql = "SELECT p.*, c.name AS catName FROM phone AS p INNER JOIN categories AS c ON p.cat_id = c.id";
		if(idCat > 0) {
			sql += " WHERE p.cat_id = ?";
		}
		sql += " ORDER BY p.id DESC LIMIT ?, ?";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);

			if(idCat > 0) {
				pst.setInt(1, idCat);
				pst.setInt(2, offset);
				pst.setInt(3, GlobalConstants.NUMBER_PER_PAGE);
			}else {
				pst.setInt(1, offset);
				pst.setInt(2, GlobalConstants.NUMBER_PER_PAGE);
			}
			rs = pst.executeQuery();
			while(rs.next()) {
				Phone phones = new Phone(rs.getInt("id"),
						rs.getString("name"),
						rs.getString("preview_text"),
						rs.getString("description_text"),
						rs.getDouble("price"),
						new Category(rs.getInt("cat_id"), rs.getString("catName")));
				listphone.add(phones);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return listphone;
	}
	public int numerOfItemsForCat(int cat_id) {
		String sql = "SELECT COUNT(*) AS count FROM phone WHERE cat_id = ?";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, cat_id);
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

	public List<Phone> getAllPaginationForCat(int id, int offset) {
		List<Phone> listphone = new ArrayList<>();
		String sql ="SELECT p.*, c.name AS catName FROM phone AS p INNER JOIN categories AS c ON p.cat_id = c.id WHERE p.cat_id = ? ORDER BY p.id DESC LIMIT ?,?";
		//String sql = "SELECT id, name, preview_text, detail_text, date_create, counter FROM songs Where cat_id = ?";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setInt(2, offset);
			pst.setInt(3, GlobalConstants.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while(rs.next()) {
				Phone phones = new Phone(rs.getInt("id"),
						rs.getString("name"),
						rs.getString("preview_text"),
						rs.getString("description_text"),
						rs.getDouble("price"),
						new Category(rs.getInt("cat_id"), rs.getString("catName")));
				listphone.add(phones);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return listphone;
	}
	public List<Phone> getAllPage(int offset) {
		List<Phone> listphone = new ArrayList<>();
		String sql = "SELECT p.*, c.name AS catName FROM phone AS p INNER JOIN categories AS c ON p.cat_id = c.id ORDER BY p.id DESC LIMIT ?, ?";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, 0);
			pst.setInt(2, (offset+2)*GlobalConstants.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while(rs.next()) {
				Phone phones = new Phone(rs.getInt("id"),
						rs.getString("name"),
						rs.getString("preview_text"),
						rs.getString("description_text"),
						rs.getDouble("price"),
						new Category(rs.getInt("cat_id"), rs.getString("catName")));
				listphone.add(phones);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return listphone;
	}
	public List<Phone> getAllPageAndIdCat(int offset, int idCat) {
		List<Phone> listphone = new ArrayList<>();
		String sql = "SELECT p.*, c.name AS catName FROM phone AS p INNER JOIN categories AS c ON p.cat_id = c.id Where p.cat_id = ? ORDER BY p.id DESC LIMIT ?, ?";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, idCat);
			pst.setInt(2, 0);
			pst.setInt(3, (offset+2)*GlobalConstants.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while(rs.next()) {
				Phone phones = new Phone(rs.getInt("id"),
						rs.getString("name"),
						rs.getString("preview_text"),
						rs.getString("description_text"),
						rs.getDouble("price"),
						new Category(rs.getInt("cat_id"), rs.getString("catName")));
				listphone.add(phones);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return listphone;
	}
}
