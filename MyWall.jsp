<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="java.sql.*,java.util.*" %>

<% String ID = (String)session.getAttribute("ID"); %>
    <% 
        String subject = request.getParameter("subject");
        int marks = 0;
%>

<%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eportal", "root" , "" ); 
            Statement statement=conn.createStatement();
            String sql ="select "+subject+" from registration where id = '"+ID+"' ";
            ResultSet resultSet = statement.executeQuery(sql);
            if(resultSet.next())
                marks = resultSet.getInt(1);        
        }
            catch(Exception e) {
            System.out.print(e); 
            e.printStackTrace(); 
        }
%>

<h2 style="font-family: 'Balsamiq Sans', cursive; font-size: 30px; margin-left:42%; margin-top:15%;">Your Score in <%= subject %>: <%= marks %></h2>

<input type="button" value="Home" onclick="window.location.href='eExamPortal.html'" style="background-color: DodgerBlue;
                                            text-decoration: none;
                                            font-family: 'Balsamiq Sans', cursive;
                                            font-size: 21px;
                                            padding: 20px;
                                            cursor: pointer;
                                            border: none;
                                            border-radius: 20px;
                                            color: MidnightBlue;
                                            width: 10%;
                                            margin-left: 46%;
                                            margin-top: 7%;">

<style>
body{
    background: lightblue;
}
</style>

