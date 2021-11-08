package com.java.cms;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {

	@Autowired  
    JdbcTemplate jdbc;  
	
	public List<Orders> showCustomerOrders(int custId) {
		String cmd = "select * from orders where cus_id=?";
		List<Orders> orders=null;
		orders=jdbc.query(cmd,new Object[] {custId}, new RowMapper<Orders>() {

			@Override
			public Orders mapRow(ResultSet rs, int rowNum) throws SQLException {
				Orders order = new Orders();
				order.setOrdId(rs.getInt("ORD_ID"));
				order.setCusId(rs.getInt("CUS_ID"));
				order.setVenId(rs.getInt("VEN_ID"));
				order.setWalSource(rs.getString("WAL_SOURCE"));
				order.setOrdQty(rs.getInt("ORD_QTY"));
				order.setOrdBillamount(rs.getDouble("ORD_BILLAMOUNT"));
				order.setOrdComments(rs.getString("ORD_COMMENTS"));
				order.setOrdStatus(rs.getString("ORD_STATUS"));
				return order;
			}
			
		});
		return orders;
	}
}
