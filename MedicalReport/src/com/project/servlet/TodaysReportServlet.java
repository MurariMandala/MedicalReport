package com.project.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.been.objs.MedicalReportDtls;
import com.project.been.objs.MedicalReportItemDtls;
import com.project.daoImpl.MedicalReportDAOImpl;
import com.project.sdo.AbstractDtlsSDO;
import com.project.sdo.ReportItemsSDO;
import com.project.util.ProjectReportsUtil;

/**
 * Servlet implementation class TodaysReportServlet
 */
/*@WebServlet("/TodaysReportServlet")*/
public class TodaysReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodaysReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String formAction=request.getParameter("formAction");
		String formAction1 =(String) request.getAttribute("formAction");
		System.out.println(formAction);
		RequestDispatcher dispatcher;
	
		
		if(formAction.equalsIgnoreCase("GOTO_TODAT_REPORT") || formAction1.equalsIgnoreCase("GOTO_TODAT_REPORT") ) {
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
		   dispatcher=request.getRequestDispatcher("jsp/todayReports.jsp");
			dispatcher.forward(request, response);
		   
		}
		
	
	}
	

	
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
