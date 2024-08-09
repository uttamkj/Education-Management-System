<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Leave Management System</title>
<script src="js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="css/stylesleaveform.css">
</head>
<body>

	<form method="post" action="showLeave" onsubmit="return chk()" class="leave-form">
		<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3301/education_system", "root", "");

			Statement stmt = con.createStatement();
			String qry = "select * from employee";

			ResultSet rs = stmt.executeQuery(qry);
		%>
		    <label for="emp_id">Employee Name:</label> 
		    <select name="emp_id" id="emp_id">
			    <option hidden="hidden">Choose...</option>
			    <%
			    while (rs.next()) {
				    out.print("<option value='" + rs.getInt(1) + "'>" + rs.getString(2) + "</option>");
			    }
			    con.close();
			    } catch (Exception e) {
				    e.printStackTrace();
			    }
			    %>
		    </select>
		    <br><br><br>
		    <label for="leave_id">Leave Apply:</label>
		    <select name="leave_id" id="leave_id"><br>
			    <option hidden="hidden">Choose...</option>
		    </select> 
		    <br> <br>
		    <label for="num_of_leave">Number of Leave Apply:</label>
		    <input type="text" id="num_of_leave" name="num_of_leave" /> 
		    <br>
		    <label for="onum_of_leave">Number of Leave Available:</label>
		    <input type="text" id="onum_of_leave" name="onum_of_leave" readonly/> 
		    <br> 
		    <span id="qsms"></span> 
		    <br> <br> 
		    <input type="submit" name="btn" value="Submit" />
	</form>
	<br>
	<p>${param.msg}</p>
	<script>
		$(document).ready(function() {
			alert("hello");
			$("#emp_id").change(function() {
				$.ajax({
					url:"getDetails",
					type:"POST",
					dataType:"json",
					data:{emp_id : $("#emp_id").val()},
					success:function(res) {
						op = "";
						$.each(res,function(key,value) {
							op = op+"<option value= "+value.leave_id+">"+ value.leave_name+ "</option>";
						});
						$("#leave_id").html(op);
					}
				});
			});
			$("#leave_id").change(function(){
				$.ajax({
					url:"GetNumLeave",
					type:"post",
					dataType:"json",
					data:{emp_id:$("#emp_id").val(),leave_id:$("#leave_id").val()},
					success:function(res){
						$("#onum_of_leave").val(res[0].no_of_leave);
					}
				});
			});
		});

		function chk(){
			errorLeave = validLeave();
			return errorLeave;
		}

		function validLeave(){
			oldNum = parseInt(document.getElementById("onum_of_leave").value);
			newNum = parseInt(document.getElementById("num_of_leave").value);
			if(oldNum >= newNum){
				document.getElementById("qsms").innerHTML="null";
				return true;
			}else{
				document.getElementById("qsms").innerHTML="Sorry, Choose Less Leave days";
				return false;
			}
		}
	</script>

</body>
</html>
