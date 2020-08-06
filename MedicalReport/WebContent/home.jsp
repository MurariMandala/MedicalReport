<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.project.been.objs.PharmacyDtls" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title class="title" >Medical Report</title>
  <link rel = "icon" href = "images/medicine.png" type = "image/x-icon"> 
<style> /* 
#mySidebar {
/*   background-image: url("images/medicines.jpg");
 */  background-repeat: no-repeat, repeat;
  background-color: #cccccc;
  background-position: center; 
  background-size: cover;
  height: 500px;
} */
</style>
</head>
<body>
<%
if(request.getSession().getAttribute("pharmaDtls")!=null){
	PharmacyDtls dtls=(PharmacyDtls)request.getSession().getAttribute("pharmaDtls");
	pageContext.setAttribute("pharmaId", dtls.getPharmacyId());
	pageContext.setAttribute("pharmaName", dtls.getPharmacyName());
	pageContext.setAttribute("userName", dtls.getUserName());
}
if(request.getSession().getAttribute("pharmaDtls")==null){
	response.sendRedirect("index.jsp");
}
%>
<form action="todaysReport" name="indexFormForTodaysReport" method="post">
<input type="hidden" name="formAction" value=""></form>
<form action="addReport" name="indexForm" method="post">
<input type="hidden" name="formAction" value="">

</form>

<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
  <button class="w3-bar-item w3-button w3-large"
  onclick="w3_close()">Close &times;</button>
  <a href="#"  name="addReport" id="addReport" onclick="addMedReport()" class="w3-bar-item w3-button">AddReport</a>
  <a href="#"  name="todayReports" id="todayReports" onclick="todayMedReport()" class="w3-bar-item w3-button">TodayReports</a>
  <a href="#" name="addYourMedicines" id="addYourMedicines" onclick="addMedicines()" class="w3-bar-item w3-button">Add Your Medicines</a>
  <a href="/MedicalReport/login?formAction=LOGOUT" name="logout" id="logout" class="w3-bar-item w3-button">Logout</a>
</div>
<div id="main">

<div class="w3-teal">
  <button id="openNav" class="w3-button w3-teal w3-xlarge" onclick="w3_open()">&#9776;</button>
  <div class="w3-container">
    <h1>Medical Report</h1>
  </div>
    <div class="w3-container">
    <h3 align="right">Welcome Mr.${userName} (${pharmaName})</h3>
  </div>
</div>

<img src="images/doctor.jpg" alt="doctor" style="width:100%";height="50%">

<div class="w3-container">
</div>

</div>

<script type="text/javascript">
function addMedicines(){
	document.forms["indexForm"].elements["formAction"].value="LIST_MEDICINES";
	document.forms["indexForm"].submit();
}
function addMedReport(){
//	alert("1");
	document.forms["indexForm"].elements["formAction"].value="GOTO_REPORT";
document.forms["indexForm"].submit();
   }
function todayMedReport(){
	//alert("1");
	document.forms["indexFormForTodaysReport"].elements["formAction"].value="GOTO_TODAT_REPORT";
document.forms["indexFormForTodaysReport"].submit();
   }


function w3_open() {
  document.getElementById("main").style.marginLeft = "25%";
  document.getElementById("mySidebar").style.width = "25%";
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("openNav").style.display = 'none';
}
function w3_close() {
  document.getElementById("main").style.marginLeft = "0%";
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("openNav").style.display = "inline-block";
}
</script>

</body>
</html>