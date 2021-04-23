package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import constants.GlobalConstants;
import models.Order;
import utils.ConnectDBUtil;

public class OrderDAO {
	
	private Connection conn;
	
	private Statement st;
	
	private PreparedStatement pst;
	
	private ResultSet rs;

	public Order getOrderCart(int id) {
		Order order = null;
		String sql = "SELECT * FROM `order` WHERE id_user = ? AND status = 1";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				order = new Order(rs.getInt("id_order"), id,rs.getDouble("sum_price"), rs.getString("name"),rs.getInt("numberPhone"),rs.getString("addres"),
						rs.getString("other"),rs.getInt("status"),rs.getTimestamp("date_create"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(st, rs, conn);

		}
		return order;
	}
	public List<Order> getOrderNotCart(int id) {
		List<Order> listOrder = new ArrayList<>();
		String sql = "SELECT * FROM `order` WHERE id_user = ? AND status != 1 ORDER BY id_order DESC";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();

			while(rs.next()) {
				Order order = new Order(rs.getInt("id_order"), id,rs.getDouble("sum_price"), rs.getString("name"),rs.getInt("numberPhone"),rs.getString("addres"),
						rs.getString("other"),rs.getInt("status"),rs.getInt("status_pay"),rs.getTimestamp("date_create"));
						
				listOrder.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(st, rs, conn);

		}
		return listOrder;
	}
	public int addOrderCart(Order order) {
		String sql = "INSERT INTO `order`(id_user, sum_price, name, numberPhone, addres, other, status) VALUES(?, ?, ?, ?, ?, ?, ?)";
		int result = 0;
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, order.getId_user());
			pst.setDouble(2, order.getSum_price());
			pst.setString(3, order.getName());
			pst.setInt(4, order.getNumberPhone());
			pst.setString(5, order.getAddres());
			pst.setString(6, order.getOther());
			pst.setInt(7, order.getStatus());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);
		}
		return result;
	}
	public int updateOrderCart(Order order) {
		String sql = "UPDATE `order` SET sum_price=?, name=?, numberPhone=?, addres=?, other=?, status=? WHERE id_order = ?";
		int result = 0;
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setDouble(1, order.getSum_price());
			pst.setString(2, order.getName());
			pst.setInt(3, order.getNumberPhone());
			pst.setString(4, order.getAddres());
			pst.setString(5, order.getOther());
			pst.setInt(6, order.getStatus());
			pst.setInt(7, order.getId_order());
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return result;
	}
	public int updateStatus(Order order) {
		String sql = "UPDATE `order` SET  status=?, status_pay=?  WHERE id_order = ?";
		int result = 0;
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, order.getStatus());
			pst.setInt(2, order.getStatus_pay());
			pst.setInt(3, order.getId_order());
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return result;
	}
	public int cancelOrder(int id_order) {
		String sql = "UPDATE `order` SET  status=5 WHERE id_order = ?";
		int result = 0;
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id_order);
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return result;
	}
	public List<Order> getAllPagination(int offset,int idStatus) {
		List<Order> listorder = new ArrayList<>();
		String sql = "SELECT * FROM `order` WHERE status != 1";
		if(idStatus > 0) {
			sql += " AND status = ?";
		}
		sql += " ORDER BY id_order DESC LIMIT ?, ?";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);

			if(idStatus > 0) {
				pst.setInt(1, idStatus);
				pst.setInt(2, offset);
				pst.setInt(3, GlobalConstants.NUMBER_PER_PAGE);
			}else {
				pst.setInt(1, offset);
				pst.setInt(2, GlobalConstants.NUMBER_PER_PAGE);
			}
			rs = pst.executeQuery();
			while(rs.next()) {
				Order order = new Order(rs.getInt("id_order"), rs.getInt("id_user"),
						rs.getDouble("sum_price"), rs.getString("name"),
						rs.getInt("numberPhone"),rs.getString("addres"),
						rs.getString("other"),rs.getInt("status"),
						rs.getInt("status_pay"),
						rs.getTimestamp("date_create"));
				listorder.add(order);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return listorder;
	}
	public List<Order> findAllByIdOder(int id) {
		List<Order> listorder = new ArrayList<>();
		String sql = "SELECT * FROM `order` WHERE status != 1";
		if(id != 0 ) {
			sql += " AND id_order LIKE ?";
		}
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			if(id != 0) {
				pst.setInt(1, id);
			}
			rs = pst.executeQuery();
			while(rs.next()) {
				Order order = new Order(rs.getInt("id_order"), rs.getInt("id_user"),
						rs.getDouble("sum_price"), rs.getString("name"),
						rs.getInt("numberPhone"),rs.getString("addres"),
						rs.getString("other"),rs.getInt("status"),
						rs.getInt("status_pay"),
						rs.getTimestamp("date_create"));
				listorder.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return listorder;
	}
	public int numerOfItems() {
		String sql = "SELECT COUNT(*) AS count FROM `order`";
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
	public Order getOrderByIdOrder(int id_order) {
		Order order = null;
		String sql = "SELECT * FROM `order` WHERE id_order = ? ";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id_order);
			rs = pst.executeQuery();
			if(rs.next()) {
				order = new Order(rs.getInt("id_order"), rs.getInt("id_user"),rs.getDouble("sum_price"), rs.getString("name"),rs.getInt("numberPhone"),rs.getString("addres"),
						rs.getString("other"),rs.getInt("status"),rs.getInt("status_pay"),rs.getTimestamp("date_create"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(st, rs, conn);

		}
		return order;
	}
}
