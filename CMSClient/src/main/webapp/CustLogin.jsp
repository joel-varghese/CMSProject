<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="com.java.cms.Customer"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	
	<%
	String user = request.getParameter("username");
	String pass = request.getParameter("password");
	 URL url = new URL("http://localhost:1111/custAuthenticate/"+user+"/"+pass);
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
       output = br.readLine();
		if(output=="0")  {
		out.print("Invalid Credentials...."); 
	%>
		<jsp:include page="CustLogin.html"></jsp:include>
	<%
		}
		else{
			/* out.print("Login Successful"); */
			session.setAttribute("id",output);
	%>
		<jsp:include page="menu.jsp"></jsp:include>
	<%
		}
	%>
</body>
</html>