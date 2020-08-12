<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.project.been.objs.PharmacyDtls" %>
<jsp:include page="jsp/allImportsFile.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title class="title" >Medical Report</title>
  <link rel = "icon" href = "images/medicine.png" type = "image/x-icon"> 
<link rel="stylesheet" href="css/model.css">
</head>
<style>
.topright {
  position: absolute;
  top: 10px;
  right: 70px;
  font-size: 18px;
  font-weight: bold;
  text-decoration: none;
  color:white;
}
</style>
<body>
<%
if(request.getSession().getAttribute("pharmaDtls")!=null){
	PharmacyDtls dtls=(PharmacyDtls)request.getSession().getAttribute("pharmaDtls");
	pageContext.setAttribute("pharmaId", dtls.getPharmacyId());
	pageContext.setAttribute("pharmaName", dtls.getPharmacyName());
	pageContext.setAttribute("userName", dtls.getUserName());
	pageContext.setAttribute("address", dtls.getAddress());
	pageContext.setAttribute("dlno", dtls.getDlNo());
	pageContext.setAttribute("doctorName", dtls.getDoctorName());
	pageContext.setAttribute("taxNo", dtls.getGstInTaxNo());
	pageContext.setAttribute("phNo", dtls.getPhoneNo());
	pageContext.setAttribute("totIncome", dtls.getTotalIncome());
	pageContext.setAttribute("totCgstAmt", dtls.getTotCgstAmount());
	pageContext.setAttribute("totCgstPer", dtls.getTotCgstPer());
	pageContext.setAttribute("totSgstAmt", dtls.getTotSgstAmount());
	pageContext.setAttribute("totSgstPer", dtls.getTotSgstPer());
	pageContext.setAttribute("totSaleOfMedicines", dtls.getTotSaleMedicines());
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
  <a href="#"  name="addReport" id="addReport"onclick="addMedReport()" style="text-decoration: none;"  class="w3-bar-item w3-button">AddReport</a>
  <a href="#"  name="todayReports" id="todayReports" onclick="todayMedReport()" style="text-decoration: none;"class="w3-bar-item w3-button">TodayReports  </span></a>
  <a href="#" name="addYourMedicines" id="addYourMedicines" onclick="addMedicines()"style="text-decoration: none;" class="w3-bar-item w3-button">Add Your Medicines</a>
  

<a href="#mylogoutModal"  data-toggle="modal" name="logout" id="logout" style="text-decoration: none;"class="w3-bar-item w3-button">Logout     <span class="glyphicon glyphicon-log-out"></span></a>
</div>
<div id="main">

<div class="w3-teal">
  <button id="openNav" class="w3-button w3-teal w3-xlarge" onclick="w3_open()">&#9776;</button>
  <div class="w3-container">
    <h1>Medical Report</h1>
     <a href="#myModal"  data-toggle="modal"  class="topright"class="w3-bar-item w3-button" >ViewProfile   <span class="glyphicon glyphicon-user"></span></a>
     <h3 align="right">Welcome Mr.${userName} (${pharmaName})</h3>
  </div>
  </div>
   
<img src="images/doctor.jpg" alt="doctor" style="width:100%";height="50%">

<div class="w3-container">
</div>

</div>

<!-- Modal HTML -->
<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
								
				<h4 class="modal-title">${userName}</h4>	
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                
			</div>
			<div class="modal-body">
				
			<p>	Pharmacy Name :${pharmaName} </p>
			<p>	Doctor Name   :${doctorName} </p>
			<p>	Address       :${address}</p>
			<p>	DlNo          :${dlno}</p>
			<p>	GST Tax Number       :${taxNo}</p>
			<p>	Phone No       :${phNo}</p>
			<p>	Your Total income          :${totIncome}</p>
	        <p>	Total CGST Amount          :${totCgstAmt}</p>
	        <p>	Total CGST %         :${totCgstPer}</p>
	        <p>	Total SGST Amount        :${totSgstAmt}</p>
	        <p>	Total SGST %        :${totSgstPer}</p>
	        <p>	Total Number of Medicines You sale          :${totSaleOfMedicines}</p>
			</div>
		</div>
	</div>
</div>

<div id="mylogoutModal" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
								
				<h4 class="modal-title">Are You Sure Want to Logout</h4>	
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                
			</div>
			<div class="modal-body">
					<div class="modal-footer justify-content-center">
				<button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
				<a href="/MedicalReport/login?formAction=LOGOUT" class="btn btn-secondary" style="color: white;">Yes</a>
			<!-- 	<button type="submit" class="btn btn-danger" href="/MedicalReport/login?formAction=LOGOUT">Yes</button> -->
			</div>
		
			</div>
		</div>
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