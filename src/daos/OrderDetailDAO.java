package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import models.OrderDetail;
import models.Phone;
import utils.ConnectDBUtil;

public class OrderDetailDAO {
	
	private Connection conn;
	
	private Statement st;
	
	private PreparedStatement pst;
	
	private ResultSet rs;

	public List<OrderDetail> getAllByIdOrder(int id_order) {
		List<OrderDetail> listOrderDetail = new ArrayList<>();
		String sql = "SELECT o.*, p.* FROM order_detail AS o INNER JOIN phone AS p ON o.id_phone = p.id WHERE o.id_order = ?";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id_order);
			rs = pst.executeQuery();
			while(rs.next()) {
				OrderDetail orderDetail = new OrderDetail(rs.getInt("id_detail"), rs.getInt("id_order"),
						rs.getInt("number"),rs.getString("color"),
						new Phone(rs.getInt("id_phone"), rs.getString("name"), rs.getInt("price"), rs.getString("picture")));
						
				listOrderDetail.add(orderDetail);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(st, rs, conn);

		}
		return listOrderDetail;
	}

	public int add(OrderDetail orderDetail) {
		String sql = "INSERT INTO order_detail(id_order, id_phone, name_phone ,price_detail, number, color) VALUES(?, ?, ?, ?, ?, ?)";
		int result = 0;
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, orderDetail.getId_order());
			pst.setInt(2, orderDetail.getPhone().getId());
			pst.setString(3, orderDetail.getName_phone());
			pst.setDouble(4, orderDetail.getPrice_detail());
			pst.setInt(5, orderDetail.getNumber());
			pst.setString(6, orderDetail.getColor());
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return result;
	}
	public int edit(OrderDetail orderDetail) {
		String sql = "UPDATE order_detail SET name_phone =?, price_detail = ?  WHERE id_detail = ?";
		int result = 0;
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, orderDetail.getName_phone());
			pst.setDouble(2, orderDetail.getPrice_detail());
			pst.setInt(3, orderDetail.getId_detail());
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return result;
	}
	public List<OrderDetail> getAllHistoryByIdOrder(int id_order) {
		List<OrderDetail> listOrderDetail = new ArrayList<>();
		String sql = "SELECT o.*, p.* FROM order_detail AS o INNER JOIN phone AS p ON o.id_phone = p.id WHERE o.id_order = ?";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id_order);
			rs = pst.executeQuery();
			while(rs.next()) {
				OrderDetail orderDetail = new OrderDetail(rs.getInt("id_detail"), rs.getInt("id_order"),
						rs.getString("name_phone"),rs.getDouble("price_detail"),
						rs.getInt("number"),rs.getString("color"),
						new Phone(rs.getInt("id_phone"), rs.getString("name"), rs.getInt("price"), rs.getString("picture")));
						
				listOrderDetail.add(orderDetail);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(st, rs, conn);

		}
		return listOrderDetail;
	}
	public int numerOfItems(int id) {
		String sql = "SELECT COUNT(*) AS count FROM order_detail WHERE id_order = ?";
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
	public int del(int id) {
		String sql = "DELETE FROM order_detail WHERE id_detail = ?";
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
	public OrderDetail findItems(int id_order, int id_phone, String color) {
		OrderDetail orderDetail = null;
		String sql = "SELECT id_detail, number FROM order_detail  WHERE id_order = ? AND id_phone = ? AND color = ?";
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id_order);
			pst.setInt(2, id_phone);
			pst.setString(3, color);
			rs = pst.executeQuery();
			if(rs.next()) {
				int idDetail = rs.getInt("id_detail");
				int num = rs.getInt("number");
				orderDetail = new OrderDetail(idDetail,num);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return orderDetail;
	}
	public int addNum(int id_detail, int num) {
		String sql = "UPDATE order_detail SET number =? WHERE id_detail = ?";
		int result = 0;
		conn = ConnectDBUtil.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, num + 1);
			pst.setInt(2, id_detail);
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectDBUtil.close(pst, rs, conn);

		}
		return result;
	}
}
