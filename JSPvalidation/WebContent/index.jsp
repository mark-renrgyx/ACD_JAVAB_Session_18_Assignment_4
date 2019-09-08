<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.regex.Matcher" %>
<%@ page import = "java.util.regex.Pattern" %>

<!DOCTYPE html>

<!--  For Assignment 18-3 and 18-4 -->
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>

<style><%@include file="/css/style.css" %></style>
</head>
<body>
	<p>Provide your contact information</p>
	<form action="index.jsp">
		Name: <input type="text" name="name" value=""> <br />
		Address: <input type="text" name="address" value=""> <br />
		Mobile Number: <input type="text" name="phone" value=""> <br />
		<input type="submit" value="Submit">
	</form>
	<br />
<%
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	
	boolean isValid = true;
	String errorMessage = "";
	
	if (name != null && address != null && phone != null) { // check if page was just loaded
		if (name.length() < 1) {
			isValid = false;
			errorMessage = "You must provide a name";
		}
		if (isValid && address.length() < 1) { // short-circuit if error already occurred
			isValid = false;
			errorMessage = "You must provide an address";
		}
		if (isValid) {
			String pattern = "^(\\+\\d{1,2}\\s)?\\(?\\d{3}\\)?[\\s.-]\\d{3}[\\s.-]\\d{4}$";
			Pattern p = Pattern.compile(pattern);
			Matcher m = p.matcher(phone);
			boolean matched = m.matches();
			if (!matched) {
				isValid = false;
				errorMessage = "That's not a valid phone number";
			}
		}
		
	
		if (!isValid) {
%>
		<p class="error"><%= errorMessage %></p>
<%
		}
		else { %>
			<p>Thank you for providing your information!</p>
	<%	}
	}
%>

<p> And by the way there's an arbitrary page over <a href="second_page.jsp">here</a></p>

<%@ include file="footer.html" %>
</body>
</html>