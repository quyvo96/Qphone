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
public class Confi {
	
	private int id;
	
	private String screen;
	
	private String operating_system;
	
	private String rear_camera;
	
	private String front_camera;
	
	private String cpu;
	
	private String ram;
	
	private String internal_memory;
	
	private String sim;
	
	private String pin;
	
	private int id_phone;

	public Confi(String screen, String operating_system, String rear_camera, String front_camera, String cpu,
			String ram, String internal_memory, String sim, String pin, int id_phone) {
		super();
		this.screen = screen;
		this.operating_system = operating_system;
		this.rear_camera = rear_camera;
		this.front_camera = front_camera;
		this.cpu = cpu;
		this.ram = ram;
		this.internal_memory = internal_memory;
		this.sim = sim;
		this.pin = pin;
		this.id_phone = id_phone;
	}

	
}
