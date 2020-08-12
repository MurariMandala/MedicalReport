package testprograms;

public class test1 {
  public static void main(String args[]) {
	  String str = "~,,,WOKRIDE-D,267,WOKAHARD,31173008,2022-11,45,4500.0~,,,ABC,267,WOKAHARD,31173008,2022-11,45,4500.0";
	  String[] splitNeg=str.split("~");
	  for(int i=0;i<splitNeg.length;i++) {
		  String splitted = splitNeg[i];
		  String splittedcomma[] = splitted.split(",");
		    StringBuffer sb = new StringBuffer();
		      String retrieveData = "";
		      for(int j =0; j<splittedcomma.length; j++){
		          retrieveData = splittedcomma[j];
		          if((retrieveData.trim()).length()>0){

		              
		                  sb.append(",");
		              
		              sb.append(retrieveData);

		          }
		      }
		      str = sb.toString();

		      System.out.println(str);
		     
		      System.out.println(str.replaceFirst(",",""));
		 	String nextStr=str.replaceFirst(",","");
	  }
      
  

  }
}
