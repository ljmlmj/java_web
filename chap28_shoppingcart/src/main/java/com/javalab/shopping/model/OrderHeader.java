package com.javalab.shopping.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class OrderHeader {

	private int orderId;		// 주문번호(PK)
	private String userId;		// 고객ID
	private String email;		// 이메일
	private String phoneNumber;	// 전화번호
	private String address;		// 주소
	private int totalAmt;		// 주문총액
	
	// 주문상태 (0-입금전 / 1-입금 / 2-배송전 / 3-배송중 / 4-도착 / 5-반품)
	private String status;
	
	// 결제방법 (0-현금 / 1-카드 / 2-휴대폰결제)
	private String paymentMethod;
	private String createDate;				// 주문일자
	private List<OrderItem> orderItems;		// 주문상세
	
} // class end
