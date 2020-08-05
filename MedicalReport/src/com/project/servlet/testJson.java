package com.project.servlet;

import java.util.ArrayList;

import com.mysql.cj.util.StringUtils;
import com.project.been.objs.MedicalReportItemDtls;

public class testJson {
public static void main(String arrs[]) {
	
	 ArrayList<MedicalReportItemDtls>itemsUpdatedArr=new ArrayList<MedicalReportItemDtls>();
String str="~C-FURO 500,4324,HETERO,31173008,2021-09,55,1375.0~,DOLO650,1234,INDIA,2020B,2021-05,30,500.0~,,WOKRIDE-D,5456,WOKAHARD,PDECP01,2022-08,45,1687.5";
String [] splitn=str.split("~");
for(int i=0;i<splitn.length;i++) {
	if(i==1||1<i) {
		String nextsplit=splitn[i];
		String splitted[] = nextsplit.split(","); 

	StringBuffer sb = new StringBuffer();
	String retrieveData = "";
	System.out.println(splitted.length);
	for(int j =0; j<splitted.length; j++){
	    retrieveData = splitted[j];
	    if((retrieveData.trim()).length()>0){

	        if(i!=0){
	            sb.append(",");
	        }
	        sb.append(retrieveData);

	    }
	}

	str = sb.toString();
	System.out.println(str.replaceFirst(",",""));
	String nextStr=str.replaceFirst(",","");
	
	String [] nextstrSplit=nextStr.split(",");

	String medicineName=nextstrSplit[0];
	String medicineId=nextstrSplit[1];
	String manufacture=nextstrSplit[2];
	String batchNo=nextstrSplit[3];
	String expdate=nextstrSplit[4];
	String qty=nextstrSplit[5];
	String price=nextstrSplit[6];
	
	MedicalReportItemDtls uitems=new MedicalReportItemDtls();
	uitems.setMedicineId(Integer.parseInt(medicineId));
	uitems.setMedicineName(medicineName);
	   uitems.setManufacture(manufacture);
	   uitems.setBatchNo(batchNo);
	   uitems.setExpDate(expdate);
	   uitems.setQty(qty);
	   uitems.setItemPrice(Double.parseDouble(price));
	   itemsUpdatedArr.add(uitems);

	}else {
		
		String nextsplit=splitn[i];
		System.out.println(nextsplit);
		if(!StringUtils.isNullOrEmpty(nextsplit)) {
			String[] itemUpdate=nextsplit.split(",");
			
			String medicineName=itemUpdate[0];
			String medicineId=itemUpdate[1];
			String manufacture=itemUpdate[2];
			String batchNo=itemUpdate[3];
			String expdate=itemUpdate[4];
			String qty=itemUpdate[5];
			String price=itemUpdate[6];
			
			MedicalReportItemDtls uitems=new MedicalReportItemDtls();
			uitems.setMedicineId(Integer.parseInt(medicineId));
			uitems.setMedicineName(medicineName);
			   uitems.setManufacture(manufacture);
			   uitems.setBatchNo(batchNo);
			   uitems.setExpDate(expdate);
			   uitems.setQty(qty);
			   uitems.setItemPrice(Double.parseDouble(price));
			   itemsUpdatedArr.add(uitems);
			
		}
	}


}
}
}
