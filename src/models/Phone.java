package models;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@NoArgsConstructor
@AllArgsConstructor
@Data
/*
 * @Data ==
 * 	@Getter
	@Setter
	@ToString
 * 
 * */
public class Phone {
	
	private int id;
	
	private String name;
	
	private String preview_text;
	
	private String description_text;
	
	private double price;
	
	private Category cat;

	public Phone(String name, Category cat) {
		super();
		this.name = name;
		this.cat = cat;
	}

	public Phone(String name, String preview_text,String description_text, double price, Category cat) {
		super();
		this.name = name;
		this.preview_text = preview_text;
		this.description_text = description_text;
		this.price = price;
		this.cat = cat;
	}

	public Phone(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Phone(int id) {
		super();
		this.id = id;
	}

	public Phone(int id, String name, double price, String picture) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
	}


}
