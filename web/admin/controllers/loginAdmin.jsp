<%@include file= "../../config/db_connection.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>
<% 
    
    if(request.getParameter("pw") != null && request.getParameter("email") != null ){
        
        String pw = request.getParameter("pw");
        String email = request.getParameter("email");
    
        
        ResultSet rs = getCon().createStatement().executeQuery("select * from adminAC where email='"+email+"' and pw='"+pw+"'");
        if (rs.first()) {
            session.setAttribute("id", rs.getString("admin_id"));
            session.setAttribute("email", rs.getString("email"));
            session.setAttribute("name", rs.getString("Name"));
            session.setAttribute("img", rs.getString("img"));
            session.setAttribute("pos", rs.getString("pos"));
            out.print("true");
        }
        else{
            out.print("false");
        }
        
        
        
    }
    else{
        out.print("false");
    }
    

%>
