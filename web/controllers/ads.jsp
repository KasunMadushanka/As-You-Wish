<%@include file= "../config/db_connection.jsp" %>

<%
    
     
    
    
    ResultSet rs;
    String sql = "SELECT * FROM `ads` order by Rand() Limit 1";
    rs = getCon().createStatement().executeQuery(sql);
        
    while(rs.next()){
        String img = rs.getString("loc");
        %>
        <img src="<%= img %>" >
        <%
    }

    
    
    //out.print(sql);

%>



