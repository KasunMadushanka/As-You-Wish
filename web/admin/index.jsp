<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="../config/sessionCheckAdmin.jsp" %>

<%
    
    String People ="";
    String users ="";
    String items ="";
    String votes ="";
    String vendors ="";
    String blogs ="";
    String likes ="";
    String comments ="";
    String sales ="";
    String tot ="";
    String noItems = "";
    
    
     
    
    // People
    ResultSet rsPeople;
    String sql = "SELECT (sum(`users`)+sum(`visitors`)) as x FROM `noofpeople`";
    rsPeople = getCon().createStatement().executeQuery(sql);
    
    while(rsPeople.next()){
        People = rsPeople.getString("x");
    }
    
    // users
    ResultSet rsUsers;
    String sql1 = "SELECT count(`customer_id`) as x FROM `customer` ";
    rsUsers = getCon().createStatement().executeQuery(sql1);
    
    while(rsUsers.next()){
        users = rsUsers.getString("x");
    }
    
    // items
    ResultSet rsItems;
    String sql2 = "SELECT `itemName` as y, `reviews` as x FROM `items` order by `reviews` desc LIMIT 1";
    rsItems = getCon().createStatement().executeQuery(sql2);
    
    while(rsItems.next()){
        items = rsItems.getString("y");
        noItems = rsItems.getString("x");
    }
    
    // votes
    ResultSet rsVotes;
    String sql3 = "SELECT sum(`votes`) as x FROM `contestant`";
    rsVotes = getCon().createStatement().executeQuery(sql3);
    
    while(rsVotes.next()){
        votes = rsVotes.getString("x");
    }
    
    // vendors
    ResultSet rsVendors;
    String sql4 = "SELECT count(*) as x FROM `vendor`";
    rsVendors = getCon().createStatement().executeQuery(sql4);
    
    while(rsVendors.next()){
        vendors = rsVendors.getString("x");
    }
    
    // Blogs
    ResultSet rsBlog;
    String sql5 = "SELECT count(*) as x, sum(`likes`) as y ,sum(`comments`) as z FROM `news_blog`";
    rsBlog = getCon().createStatement().executeQuery(sql5);
    
    while(rsBlog.next()){
        blogs = rsBlog.getString("x");
        likes = rsBlog.getString("y");
        comments = rsBlog.getString("z");
    }
    
    // Sales
    ResultSet rsSales;
    String sql6 = "SELECT sum(`qty`) as x FROM `items_sales`";
    rsSales = getCon().createStatement().executeQuery(sql6);
    
    while(rsSales.next()){
        sales = rsSales.getString("x");
    }
    
    // tot
    ResultSet rsTot;
    String sql7 = "SELECT sum(`payment`) as x FROM `ads`";
    rsTot = getCon().createStatement().executeQuery(sql7);
    
    while(rsTot.next()){
        tot = rsTot.getString("x");
    }
    
    
    ArrayList al = new ArrayList();
    ArrayList al2 = new ArrayList();
    
    //chart
    ResultSet rsPeople2;
    
    
    String sql8 = "SELECT * FROM (SELECT * FROM noofpeople ORDER BY id DESC LIMIT 6) sub ORDER BY id ASC";
    rsPeople2 = getCon().createStatement().executeQuery(sql8);
        
    String lastMonthV = "";
    String lastMonthU = "";
    
    while(rsPeople2.next()){
        int total_Users = 0;
        total_Users = total_Users+ Integer.parseInt(rsPeople2.getString("visitors")) + Integer.parseInt(rsPeople2.getString("users"));
        al.add(total_Users);
        al2.add(rsPeople2.getString("month"));
        
        lastMonthU = rsPeople2.getString("users");
        lastMonthV = rsPeople2.getString("visitors");
        
        //People = rsPeople2.getString("x");
        
    }
    
    DecimalFormat df = new DecimalFormat("#.00");
    
    int TotalLast = Integer.parseInt(lastMonthU)+Integer.parseInt(lastMonthV);
    
    double dd = Double.parseDouble(lastMonthU)+Double.parseDouble(lastMonthV);
    
    double pU = Integer.parseInt(lastMonthU)*100 / dd ;
    double pV = Integer.parseInt(lastMonthV)*100 / dd ;
    
    pV = Math.round(pV);
    pU = Math.round(pU);
    
    String id = request.getParameter("txt");
    



%>


<script type="text/javascript"> 
                
                var data1 = [];
                var data2 = [];
                
                // for chart
                <% for (int i=0; i<al.size(); i++) { %>
                    data1[<%= i %>] = "<%= al.get(i) %>"; 
                <% } %>
                    
                <% for (int i=0; i<al2.size(); i++) { %>
                    data2[<%= i %>] = "<%= al2.get(i) %>"; 
                <% } %>
                     
                     var Lu = "<%= lastMonthU %>";
                     var Lv = "<%= lastMonthV %>";
                
		// for chart
		
	
	</script>


