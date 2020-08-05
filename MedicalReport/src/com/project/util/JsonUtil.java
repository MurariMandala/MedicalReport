package com.project.util;

import java.io.IOException;
import java.util.ArrayList;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import com.project.been.objs.MedicalReportDtls;
import com.project.been.objs.MedicalReportItemDtls;
import com.project.sdo.AbstractDtlsSDO;

public class JsonUtil {
public static ObjectMapper mapper;
static {
	mapper=new ObjectMapper();
}
	public static String getJson(ArrayList<MedicalReportItemDtls> itemsArr) {
		String jsonResult = null;
		try {
		 jsonResult=mapper.writeValueAsString(itemsArr);
	
	} catch (JsonGenerationException e) {
	System.out.println("JsonGenerationException : "+e.getMessage());
	} catch (JsonMappingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return jsonResult;
	}

}
