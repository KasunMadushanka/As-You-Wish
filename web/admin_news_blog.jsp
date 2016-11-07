<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "config/db_connection.jsp" %>

<%
    String id = (String) session.getAttribute("id");

    if (id == null) {
        id = request.getParameter("id");
    }

    session.setAttribute("page", "news_blog");

    ArrayList list = new ArrayList();

    ResultSet rs = getCon().createStatement().executeQuery("Select nb.*,a.name from news_blog nb inner join adminac a on nb.admin_id=a.admin_id");
    while (rs.next()) {

        String data[] = new String[9];

        data[0] = rs.getString("nb.post_id");
        data[1] = rs.getString("nb.date");
        data[2] = rs.getString("nb.time");
        data[3] = rs.getString("nb.title");
        data[4] = rs.getString("nb.content");
        data[5] = rs.getString("nb.image_url");
        data[6] = rs.getString("nb.comments");
        data[7] = rs.getString("nb.likes");
        data[8] = rs.getString("a.name");

        list.add(data);

    }

%>

<!DOCTYPE html>
<html dir="ltr" lang="en">


    <head>
        <%@ include file="/static/head.jsp" %>

        <script src="js/bootstrap-filestyle.js"></script>  
        <script src="myjs/image_upload.js"></script>
        <script src="myjs/new_post.js"></script>
        <script src="myjs/update_post.js"></script>

    </head>

    <body class="has-side-panel side-panel-left fullwidth-page">

        <% if (session.getAttribute("type").equals("customer")) {%>
        <%@ include file="/side_panels/customer_side_panel.jsp"%>
        <%} else if (session.getAttribute("type").equals("vendor")) {%>
        <%@ include file="/side_panels/vendor_side_panel.jsp"%>
        <%}%> 

        <div id="wrapper" class="clearfix">

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
                                    <h3 class="title text-white">As You Wish News Blog</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section>
                    <div class="container pt-100 pb-100">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="vertical-masonry-timeline-wrapper">
                                    <ul class="vertical-masonry-timeline">
                                        <% for (int i = list.size() - 1; i >= 0; i--) {%>
                                        <li class="each-masonry-item wow fadeInUp" data-wow-duration="1.5s" data-wow-offset="10">
                                            <div class="timeline-block">
                                                <span class="timeline-post-format"><i class="fa fa-user"></i></span>
                                                <article class="post clearfix">
                                                    <div class="entry-header">
                                                        <%String fields[] = (String[]) list.get(i);
                                                            if (!fields[5].equals("")) {%>
                                                        <div class="post-thumb"> <img id="image<%=fields[0]%>" alt="" src="<%=fields[5]%>" class="img-fullwidth img-responsive"> </div>
                                                            <%}%>
                                                        <div class="dropdown">
                                                            <a class="dropdown-toggle" data-toggle="dropdown">
                                                                <span class="caret"></span></a>
                                                            <ul class="dropdown-menu">
                                                                <li><a href="" onclick="edit_post(<%=fields[0]%>); return false;">Edit Post</a></li>
                                                                <li><a href="" onclick="delete_post(<%=fields[0]%>, 'customer'); return false;">Delete Post</a></li>
                                                                <li><a href="#">Hide Post</a></li>
                                                            </ul>
                                                        </div>
                                                        <h3 id="title<%=fields[0]%>" class="entry-title sm-inline-block mt-0 mt-sm-30 mt-xs-0 pt-0"><%=fields[3]%></h3>
                                                        <ul class="list-inline font-12 mb-20 mt-10">
                                                            <li>posted by <a href="#" class="text-theme-colored"><%=fields[8]%></a></li>
                                                            <li><span class="text-theme-colored">| <%=fields[1]%> at <%=fields[2]%></span></li>
                                                        </ul>                                                         
                                                    </div>
                                                    <div class="entry-content">
                                                        <p id="content<%=fields[0]%>" class="mb-30"><%=fields[4]%></p>
                                                        <ul class="list-inline like-comment pull-left font-12">
                                                            <li><i class="pe-7s-comment"></i><%=fields[6]%></li>
                                                            <li><a id="<%=fields[0]%>" href="" onclick="update_like(<%=fields[0]%>, 'customer',<%=fields[7]%>); return false;"><i class="pe-7s-like2"></i><%=fields[7]%></a></li>
                                                        </ul>
                                                        <a id="view<%=fields[0]%>" class="pull-right text-gray font-13" href="" onclick="view_comments(<%=fields[0]%>, 'customer'); return false;"><i class="fa fa-angle-double-right text-theme-colored"></i>View All Comments</a>
                                                    </div>
                                                    <input id="text<%=fields[0]%>" class="form-control" onkeypress="update_comment(<%=fields[0]%>, 'customer', event)" placeholder="Write a comment..."/>
                                                </article>
                                            </div>
                                        </li>
                                        <%}%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <!-- end main-content -->

            <%@ include file="/static/customer_modal.jsp"%>

            <!-- Footer -->
            <footer id="footer" class="footer pb-0 bg-black-111">
                <%@ include file="/static/footer.jsp"%>
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
