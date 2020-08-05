<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
 background-image: url("https://www.toptal.com/designers/subtlepatterns/patterns/ignasi_pattern_s.png");
}

</style>
<meta charset="ISO-8859-1">
<title class="title" >Medical Report</title>
  <link rel = "icon" href = "images/medicine.png" type = "image/x-icon"> 

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src=https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script type="text/javascript" src="js/addMedicines.js"></script>
</head>
<body>
<form action="addReport" name="yourMedicinesForm" method="post">
<input type="hidden" name="medicinesList" value="">
<input type="hidden" name="updateMedicinesList" value="">

<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none;" id="mySidebar">
  <button class="w3-bar-item w3-button w3-large"
  onclick="w3_close()">Close &times;</button>
</div>

<div class="w3-teal">
  <button id="openNav" class="w3-button w3-teal w3-xlarge" onclick="w3_open()">&#9776;</button>
  <div class="w3-container">
    <h1>Medical Report</h1>
  </div>
    <div class="w3-container">
    <h3 align="right">Welcome Mr.Murari</h3>
  </div>
</div>

<input type="hidden" name="formAction" value="">
<table id="medicines" align="left" class="cell-border" width="50%">
		    <button type="button" name="Remove" value="Remove" id="remove"  class="btn del btn-delete btn-sm">
          <span></span> Delete item </button> </table>
<table>
 <tbody>
 <tr><td> <label>Medicine Name</label>
     <input type="text" name="medicineName" id="medicineName" placeholder="Medicine Name" class="form-control" >
     <input type="hidden" name="medicineId" id="medicineId" placeholder="Medicine ID" class="form-control" ></td>
      <td><label class="col-md-2 control-label">Manufacture</label>
				
            <input type="text" name="manufacture" id="manufacture" placeholder="Manufacture" class="form-control" ></td>
      <td> <label>Batch No</label>
	        <input type="text" name="batchNo" id="batchNo" placeholder="Batch No" class="form-control"  ></td>
      <td>
      <label class="col-md-2 control-label">Exp.Date</label>

<input type="month"  min="2018-03" value="2018-05"name="expDate" id="expDate" placeholder="Exp.Date" class="form-control"   >
     
          </td>
            			<td>
			 <label class="col-md-2 control-label">Quantity</label>
			<input type="number" name="qty" id="qty" placeholder="Quantity" class="form-control"   >
			</td> 
			  
                </tr> <tr>     <td>
              <label class="col-md-2 control-label">Price</label>
			<input type="text" name="price" id="price" placeholder="Price" class="form-control"   ></td>
 
           
    
 
  <button class="btn btn-info" class="add" id="add"><span>Add</span></button>
    <button class="btn btn-info" class="update" id="update"><span>Update</span></button></td> </tr>     
 </tbody>    
 </table>
<button class="btn btn-info" type="button" onclick="doSubmit()"><span>Submit</span></button>
</form>
</body>
<script type="text/javascript">
function doSubmit() {
	alert("dosubmit");
	
	document.forms["yourMedicinesForm"].elements["formAction"].value="SAVE_MEDICINES";
	document.forms["yourMedicinesForm"].submit();
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
var dataset=<c:out value="${dataset}" escapeXml="false"/>;
//var dataSet=[["DOLO650","2020B","2021-05","30","500.0"]];;
//alert(dataSet);
 

</script>
</html>