package com.project.serviceimpl;

import com.project.been.objs.MedicalReportDtls;

public interface IProjectService {

	void saveReport(MedicalReportDtls medReportDtls);

	MedicalReportDtls getTodaysAllReports(String todayDate);

}
