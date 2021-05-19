<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@page import="java.sql.*,java.util.*" %>

<%
    String ID = (String)session.getAttribute("ID");
    String subject = request.getParameter("subject"); 
    ResultSet resultSet = null;
    Boolean status = false;
    ResultSet rs = null;
    String ans1 = request.getParameter("1");
    String ans2 = request.getParameter("2");
    String ans3 = request.getParameter("3");
    String ans4 = request.getParameter("4");
    String ans5 = request.getParameter("5");
    
    int mark = 0;

    
    try {
        String choice;
        Class.forName("com.mysql.cj.jdbc.Driver"); 
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/eportal", "root" , "" ); 
        Statement st=conn.createStatement(); 
        String sql1 = "Select * from "+subject+" where id = 1 and Answer = '"+ans1+"'";
        String sql2 = "Select * from "+subject+" where id = 2 and Answer = '"+ans2+"'";
        String sql3 = "Select * from "+subject+" where id = 3 and Answer = '"+ans3+"'";
        String sql4 = "Select * from "+subject+" where id = 4 and Answer = '"+ans4+"'";
        String sql5 = "Select * from "+subject+" where id = 5 and Answer = '"+ans5+"'";
        
        resultSet = st.executeQuery(sql1);
        status = resultSet.next();
        out.println(status);
        if(status) {
            out.println("1");
            String updateQuery = "Update "+subject+" set mark=1 where id=1";
            st.executeUpdate(updateQuery);
        }
        resultSet.close();
        resultSet = st.executeQuery(sql2);
        status = resultSet.next();
        out.println(status);
        if(status) {
            out.println("2");
            String updateQuery = "Update "+subject+" set mark=1 where id=2";
            st.executeUpdate(updateQuery);
        }
        resultSet.close();
        resultSet = st.executeQuery(sql3);
        status = resultSet.next();
        out.println(status);
        if(status) {
            out.println("3");
            String updateQuery = "Update "+subject+" set mark=1 where id=3";
            st.executeUpdate(updateQuery);
        }
        resultSet.close();
        resultSet = st.executeQuery(sql4);
        status = resultSet.next();
        out.println(status);
        if(status) {
            out.println("4");
            String updateQuery = "Update "+subject+" set mark=1 where id=4";
            st.executeUpdate(updateQuery);
        }
        resultSet.close();
        resultSet = st.executeQuery(sql5);
        status = resultSet.next();
        out.println(status);
        if(status) {
            out.println("5");
            String updateQuery = "Update "+subject+" set mark=1 where id=5";
            st.executeUpdate(updateQuery);
        }
        resultSet.close();
        String sql = "Select sum(mark) from "+subject+"";
        resultSet = st.executeQuery(sql);
        if(resultSet.next()) {
            mark = resultSet.getInt(1);
            out.println("mark"+mark);
            int i=st.executeUpdate("Update registration set "+subject+"="+mark+" where id="+ID+""); 
            out.println("..............."+i+"............."+ID);
            i= st.executeUpdate("Update "+subject+" set mark=0 where mark=1");
            response.sendRedirect("MyWall.jsp?subject="+subject);
        }
        
    }
        catch(Exception e) {
        System.out.print(e); 
        e.printStackTrace(); 
    }
%>