
const app = {
  buildForm() {
    return [
      $('#medicineName').val(),//0
      $('#manufacture').val(),  //1
      $('#batchNo').val(),//2
      $('#expDate').val(),//3
      $('#sgst').val(),//4
      $('#cgst').val(),//5
      $('#qty').val(),//6
      $('#price').val(),//7
      $('#totItemAmount').val(),//8
      $('#itemId').val(),//9
	
	  
	  ];
  },
  sendToServer() {
    const formData = this.buildForm();
    axios.post('http://localhost:2000/record', formData)
      .then(response => console.log(response));
  },
  addRow(dataTable, data) {

   const formData = this.buildForm();
        const addedRow = dataTable.row.add(formData).draw();
        addedRow.show().draw(false);
        const addedRowNode = addedRow.node();
        console.log(addedRowNode);
        $(addedRowNode).addClass('highlight');
        this.confirmData(dataTable,"");

		return false;
	 
  },
  selectRow(dataTable) {
	   if ($(this).hasClass('selected')) {
      $(this).removeClass('selected');
      //deduct from total
//      
      $(this).addClass('unselected');
	  var str= dataTable.row('.unselected').data();
	   var arr = str.toString().split(',');
	   /*	   const index = baIdArr.indexOf(arr[20]);
	   if (index > -1) {
		   baIdArr.splice(index, 1);//no of items to be removed
	   }
*///	   alert('st1r:'+str);
	   $(this).removeClass('unselected');
	  
    } else {
      var selItem=dataTable.$('tr.selected');
      selItem.removeClass('selected');
      $(this).addClass('selected');
      var str= dataTable.row('.selected').data();
	   var arr = str.toString().split(',');
	//   baIdArr.push(arr[20]);
//	   alert('str2:'+str);
	  //  $(this).removeClass('selected');
	    //selItems.push($(this));
	    //$(this).addClass('xselected');
	   selItem.addClass('selected');
	   	 
	   //add in total
 
	
	    
	    
	  
    }
  },
  confirmData(dataTable) {
		 
		 var data = dataTable.rows().data().length; 
		 var totSgstAmount=0.0;
		 var totCgstAmount=0.0;
		 var totAmount=0.0;
		 
			var i;
	         var addReportItems = [ ];
					var arrayAsAString=''; 
					for(i=0;i<data;i++){
						
						var data1 = dataTable.rows().data()[i];
							  //baItems[i]=data1.split(',');
							  addReportItems[i]=data1;
						//	   alert(baItems[i]);
							  var arr = data1 .toString().split(',');
								var price=arr[7];                    //price
							    var totSgstPer=arr[4];   
								totSgst=(price*totSgstPer)/100;  //totSgst%
								totSgstAmount=+totSgstAmount + +totSgst; // totSgst Amount
								var totCgstPer=arr[5];
								totCgst=(price*totCgstPer)/100;  //totCgst%
								totCgstAmount=+totCgstAmount + +totCgst;  //totCgst Amount
								var amountTot=arr[8];
								totAmount=+totAmount + +amountTot;  //totAmount
								document.getElementById("sgstTax").value=totSgstAmount.toFixed(2);
								document.getElementById("cgstTax").value=totCgstAmount.toFixed(2);
								document.getElementById("totAmount").value=totAmount.toFixed(2);
								document.getElementById("netAmount").value=totAmount.toFixed(2);
						}
					if(data==0){
						document.getElementById("sgstTax").value="";
						document.getElementById("cgstTax").value="";
						document.getElementById("totAmount").value="";
						document.getElementById("netAmount").value="";
					}
					addReportItems=addReportItems.join("~");		
		 document.forms["medicalReportCreationForm"].elements["addReportItems"].value=addReportItems;
		
	 },
	  removeRow(dataTable,data) {
		  var data = dataTable.rows().data().length; 
		  var data1 = dataTable.row('.selected').data(); 
		
			//   var arr = data1 .toString().split(',');
			  
					  dataTable.row('.selected').remove().draw( false );
					   this.confirmData(dataTable,"");
					   return false;
				
		  
		
	    //this.totMrnAmount(dataTable,"");
		    //this.getWorkGSTAmount(dataTable,"");
		  
		  },
		  doCalGST(dataTable,data) {
			
				var price=document.getElementById("price").value;
				var sgstPer=document.getElementById("sgst").value;
				var cgstPer=document.getElementById("cgst").value;
				var sgstAmount=(price*sgstPer)/100;
				var cgstAmount=(price*cgstPer)/100;
				
			  var totGstAmount=+price+sgstAmount+cgstAmount;
		//	var totAmount= document.getElementById("totAmount").value;
			 document.getElementById("totItemAmount").value=totGstAmount.toFixed(2);
		    //this.totMrnAmount(dataTable,"");
			    //this.getWorkGSTAmount(dataTable,"");
				   return false;
					
			  },
  start() {
	   var dataSet// =[["211","2020-03-04","HYD","null","Earthwork","0","Normal Soils","10074","2020-03-12","2020-03-04","11.0","3","21.0","12","27.72","231.00","dsfds","97790","0"]];
			// [["1225","2020-02-25","","sand","Internal Plumbong","0","INTERNAL FLATS SAINTORY AND CP F","0","2020-02-15","2020-02-15","12.0","LUMPSUM","50.0","630.0","5","30.0","12.0","demo"],["1224","2020-02-24","","sand","External Plumbing","0","MANHOLE CHAMBER CONSTRUCT / GAL","0","2020-02-15","2020-02-15","20.0","LUMPSUM","12.0","244.8","0","0.0","20.0","demo"]];
	//	alert(dataSet);
    const dataTable = $('#reportItems').DataTable({
    	 
      data: dataset,
	   columns: [
	
		{ title: 'Medicine Name' }, //0
	    { title: 'Manufacture' },//1
        { title: 'Batch No' }, //5
        { title: 'Exp.Date' }, //5
        { title: 'SGST%' }, //5
        { title: 'CGST%' }, //5
        { title: 'Quantity' }, //5
       { title: 'Price' }, //5
        { title: 'TotAmount' }, //5
//        { title: 'Item ID' }, //5
        
      	 
      ]
      
    });
	
   
  
	  
	
  $('#add').on('click', this.addRow.bind(this, dataTable));   
  // $('#add').on('click', this.sendToServer.bind(this));
    const self = this;
    $('#reportItems tbody').on('click', 'tr', function(){
      self.selectRow.bind(this, dataTable)();
    });
    $('#remove').on('click', this.removeRow.bind(this, dataTable));
    $('#sgst').on('change', this.doCalGST.bind(this, dataTable));
    $('#cgst').on('change', this.doCalGST.bind(this, dataTable));
    $('#price').on('change', this.doCalGST.bind(this, dataTable));
  }
 	  
	
};

$(document).ready(() => app.start());
