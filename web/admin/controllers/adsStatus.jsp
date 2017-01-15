<%@include file= "../../config/db_connection.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>
<% 
    
   
        
        String status = request.getParameter("sss");
        
    
        
        Statement stx= getCon().createStatement();
        String sdd = "update ads set status = '"+status+"' ";
        int i2=stx.executeUpdate(sdd);
        out.print(sdd);
       
        
    
    

%>
