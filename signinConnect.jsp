<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
String email=request.getParameter("email");
//session.putValue("email",email);
String password=request.getParameter("password");
boolean current = false;
try{
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eportal","root","");
    Statement st= con.createStatement();
    ResultSet rs=st.executeQuery("select * from registration where email='"+email+"' and password='"+password+"'");
    current = rs.next();
    out.println("Current"+current+" "+rs);
    if(current)
    {
        session.setAttribute("user",rs.getString(2));//session is created
        session.setAttribute("ID", rs.getString(1));
        out.println("Welcome");
        response.sendRedirect("eExamPortal.html");
    }
    else{
        session.invalidate();
        request.setAttribute("errormessage","Invalid User id or password");
        RequestDispatcher rd = request.getRequestDispatcher("/signin.jsp");
        rd.forward(request,response);
        
    }
}
    catch (Exception e) {
    e.printStackTrace();
    }
%>



