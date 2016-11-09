<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="config/db_connection.jsp" %>

<%
    String id = (String) session.getAttribute("id");
    session.setAttribute("page", "voting");

    if (id == null) {

        id = request.getParameter("id");

        if (id != null) {
            ResultSet rs = getCon().createStatement().executeQuery("Select* from visitor where visitor_id='" + id + "'");
            if (rs.first()) {
                session.setAttribute("id", id);
                session.setAttribute("first_name", rs.getString("first_name"));
                session.setAttribute("last_name", rs.getString("last_name"));
                session.setAttribute("type", "visitor");

            }
        }
    }

    ArrayList contestants = new ArrayList();

    ResultSet rs = getCon().createStatement().executeQuery("Select cus.customer_id,cus.first_name,cus.partner_first_name,cus.image_url from customer cus inner join contestant cnt on cus.customer_id=cnt.customer_id inner join contest cn on cnt.contest_id=cn.contest_id");
    while (rs.next()) {

        String[] details = new String[4];

        details[0] = rs.getString("cus.customer_id");
        details[1] = rs.getString("cus.first_name");
        details[2] = rs.getString("cus.partner_first_name");
        details[3] = rs.getString("cus.image_url");

        contestants.add(details);
    }

    Calendar cal = Calendar.getInstance();

    cal.set(Calendar.SECOND, 59);
    cal.set(Calendar.HOUR_OF_DAY, 23);
    cal.set(Calendar.MINUTE, 59);

    int difference = (int) (cal.getTimeInMillis() - Calendar.getInstance().getTimeInMillis()) / 1000-19800;
%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>

        <link rel="stylesheet" href="css/flipclock.css">

        <script src="js/customer_modal.js"></script>	
        <script src="myjs/email.js"></script>
        <script src="myjs/voting.js"></script>	
        <script src="js/flipclock.js"></script>
     
        <script>
            var clock;
            $(document).ready(function () {
                clock = $('.clock').FlipClock('<%=difference%>', {
                    countdown: true,
                    autoStart: true,
                    callbacks: {
                        start: function () {

                        },
                        interval: function () {
                            $.ajax({
                                type: "post",
                                url: "controllers/voting_system/refresh_votes.jsp",
                                dataType: "json",
                                success: function (msg) {

                                    for (i = 0; i < msg.length; i++) {
                                        $('#' + msg[i][0]).html(msg[i][1]);
                                    }


                                },
                                error: function (error) {
                                    alert(error);
                                }
                            });
                        },
                        stop: function () {

                        }
                    }
                });
            });
        </script>
    </head>

    <body class="">
        <div id="wrapper" class="clearfix">

            <div id="preloader">
                <div id="spinner">
                    <div class="heart-preloader">
                        <i class="fa fa-heart font-36 infinite animated pulse"></i>
                    </div>
                </div>
            </div>

            <!-- Header -->
            <%if ((String) session.getAttribute("id") != null) {%>
            <%@ include file="/static/customer_header.jsp"%>
            <%} else {%>
            <%@ include file="/static/visitor_header.jsp"%>
            <%}%>

            <!-- Start main-content -->
            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white">Most Popular Couple 2016</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="" data-bg-img="images/bg/bg22.png">

                    <div class="container">
                        <div class="clock" style="padding-top:0.5em;padding-left: 30em;padding-bottom: 1em;"></div>
                        <%if (id == null) {%>
                            <center><button id="sign_in_button" class="btn btn-theme-colored" type="button" onclick="visitor_sign_in()">Sign In to Vote</button></center>
                        <%}%>
                        <div class="widget pt-50">
                            <div class="search-form">
                                <form>
                                    <div class="input-group">
                                        <input id="search" type="text" placeholder="Click to Search" class="form-control search-input">
                                        <span class="input-group-btn">
                                            <button id="search_button" type="button" class="btn search-button"><i class="fa fa-search"></i></button>
                                        </span>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div id="table_div">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th width="75"><font size="4">Place</font></th>
                                        <th width="100"><font size="4">Couple</font></th>
                                        <th width="500"></th>
                                        <th width="75"></th>
                                        <%--<th width="100"><font size="4">#Votes</font></th>--%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (int i = 0; i < contestants.size(); i++) {
                                            String[] data = (String[]) contestants.get(i);%>
                                    <tr>
                                        <td style="padding-top: 1.5em;"><font size="3"><%=(i + 1)%></font></td>
                                        <td><img src="<%=data[3]%>" class="img-circle" width="75" height="50"></td>
                                        <td style="padding-top: 1.5em;"><font size="3"><%=data[1] + " & "%><%=data[2]%></font></td>
                                        <td style="padding-top: 1em;"><button id="button<%=data[0]%>" class="btn btn-theme-colored" onclick="vote(<%=data[0]%>)">Vote</button></td>
                                        <%if ((String) session.getAttribute("id") == null) {%>
                                <script>
                                        $('#button' + '<%=data[0]%>').prop("disabled", true);
                                </script>
                                <%}%>
                               <%--<td style="padding-top: 1.5em;"><div id="<%=data[0]%>" style="font-size: 16px;">000</div></td>--%>
                                </tr>
                                <%}%>
                                </tbody>
                            
                            </table>
                        </div>
                    </div>
                </section>
            </div>
            <!-- end main-content -->

            <%@ include file="/static/customer_modal.jsp"%>

            <!-- Footer -->
            <footer id="footer" class="footer pb-0 bg-black-111">
                <%@ include file="/static/footer.jsp" %>
            </footer>
            <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
        </div>
        <!-- end wrapper -->

        <!-- Footer Scripts -->
        <!-- JS | Custom script for all pages -->
        <script src="js/custom.js"></script>
        <script src="js/jquery.rustaMsgBox.js"></script>

    </body>

</html>
