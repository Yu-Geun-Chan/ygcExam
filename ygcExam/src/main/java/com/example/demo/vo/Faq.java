package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Faq {

	private int id;
	private String title;
	private String body;
	private String code;
	private String name;
	
}
