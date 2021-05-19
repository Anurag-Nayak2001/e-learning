<%@ page import = "java.sql.*"%>

<% 
	String fullname = request.getParameter("fullname");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String address = request.getParameter("address");
	String branch = request.getParameter("branch");
	String tech = request.getParameter("tech");

	try{

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eportal","root","");
		PreparedStatement ps = conn.prepareStatement("insert into registration(fullname, email, password, age, gender, address, branch, tech) values(?,?,?,?,?,?,?,?);");
		ps.setString(1,fullname);
		ps.setString(2,email);
		ps.setString(3,password);
		ps.setString(4,age);
		ps.setString(5,gender);
		ps.setString(6,address);
		ps.setString(7,branch);
		ps.setString(8,tech);
		int x = ps.executeUpdate();

		if(x > 0){
			out.println("Registration done successfully......");
			response.sendRedirect("signin.jsp");
		}
		else{
			out.println("Registration failed....");
		}

	}
	catch(Exception e){
		out.println(e);
	}
%>


