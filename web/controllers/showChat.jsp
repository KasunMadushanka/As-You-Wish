<%@include file= "../config/db_connection.jsp" %>

<%
    
     
    
    String id = request.getParameter("convId");
    String type = request.getParameter("type");
    String UserId = request.getParameter("sendID");
    String revType = request.getParameter("rType");
    ResultSet rs;
    String sql = "SELECT * FROM `chat` WHERE `user` = '"+UserId+"' and ((`revId` = '"+id+"' or `sendId` = '"+id+"') ) and userType='"+type+"' ";///
    rs = getCon().createStatement().executeQuery(sql);
    
    //out.print(sql);

%>

<html>
    <body>
        <ul class="chat">
                        <% while (rs.next()) {
                            if(Integer.parseInt(rs.getString("sendId")) == 0){ %>
                                <li class="left clearfix"><span class="chat-img pull-left">
                                    <img src="images/asd.png" alt="User Avatar" class="img-circle">
                                </span>
                                    <div class="chat-body clearfix">
                                        <div class="header" style="text-align: left">
                                            <span class="glyphicon glyphicon-time" style="text-align: left"></span><%= rs.getString("time") %></small>
                                        </div>
                                        <p>
                                            <b> <%= rs.getString("msg") %></b>
                                        </p>
                                    </div>
                                </li>
                                                                 
                          <% }
                            else{ %>
                                 <li class="right clearfix"><span class="chat-img pull-right">
                                    <img src="http://placehold.it/50/FA6F57/fff&amp;text=ME" alt="User Avatar" class="img-circle">
                                </span>
                                    <div class="chat-body clearfix">
                                        <div class="header" style="text-align: right">
                                            <small class=" text-muted" ><span class="glyphicon glyphicon-time"></span><%= rs.getString("time") %> </small>
                                        </div>
                                            <p style="text-align: right">
                                                <b><%= rs.getString("msg") %></b>
                                        </p>
                                    </div>
                                </li>                             
                            <% }
                                                            
                        }%>
                        
                                                
                    </ul>
    </body>
</html>