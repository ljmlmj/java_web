package com.javalab.vo;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Member {
	
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String joindate;
	
	public Member(String id, String name) {
		this.id = id;
		this.name = name;
	}
	
}
