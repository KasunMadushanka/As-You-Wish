<%@include file= "../../config/db_connection.jsp" %>


<%
    
     
    
    String UName = "";
    String uImg = "";
    String id = request.getParameter("convId");
    String type = request.getParameter("type");

    ResultSet rs3;
    String sql3 = "SELECT * FROM `chat` WHERE `user` = '"+id+"' and userType='"+type+"' and (`sendId`= '0' or `revId`='0')";
    rs3 = getCon().createStatement().executeQuery(sql3);
    //out.print(sql3);

    ResultSet rs0;
    String sql0;
    if(Integer.parseInt(type) == 1){
        sql0 = "SELECT `company_name`,`image_url` FROM `vendor` WHERE `vendor_id` ='"+id+"'";
        rs0 = getCon().createStatement().executeQuery(sql0);
        if(rs0.first()){
            UName = rs0.getString("company_name");
            uImg = rs0.getString("image_url");
        }
    }
    else{
        sql0 = "SELECT `first_name`,`last_name`,`image_url` FROM `customer` WHERE `customer_id` = '"+id+"'";
        rs0 = getCon().createStatement().executeQuery(sql0);
        if(rs0.first()){
            UName = rs0.getString("first_name")+" "+rs0.getString("last_name");
            uImg = rs0.getString("image_url");
        }
    }

%>

<html>
    <body>
        <ul class="chats">
                                                             <% while (rs3.next()) {
                                                                 if(Integer.parseInt(rs3.getString("sendId")) == 0){ %>
                                                                     
                                                                    <li class="right">
                                                                        <span class="date-time"><%= rs3.getString("time") %></span>
                                                                        <a href="javascript:;" class="name">Admin</a>
                                                                        <a href="javascript:;" class="image"><img alt="" src="../images/asd.png" /></a>
                                                                        <div class="message">
                                                                            <%= rs3.getString("msg") %>
                                                                        </div>
                                                                    </li>
                                                                 
                                                                 <% }
                                                                else{ %>
                                                                
                                                                    <li class="left">
                                                                        <span class="date-time"><%= rs3.getString("time") %></span>
                                                                        <a href="javascript:;" class="name"><%= UName %></a>
                                                                        <a href="javascript:;" class="image"><img alt="" src="../<%= uImg %>" /></a>
                                                                        <div class="message">
                                                                            <%= rs3.getString("msg") %>
                                                                        </div>
                                                                    </li>
                                                                
                                                                 <% }
                                                            
                                                            
                                                            
                                                            }%>
                                                            
                                                        </ul>
    </body>
</html>