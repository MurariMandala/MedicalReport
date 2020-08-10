package testprograms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.project.dbconnection.MyConnectionProvider;

public class test {
  public static void main(String args[]) {
	  ArrayList list=getids();
	 System.out.println(list);
	 System.out.println(list.size());
	 for(int i=0;i<list.size();i++) {
		 int id=1001;
		String idlist= (String) list.get(i);
		System.out.println("idlist :"+idlist);
		insert(id,idlist); 
	 }
  }

private static void insert(int id, String idlist) {
	Connection conn=null;
String query1="insert into demo (id,value) values(?,?)";
	try {
		conn=MyConnectionProvider.getConn();
		PreparedStatement ps=conn.prepareStatement(query1);
		ps.setString(1, idlist);
		ps.setInt(2, id);
		ps.executeUpdate();
	} catch (Exception e) {
		// TODO: handle exception
	}
}

private static ArrayList getids() {
	ArrayList list=new ArrayList<>();
Connection conn=null;
String query="select PATIENT_ID from medical_report_dtls";
try {
	conn=MyConnectionProvider.getConn();
	PreparedStatement ps=conn.prepareStatement(query);
	ResultSet rs=ps.executeQuery();
	while(rs.next()) {
list.add(rs.getString("PATIENT_ID"));
	}
} catch (Exception e) {
	// TODO: handle exception
}
	return list;
}
}
