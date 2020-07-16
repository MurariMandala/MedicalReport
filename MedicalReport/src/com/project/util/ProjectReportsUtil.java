package com.project.util;

import java.util.ArrayList;

import com.project.sdo.AbstractDtlsSDO;
import com.project.sdo.ReportItemsSDO;

public class ProjectReportsUtil {

	public String getReportsDataset(ArrayList<AbstractDtlsSDO> todaysReportList) {
		StringBuffer buff=new StringBuffer();
		buff.append("[");
		for(int i=0;i<todaysReportList.size();i++) {
			ReportItemsSDO sdo=(ReportItemsSDO) todaysReportList.get(i);
			buff.append("[")
			
			.append("\""+sdo.getMedicineName()+"\",") //0
			.append("\""+sdo.getManufacture()+"\",") //1
			.append("\""+sdo.getBatchNo()+"\",") //2
			.append("\""+sdo.getExpDate()+"\",") //3
			.append("\""+sdo.getSgstPer()+"\",") //4
			.append("\""+sdo.getCgstPer()+"\",") //5
			.append("\""+sdo.getQty()+"\",") //6
			.append("\""+sdo.getItemPrice()+"\",") //7
			.append("\""+sdo.getTotAmount()+"\",") //8
			.append("\""+sdo.getReportId()+"\",") //9
			.append("\""+"\"]");	//10
			
			if(i<todaysReportList.size()-1) {
				 buff.append(",");	 
			 }
		}
		 buff.append("]");
			System.out.println("ReportItems JSON : "+buff.toString());
		 	return buff.toString();
	}

}