<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="todaysReport" name="indexFormForTodaysReport" method="post">
<input type="hidden" name="formAction" value=""></form>
<form action="addReport" name="indexForm" method="post">
<input type="hidden" name="formAction" value="">

</form>
<button name="addReport" id="addReport" onclick="addMedReport()">AddReport</button>
<button name="todayReports" id="todayReports" onclick="todayMedReport()">TodayReports</button>
</body>
<script type="text/javascript">
function addMedReport(){
	alert("1");
	document.forms["indexForm"].elements["formAction"].value="GOTO_REPORT";
document.forms["indexForm"].submit();
   }
function todayMedReport(){
	//alert("1");
	document.forms["indexFormForTodaysReport"].elements["formAction"].value="GOTO_TODAT_REPORT";
document.forms["indexFormForTodaysReport"].submit();
   }

</script>
</html>