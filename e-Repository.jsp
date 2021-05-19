<%@page import="java.sql.*,java.util.*" %>
<% String ID = (String)session.getAttribute("ID"); %>
<%
String fullname = request.getParameter("fullname");
String driver = "com.mysql.jdbc.Driver";

try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>

<style>
    body {
        padding: 0px;
        margin: 0;
        font-family: Verdana, Geneva, Tahoma, sans-serif;
    }
    
    table {
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        border-collapse: collapse;
        width: 800px;
        height: 140px;
        border: 1px solid #bdc3c7;
        box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2), -1px -1px 8px rgba(0, 0, 0, 0.2);
    }
    
    tr {
        transition: all .2s ease-in;
        cursor: pointer;
    }
    
    th,
    td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    
    #header {
        background-color: #16a085;
        color: #fff;
    }
    
    h1 {
        font-weight: 600;
        text-align: center;
        background-color: #16a085;
        color: #fff;
        padding: 10px 0px;
    }
    
    tr:hover {
        background-color: #f5f5f5;
        transform: scale(1.02);
        box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2), -1px -1px 8px rgba(0, 0, 0, 0.2);
    }
    
    @media only screen and (max-width: 768px) {
        table {
            width: 60%;
        }
    }
</style>

<body>

<h1>Your Result....</h1>
<hr>
<table>
<tr id="header">
    <td>fullname</td>
    <td>email</td>
    <td>branch</td>
    <td>Score in C</td>
    <td>Score in Pythom</td>
    <td>Score in Java</td>

</tr>
<%
try{
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/eportal","root","" );
    statement=connection.createStatement();

    resultSet = statement.executeQuery("select * from registration where id = "+ID) ;

    while(resultSet.next()){
    %>
        <tr>
            <td><%=resultSet.getString(2) %></td>
            <td><%=resultSet.getString(3) %></td>
            <td><%=resultSet.getString(8) %></td>
            <td><%=resultSet.getString(11) %></td>
            <td><%=resultSet.getString(10) %></td>
            <td><%=resultSet.getString(12) %></td>
        </tr>
    <%
    }
    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>
</table>
</body>
</html> 

