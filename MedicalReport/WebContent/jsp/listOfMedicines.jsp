<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src=https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<!-- jQuery library -->

<style type="text/css">
body{
background-color:white;
 background-image: url("https://www.toptal.com/designers/subtlepatterns/patterns/ignasi_pattern_s.png");
}
.modal-content {
    width: 1150px;
}
#medicines.dataTable tbody tr:hover {
  background-color: #B3B8BD;
    color :#FFFFFF;
}
 #medicines.dataTable thead {
  line-height: 12px;
  background-color: #B3B8BD  ;
   color :#FFFFFF;
}

  #medicines tr td { 
  	line-height: 12px; }
 

</style>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
var dataSet=<c:out value="${dataset}" escapeXml="false"/>;
//var dataSet=[["DOLO650","2020B","2021-05","30","500.0"]];;
//alert(dataSet);
 
 $(document).ready(function() {
   var table= $('#medicines').DataTable( {
        data: dataSet,
        columns: [
            { title: "Medicine Name" },
            { title: "Medicine Id" },
            { title: "Manufacture" },
            { title: "Batch No" },
            { title: "Exp.Date" },
            { title: "Quantity" },
            { title: "Price" }
            
        ]
    } );
    $('#medicines tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
           
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            returnSelected();
        }
    } );
    
    function returnSelected(){
    	//alert(" function returnSelected");
    	var selItem=table.$('tr.selected');
    		  var str= table.row('.selected').data();
				   var arr = str.toString().split(',');
				   selItem.addClass('selected');
               // alert( 'You clicked on '+data[9]+'\'s row' );
				var medicineName = arr[0]  
				var medicineId = arr[1]
              var manufacture=arr[2];
				var batchNo = arr[3]
				var expDate = arr[4]
				var qty = arr[5]
				var price = arr[6]
				var actualQty=arr[5]
				var priceperone=price/qty;
				window.opener.document.getElementById('priceperone').value = priceperone;
				window.opener.document.getElementById('medicineName').value = medicineName;
				window.opener.document.getElementById('medicineId').value = medicineId;
				window.opener.document.getElementById('manufacture').value =manufacture;
				window.opener.document.getElementById('batchNo').value =batchNo;
				window.opener.document.getElementById('expDate').value =expDate;
				window.opener.document.getElementById('qty').value = qty;
				window.opener.document.getElementById('actualQty').value = actualQty;
				window.opener.document.getElementById('price').value = price;
			window.close();	  
    }
 
} );

</script>
</head>
<body>


<div class="w3-teal">
  <div class="w3-container">
    <h1>List of Medicines</h1>
  </div>
    <div class="w3-container">
    <h5 align="right">single click to select !</h5>
  </div>
</div>

<table id="medicines" class="cell-border" width="100%"></table>
</body>
</html>