package models;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Order {
	
	private int id_order;
	
	private int id_user;
	
	private double sum_price;
	
	private String name;
	
	private int numberPhone;
	
	private String addres;
	
	private String other;
	
	private int status;
	
	private int status_pay;
	
	private Timestamp date_create;
	

	public Order(int id_user, double sum_price, String name, int numberPhone, String addres, String other, int status) {
		super();
		this.id_user = id_user;
		this.sum_price = sum_price;
		this.name = name;
		this.numberPhone = numberPhone;
		this.addres = addres;
		this.other = other;
		this.status = status;
	}



	public Order(int id_order, int id_user, double sum_price, String name, int numberPhone, String addres, String other,
			int status) {
		super();
		this.id_order = id_order;
		this.id_user = id_user;
		this.sum_price = sum_price;
		this.name = name;
		this.numberPhone = numberPhone;
		this.addres = addres;
		this.other = other;
		this.status = status;
	}



	public Order(int id_order, int id_user, double sum_price, String name, int numberPhone, String addres, String other,
			int status, Timestamp date_create) {
		super();
		this.id_order = id_order;
		this.id_user = id_user;
		this.sum_price = sum_price;
		this.name = name;
		this.numberPhone = numberPhone;
		this.addres = addres;
		this.other = other;
		this.status = status;
		this.date_create = date_create;
	}



	public Order(int id_order, int status, int status_pay) {
		super();
		this.id_order = id_order;
		this.status = status;
		this.status_pay = status_pay;
	}

}
