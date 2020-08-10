<%@page import="com.mysql.cj.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page import="com.project.been.objs.MedicalReportDtls" %>
    <%@page import="com.project.been.objs.PharmacyDtls" %>
    <jsp:include page="allImportsFile.jsp" />
    <jsp:include page="listOfMedicines.jsp" />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
/*  background-image: url("https://www.toptal.com/designers/subtlepatterns/patterns/ignasi_pattern_s.png"); */
}
.searchbtn{
  float: left;
  width: 15%;
  padding: 5px;
  color: black;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none; /* Prevent double borders */
  cursor: pointer;
}
</style>
<meta charset="ISO-8859-1">
<title class="title" >Medical Report</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="js/addReportScript.js"></script>
</head>
<style>
fieldset {
  margin: 5px;
  padding: 0 2px 2px;
  border: 1px solid #666;
  border-radius: 8px;
 
  padding-top: 0px;
}
body{
background-color: white;
}
.topright {
  position: absolute;
  top: 550px;
  right: 900px;
  font-size: 18px;
  font-weight: bold;
}
.topright1 {
  position: absolute;
  top: 590px;
  right: 900px;
  font-size: 18px;
  font-weight: bold;
}
.topright2 {
  position: absolute;
  top: 630px;
  right: 900px;
  font-size: 18px;
  font-weight: bold;
}

</style>
<body>
<%
if(request.getAttribute("reportDtls")!=null){
	MedicalReportDtls reportDtls=(MedicalReportDtls)request.getAttribute("reportDtls");
	pageContext.setAttribute("patientId", reportDtls.getPatientId());
	pageContext.setAttribute("patientName", reportDtls.getPatientName());
	pageContext.setAttribute("billNo", reportDtls.getBillNo());
	pageContext.setAttribute("billDate", reportDtls.getBillDate());
	pageContext.setAttribute("saleType", reportDtls.getSalesType());
	pageContext.setAttribute("totAmount", reportDtls.getTotAmount());
	pageContext.setAttribute("paidAmount", reportDtls.getPaidAmount());
	pageContext.setAttribute("netAmount", reportDtls.getNetAmount());
	pageContext.setAttribute("preparedBy", reportDtls.getPreparedBy());
	pageContext.setAttribute("printedBy", reportDtls.getPrintedBy());
	pageContext.setAttribute("cgstAmount", reportDtls.getCgstAmount());
	pageContext.setAttribute("sgstAmount", reportDtls.getSgstAmount());
	
	
}
if(request.getSession().getAttribute("pharmaDtls")!=null){
	PharmacyDtls pdtls=(PharmacyDtls)request.getSession().getAttribute("pharmaDtls");
	pageContext.setAttribute("pharmaId", pdtls.getPharmacyId());
	pageContext.setAttribute("gstInTaxId", pdtls.getGstInTaxId());
	pageContext.setAttribute("pharmaName", pdtls.getPharmacyName());
	pageContext.setAttribute("doctorName", pdtls.getDoctorName());
	pageContext.setAttribute("address", pdtls.getAddress());
	pageContext.setAttribute("phoneNo", pdtls.getPhoneNo());
	pageContext.setAttribute("gstInTaxNo", pdtls.getGstInTaxNo());
	pageContext.setAttribute("dlNo", pdtls.getDlNo());
	
}
if(request.getSession().getAttribute("pharmaDtls")==null){
	response.sendRedirect("index.jsp");
}
%>
<form action="todaysReport" method="post" width="1000px"; name="todayReportsForm">
<input type="hidden" name="formAction" value="">

</form>
<form action="addReport" method="post" width="500px"; name="medicalReportCreationForm">
<input type="hidden" name="addReportItems" value="">
 <input type="hidden" id="patientId" name="patientId" value="${patientId}" >
<input type="hidden" name="itemId"  value="${itemId}" />
<input type="hidden" name="formAction" value="${formAction}">

<input type="hidden" name="priceperone" id="priceperone" value="" />

 <fieldset>
 <p align="center"> ${pharmaName} </p>
 <p align="center"> ${address} </p>
 <p align="center"> Phone No :${phoneNo} </p>
 <p align="center">CASH/CREDIT BILL </p>
 <p> DLNO :${dlNo} </p>
 <p align="right"> GSTINNO :${gstInTaxNo} </p>

 </fieldset>
