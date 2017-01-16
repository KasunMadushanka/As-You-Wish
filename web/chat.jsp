<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="config/db_connection.jsp" %>

<%

    String id = "x";
    String nameRev = "Administrator";
    String type = "0";
    String UserId = ""+session.getAttribute("id");
    String uType = (String)session.getAttribute("type");
    
    if(uType=="customer"){
        uType = "2";
    }
    else if(uType=="vendor"){
        uType = "1";
    }
//    else{
//        uType = "0";
//    }
    
    if (request.getParameter("id") == null || request.getParameter("type") == "0") {
        id = "0";
    } else {
        id = request.getParameter("id");
    }

    if (request.getParameter("type") != null) {
        type = request.getParameter("type");
    }

    if (request.getParameter("name") != null) {
        nameRev = request.getParameter("name");
    }

    if (request.getParameter("uType") != null) {
        uType = request.getParameter("uType");
    }

    ResultSet rs;
    String sql = "SELECT * FROM `chat` WHERE `user` = '" + UserId + "' and (`revId` = '" + id + "' or `sendId` = '" + id + "') and userType='" + uType + "' ";///
    rs = getCon().createStatement().executeQuery(sql);


%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>
    </head>

    <body class="has-side-panel side-panel-left fullwidth-page">
        
        <% if (session.getAttribute("type").equals("customer")) {%>
        <%@ include file="/side_panels/customer_side_panel.jsp"%>
        <%} else if (session.getAttribute("type").equals("vendor")) {%>
        <%@ include file="/side_panels/vendor_side_panel.jsp"%>
        <%}%> 
        
        <div id="wrapper">

            <div id="preloader">
                <div id="spinner">
                    <div class="heart-preloader">
                        <i class="fa fa-heart font-36 infinite animated pulse"></i>
                    </div>
                </div>
            </div>

            <!-- Header -->
             <%if (session.getAttribute("type").equals("customer")) {%>
            <%@ include file="/static/customer_header.jsp"%>
            <%} else if (session.getAttribute("type").equals("vendor")) {%>
            <%@ include file="/static/vendor_header.jsp"%>
            <%} else if (session.getAttribute("type").equals("visitor")) {%>
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
                                    <h3 class="title text-white">Chat Room</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <div id="tab"> &nbsp;</div>
             
                <section >
                    <div class="container">
                        <div class="row">
                            <div class="col-md-9 blog-pull-right">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-10">
                                            <center><h3><%= nameRev%></h3></center>
                                            <input type="hidden" id="revID" value="<%= id%>">
                                            <input type="hidden" id="revType" value="<%= type%>">
                                            <div class="panel panel-primary">
                                                <div class="panel-body" id="check" style="height: 350px;padding-right: 20px;overflow: scroll;">



                                                </div>
                                                <div class="panel-footer">
                                                    <div class="input-group">
                                                        <input id="btn-input" type="text"  class="form-control input-sm" placeholder="Type your message here...">
                                                        <span class="input-group-btn">
                                                            <button class="btn btn-warning btn-sm" id="sendMsg" >Send</button>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-3">
                                <div class="sidebar sidebar-left mt-sm-30">
                                    <div class="widget">
                                        <h5 class="widget-title line-bottom">Chat History </h5>
                                        <input type="hidden" name="userId" id="UserId" value="<%= UserId%>">
                                        <input type="hidden" name="userId" id="uType" value="<%= uType%>">
                                        <div class="latest-posts">

                                            <%
                                                String sql2 = "SELECT `revId`,`revType` FROM `chat` WHERE `user` ='" + UserId + "' and `revId` <> '" + UserId + "' group by `revId`,revType order by `time` desc";
                                                ResultSet rs2 = getCon().createStatement().executeQuery(sql2);
                                                while (rs2.next()) {
                                                    int revID = Integer.parseInt(rs2.getString("revType"));
                                                    if (revID == 1) {
                                                        String vId = rs2.getString("revId");
                                                        String sql3 = "SELECT `company_name`,`image_url` FROM `vendor` WHERE `vendor_id` = '" + vId + "'";
                                                        ResultSet rs3 = getCon().createStatement().executeQuery(sql3);
                                                        while (rs3.next()) {
                                                            String img = "images/asd.png";
                                                            if (rs3.getString("image_url") != null) {
                                                                img = rs3.getString("image_url");
                                                            }
                                                            String VName = rs3.getString("company_name");

                                            %>

                                            <article class="post media-post clearfix pb-0 mb-10">
                                                <a class="post-thumb" href="#"><img class="img-circle" src="<%= img%>" width="50" height="50" alt=""></a>
                                                <div class="post-right">
                                                    <h5 class="post-title mt-0" ><a href="chat.jsp?id=<%= vId%>&&type=1&&name=<%= VName%>&&#tab" style="vertical-align:text-bottom"><%= VName%></a></h5>

                                                </div>
                                            </article>




                                            <% }
                                            } else if (revID == 2) {
                                                String vId = rs2.getString("revId");
                                                String sql3 = "SELECT `first_name`,`last_name`,`image_url` FROM `customer` WHERE `customer_id` = '" + vId + "'";
                                                ResultSet rs3 = getCon().createStatement().executeQuery(sql3);
                                                while (rs3.next()) {
                                                    String img = "images/asd2.png";
                                                    if (rs3.getString("image_url") != "" || rs3.getString("image_url") != null) {
                                                        img = rs3.getString("image_url");
                                                    }
                                                    String VName = rs3.getString("first_name") + " " + rs3.getString("last_name");

                                            %>

                                            <article class="post media-post clearfix pb-0 mb-10">
                                                <a class="post-thumb"><img class="img-circle" src="<%= img%>" width="50" height="50" alt=""></a>
                                                <div class="post-right">
                                                    <h5 class="post-title mt-0" ><a href="chat.jsp?id=<%= vId%>&&type=2&&name=<%= VName%>&&#tab" style="vertical-align:text-bottom"><%= VName%></a></h5>
                                                </div>
                                            </article>




                                            <% }
                                            } else if (revID == 0) {
                                                String vId = rs2.getString("revId");
                                                String img = "images/asd.png";
                                                String VName = "Administrator";
                                            %>

                                            <article class="post media-post clearfix pb-0 mb-10">
                                                <a class="post-thumb" href="#"><img class="img-circle" src="<%= img%>" alt=""></a>
                                                <div class="post-right">
                                                    <h5 class="post-title mt-0" ><a href="chat.jsp?id=<%= vId%>&&type=0&&name=<%= VName%>&&#tab" style="vertical-align:text-bottom"><%= VName%></a></h5>

                                                </div>
                                            </article>




                                            <%
                                                    }

                                                }
                                            %>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <!-- end main-content -->

            <!-- Footer -->
            <footer id="footer" class="footer pb-0 bg-black-111">
                <%@ include file="/static/footer.jsp" %>
            </footer>
            <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
        </div>
        <!-- end wrapper -->

        <!-- Footer Scripts -->
        <!-- JS | Custom script for all pages -->
        <!-- external javascripts -->
        <script src="js/jquery-2.2.0.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- JS | jquery plugin collection for this theme -->
        <script src="js/jquery-plugin-collection.js"></script>
        <script src="js/custom.js"></script>

        <script>
            $(document).ready(function () {
                $("#sendMsg").click(function () {
                    var c = $("#btn-input").val();
                    var revID = $("#revID").val();
                    var sendID = $("#UserId").val();
                    var atype = $("#revType").val();
                    var uType = $("#uType").val();
                    //alert(c);
                    //alert($("#msg").val());

                    $.ajax({
                        type: "post",
                        url: "controllers/insertChat2.jsp",
                        data: {msg2: c, rev: revID, sender: sendID, revType: atype, uType: uType},
                        success: function (msg) {
                            $("#btn-input").val("");
                            $('#check').load('controllers/showChat.jsp?type=' + rtype + '&convId=' + uId2 + '&sendID=' + sendID + '&rType=' + atype);

                            //location.reload();
                        },
                        error: function (error) {
                            alert("Error");

                        }
                    });
                });
            });


            // Live Chat
            var uId2 = $("#revID").val();
            var sendID = $("#UserId").val();
            var rtype = $("#uType").val();
            var atype = $("#revType").val();
            $('#check').load('controllers/showChat.jsp?type=' + rtype + '&convId=' + uId2 + '&sendID=' + sendID + '&rType=' + atype);
            $.ajaxSetup({cache: false});
            setInterval(function () {
                $('#check').load('controllers/showChat.jsp?type=' + rtype + '&convId=' + uId2 + '&sendID=' + sendID + '&rType=' + atype)
                var objDiv = document.getElementById("check");
                objDiv.scrollTop = objDiv.scrollHeight;
            }, 500);

        </script>


        <script>
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                        m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '../../../../www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-53034621-1', 'auto');
            ga('send', 'pageview');
        </script>    


    </body>



</html>