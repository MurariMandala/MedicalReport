<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.16.2/axios.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/plug-ins/1.10.15/api/row().show().js"></script>

 <script src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>        


<script type="text/javascript" src="js/addReportScript.js"></script>
 
 
</head>
<body>
<form action="addReport" method="post" width="1000px"; name="medicalReportCreationForm">
<input type="hidden" name="addReportItems" value="">
<input type="hidden" name="itemId"  value="${itemId}" />
<input type="hidden" name="formAction" value="${formAction}">

<fieldset>
 
  <table>
  <tbody style="width: 200%;">
  <tr><td><label for="pname">Patient Name :</label></td>
  <td><input type="text" id="patientName" name="patientName" width="100%"></td>
   <td> <label for="billno">Bill No :</label></td>
   <td> <input type="text" id="billNo" name="billNo" value="${billNo}"></td></tr>
  <tr><td>
  <label for="saletype">Sale Type :</label></td>
  <td>  <input type="text" id="saleType" name="saleType"></td>
  <td>  <label for="billDate">Bill Date :</label></td>
  <td>  <input type="text" id="billDate" name="billDate" value="${billDate}"></td></tr>
  <tr>
   <td>  <label for="doctor">Doctor Name :</label></td>
   <td> <input type="text" id="doctorName" name="doctorName"></td></tr>
  </tbody>
  </table>
  
 </fieldset>
 <fieldset>
<div class="col-md-0 col-md-offset-5">
<table id="reportItems"  align="left" width="950px"></table>
<div class="form-group col-xs-10 col-sm-2 col-md-4 col-lg-3">	
	    <button type="button" name="Remove" value="Remove" id="remove"  class="btn del btn-delete btn-sm">
          <span></span> Delete item </button> 
  </div>  
  </div>  
 <table>
 <tbody>
 <tr><td> <label class="col-md-2 control-label">Medicine Name</label>
     <input type="text" name="medicineName" id="medicineName" placeholder="Medicine Name" class="form-control"   ></td>
     <td><label class="col-md-2 control-label">Manufacture</label>
				
            <input type="text" name="manufacture" id="manufacture" placeholder="Manufacture" class="form-control"   ></td>
      <td> <label class="col-md-2 control-label">Batch No</label>
	        <input type="text" name="batchNo" id="batchNo" placeholder="Batch No" class="form-control"   ></td>
      <td>
       <label class="col-md-2 control-label">Exp.Date</label>
	        <input type="date" name="expDate" id="expDate" placeholder="Exp.Date" class="form-control"   >
          </td>
            
    <td>
     <label class="col-md-2 control-label">SGST%</label></td>
 <td>     <select name="sgst" id="sgst" class="form-control"  >
    <option value="0">0</option>
    <option value="2">2</option>
    <option value="5">5</option>
    <option value="10">10</option>
    <option value="15">15</option>
    <option value="20">20</option>
  </select>
     
			</td>
			   
	<td> <label class="col-md-2 control-label">CGST%</label></td>
<td>		  <select name="cgst" id="cgst" class="form-control"  >
    <option value="0">0</option>
    <option value="2">2</option>
    <option value="5">5</option>
    <option value="10">10</option>
    <option value="15">15</option>
    <option value="20">20</option>
  </select></td>
        </tr>   
			<td>
			 <label class="col-md-2 control-label">Quantity</label>
			<input type="number" name="qty" id="qty" placeholder="Quantity" class="form-control"   ></td>   
            <td>
              <label class="col-md-2 control-label">Price</label>
			<input type="number" name="price" id="price" placeholder="Price" class="form-control"   ></td>
            <td>
            <label class="col-md-2 control-label">TotAmount</label>
            <input type="number" name="totItemAmount" id="totItemAmount" placeholder="TotAmount" class="form-control"   ></td>
               <td>  <button class="add matbill btn-sm" id="add"><span>Add</span></button></td>
 </tbody>
 </table>
 </fieldset>	
  <fieldset>	
  <table>		 
 <tr>
   <td>  <label for="sgstTax">SGST TAX :</label></td>
   <td> <input type="text" id="sgstTax" name="sgstTax"></td>
   <td>  <label for="cgstTax">CGST TAX :</label></td>
   <td> <input type="text" id="cgstTax" name="cgstTax"></td>
   <td>  <label for="totAmount">TotAmount:</label></td>
   <td> <input type="text" id="totAmount" name="totAmount"></td>
   <td>  <label for="netAmount">NetAmount:</label></td>
   <td> <input type="text" id="netAmount" name="netAmount"></td>
   <td>  <label for="paidAmount">PaidAmount:</label></td>
   <td> <input type="text" id="paidAmount" name="paidAmount"></td>
   
   </tr>
   <tr>
   <td>  <label for="doctor">Prepared By:</label></td>
   <td> <input type="text" id="preparedBy" name="preparedBy"></td>
   </tr>
   <tr>
   <td>  <label for="doctor">Printed By:</label></td>
   <td> <input type="text" id="printedBy" name="printedBy"></td>
   </tr>
   </table>
 </fieldset>					
       <button class="add matbill btn-sm" id="save" name="save" onclick="doSave()"><span>Save</span></button>
</form>
</body>
<script type="text/javascript">
function doSave(){
	//alert("1");
	document.forms["medicalReportCreationForm"].elements["formAction"].value="REPORT_SAVE";
document.forms["medicalReportCreationForm"].submit();
   }
var dataset= <c:out value="${dataset}" escapeXml="false"/>;
</script>
</html>