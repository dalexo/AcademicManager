<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%! String secretaryName = ""; %>
	<%
		Cookie[] authCookies = null;
		

		authCookies = request.getCookies();
		if (authCookies.length - 1 > 0) {
			for (Cookie ck : authCookies) {
				if (ck.getName().equals("user")) {
					secretaryName = ck.getValue().substring(0, ck.getValue().indexOf("@"));
				}
			}

		} else {
			response.sendRedirect("/AcademicManagerV1/html/login.jsp?authentication=false");
		}
	%>

</body>
</html>