<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
         <jsp:include page="allImportsFile.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title class="title" >Medical Report</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/addReportScript.js"></script> 
</head>
<style type="text/css">
body{
 background-image: url("https://www.toptal.com/designers/subtlepatterns/patterns/ignasi_pattern_s.png");
}

</style>
<%
if(request.getSession().getAttribute("pharmaDtls")==null){
	response.sendRedirect("index.jsp");
}
%>
<body>
<form action="todaysReport" method="post" width="1000px"; name="todayReportsForm">
<input type="hidden" name="formAction" value="">
<input type="hidden" name="selectedId"  value="">

</form>
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
</div>
<div id="main">

<div class="w3-teal">
  <button id="openNav" class="w3-button w3-teal w3-xlarge" onclick="w3_open()">&#9776;</button>
  <a href="home.jsp" class="btn btn-sm btn-primary"><span class="glyphicon glyphicon-home"></span> Home</a>
  <div class="w3-container">
    <h1>Medical Report</h1>
  </div>
    <div class="w3-container">
    <h3 align="right">Welcome Mr.Murari</h3>
  </div>
</div>

<div class="w3-container">
</div>


 <fieldset>
<div class="col-md-10 col-md-offset-0">
<table id="reportItems"  align="left" width="950px"></table>
  </div> 
  </fieldset>
  </div>
</body>

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
var dataset= <c:out value="${dataset}" escapeXml="false"/>;
</script>
</html>