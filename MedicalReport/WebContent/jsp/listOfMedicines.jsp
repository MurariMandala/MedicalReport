<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
.modal-header {
  background-color: #B3B9BD;
  color: white;
    
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
 #myModal {

}
</style>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
var listMedicinesDataSet=<c:out value="${listMedicinesDataSet}" escapeXml="false"/>;
//var dataSet=[["DOLO650","2020B","2021-05","30","500.0"]];;
//alert(dataSet);
 
 $(document).ready(function() {
   var table= $('#medicines').DataTable( {
        data: listMedicinesDataSet,
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
				document.getElementById('priceperone').value = priceperone;
				document.getElementById('medicineName').value = medicineName;
				document.getElementById('medicineId').value = medicineId;
				document.getElementById('manufacture').value =manufacture;
				document.getElementById('batchNo').value =batchNo;
				document.getElementById('expDate').value =expDate;
				document.getElementById('qty').value = qty;
				document.getElementById('actualQty').value = actualQty;
				document.getElementById('price').value = price;
				hide();
  
    }
    function hide(){
       // this will help in hide the model
    	$("[data-dismiss=modal]").trigger({ type: "click" });

 };

 
} );

</script>
</head>
<body>



<!-- Modal HTML -->
<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
								
				<h4 class="modal-title">List of Medicines</h4>	
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                
			</div>
			<div class="modal-body">
		<table id="medicines" class="cell-border" width="100%"></table>	</div>
		</div>
	</div>
</div>

</body>
</html>