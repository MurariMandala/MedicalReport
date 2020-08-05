<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title class="title" >Medical Report</title>
  <link rel = "icon" href = "images/medicine.png" type = "image/x-icon"> 
 <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.16.2/axios.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/plug-ins/1.10.15/api/row().show().js"></script>

 <script src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>        


<script type="text/javascript" src="js/addReportScript.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
 
</head>

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
<div class="form-group col-xs-10 col-sm-2 col-md-4 col-lg-3">	
	    <button type="button" name="Remove" value="Remove" id="remove"  class="btn del btn-delete btn-sm">
          <span></span> Delete item </button> 
  </div>  
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