<fieldset>
<div class="col-md-7 col-md-offset-7">
 <div class="container login-container">
            <div class="row">
                <div class="col-md-3 login-form-5">
                <div class="form-group"> </div>
                  
                 <div class="form-group">
                 
                 <c:if test="${patientId ==0 || patientId==null}"> <input type="text" class="form-control" placeholder="PATIENT NAME" id="patientName" name="patientName"  value="${patientName}" /></c:if>
                 <c:if test="${patientId !=0 && patientId !=null }">
                 <p  style="font-weight: bold;"> Patient Name  :${patientName} </p></c:if>           
                        </div>
            
                      <div class="form-group">

                 <c:if test="${patientId ==0 || patientId==null}"> <input type="text" class="form-control" placeholder="SALE TYPE" id="saleType" name="saleType"  value="${saleType}" /></c:if>
                <c:if test="${patientId !=0 && patientId !=null }"> <p  style="font-weight: bold;">Sales Type  :${saleType} </p></c:if>         
                        </div>
               <div class="form-group">
             <p  style="font-weight: bold;">  Doctor Name : ${doctorName}</p>
               </div>
                
                </div>
                
              <div class="col-md-3 login-form-5">   
                  <div class="form-group"> </div>
                    <div class="form-group">
                    <input type="hidden" id="billNo" name="billNo" value="${billNo}">
                      <p  style="font-weight: bold;"> Bill No :   ${billNo}</p>
                        </div>
                       
                      <div class="form-group">
 						<p  style="font-weight: bold;">Bill Date :   ${billDate}</p> 
                 <input type="hidden" id="billDate" name="billDate" value="${billDate}">
                            
                        </div>
                        
               </div> 
                
            </div>
        </div> </div> 
 
  
 </fieldset>
 <fieldset>
<div class="col-md-8 col-md-offset-9">
<table id="reportItems"  align="left" width="950px"></table>
<div class="form-group col-xs-10 col-sm-2 col-md-4 col-lg-3">	
	    <button type="button" name="Remove" value="Remove" id="remove"  class="btn del btn-delete btn-sm">
          <span></span> Delete item </button> 
  </div>  
  </div> 
  <c:if test="${patientId ==0 || patientId==null}"> 
 <table>
 <tbody>
 <tr><td> <label>Medicine Name</label>
     <input type="text" name="medicineName" id="medicineName" placeholder="Medicine Name" class="form-control" readonly>
     <input type="hidden" name="medicineId" id="medicineId" placeholder="Medicine ID" class="form-control" >
      <button type="button" class="searchbtn" href="#myModal"  data-toggle="modal" ><i class="fa fa-search"></i></button></td>
      <td><label class="col-md-2 control-label">Manufacture</label>
				
            <input type="text" name="manufacture" id="manufacture" placeholder="Manufacture" class="form-control" readonly  ></td>
      <td> <label>Batch No</label>
	        <input type="text" name="batchNo" id="batchNo" placeholder="Batch No" class="form-control"  readonly ></td>
      <td>
      <label class="col-md-2 control-label">Exp.Date</label>

<input type="month"  min="2018-03" value="2018-05"name="expDate" id="expDate" placeholder="Exp.Date" class="form-control"   >
     
          </td>
            

       
			<td>
			 <label class="col-md-2 control-label">Quantity</label>
			<input type="number" name="qty" id="qty" placeholder="Quantity" class="form-control"   >
			<input type="hidden" name="actualQty" id="actualQty" placeholder="Quantity" class="form-control"   ></td> 
			  
                </tr> <tr>     <td>
              <label class="col-md-2 control-label">Price</label>
			<input type="text" name="price" id="price" placeholder="Price" class="form-control"   ></td>
 
            <td>
              
     <label>SGST%</label>
      <select name="sgst" id="sgst" class="form-control"  >
    <option value="0">0</option>
    <option value="2">2</option>
    <option value="5">5</option>
    <option value="10">10</option>
    <option value="15">15</option>
    <option value="20">20</option>
  </select>
     
			</td>
			   
	<td> <label class="col-md-2 control-label">CGST%</label>
	  <select name="cgst"  id="cgst" class="form-control"  >
    <option value="0">0</option>
    <option value="2">2</option>
    <option value="5">5</option>
    <option value="10">10</option>
    <option value="15">15</option>
    <option value="20">20</option>
  </select></td>
           <td> <label class="col-md-2 control-label">TotAmount</label>
            <input type="text" name="totItemAmount" id="totItemAmount" placeholder="TotAmount" class="form-control" readonly="readonly"  ></td>
     <td>  
    
 
  <button class="btn btn-info" class="add" id="add"><span>Add</span></button></td> </tr>     
 </tbody>    
 </table>
 <hr>
 </c:if>
 <c:if test="${patientId !=0 && patientId !=null }">
 <table>
 <tr><td>
 <p style="font-weight: bold;"> SGST TAX   :   ${sgstAmount}
