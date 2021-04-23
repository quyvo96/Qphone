package models;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderDetail {
	
	private int id_detail;
	
	private int id_order;
	
	private String name_phone;
	
	private double price_detail;
	
	private int number;
	
	private String color;
	
	private Phone phone;

	public OrderDetail(int id_detail, int id_order, int number, String color) {
		super();
		this.id_detail = id_detail;
		this.id_order = id_order;
		this.number = number;
		this.color = color;

	}

	public OrderDetail(int id_order, int number, String color, Phone phone) {
		super();
		this.id_order = id_order;
		this.number = number;
		this.color = color;

		this.phone = phone;
	}

	public OrderDetail(int id_detail, int id_order, int number, String color, Phone phone) {
		super();
		this.id_detail = id_detail;
		this.id_order = id_order;
		this.number = number;
		this.color = color;
		this.phone = phone;
	}

	public OrderDetail(int id_detail, int id_order, String name_phone, double price_detail, int number, String color) {
		super();
		this.id_detail = id_detail;
		this.id_order = id_order;
		this.name_phone = name_phone;
		this.price_detail = price_detail;
		this.number = number;
		this.color = color;
	}

	public OrderDetail(int id_detail, String name_phone, double price_detail) {
		super();
		this.id_detail = id_detail;
		this.name_phone = name_phone;
		this.price_detail = price_detail;
	}

	public OrderDetail(int id_order, String name_phone, double price_detail, int number, String color, Phone phone) {
		super();
		this.id_order = id_order;
		this.name_phone = name_phone;
		this.price_detail = price_detail;
		this.number = number;
		this.color = color;
		this.phone = phone;
	}

	public OrderDetail(int id_detail, int number) {
		super();
		this.id_detail = id_detail;
		this.number = number;
	}
	
	
	
}
