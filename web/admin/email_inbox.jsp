<!DOCTYPE html>

<html lang="en">

    <head>
        <%@ include file="static/head.jsp" %>
    </head>
    <body>


        <!-- begin #page-container -->
        <div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
            <!-- begin #header -->
            <div id="header" class="header navbar navbar-default navbar-fixed-top">
                <!-- begin container-fluid -->
                <div class="container-fluid">
                    <!-- begin mobile sidebar expand / collapse button -->
                    <div class="navbar-header">
                        <a href="index.html" class="navbar-brand"><span class="navbar-logo"></span> As You Wish </a>
                        <button type="button" class="navbar-toggle" data-click="sidebar-toggled">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <!-- end mobile sidebar expand / collapse button -->

                    <!-- begin header navigation right -->
                    <ul class="nav navbar-nav navbar-right">

                        <li class="dropdown">
                            <a href="javascript:;" data-toggle="dropdown" class="dropdown-toggle f-s-14">
                                <i class="fa fa-bell-o"></i>
                                <span class="label">5</span>
                            </a>
                            <ul class="dropdown-menu media-list pull-right animated fadeInDown">
                                <li class="dropdown-header">Notifications (5)</li>
                                <li class="media">
                                    <a href="javascript:;">
                                        <div class="media-left"><i class="fa fa-bug media-object bg-red"></i></div>
                                        <div class="media-body">
                                            <h6 class="media-heading">Server Error Reports</h6>
                                            <div class="text-muted f-s-11">3 minutes ago</div>
                                        </div>
                                    </a>
                                </li>
                                <li class="media">
                                    <a href="javascript:;">
                                        <div class="media-left"><img src="assets/img/user-1.jpg" class="media-object" alt="" /></div>
                                        <div class="media-body">
                                            <h6 class="media-heading">John Smith</h6>
                                            <p>Quisque pulvinar tellus sit amet sem scelerisque tincidunt.</p>
                                            <div class="text-muted f-s-11">25 minutes ago</div>
                                        </div>
                                    </a>
                                </li>
                                <li class="media">
                                    <a href="javascript:;">
                                        <div class="media-left"><img src="assets/img/user-2.jpg" class="media-object" alt="" /></div>
                                        <div class="media-body">
                                            <h6 class="media-heading">Olivia</h6>
                                            <p>Quisque pulvinar tellus sit amet sem scelerisque tincidunt.</p>
                                            <div class="text-muted f-s-11">35 minutes ago</div>
                                        </div>
                                    </a>
                                </li>
                                <li class="media">
                                    <a href="javascript:;">
                                        <div class="media-left"><i class="fa fa-plus media-object bg-green"></i></div>
                                        <div class="media-body">
                                            <h6 class="media-heading"> New User Registered</h6>
                                            <div class="text-muted f-s-11">1 hour ago</div>
                                        </div>
                                    </a>
                                </li>
                                <li class="media">
                                    <a href="javascript:;">
                                        <div class="media-left"><i class="fa fa-envelope media-object bg-blue"></i></div>
                                        <div class="media-body">
                                            <h6 class="media-heading"> New Email From John</h6>
                                            <div class="text-muted f-s-11">2 hour ago</div>
                                        </div>
                                    </a>
                                </li>
                                <li class="dropdown-footer text-center">
                                    <a href="javascript:;">View more</a>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown navbar-user">
                            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="assets/img/user-13.jpg" alt="" /> 
                                <span class="hidden-xs">Rahal Jayawardane</span> <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu animated fadeInLeft">
                                <li class="arrow"></li>
                                <li><a href="javascript:;">Edit Profile</a></li>
                                <li><a href="javascript:;"> Inbox </a></li>
                                <li><a href="javascript:;">Calendar</a></li>
                                <li><a href="javascript:;">Setting</a></li>
                                <li class="divider"></li>
                                <li><a href="javascript:;">Log Out</a></li>
                            </ul>
                        </li>
                    </ul>
                    <!-- end header navigation right -->
                </div>
                <!-- end container-fluid -->
            </div>
            <!-- end #header -->

            <!-- begin #sidebar -->
            <div id="sidebar" class="sidebar">
                <!-- begin sidebar scrollbar -->
                <div data-scrollbar="true" data-height="100%">
                    <!-- begin sidebar user -->
                    <ul class="nav">
                        <li class="nav-profile">
                            <div class="image">
                                <a href="javascript:;"><img src="assets/img/user-13.jpg" alt="" /></a>
                            </div>
                            <div class="info">
                                Rahal Jayawardane
                                <small>Back end developer</small>
                            </div>
                        </li>
                    </ul>
                    <!-- end sidebar user -->
                    <!-- begin sidebar nav -->
                    <ul class="nav">
                        <li class="nav-header">Navigation</li>
                        <li ><a href="index.html"><i class="fa fa-laptop"></i> <span>Dashboard</span></a></li>
                        <li class="has-sub active">
                            <a href="javascript:;">
                                <b class="caret pull-right"></b>
                                <i class="fa fa-user"></i> 
                                <span>Vendor</span>
                            </a>
                            <ul class="sub-menu">
                                <li class="active"><a href="email_inbox.html">Vendor Requests</a></li>
                                <li><a href="table_manage.html">Registrations</a></li>
                                <li><a href="email_compose.html">All Vendors</a></li>
                                <li><a href="email_detail.html">Contact</a></li>
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a href="javascript:;">
                                <b class="caret pull-right"></b>
                                <i class="fa fa-star"></i>
                                <span>Front End</span> 
                            </a>
                            <ul class="sub-menu">
                                <li><a href="ui_general.html">News Blog</a></li>
                                <li><a href="ui_typography.html">Online Items</a></li>
                                <li><a href="ui_tabs_accordions.html">Terms and Regulations</a></li>
                                <li><a href="ui_unlimited_tabs.html">Contact Us</a></li>
                                <li><a href="ui_modal_notification.html">Images</a></li>

                            </ul>
                        </li>
                        <li class="has-sub">
                            <a href="javascript:;">
                                <b class="caret pull-right"></b>
                                <i class="fa fa-check"></i>
                                <span>Voting System</span> 
                            </a>
                            <ul class="sub-menu">
                                <li><a href="form_elements.html">Candidates</a></li>
                                <li><a href="form_plugins.html">Results</a></li>
                                <li><a href="form_slider_switcher.html">Report</a></li>
                            </ul>
                        </li>
                        <li class="has-sub">
                            <a href="javascript:;">
                                <b class="caret pull-right"></b>
                                <i class="fa fa-file"></i> 
                                <span>Wedding Blog</span>
                            </a>
                            <ul class="sub-menu">
                                <li><a href="http://seantheme.com/color-admin-v1.9/frontend/one-page-parallax/index.html" target="_blank">Templates</a></li>
                                <li><a href="http://seantheme.com/color-admin-v1.9/frontend/blog/index.html" target="_blank">Registered Users</a></li>
                                <li><a href="http://seantheme.com/color-admin-v1.9/frontend/forum/index.html" target="_blank">Reports</a></li>
                            </ul>
                        </li>

                        <li><a href="calendar.html"><i class="fa fa-file-pdf-o"></i> <span>Reports</span></a></li>

                        <li><a href="calendar.html"><i class="fa fa-download"></i> <span>Backup</span></a></li>



                        <li><a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify"><i class="fa fa-angle-double-left"></i></a></li>
                        <!-- end sidebar minify button -->
                    </ul>
                    <!-- end sidebar nav -->
                </div>
                <!-- end sidebar scrollbar -->
            </div>
            <div class="sidebar-bg"></div>
            <!-- end #sidebar -->

            <!-- begin #content -->
            <div id="content" class="content content-full-width">
                <div class="p-20">
                    <!-- begin row -->
                    <div class="row">
                        <!-- begin col-2 -->
                        <div class="col-md-12">
                            <div class="email-btn-row hidden-xs">
                                <a href="#" class="btn btn-sm btn-inverse"><i class="fa fa-plus m-r-5"></i> New</a>
                                <a href="#" class="btn btn-sm btn-default disabled">Reply</a>
                                <a href="#" class="btn btn-sm btn-default disabled">Delete</a>
                                <a href="#" class="btn btn-sm btn-default disabled">Archive</a>
                                <a href="#" class="btn btn-sm btn-default disabled">Junk</a>
                                <a href="#" class="btn btn-sm btn-default disabled">Swwep</a>
                                <a href="#" class="btn btn-sm btn-default disabled">Move to</a>
                                <a href="#" class="btn btn-sm btn-default disabled">Categories</a>
                            </div>
                            <div class="email-content">
                                <table class="table table-email">
                                    <thead>
                                        <tr>
                                            <th class="email-select"><a href="#" data-click="email-select-all"><i class="fa fa-square-o fa-fw"></i></a></th>
                                            <th colspan="2">
                                                <div class="dropdown">
                                                    <a href="#" class="email-header-link" data-toggle="dropdown">View All <i class="fa fa-angle-down m-l-5"></i></a>
                                                    <ul class="dropdown-menu">
                                                        <li class="active"><a href="#">All</a></li>
                                                        <li><a href="#">Unread</a></li>
                                                        <li><a href="#">Contacts</a></li>
                                                        <li><a href="#">Groups</a></li>
                                                        <li><a href="#">Newsletters</a></li>
                                                        <li><a href="#">Social updates</a></li>
                                                        <li><a href="#">Everything else</a></li>
                                                    </ul>
                                                </div>
                                            </th>
                                            <th>
                                                <div class="dropdown">
                                                    <a href="#" class="email-header-link" data-toggle="dropdown">Arrange by <i class="fa fa-angle-down m-l-5"></i></a>
                                                    <ul class="dropdown-menu">
                                                        <li class="active"><a href="#">Date</a></li>
                                                        <li><a href="#">From</a></li>
                                                        <li><a href="#">Subject</a></li>
                                                        <li><a href="#">Size</a></li>
                                                        <li><a href="#">Conversation</a></li>
                                                    </ul>
                                                </div>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                Leap Motion
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Maecenas ultrices interdum leo, eu aliquam diam mattis sed.
                                            </td>
                                            <td class="email-date">11/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                Leap Motion
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Ut tristique dapibus nibh, sed scelerisque magna vehicula a.
                                            </td>
                                            <td class="email-date">11/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                Stefie Chin
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Etiam pretium neque vitae vulputate fermentum.
                                            </td>
                                            <td class="email-date">11/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                Alan Tan
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Duis et justo in nisl tristique lobortis id at ligula.
                                            </td>
                                            <td class="email-date">11/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                Yu Ming Tan
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Sed dapibus nec velit eget pulvinar. Etiam id erat in eros imperdiet tempus.
                                            </td>
                                            <td class="email-date">11/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                Harvinder Signh
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Aliquam diam risus, condimentum ut diam in, fermentum euismod sem.
                                            </td>
                                            <td class="email-date">12/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                Fiona Loh
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Praesent dapibus ultricies magna, ac laoreet ante pellentesque nec. 
                                            </td>
                                            <td class="email-date">11/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                Derrick Tew
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Nullam eget nibh et dui vestibulum aliquam vitae a lacus.
                                            </td>
                                            <td class="email-date">10/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                Terry Dew
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Nulla eget placerat ante, sed hendrerit felis. Praesent vitae convallis erat.
                                            </td>
                                            <td class="email-date">09/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                John Doe
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Sed dapibus nec velit eget pulvinar. Etiam id erat in eros imperdiet tempus.
                                            </td>
                                            <td class="email-date">08/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                Leap Motion
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Ut tristique dapibus nibh, sed scelerisque magna vehicula a.
                                            </td>
                                            <td class="email-date">11/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                Stefie Chin
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Etiam pretium neque vitae vulputate fermentum.
                                            </td>
                                            <td class="email-date">11/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                Alan Tan
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Duis et justo in nisl tristique lobortis id at ligula.
                                            </td>
                                            <td class="email-date">11/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                Yu Ming Tan
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Sed dapibus nec velit eget pulvinar. Etiam id erat in eros imperdiet tempus.
                                            </td>
                                            <td class="email-date">11/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                Fiona Loh
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Praesent dapibus ultricies magna, ac laoreet ante pellentesque nec. 
                                            </td>
                                            <td class="email-date">11/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                Derrick Tew
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Nullam eget nibh et dui vestibulum aliquam vitae a lacus.
                                            </td>
                                            <td class="email-date">10/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                Terry Dew
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Nulla eget placerat ante, sed hendrerit felis. Praesent vitae convallis erat.
                                            </td>
                                            <td class="email-date">09/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                John Doe
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Sed dapibus nec velit eget pulvinar. Etiam id erat in eros imperdiet tempus.
                                            </td>
                                            <td class="email-date">08/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                Leap Motion
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Ut tristique dapibus nibh, sed scelerisque magna vehicula a.
                                            </td>
                                            <td class="email-date">11/4/2014</td>
                                        </tr>
                                        <tr>
                                            <td class="email-select"><a href="#" data-click="email-select-single"><i class="fa fa-square-o fa-fw"></i></a></td>
                                            <td class="email-sender">
                                                Stefie Chin
                                            </td>
                                            <td class="email-subject">
                                                <a href="#" class="email-btn" data-click="email-archive"><i class="fa fa-folder-open"></i></a>
                                                <a href="#" class="email-btn" data-click="email-remove"><i class="fa fa-trash-o"></i></a>
                                                <a href="#" class="email-btn" data-click="email-highlight"><i class="fa fa-flag"></i></a> 
                                                Etiam pretium neque vitae vulputate fermentum.
                                            </td>
                                            <td class="email-date">11/4/2014</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="email-footer clearfix">
                                    737 messages
                                    <ul class="pagination pagination-sm m-t-0 m-b-0 pull-right">
                                        <li class="disabled"><a href="javascript:;"><i class="fa fa-angle-double-left"></i></a></li>
                                        <li class="disabled"><a href="javascript:;"><i class="fa fa-angle-left"></i></a></li>
                                        <li><a href="javascript:;"><i class="fa fa-angle-right"></i></a></li>
                                        <li><a href="javascript:;"><i class="fa fa-angle-double-right"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- end col-10 -->
                    </div>
                    <!-- end row -->
                </div>
            </div>
            <!-- end #content -->

            <!-- begin theme-panel -->
            <div class="theme-panel">
                <a href="javascript:;" data-click="theme-panel-expand" class="theme-collapse-btn"><i class="fa fa-cog"></i></a>
                <div class="theme-panel-content">
                    <h5 class="m-t-0">Color Theme</h5>
                    <ul class="theme-list clearfix">
                        <li class="active"><a href="javascript:;" class="bg-green" data-theme="default" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Default">&nbsp;</a></li>
                        <li><a href="javascript:;" class="bg-red" data-theme="red" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Red">&nbsp;</a></li>
                        <li><a href="javascript:;" class="bg-blue" data-theme="blue" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Blue">&nbsp;</a></li>
                        <li><a href="javascript:;" class="bg-purple" data-theme="purple" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Purple">&nbsp;</a></li>
                        <li><a href="javascript:;" class="bg-orange" data-theme="orange" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Orange">&nbsp;</a></li>
                        <li><a href="javascript:;" class="bg-black" data-theme="black" data-click="theme-selector" data-toggle="tooltip" data-trigger="hover" data-container="body" data-title="Black">&nbsp;</a></li>
                    </ul>
                    <div class="divider"></div>
                    <div class="row m-t-10">
                        <div class="col-md-5 control-label double-line">Header Styling</div>
                        <div class="col-md-7">
                            <select name="header-styling" class="form-control input-sm">
                                <option value="1">default</option>
                                <option value="2">inverse</option>
                            </select>
                        </div>
                    </div>
                    <div class="row m-t-10">
                        <div class="col-md-5 control-label">Header</div>
                        <div class="col-md-7">
                            <select name="header-fixed" class="form-control input-sm">
                                <option value="1">fixed</option>
                                <option value="2">default</option>
                            </select>
                        </div>
                    </div>
                    <div class="row m-t-10">
                        <div class="col-md-5 control-label double-line">Sidebar Styling</div>
                        <div class="col-md-7">
                            <select name="sidebar-styling" class="form-control input-sm">
                                <option value="1">default</option>
                                <option value="2">grid</option>
                            </select>
                        </div>
                    </div>
                    <div class="row m-t-10">
                        <div class="col-md-5 control-label">Sidebar</div>
                        <div class="col-md-7">
                            <select name="sidebar-fixed" class="form-control input-sm">
                                <option value="1">fixed</option>
                                <option value="2">default</option>
                            </select>
                        </div>
                    </div>
                    <div class="row m-t-10">
                        <div class="col-md-5 control-label double-line">Sidebar Gradient</div>
                        <div class="col-md-7">
                            <select name="content-gradient" class="form-control input-sm">
                                <option value="1">disabled</option>
                                <option value="2">enabled</option>
                            </select>
                        </div>
                    </div>
                    <div class="row m-t-10">
                        <div class="col-md-5 control-label double-line">Content Styling</div>
                        <div class="col-md-7">
                            <select name="content-styling" class="form-control input-sm">
                                <option value="1">default</option>
                                <option value="2">black</option>
                            </select>
                        </div>
                    </div>
                    <div class="row m-t-10">
                        <div class="col-md-12">
                            <a href="#" class="btn btn-inverse btn-block btn-sm" data-click="reset-local-storage"><i class="fa fa-refresh m-r-3"></i> Reset Local Storage</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end theme-panel -->

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
        <!--[if lt IE 9]>
                <script src="assets/crossbrowserjs/html5shiv.js"></script>
                <script src="assets/crossbrowserjs/respond.min.js"></script>
                <script src="assets/crossbrowserjs/excanvas.min.js"></script>
        <![endif]-->
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>
        <!-- ================== END BASE JS ================== -->

        <!-- ================== BEGIN PAGE LEVEL JS ================== -->
        <script src="assets/js/inbox.demo.min.js"></script>
        <script src="assets/js/apps.min.js"></script>
        <!-- ================== END PAGE LEVEL JS ================== -->

        <script>
            $(document).ready(function () {
                App.init();
                Inbox.init();
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

    <!-- Mirrored from seantheme.com/color-admin-v1.9/admin/html/email_inbox.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 19 Oct 2015 11:19:46 GMT -->
</html>

