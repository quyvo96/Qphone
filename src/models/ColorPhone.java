package models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ColorPhone {

	private int id;
	
	private String color;
	
	private String picture;
	
	private int id_phone;

	public ColorPhone(String color, String picture, int id_phone) {
		super();
		this.color = color;
		this.picture = picture;
		this.id_phone = id_phone;
	}


}
