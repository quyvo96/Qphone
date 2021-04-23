package models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


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
public class Status {
	
	private int id_status;
	
	private String name_status;
}
