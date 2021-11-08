<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="com.java.cms.Orders"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="menu.jsp"></jsp:include>
 
	<table border='3'>
		<tr>
		 <th>Order Id </th>
		 <th>Customer Id</th>
		 <th>Vendor Id</th>
		 <th>Wallet</th>
		 <th>Date</th>
		 <th>Quantity</th>
		 <th>Amount</th>
		 <th>Status</th>
		 <th>Comments</th>
	    </tr>
	<%
	String id1 = (String)session.getAttribute("id");
	int id = Integer.parseInt(id1);
	URL url = new URL("http://localhost:1111/order/"+id);
       HttpURLConnection conn = (HttpURLConnection) url.openConnection();
       conn.setRequestMethod("GET");
       conn.setRequestProperty("Accept", "application/json");
       if (conn.getResponseCode() != 200) {
           throw new RuntimeException("Failed : HTTP error code : "
                   + conn.getResponseCode());
       }
       BufferedReader br = new BufferedReader(new InputStreamReader(
           (conn.getInputStream())));
       String output;
       String res="";
       while ((output = br.readLine()) != null) {
       	res+=output;
           //out.println(output);
       }
       Orders[] or = new ObjectMapper().readValue(res, Orders[].class);
		for(Orders od : or){
	%>
		<tr>
			<th><%=od.getOrdId() %></th>
			<th><%=od.getCusId() %></th>
			<th><%=od.getVenId() %></th>
			<th><%=od.getWalSource() %></th>
			<th><%=od.getOrdDate() %></th>
			<th><%=od.getOrdQty() %></th>
			<th><%=od.getOrdBillamount() %></th>
			<th><%=od.getOrdStatus() %></th>
			<th><%=od.getOrdComments() %></th>
		<%} %>
		
</body>
</html>