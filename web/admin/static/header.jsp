<%@ include file="../../config/db_connection.jsp" %>

<%@page import="java.sql.ResultSet"%>

<div id="header" class="header navbar navbar-default navbar-fixed-top">
    <!-- begin container-fluid -->
    <div class="container-fluid">
        <!-- begin mobile sidebar expand / collapse button -->
        <div class="navbar-header">
            <a href="index.jsp" style="color: #9e5196;font-style: italic; font-family: Georgia, serif; font-size: 30px"><img src="../images/AYW/aywLogo.png" width="15%">  Admin Panel </a>
            <button type="button" class="navbar-toggle" data-click="sidebar-toggled">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <ul class="nav navbar-nav navbar-right">

            <%
                int c = 0;
                int itemCount = 0;
                int not = 0;
                String li = "";
                String sqlCheck = "SELECT count(*) as x FROM `checkout` WHERE `status` = '0'";
                ResultSet rsCheck = getCon().createStatement().executeQuery(sqlCheck);
                while (rsCheck.next()) {
                    c = Integer.parseInt(rsCheck.getString("x"));
                }

                String sqlitemCheck = "SELECT count(*) As x FROM `items` WHERE (CAST(`stock` AS SIGNED) - CAST(`margin` AS SIGNED)) < 0";
                ResultSet rsitemCheck = getCon().createStatement().executeQuery(sqlitemCheck);
                while (rsitemCheck.next()) {
                    itemCount = Integer.parseInt(rsitemCheck.getString("x"));
                    if (itemCount > 0) {
                        not++;
                        li = li + "<li class='media'> "
                                + "<a href='item.jsp'> "
                                + "<div class='media-left'><i class='fa fa-bug media-object bg-red'></i></div>"
                                + " <div class='media-body'> <h6 class='media-heading'>Low Stock </h6><div class='text-muted f-s-11'>There are " + itemCount + " item(s) under re - order "
                                + "<br>level."
                                + " <br> click here to view those..</div></div> "
                                + "</a></li>";
                    }
                }

                if (c != 0) {
                    li = li + "<li class='media'> "
                            + "<a href='checkout.jsp'> "
                            + "<div class='media-left'><i class='fa fa-file-text media-object bg-blue'></i></div>"
                            + " <div class='media-body'> <h6 class='media-heading'>Checkouts</h6><div class='text-muted f-s-11'>There are " + c + " new checkouts!"
                            + " <br> click here to view..</div></div> "
                            + "</a></li>";
                    not++;

                }

                int d = 0;
                
                String query = "SELECT count(*) as x FROM `service_request` WHERE `status` = 'completed'";
                ResultSet requests = getCon().createStatement().executeQuery(query);
                while (requests.next()) {
                    d = Integer.parseInt(requests.getString("x"));
                }
                if (d != 0) {
                    li = li + "<li class='media'> "
                            + "<a href='service_requests.jsp'> "
                            + "<div class='media-left'><i class='fa fa-file-text media-object bg-blue'></i></div>"
                            + " <div class='media-body'> <h6 class='media-heading'>Service Requests</h6><div class='text-muted f-s-11'>There are " + d + " new service requests!"
                            + " <br> click here to view..</div></div> "
                            + "</a></li>";
                    not++;

                }


            %>



            <li class="dropdown">
                <a href="javascript:;" data-toggle="dropdown" class="dropdown-toggle f-s-14">
                    <i class="fa fa-bell-o"></i>
                    <span class="label"><%= not%></span>
                </a>
                <ul class="dropdown-menu media-list pull-right animated fadeInDown">
                    <%
                        if (li.length() > 0) {

                        } else {
                            li = "<li class='media'> "
                                    + "<a href=''> "
                                    + "<div class='media-body'> <h6 class='media-heading'>No Notifaction</h6></div>"
                                    + "</a></li>";
                        }

                        out.print(li);

                    %>
                </ul>
            </li>

            <li class="dropdown navbar-user">
                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
                    <img src="<%= session.getAttribute("img")%>" alt="" /> 
                    <span class="hidden-xs"><%=session.getAttribute("name")%></span> <b class="caret"></b>
                </a>
                <ul class="dropdown-menu animated fadeInLeft">
                    <li class="arrow"></li>
                    <li><a href="javascript:;">Edit Profile</a></li>
                    <li class="divider"></li>
                    <li><a href="controllers/logoutAdmin.jsp">Log Out</a></li>
                </ul>
            </li>
        </ul>
        <!-- end header navigation right -->
    </div>
    <!-- end container-fluid -->
</div>