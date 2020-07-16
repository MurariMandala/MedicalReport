package com.project.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.util.StringUtils;
import com.project.been.objs.MedicalReportDtls;
import com.project.been.objs.MedicalReportItemDtls;
import com.project.daoImpl.MedicalReportDAOImpl;
import com.project.sdo.AbstractDtlsSDO;
import com.project.sdo.ReportItemsSDO;
import com.project.util.ProjectReportsUtil;

/**
 * Servlet implementation class AddReportServlet
 */

public class AddReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	String formAction=request.getParameter("formAction");
	System.out.println(formAction);
	RequestDispatcher dispatcher;
	if(formAction.equalsIgnoreCase("GOTO_REPORT")) {
		generateBillNoAndDate(request);
		request.setAttribute("dataset", "[]");
		dispatcher=request.getRequestDispatcher("jsp/medicalReportCreation.jsp");
		dispatcher.forward(request, response);
	}
	// today reports list
	
	/*if(formAction.equalsIgnoreCase("GOTO_TODAT_REPORT")) {
		MedicalReportDAOImpl daoImpl=new MedicalReportDAOImpl();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");  
	    Date date = new Date();  
	    System.out.println(formatter.format(date));  
	    String todayDate=formatter.format(date);
	   MedicalReportDtls reportDtls=new MedicalReportDtls();
	   reportDtls=daoImpl.getTodaysAllReports(todayDate);
	   ArrayList<AbstractDtlsSDO> todaysReportList=new ArrayList<AbstractDtlsSDO>(); 
	   todaysReportList=getReports(reportDtls);
	   request.setAttribute("dataset",new ProjectReportsUtil().getReportsDataset(todaysReportList));
	   dispatcher=request.getRequestDispatcher("todayReports.jsp");
		dispatcher.forward(request, response);
	   
	}*/
	
	//report save
	if(formAction.equalsIgnoreCase("REPORT_SAVE")) {
		MedicalReportDtls medReportDtls=new MedicalReportDtls();
		medReportDtls=getReportEntity(request);
		MedicalReportDAOImpl daoImpl=new MedicalReportDAOImpl();
		if(medReportDtls!=null) {
			daoImpl.saveReport(medReportDtls);			
			request.setAttribute("SuccessMsg", "Report saved successfully...");
	//		dispatcher=request.getRequestDispatcher("GOTO_TODAT_REPORT");
		
			dispatcher = request.getRequestDispatcher("/todaysReport");
			request.setAttribute("formAction","GOTO_TODAT_REPORT");
			dispatcher.forward(request, response);
		}		
	
	}
	}
	
	