CGST TAX   :   ${cgstAmount}</p> 
</td><td>
<p class="topright" >  TotAmount  :   ${totAmount} </p></td></tr>
<tr><td>
<p style="font-weight: bold;"> Prepared By:   ${preparedBy}</p></td>
<td><p class="topright1" >  NetAmount  :   ${netAmount}</p></td></tr>
<tr><td> <p style="font-weight: bold;">  Printed By :   ${printedBy}</p></td>
<td><p class="topright2" > PaidAmount     :   ${paidAmount}</p></td>
</tr>

 </table>

 

 
 </c:if>
  <c:if test="${patientId ==0 || patientId==null}">
  <table>	
 
   <tr>
   <td>  <label for="sgstTax" >SGST TAX  :</label></td>
   <td><c:if test="${patientId ==0 || patientId==null}"> <input type="text"  class="form-control" id="sgstTax" name="sgstTax" value="${sgstAmount}" readonly="readonly"  ></c:if></td>
  <td>  <label for="netAmount">NetAmount:</label></td>
   <td><c:if test="${patientId ==0 || patientId==null}"> <input type="text"   class="form-control"id="netAmount" name="netAmount" value="${netAmount}" readonly="readonly"  ></c:if></td>
  </tr><tr>
   <td>  <label for="cgstTax">CGST TAX :</label></td>
   
   <td><c:if test="${patientId ==0 || patientId==null}"> <input type="text"  class="form-control" id="cgstTax" name="cgstTax" value="${cgstAmount}" readonly="readonly"  > </c:if></td>
  
  
   
   <td>  <label for="totAmount">TotAmount:</label></td>
   <td><c:if test="${patientId ==0 || patientId==null}"> <input type="text"  class="form-control" id="totAmount" name="totAmount" value="${totAmount}" readonly="readonly"  ></c:if></td>
  </tr><tr> 
    <td>  <label for="doctor">Prepared By:</label></td>
   <td><c:if test="${patientId ==0 || patientId==null}"> <input type="text"  class="form-control" id="preparedBy" name="preparedBy" value="${preparedBy}"></c:if></td>
  
  
  
   <td>  <label for="paidAmount">PaidAmount:</label></td>
   <td><c:if test="${patientId ==0 || patientId==null}"> <input type="text"   class="form-control"id="paidAmount" name="paidAmount" value="${paidAmount}"></c:if></td>
   
   </tr>
   <tr>
 
   <tr>
   <td>  <label for="doctor">Printed By:</label></td>
   <td><c:if test="${patientId ==0 || patientId==null}"> <input type="text"  class="form-control" id="printedBy" name="printedBy" value="${printedBy}"></c:if></td>
   </tr>
   </table></c:if>
 </fieldset>	
 <c:if test="${patientId ==0 || patientId==null}"> 				
       <button class="btn btn-info" style="margin-left: 30%;" id="save" name="save" onclick="doSave()"><span class="glyphicon glyphicon-floppy-disk">Save</span></button>
       </c:if>
   
</form>
</body>
<script type="text/javascript">
/* alert(${patientId}); */
 function doSearch() {
//	alert("doSearch");
document.forms["todayReportsForm"].elements["formAction"].value="LIST_OF_MEDICINES";
document.forms["todayReportsForm"].submit();
/* var Window;
	 Window=window.open("/MedicalReport/todaysReport?formAction=LIST_OF_MEDICINES&reqSource=medicine","_blank","height=600,width=1000,left=300,top=10,resizable=yes,scrollbars=yes,toolbar=yes,location=center,directories=no, status=yes");
 */}
function doSave(){
	//alert("1");
	document.forms["medicalReportCreationForm"].elements["formAction"].value="REPORT_SAVE";
document.forms["medicalReportCreationForm"].submit();
   }
var dataset= <c:out value="${dataset}" escapeXml="false"/>;
</script>
</html>