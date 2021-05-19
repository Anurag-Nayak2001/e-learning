<%@ page contentType="text/html;charset=utf-8"%>


<head>
    <link rel="stylesheet" type="text/css" href="exam.css" media="screen" />
</head>
<body>
<%@ page import = "java.sql.*"%>

<% String subject = request.getParameter("subject"); %>
<form method="POST" action="verify.jsp?subject=<%=subject %>">
<div Class="container">
<h1>Question</h1>

<%
    ResultSet resultSet = null;
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eportal","root","");
        Statement st = conn.createStatement();
        String sql = "Select * from "+subject+"";
        resultSet = st.executeQuery(sql);
        while(resultSet.next()){ %>
            <%= resultSet.getString(1) %>.
            <%= resultSet.getString(2) %> <br>
            <div Class="option">
            <input type="radio" name="<%=resultSet.getString(1) %>" value="<%= resultSet.getString(3) %>"> <%= resultSet.getString(3) %> <br>
            <input type="radio" name="<%=resultSet.getString(1) %>" value="<%= resultSet.getString(4) %>"> <%= resultSet.getString(4) %> <br>
            <input type="radio" name="<%=resultSet.getString(1) %>" value="<%= resultSet.getString(5) %>"> <%= resultSet.getString(5) %> <br>
            <input type="radio" name="<%=resultSet.getString(1) %>" value="<%= resultSet.getString(6) %>"> <%= resultSet.getString(6) %> <br> <br>
            </div>
<%      }
%>
        <input type="submit" value="Submit"><br><br>
        </form>
<%
    }
    catch(Exception e){
        System.out.println(e);
        e.printStackTrace();
    }
%>
</div>
</body>