/*
	private ArrayList<AbstractDtlsSDO> getReports(MedicalReportDtls reportDtls) {
		ArrayList<AbstractDtlsSDO> dtlsSdo=new ArrayList<AbstractDtlsSDO>();
		List itemsList=reportDtls.getReportItems();
		if(itemsList!=null && itemsList.size()>0) {
			for(int i=0;itemsList.size()>i;i++) {
				ReportItemsSDO sdo=new ReportItemsSDO();
				MedicalReportItemDtls reportItems=(MedicalReportItemDtls) itemsList.get(i);
				sdo.setReportId(reportItems.getReportId());
				sdo.setMedicineName(reportItems.getMedicineName());
				sdo.setManufacture(reportItems.getManufacture());
				sdo.setBatchNo(reportItems.getBatchNo());
				sdo.setCgstPer(reportItems.getCgstPer());
				sdo.setSgstPer(reportItems.getSgstPer());
				sdo.setExpDate(reportItems.getExpDate());
				sdo.setQty(reportItems.getQty());
				sdo.setItemPrice(reportItems.getItemPrice());
				sdo.setTotAmount(reportItems.getTotAmount());
				dtlsSdo.add(sdo);
			}
			
			
		}
		
		return dtlsSdo;
	}
*/
	private void generateBillNoAndDate(HttpServletRequest request) {
		Random generateBill=new Random();
		int billNo=generateBill.nextInt(99999);
		MedicalReportDtls dtls=new MedicalReportDtls();
		dtls.setBillNo(billNo);
		request.setAttribute("billNo", dtls.getBillNo());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");  
	    Date date = new Date();  
	    System.out.println(formatter.format(date));  
	    String billDate=formatter.format(date);
	    request.setAttribute("billDate", billDate);
	}

	private MedicalReportDtls getReportEntity(HttpServletRequest request) {
     String patientName=request.getParameter("patientName");
     String saleType=request.getParameter("saleType");
     String doctorName=request.getParameter("doctorName");
     String billNo=request.getParameter("billNo");
     String billDate=request.getParameter("billDate");
     String totAmount=request.getParameter("totAmount");
     String netAmount=request.getParameter("netAmount");
     String paidAmount=request.getParameter("paidAmount");
     String preparedBy=request.getParameter("preparedBy");
     String printedBy=request.getParameter("printedBy");
     
     Random idGenerate=new Random();
     int patientId=idGenerate.nextInt(10000);
     System.out.println("patientId : "+patientId);
     MedicalReportDtls reportDtls=new MedicalReportDtls();
     reportDtls.setPatientId(patientId);
     reportDtls.setPatientName(patientName);
     reportDtls.setDoctorName(doctorName);
     reportDtls.setSalesType(saleType);
     reportDtls.setBillDate(billDate);
     reportDtls.setBillNo(Integer.parseInt(billNo));
     reportDtls.setTotAmount(Double.parseDouble(totAmount));
     reportDtls.setNetAmount(Double.parseDouble(netAmount));
     reportDtls.setPaidAmount(Double.parseDouble(paidAmount));
     reportDtls.setPreparedBy(preparedBy);
     reportDtls.setPrintedBy(printedBy);
     
     
     // getting medical report items form the array objects
     
     String addReportItems=request.getParameter("addReportItems");
     ArrayList<MedicalReportItemDtls> reportItems=new ArrayList<MedicalReportItemDtls>();
     
     if(!StringUtils.isNullOrEmpty(addReportItems)) {
    	 String [] itemArr=addReportItems.split("~");
    	 
    	 for(int i=0; itemArr.length>i;i++) {
    		 String itemString =itemArr[i];
    		 String [] itemArr1=itemString.split(",");
    		 
    		 if(itemArr1.length==0) {
    			 continue;
    		 }
    		 
    		 String medicineName=itemArr1[0];
    		 String manufacture=itemArr1[1];
    		 String batchNo=itemArr1[2];
    		 String expDate=itemArr1[3];
    		 String sgstPer=itemArr1[4];
    		 String cgstPer=itemArr1[5];
    		 String qty=itemArr1[6];
    		 String price=itemArr1[7];
    		 String itemTotAmount=itemArr1[8];
    		 
    		 Integer itemId=0;
    		/* String idArr=itemArr1[9];
    		 if(!StringUtils.isNullOrEmpty(idArr)) {
    			 itemId=Integer.parseInt(idArr);
    		 }*/
    		
    		 
    		 MedicalReportItemDtls itemdtls=new MedicalReportItemDtls();
    		 if(itemId==0) {
    			 Random itemIdGenerate=new Random();
    			 itemId=itemIdGenerate.nextInt(10000);
    		 
    		 }
    		 itemdtls.setReportId(itemId);
    		 itemdtls.setMedicineName(medicineName);
    		 itemdtls.setManufacture(manufacture);
    		 itemdtls.setBatchNo(batchNo);
    		 itemdtls.setExpDate(expDate);
    		 itemdtls.setSgstPer(sgstPer);
    		 itemdtls.setCgstPer(cgstPer);
    		 itemdtls.setQty(qty);
    		 itemdtls.setItemPrice(Double.parseDouble(price));
    		 itemdtls.setTotAmount(Double.parseDouble(totAmount));
    		 reportItems.add(itemdtls);
    	 }
    	 reportDtls.addReportItems(reportItems);
     }
     return reportDtls;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