<!DOCTYPE html>

<html lang="en">

    <head>
       <%@ include file="static/head.jsp" %>
    </head>
    
    <body>

        <!-- begin #page-container -->
        <div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
            <!-- begin #header -->
            <%@ include file="static/header.jsp" %>
            <!-- end #header -->

            <!-- begin #sidebar -->
            <%
                String pageTitle = "home";
                String subPage = "";
            %>
            <%@ include file="static/navbar.jsp" %>
            <!-- end #sidebar -->

            <!-- begin #content -->
            <div id="content" class="content">

                <!-- begin breadcrumb -->
                <ol class="breadcrumb pull-right">
                    <li><a href="javascript:;">Home</a></li>
                    <li class="active">Dashboard </li>
                </ol>
                <!-- end breadcrumb -->
                <!-- begin page-header -->
                <h1 class="page-header">Dashboard <small>Control every thing from here...</small></h1>
                <!-- end page-header -->
                <!-- begin row -->
                <div class="row">
                    <!-- begin col-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="widget widget-stats bg-orange">
                            <div class="stats-icon stats-icon-lg"><i class="fa fa-globe fa-fw"></i></div>
                            <div class="stats-title">Last Month Total Visitors </div>
                            <div class="stats-number"><%= People %></div>
                            <div class="stats-progress progress">
                                <div class="progress-bar" style="width: 62.1%;"></div>
                            </div>

                        </div>
                    </div>
                    <!-- end col-3 -->
                    <!-- begin col-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="widget widget-stats bg-blue">
                            <div class="stats-icon stats-icon-lg"><i class="fa fa-users fa-fw"></i></div>
                            <div class="stats-title">Total Registered Users</div>
                            <div class="stats-number"><%= users %></div>
                            <div class="stats-progress progress">
                                <div class="progress-bar" style="width: 79.5%;"></div>
                            </div>

                        </div>
                    </div>
                    <!-- end col-3 -->
                    <!-- begin col-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="widget widget-stats bg-purple-lighter">
                            <div class="stats-icon stats-icon-lg"><i class="fa fa-shopping-cart fa-fw"></i></div>
                            <div class="stats-number"><small>Popular Item:</small> <%= items %></div>
                            <div class="stats-title">No Of Views: <b><%= noItems %> </b></div>
                            <div class="stats-progress progress">
                                <div class="progress-bar" style="width: 52.3%;"></div>
                            </div>

                        </div>
                    </div>
                    <!-- end col-3 -->
                    <!-- begin col-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="widget widget-stats bg-black">
                            <div class="stats-icon stats-icon-lg"><i class="fa fa-check fa-fw"></i></div>
                            <div class="stats-title">Total Votes - 2016</div>
                            <div class="stats-number"><%= votes %></div>
                            <div class="stats-progress progress">
                                <div class="progress-bar" style="width: 86.9%;"></div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="widget widget-stats bg-red">
                            <div class="stats-icon stats-icon-lg"><i class="fa fa-truck fa-fw"></i></div>
                            <div class="stats-title">Total Registered Vendors</div>
                            <div class="stats-number"><%= vendors %></div>
                            <div class="stats-progress progress">
                                <div class="progress-bar" style="width: 62.1%;"></div>
                            </div>

                        </div>
                    </div>
                    <!-- end col-3 -->
                    <!-- begin col-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="widget widget-stats bg-yellow-darker">
                            <div class="stats-icon stats-icon-lg"><i class="fa fa-rss fa-fw"></i></div>
                            <div class="stats-number"><b><%= blogs %></b> <small>News Blog Posts</small></div>
                            <div class="stats-title"> <b><big><%= likes %></big></b> Likes | <b><big><%= comments %></big></b> Comments</div>
                            <div class="stats-progress progress">
                                <div class="progress-bar" style="width: 79.5%;"></div>
                            </div>

                        </div>
                    </div>
                    <!-- end col-3 -->
                    <!-- begin col-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="widget widget-stats bg-green">
                            <div class="stats-icon stats-icon-lg"><i class="fa fa-credit-card fa-fw"></i></div>
                            <div class="stats-title">Total Sales</div>
                            <div class="stats-number"><%= sales %></div>
                            <div class="stats-progress progress">
                                <div class="progress-bar" style="width: 52.3%;"></div>
                            </div>

                        </div>
                    </div>
                    <!-- end col-3 -->
                    <!-- begin col-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="widget widget-stats bg-aqua-darker">
                            <div class="stats-icon stats-icon-lg"><i class="fa fa-usd fa-fw"></i></div>
                            <div class="stats-title">Total Revenue (Advertisements)</div>
                            <div class="stats-number"><small>LKR.</small> <%= tot %></div>
                            <div class="stats-progress progress">
                                <div class="progress-bar" style="width: 86.9%;"></div>
                            </div>

                        </div>
                    </div>
                    <!-- end col-3 -->
                </div>
                <!-- end row -->

                <!-- begin row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="widget-chart bg-black">
                            <div class="widget-chart-content">
                                <h4 class="chart-title">
                                    Visitors Analytics
                                    <small></small>
                                </h4>
                                <div id="visitors-line-chart" class="morris-inverse" style="height: 250px;"></div>
                            </div>
                            <div class="widget-chart-sidebar bg-black-darker">
                                <div class="chart-number">
                                    <%= TotalLast %> <br>
                                    <small style="color: white">Last Month Visitors</small>
                                </div>
                                <div id="visitors-donut-chart" style="height: 160px"></div>
                                
                                <ul class="chart-legend">
                                    <li><i class="fa fa-circle-o fa-fw text-success m-r-5"></i> <%= df.format(pU) %>% <span>Registered Users</span></li>
                                    <li><i class="fa fa-circle-o fa-fw text-primary m-r-5"></i> <%= df.format(pV) %>% <span>Visitors</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>


                    

                </div>
                <!-- end row -->

            </div>
            <!-- end #content -->



            <!-- begin scroll to top btn -->
            <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
            <!-- end scroll to top btn -->
        </div>
        <!-- end page container -->

        <!-- ================== BEGIN BASE JS ================== -->
        <script src="assets/plugins/jquery/jquery-1.9.1.min.js"></script>
        <script src="assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
        <script src="assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>
        <!-- ================== END BASE JS ================== -->

        <!-- ================== BEGIN PAGE LEVEL JS ================== -->
        <script src="assets/plugins/morris/raphael.min.js"></script>
        <script src="assets/plugins/morris/morris.js"></script>
        <script src="assets/plugins/jquery-jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="assets/plugins/jquery-jvectormap/jquery-jvectormap-world-merc-en.js"></script>
        <script src="assets/plugins/bootstrap-calendar/js/bootstrap_calendar.min.js"></script>
        <script src="assets/js/ui-modal-notification.demo.min.js"></script>
        <script src="assets/plugins/gritter/js/jquery.gritter.js"></script>
        <script src="assets/js/dashboard-v2.min.js"></script>
        <script src="assets/js/apps.min.js"></script>
        <!-- ================== END PAGE LEVEL JS ================== -->

        <script>
            $(document).ready(function () {
                App.init();
                //DashboardV2.init();
                Notification.init();
                
                
                
                var dict = [];
                for(var j =0; j< data1.length;j++){
                    dict.push({
                        x: data2[j],
                        y: data1[j]
                    });
                    
                }
                
                var dict2 = [{
                        x: "2014-02-01",
                        y: 60
                        
                    }, {
                        x: "2014-03-01",
                        y: 70
                    }, {
                        x: "2014-04-01",
                        y: 40
                    }, {
                        x: "2014-05-01",
                        y: 100
                    }, {
                        x: "2014-06-01",
                        y: 40
                    }, {
                        x: "2014-07-01",
                        y: 80
                    }, {
                        x: "2014-11-01",
                        y: 70
                    }];
                
                
                console.log( dict );
                console.log( dict2 );
                
              var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
              
              var handleVisitorsLineChart = function() {
                var e = "#0D888B";
                var t = "#00ACAC";
                var n = "#3273B1";
                var r = "#348FE2";
                var i = "rgba(0,0,0,0.6)";
                var s = "rgba(255,255,255,0.4)";
                Morris.Line({
                    element: "visitors-line-chart",
                    data: dict,
                    xkey: "x",
                    ykeys: "y",
                    xLabelFormat: function(e) {
                        var year = new Date(e).getFullYear();
                        e = year+" - "+getMonthName(e.getMonth());
                        return e.toString()
                    },
                    labels: ["Page Visitors"],
                    lineColors: [e],
                    pointFillColors: [t],
                    lineWidth: "2px",
                    pointStrokeColors: [i],
                    resize: true,
                    gridTextFamily: "Open Sans",
                    gridTextColor: s,
                    gridTextWeight: "normal",
                    gridTextSize: "11px",
                    gridLineColor: "rgba(0,0,0,0.5)",
                    hideHover: "auto"
                })
            };
            
            var handleVisitorsDonutChart = function() {
                var e = "#00acac";
                var t = "#348fe2";
                Morris.Donut({
                    element: "visitors-donut-chart",
                    data: [{
                        label: "Users",
                        value: Lu
                    }, {
                        label: "Visitors",
                        value: Lv
                    }],
                    colors: [e, t],
                    labelFamily: "Open Sans",
                    labelColor: "rgba(255,255,255,0.4)",
                    labelTextSize: "12px",
                    backgroundColor: "#242a30"
                })
            };
            
            handleVisitorsLineChart();
            handleVisitorsDonutChart();

            });
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

