package com.java.cms;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class OrderService {

	@Autowired
    private OrderRepository repo;
	
	@Autowired
	private OrderDAO dao;
	
//	public List<Orders> showVendorOrders(int venId) {
//		return repo.vendorOrders(venId);
//	}
//	public List<Orders> showCustomerOrders(int custId) {
//		return repo.customerOrders(custId);
//	}
	public Orders search(int orderId) {
		return repo.findById(orderId).get();
	}
	public List<Orders> showOrders() {
		return repo.findAll();
	}
	public List<Orders> showCustomerOrders(int custId) {
		return dao.showCustomerOrders(custId);
	}
}
