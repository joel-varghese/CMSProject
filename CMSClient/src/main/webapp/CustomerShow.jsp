<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="com.java.cms.Customer"%>
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
		 <th>Id </th>
		 <th>Name</th>
		 <th>Phone</th>
		 <th>User</th>
		 <th>Email</th>
	    </tr>
	<%
	String id1 = (String)session.getAttribute("id");
	int id = Integer.parseInt(id1);
	URL url = new URL("http://localhost:1111/customer/"+id);
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
       Customer cm = new ObjectMapper().readValue(res, Customer.class);
		if(cm != null){
	%>
		<tr>
			<th><%=cm.getCusId() %></th>
			<th><%=cm.getCusName() %></th>
			<th><%=cm.getCusPhnno() %></th>
			<th><%=cm.getCusUsername() %></th>
			<th><%=cm.getCusEmail() %></th>

		<%} %>
		
</body>
</html>