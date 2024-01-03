package com.eatit.orderDomain;

import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude = "cartList")
public class CartVO {

	private int cart_id;
	private int employee_no;
	private int product_no;
	private int quantity;
	
	// join 데이터
	private String product_name;
	
	// 리스트
	private List<CartVO> cartList;
}
