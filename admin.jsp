<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN DASHBOARD</title>
<link rel="stylesheet" href="css/admin.css">
</head>
<body>
<header>
    <jsp:include page="demoheader.jsp"></jsp:include>
</header>


<main>
<div class="table-container">
    <h1 style="color: white;">Users Page</h1>
    <table border="2px">
        <thead>
            <tr >
                <th>Name</th>
                <th>Email</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                String url = "jdbc:mysql://localhost:3301/education_system";
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection(url, "root", "");
                    stmt = con.createStatement();
                    String query = "SELECT * FROM user_master";
                    rs = stmt.executeQuery(query);

                    while (rs.next()) {
                        String name = rs.getString("name");
                        String gmail = rs.getString("email");
                        int status = rs.getInt("status");
            %>
            <tr>
                <td><%= name %></td>
                <td><%= gmail %></td>
                <td><%= status %></td>
                <td>
                    <button class="btn edit">Edit</button>
                    <button class="btn delete">Delete</button>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (con != null) con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>
</div>

<div class="table-container">
    <h1 style="color: white;">Leave Page</h1>
    <table border="2px">
        <thead>
            <tr >
                <th>Name</th>
                <th>Email</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%

                Connection con2 = null;
                Statement stmt2 = null;
                ResultSet rs2 = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con2 = DriverManager.getConnection(url, "root", "");
                    stmt2 = con2.createStatement();
                    String query2 = "SELECT e.emp_name, e.emp_email FROM employee e INNER JOIN leave_apply l ON e.emp_id = l.emp_id";
                    rs2 = stmt2.executeQuery(query2);

                    while (rs2.next()) {
                        String name = rs2.getString("emp_name");
                        String gmail = rs2.getString("emp_email");
            %>
            <tr>
                <td><%= name %></td>
                <td><%= gmail %></td>
                <td>
                    <button class="btn approve">Approve</button>
                    <button class="btn reject">Reject</button>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs2 != null) rs2.close();
                        if (stmt2 != null) stmt2.close();
                        if (con2 != null) con2.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>
</div>

</main>

<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>
