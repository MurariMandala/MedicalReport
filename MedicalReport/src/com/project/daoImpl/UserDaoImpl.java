package com.project.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.project.been.objs.PharmacyDtls;
import com.project.dbconnection.MyConnectionProvider;

public class UserDaoImpl {
Connection conn=null;

	public PharmacyDtls getUserLoginDetails(String userName, String passWord) {
		PharmacyDtls dtls=new PharmacyDtls();
		String userQuery="select * from create_pharmacy where USER_NAME=? and PASSWORD=?";	
    
    try {
		conn=MyConnectionProvider.getConn();
		PreparedStatement ps=conn.prepareStatement(userQuery);
		ps.setString(1, userName);
		ps.setString(2, passWord);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			dtls.setPharmacyId(rs.getString(1));
			dtls.setGstInTaxId(rs.getString(2));
			dtls.setPharmacyName(rs.getString(3));
			dtls.setAddress(rs.getString(4));
			dtls.setPhoneNo(rs.getString(5));
			dtls.setGstInTaxNo(rs.getString(6));
			dtls.setDlNo(rs.getString(7));
			dtls.setDoctorName(rs.getString(8));
			dtls.setUserName(rs.getString(9));

		}
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
		return dtls;
	}

}
