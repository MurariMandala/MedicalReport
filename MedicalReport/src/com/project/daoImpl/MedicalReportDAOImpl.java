package com.project.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;

import com.mysql.cj.jdbc.IterateBlock;
import com.project.been.objs.MedicalReportDtls;
import com.project.been.objs.MedicalReportItemDtls;
import com.project.dbconnection.DbConnection;
import com.project.dbconnection.MyConnectionProvider;
import com.project.serviceimpl.IProjectService;

public class MedicalReportDAOImpl implements IProjectService {
	static Connection conn;
@Override
	public void saveReport(MedicalReportDtls reportDtls) {
	
	String reportDtlsInsertQuery="insert into medical_report_dtls (PATIENT_ID,PATIENT_NAME,BILL_NO,BILL_DATE,SALES_TYPE,DOCTOR_NAME,TOTAL_AMOUNT,NET_AMOUNT,PAID_AMOUNT,PREPARED_BY,PRINTED_BY)values(?,?,?,?,?,?,?,?,?,?,?);";
	String reportItemsInsertQuery="insert into medical_report_item_dtls (ITEM_ID,PATIENT_ID,MEDICINE_NAME,MANUFACTURE,BATCHNO,EXP_DATE,SGST_PERCENT,CGST_PERCENT,QUANTITY,PRICE,TOTAL_AMOUNT,BILL_DATE) values(?,?,?,?,?,?,?,?,?,?,?,?) ";
	
	
try {
	 conn = MyConnectionProvider.getConn();
	PreparedStatement ps=conn.prepareStatement(reportDtlsInsertQuery);
	ps.setInt(1,reportDtls.getPatientId());
	ps.setString(2, reportDtls.getPatientName());
	ps.setInt(3, reportDtls.getBillNo());
	ps.setString(4, reportDtls.getBillDate());
	ps.setString(5, reportDtls.getSalesType());
	ps.setString(6, reportDtls.getDoctorName());
	ps.setDouble(7, reportDtls.getTotAmount());
	ps.setDouble(8, reportDtls.getNetAmount());
	ps.setDouble(9, reportDtls.getPaidAmount());
	ps.setString(10, reportDtls.getPreparedBy());
	ps.setString(11, reportDtls.getPrintedBy());
	ps.executeUpdate();
	
	if(reportDtls.getReportItems()!=null && reportDtls.getReportItems().size()>0) {
		ArrayList<MedicalReportItemDtls> reportedItemsList=reportDtls.getReportItems();
		Iterator<MedicalReportItemDtls> itemsIterator=reportedItemsList.iterator();
		PreparedStatement ps1=conn.prepareStatement(reportItemsInsertQuery);
		
		while (itemsIterator.hasNext()) {
			MedicalReportItemDtls reportItemDtls = (MedicalReportItemDtls) itemsIterator.next();
			ps1.setInt(1, reportItemDtls.getReportId());
			ps1.setInt(2, reportDtls.getPatientId());
			ps1.setString(3, reportItemDtls.getMedicineName());
			ps1.setString(4, reportItemDtls.getManufacture());
			ps1.setString(5, reportItemDtls.getBatchNo());
			ps1.setString(6, reportItemDtls.getExpDate());
			ps1.setString(7, reportItemDtls.getSgstPer());
			ps1.setString(8, reportItemDtls.getCgstPer());
			ps1.setString(9, reportItemDtls.getQty());
			ps1.setDouble(10, reportItemDtls.getItemPrice());
			ps1.setDouble(11, reportItemDtls.getTotAmount());
			ps1.setString(12, reportDtls.getBillDate());
			ps1.executeUpdate();
		}
	}
	conn.close();
	
} catch (Exception e) {
	// TODO: handle exception
}
}
@Override
public MedicalReportDtls getTodaysAllReports(String todayDate) {
	MedicalReportDtls reportDtls=new MedicalReportDtls();
	ArrayList<MedicalReportItemDtls> reportItemsList=new ArrayList<MedicalReportItemDtls>();
	String todayReportsQuery="select ITEM_ID \"itemId\",MEDICINE_NAME \"madicineName\",MANUFACTURE \"manufacture\",BATCHNO \"batchNo\",EXP_DATE \"Expdate\",SGST_PERCENT \"sgstPer\",CGST_PERCENT \"cgstPer\",QUANTITY \"qty\",PRICE \"price\",TOTAL_AMOUNT \"totAmount\" from medical_report_item_dtls where BILL_DATE=?";
	
	try {
		conn=MyConnectionProvider.getConn();
		PreparedStatement ps=conn.prepareStatement(todayReportsQuery);
		ps.setString(1, todayDate);
		ResultSet rs=ps.executeQuery();
		while (rs.next()) {
			MedicalReportItemDtls reportItems =new MedicalReportItemDtls();
			reportItems.setReportId(rs.getInt("itemId"));
			reportItems.setMedicineName(rs.getString("madicineName"));
			reportItems.setManufacture(rs.getString("manufacture"));
			reportItems.setBatchNo(rs.getString("batchNo"));
			reportItems.setExpDate(rs.getString("Expdate"));
			reportItems.setSgstPer(rs.getString("sgstPer"));
			reportItems.setCgstPer(rs.getString("cgstPer"));
			reportItems.setQty(rs.getString("qty"));
			reportItems.setItemPrice(rs.getDouble("price"));
			reportItems.setTotAmount(rs.getDouble("totAmount"));
			reportItemsList.add(reportItems);
		}
		reportDtls.addReportItems(reportItemsList);
		
	} catch (Exception e) {
		// TODO: handle exception
	}
	
	return reportDtls;
}

}
