<%@ page contentType="text/html;charset=UTF-8" pageEncoding="EUC-KR"
	session="true"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<title>### MYSQL SELECT TEST ###</title>
</head>
<body>
	<%
		try {
			String DB_URL = "jdbc:mysql://192.168.60.159:3306?useSSL=false";
			String DB_USER = "root";
			String DB_PASSWORD = "P@ssw0rd";
			String query = "SELECT * FROM EASYCOMPANY.RTETNMBER";

			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);

			out.println("<table border='1' width='1000'>");
			out.println("<tr><td>ID</td><td>NAME</td><td>E-MAIL</td><td>TEL</td><td>ADDRESS</td></tr>");
			while (rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getString("MBER_ID") + "</td>");
				out.println("<td>" + rs.getString("NM") + "</td>");
				out.println("<td>" + rs.getString("EMAIL") + "</td>");
				out.println("<td>" + rs.getString("MBTLNUM") + "</td>");
				out.println("<td>" + rs.getString("ADRES") + "</td>");
				out.println("</tr>");
			}
			out.println("</table>");

			stmt.close();
			rs.close();
			conn.close();
		} catch (SQLException sqlE) {
			sqlE.printStackTrace();
			out.println(sqlE.getMessage());

		}
	%>

</body>
</html>
