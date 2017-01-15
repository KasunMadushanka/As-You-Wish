<%@include file= "../config/db_connection.jsp" %>

<%
    
     
    
    
    ResultSet rs;
    String sql = "SELECT * FROM `ads` where `status` ='on' order by Rand() Limit 1";///
    rs = getCon().createStatement().executeQuery(sql);
        
    while(rs.next()){
        String img = rs.getString("loc");
        %>
        <div id="adver" >
            <a onclick="ad()" style="color: black; float: right" >[x] Close Advertisement</a>
            <center><div id="imgAd"><img src="<%= img %>" ></div></center>
        </div>
        
        
        <%
    }

    
    
    //out.print(sql);

%>



