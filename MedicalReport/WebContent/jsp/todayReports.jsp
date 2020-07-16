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
Success :${SuccessMsg}
<form action="addReport" method="post" width="1000px"; name="todayReportsForm">
<input type="hidden" name="formAction" value="">
 <fieldset>
<div class="col-md-0 col-md-offset-5">
<table id="reportItems"  align="left" width="950px"></table>
<div class="form-group col-xs-10 col-sm-2 col-md-4 col-lg-3">	
	    <button type="button" name="Remove" value="Remove" id="remove"  class="btn del btn-delete btn-sm">
          <span></span> Delete item </button> 
  </div>  
  </div> 
  </fieldset>
</form>
</body>

<script type="text/javascript">
var dataset= <c:out value="${dataset}" escapeXml="false"/>;
</script>
</html>