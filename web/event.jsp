<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>
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

            <%if ((String) session.getAttribute("id") != null) {%>
            <%@ include file="/static/customer_header.jsp"%>
            <%} else {%>
            <%@ include file="/static/visitor_header.jsp"%>
            <%}%>

            <!-- Start main-content -->
            <div class="main-content">
                <!-- Section: home -->
                <section id="home" class="divider parallax fullscreen" data-stellar-background-ratio="0.5" data-bg-img="images/events/1.jpg">
                    <div class="display-table">
                        <div class="display-table-cell">
                            <div class="container pt-150 pb-150">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3">
                                        <div class="text-center pt-20 pb-50 mt-sm-100">
                                            <h1 class="text-white">Ashley <img src="images/wedding-ring2.png" alt=""> Daniel</h1>
                                            <!--  <i class="fa fa-heart text-theme-colored font-48 mt-20"></i> -->
                                            <h4 class="text-white letter-space-2 mt-10 font-playfair">are getting married</h4>
                                            <div class="countdown-timer">
                                                <div class="soon text-white" id="countdown-timer-soon-rev"
                                                     data-separator="/"
                                                     data-format="d,h,m,s"
                                                     data-due="2016-06-01"
                                                     data-layout="group label-uppercase label-above spacey"
                                                     data-face="slot slide left">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Section: Couple -->
                <section id="couple" class="bg-img-center-bottom"  data-bg-img="images/bg/bg9.png">
                    <div class="container">
                        <div class="section-content">
                            <div class="row">
                                <div class="col-xs-12 col-sm-4 col-sm-offset-2 wow fadeInUp animation-delay1">
                                    <div class="couple">
                                        <div class="couple-thumb">                    
                                            <img class="img-fullwidth" src="images/photos/groom.jpg" alt="">
                                        </div>
                                        <div class="couple-details">
                                            <h3 class="name">Steve Jaka</h3>
                                            <h4 class="title"><span class="bg-theme-colored">Groom</span></h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-4 wow fadeInUp animation-delay2">
                                    <div class="couple">
                                        <div class="couple-thumb">                    
                                            <img class="img-fullwidth" src="images/photos/bride.jpg" alt="">
                                        </div>
                                        <div class="couple-details">
                                            <h3 class="name">Anjelina Jorina</h3>
                                            <h4 class="title"><span class="bg-theme-colored">Bride</span></h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-60">
                                <div class="col-md-8 col-md-offset-2 text-center">
                                    <h3>We Are Getting Married</h3>
                                    <div class="title-icon">
                                        <img src="images/section-title-after.png" alt="">
                                    </div>
                                    <div class="countdown-timer">
                                        <div class="soon text-theme-colored" id="countdown-timer-soon-rev"
                                             data-separator="/"
                                             data-format="d,h,m,s"
                                             data-due="2016-06-01"
                                             data-layout="group label-uppercase label-above spacey"
                                             data-face="slot slide left">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Section: Our Story  -->
                <section id="story" class="bg-lighter">
                    <div class="container">
                        <div class="section-title">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3 text-center pb-30 wow fadeInUp animation-delay1">
                                    <h2>Story</h2>
                                    <img src="images/section-title-after.png" alt="">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus unde, iste consectetur cumque repellat sint.</p>
                                </div>
                            </div>
                        </div>
                        <div class="section-content">
                            <div class="row">
                                <div class="each-story clearfix wow fadeInUp animation-delay1">
                                    <div class="col-md-4">
                                        <h2 class="story-date p-sm-20 mt-sm-0 pt-40 pl-20"><em>10 Feb 2015</em></h2>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="story-details border-radius-10px p-20 mb-20">
                                            <div class="row">
                                                <div class="col-sm-9">
                                                    <h4>First Meet Each Other</h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde hic quasi nesciunt tempora numquam, fuga!</p>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="story-thumb">
                                                        <img alt="" src="images/story/story-img1.jpg" class="img-circle">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="each-story clearfix wow fadeInUp animation-delay1">
                                    <div class="col-md-4 pull-right flip">
                                        <h2 class="story-date p-sm-20 mt-sm-0 pt-40 pl-20"><em>12 Jun 2015</em></h2>
                                    </div>
                                    <div class="col-md-8 pull-left">
                                        <div class="story-details bg-theme-colored border-radius-10px p-20 mb-20">
                                            <div class="row">
                                                <div class="col-sm-9">
                                                    <h4 class="title">Our First Kiss</h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde hic quasi nesciunt tempora numquam, fuga!</p>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="story-thumb">
                                                        <img alt="" src="images/story/story-img3.jpg" class="img-circle">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="each-story clearfix wow fadeInUp animation-delay1">
                                    <div class="col-md-4">
                                        <h2 class="story-date p-sm-20 mt-sm-0 pt-40 pl-20"><em>19 Dec 2015</em></h2>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="story-details border-radius-10px p-20 mb-20">
                                            <div class="row">
                                                <div class="col-sm-9">
                                                    <h4>He proposed me</h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde hic quasi nesciunt tempora numquam, fuga!</p>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="story-thumb">
                                                        <img alt="" src="images/story/story-img2.jpg" class="img-circle">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </section>

                <!-- Diver: Video Background  -->
                <section class="divider parallax layer-overlay overlay-lighter" data-stellar-background-ratio="0.5" data-bg-img="images/bg/bg-sm1.jpg">
                    <div class="container pt-200 pb-200"> 
                        <!-- Section Content -->
                        <div class="section-content">
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <a href="https://www.youtube.com/watch?v=y6PH9u0wnww" data-lightbox-gallery="youtube-video"><i class="fa fa-play-circle text-theme-colored font-72"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Diver: Event  -->
                <section id="events" class="divider bg-img-center-bottom" data-bg-img="images/bg/bg12.png">
                    <div class="container">
                        <div class="section-title">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3 text-center wow fadeInUp animation-delay1">
                                    <h2 class="title pattern-bottom">Events</h2>
                                    <img src="images/section-title-after.png" alt="">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit illo ipsa numquam, quod iusto enim.</p>
                                </div>
                            </div>
                        </div>
                        <div class="section-content">
                            <div class="row multi-row-clearfix">
                                <div class="events">
                                    <div class="col-xs-12 col-sm-12 col-md-12 wow fadeInUp animation-delay1">
                                        <article class="event clearfix maxwidth500 mb-40 bg-lighter">
                                            <div class="col-xs-12 col-md-4 p-0">
                                                <div class="entry-header">
                                                    <div class="event-thumb">
                                                        <img class="img-responsive img-fullwidth" alt="" src="images/event/event-img1.jpg">
                                                    </div>
                                                    <div class="entry-date text-center">
                                                        <span><b>DEC </b></span><br>25
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-8 p-0">
                                                <div class="entry-content pl-50 pr-50 p-30 pl-xs-15 pr-xs-15">
                                                    <h4 class="entry-title sm-inline-block mt-0 mt-sm-30 pt-0"><a href="#">The Celebration</a></h4>
                                                    <div class="entry-meta mt-10 mb-20">
                                                        <ul class="list-inline">
                                                            <li><i class="fa fa-clock-o mr-5"></i> 3pm - 6pm </li>
                                                            <li><i class="fa fa-map-marker mr-5"></i> 121 King Street, Melbourne</li>
                                                        </ul>
                                                    </div>
                                                    <p class="mb-20">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis impedit expedita, deleniti culpa nam fuga neque ab similique corporis. Sed eligendi perspiciatis error ipsam culpa, iusto dolor cum consectetur nihil qui ab obcaecati omnis odit veniam laboriosam esse quas, repellendus magnam fugit dignissimos Culpa, velit consectetur adipisicing elit.</p>
                                                    <a href="#" class="text-theme-colored font-13">Read more <i class="fa fa-angle-double-right"></i></a>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 wow fadeInUp animation-delay1">
                                        <article class="event clearfix maxwidth500 mb-30 bg-lighter">
                                            <div class="col-xs-12 col-md-4 p-0 pull-right flip">
                                                <div class="entry-header">
                                                    <div class="event-thumb">
                                                        <img class="img-responsive img-fullwidth" alt="" src="images/event/event-img2.jpg">
                                                    </div>
                                                    <div class="entry-date text-center">
                                                        <span><b>DEC </b></span><br>26
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-8 p-0 pull-left flip">
                                                <div class="entry-content pl-50 pr-50 p-30 pl-xs-15 pr-xs-15">
                                                    <h4 class="entry-title mt-0 pt-0"><a href="#">Wedding Ceremony</a></h4>
                                                    <div class="entry-meta mt-10 mb-20">
                                                        <ul class="list-inline">
                                                            <li><i class="fa fa-clock-o mr-5"></i> 6pm - 9pm </li>
                                                            <li><i class="fa fa-map-marker mr-5"></i> 121 King Street, Melbourne</li>
                                                        </ul>
                                                    </div>
                                                    <p class="mb-20">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis impedit expedita, deleniti culpa nam fuga neque ab similique corporis. Sed eligendi perspiciatis error ipsam culpa, iusto dolor cum consectetur nihil qui ab obcaecati omnis odit veniam laboriosam esse quas, repellendus magnam fugit dignissimos Culpa, velit consectetur adipisicing elit.</p>
                                                    <a href="#" class="text-theme-colored font-13">Read more <i class="fa fa-angle-double-right"></i></a>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 wow fadeInUp animation-delay1">
                                        <article class="event clearfix maxwidth500 bg-lighter">
                                            <div class="col-xs-12 col-md-4 p-0">
                                                <div class="entry-header">
                                                    <div class="event-thumb">
                                                        <img class="img-responsive img-fullwidth" alt="" src="images/event/event-img3.jpg">
                                                    </div>
                                                    <div class="entry-date text-center">
                                                        <span><b>DEC </b></span><br>27
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-8 p-0">
                                                <div class="entry-content pl-50 pr-50 p-30 pl-xs-15 pr-xs-15">
                                                    <h4 class="entry-title sm-inline-block mt-0 mt-sm-30 pt-0"><a href="#">The Greeting</a></h4>
                                                    <div class="entry-meta mt-10 mb-20">
                                                        <ul class="list-inline">
                                                            <li><i class="fa fa-clock-o mr-5"></i> 10pm - 11pm </li>
                                                            <li><i class="fa fa-map-marker mr-5"></i> 121 King Street, Melbourne</li>
                                                        </ul>
                                                    </div>
                                                    <p class="mb-20">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis impedit expedita, deleniti culpa nam fuga neque ab similique corporis. Sed eligendi perspiciatis error ipsam culpa, iusto dolor cum consectetur nihil qui ab obcaecati omnis odit veniam laboriosam esse quas, repellendus magnam fugit dignissimos Culpa, velit consectetur adipisicing elit.</p>
                                                    <a href="#" class="text-theme-colored font-13">Read more <i class="fa fa-angle-double-right"></i></a>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Section: Gallery  -->
                <section id="gallery" class="bg-lighter">
                    <div class="container-fluid pl-0 pr-0 pb-0">
                        <div class="section-title">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3 text-center pb-30 wow fadeInUp animation-delay1">
                                    <h2>Wedding Gallery</h2>
                                    <img src="images/section-title-after.png" alt="">
                                    <p><em>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non, dignissimos nihil unde dolores qui, adipisci assumenda atque blanditiis omnis nostrum!</em></p>
                                </div>
                            </div>
                        </div>
                        <div class="section-content">
                            <div class="row">
                                <div class="col-md-12"> 

                                    <!-- Portfolio Gallery Grid -->
                                    <div id="grid" class="portfolio-gallery masonry grid-4 clearfix" data-lightbox="gallery">

                                        <!-- Portfolio Item Start -->
                                        <div class="portfolio-item">
                                            <a href="images/gallery/full/m1.jpg" data-lightbox="gallery-item" title="Title Here 1">
                                                <div class="thumb">
                                                    <img class="img-fullwidth photo" src="images/gallery/m1.jpg" alt="project">
                                                    <div class="overlay-shade"></div>
                                                    <div class="text-holder">
                                                        <div class="title text-center">Wedding</div>
                                                    </div>
                                                    <div class="icons-holder">
                                                        <div class="icons-holder-inner">
                                                            <div class="social-icons icon-sm icon-dark icon-circled icon-theme-colored">
                                                                <i class="fa fa-plus text-white"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <!-- Portfolio Item End -->

                                        <!-- Portfolio Item Start -->
                                        <div class="portfolio-item">
                                            <a href="images/gallery/full/2.jpg" data-lightbox="gallery-item" title="Title Here 2">
                                                <div class="thumb">
                                                    <img class="img-fullwidth photo" src="images/gallery/2.jpg" alt="project">
                                                    <div class="overlay-shade"></div>
                                                    <div class="text-holder">
                                                        <div class="title text-center">Wedding</div>
                                                    </div>
                                                    <div class="icons-holder">
                                                        <div class="icons-holder-inner">
                                                            <div class="social-icons icon-sm icon-dark icon-circled icon-theme-colored">
                                                                <i class="fa fa-plus text-white"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <!-- Portfolio Item End -->

                                        <!-- Portfolio Item Start -->
                                        <div class="portfolio-item">
                                            <a href="images/gallery/full/m3.jpg" data-lightbox="gallery-item" title="Title Here 3">
                                                <div class="thumb">
                                                    <img class="img-fullwidth photo" src="images/gallery/m3.jpg" alt="project">
                                                    <div class="overlay-shade"></div>
                                                    <div class="text-holder">
                                                        <div class="title text-center">Wedding</div>
                                                    </div>
                                                    <div class="icons-holder">
                                                        <div class="icons-holder-inner">
                                                            <div class="social-icons icon-sm icon-dark icon-circled icon-theme-colored">
                                                                <i class="fa fa-plus text-white"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <!-- Portfolio Item End -->

                                        <!-- Portfolio Item Start -->
                                        <div class="portfolio-item">
                                            <a href="images/gallery/full/4.jpg" data-lightbox="gallery-item" title="Title Here 3">
                                                <div class="thumb">
                                                    <img class="img-fullwidth photo" src="images/gallery/4.jpg" alt="project">
                                                    <div class="overlay-shade"></div>
                                                    <div class="text-holder">
                                                        <div class="title text-center">Wedding</div>
                                                    </div>
                                                    <div class="icons-holder">
                                                        <div class="icons-holder-inner">
                                                            <div class="social-icons icon-sm icon-dark icon-circled icon-theme-colored">
                                                                <i class="fa fa-plus text-white"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <!-- Portfolio Item End -->

                                        <!-- Portfolio Item Start -->
                                        <div class="portfolio-item">
                                            <a href="images/gallery/full/5.jpg" data-lightbox="gallery-item" title="Title Here 3">
                                                <div class="thumb">
                                                    <img class="img-fullwidth photo" src="images/gallery/5.jpg" alt="project">
                                                    <div class="overlay-shade"></div>
                                                    <div class="text-holder">
                                                        <div class="title text-center">Wedding</div>
                                                    </div>
                                                    <div class="icons-holder">
                                                        <div class="icons-holder-inner">
                                                            <div class="social-icons icon-sm icon-dark icon-circled icon-theme-colored">
                                                                <i class="fa fa-plus text-white"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <!-- Portfolio Item End -->

                                        <!-- Portfolio Item Start -->
                                        <div class="portfolio-item">
                                            <a href="images/gallery/full/6.jpg" data-lightbox="gallery-item" title="Title Here 3">
                                                <div class="thumb">
                                                    <img class="img-fullwidth photo" src="images/gallery/6.jpg" alt="project">
                                                    <div class="overlay-shade"></div>
                                                    <div class="text-holder">
                                                        <div class="title text-center">Wedding</div>
                                                    </div>
                                                    <div class="icons-holder">
                                                        <div class="icons-holder-inner">
                                                            <div class="social-icons icon-sm icon-dark icon-circled icon-theme-colored">
                                                                <i class="fa fa-plus text-white"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <!-- Portfolio Item End -->

                                        <!-- Portfolio Item Start -->
                                        <div class="portfolio-item">
                                            <a href="images/gallery/full/1.jpg" data-lightbox="gallery-item" title="Title Here 3">
                                                <div class="thumb">
                                                    <img class="img-fullwidth photo" src="images/gallery/1.jpg" alt="project">
                                                    <div class="overlay-shade"></div>
                                                    <div class="text-holder">
                                                        <div class="title text-center">Wedding</div>
                                                    </div>
                                                    <div class="icons-holder">
                                                        <div class="icons-holder-inner">
                                                            <div class="social-icons icon-sm icon-dark icon-circled icon-theme-colored">
                                                                <i class="fa fa-plus text-white"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <!-- Portfolio Item End -->

                                        <!-- Portfolio Item Start -->
                                        <div class="portfolio-item">
                                            <a href="images/gallery/full/m2.jpg" data-lightbox="gallery-item" title="Title Here 3">
                                                <div class="thumb">
                                                    <img class="img-fullwidth photo" src="images/gallery/m2.jpg" alt="project">
                                                    <div class="overlay-shade"></div>
                                                    <div class="text-holder">
                                                        <div class="title text-center">Wedding</div>
                                                    </div>
                                                    <div class="icons-holder">
                                                        <div class="icons-holder-inner">
                                                            <div class="social-icons icon-sm icon-dark icon-circled icon-theme-colored">
                                                                <i class="fa fa-plus text-white"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <!-- Portfolio Item End -->

                                        <!-- Portfolio Item Start -->
                                        <div class="portfolio-item">
                                            <a href="images/gallery/full/3.jpg" data-lightbox="gallery-item" title="Title Here 3">
                                                <div class="thumb">
                                                    <img class="img-fullwidth photo" src="images/gallery/3.jpg" alt="project">
                                                    <div class="overlay-shade"></div>
                                                    <div class="text-holder">
                                                        <div class="title text-center">Wedding</div>
                                                    </div>
                                                    <div class="icons-holder">
                                                        <div class="icons-holder-inner">
                                                            <div class="social-icons icon-sm icon-dark icon-circled icon-theme-colored">
                                                                <i class="fa fa-plus text-white"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <!-- Portfolio Item End -->

                                        <!-- Portfolio Item Start -->
                                        <div class="portfolio-item">
                                            <a href="images/gallery/full/4.jpg" data-lightbox="gallery-item" title="Title Here 3">
                                                <div class="thumb">
                                                    <img class="img-fullwidth photo" src="images/gallery/4.jpg" alt="project">
                                                    <div class="overlay-shade"></div>
                                                    <div class="text-holder">
                                                        <div class="title text-center">Wedding</div>
                                                    </div>
                                                    <div class="icons-holder">
                                                        <div class="icons-holder-inner">
                                                            <div class="social-icons icon-sm icon-dark icon-circled icon-theme-colored">
                                                                <i class="fa fa-plus text-white"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <!-- Portfolio Item End -->

                                        <!-- Portfolio Item Start -->
                                        <div class="portfolio-item">
                                            <a href="images/gallery/full/5.jpg" data-lightbox="gallery-item" title="Title Here 3">
                                                <div class="thumb">
                                                    <img class="img-fullwidth photo" src="images/gallery/5.jpg" alt="project">
                                                    <div class="overlay-shade"></div>
                                                    <div class="text-holder">
                                                        <div class="title text-center">Wedding</div>
                                                    </div>
                                                    <div class="icons-holder">
                                                        <div class="icons-holder-inner">
                                                            <div class="social-icons icon-sm icon-dark icon-circled icon-theme-colored">
                                                                <i class="fa fa-plus text-white"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <!-- Portfolio Item End -->

                                        <!-- Portfolio Item Start -->
                                        <div class="portfolio-item">
                                            <a href="images/gallery/full/5.jpg" data-lightbox="gallery-item" title="Title Here 3">
                                                <div class="thumb">
                                                    <img class="img-fullwidth photo" src="images/gallery/5.jpg" alt="project">
                                                    <div class="overlay-shade"></div>
                                                    <div class="text-holder">
                                                        <div class="title text-center">Wedding</div>
                                                    </div>
                                                    <div class="icons-holder">
                                                        <div class="icons-holder-inner">
                                                            <div class="social-icons icon-sm icon-dark icon-circled icon-theme-colored">
                                                                <i class="fa fa-plus text-white"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <!-- Portfolio Item End -->

                                        <!-- Portfolio Item Start -->
                                        <div class="portfolio-item">
                                            <a href="images/gallery/full/6.jpg" data-lightbox="gallery-item" title="Title Here 3">
                                                <div class="thumb">
                                                    <img class="img-fullwidth photo" src="images/gallery/6.jpg" alt="project">
                                                    <div class="overlay-shade"></div>
                                                    <div class="text-holder">
                                                        <div class="title text-center">Wedding</div>
                                                    </div>
                                                    <div class="icons-holder">
                                                        <div class="icons-holder-inner">
                                                            <div class="social-icons icon-sm icon-dark icon-circled icon-theme-colored">
                                                                <i class="fa fa-plus text-white"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <!-- Portfolio Item End -->

                                    </div>
                                    <!-- End Portfolio Gallery Grid --> 
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Section: Bridesmaids and Groomsmen -->
                <section class="bg-img-center-bottom" data-bg-img="images/bg/bg9.png">
                    <div class="container">
                        <!-- Bridesmaids -->
                        <div class="section-title">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3 text-center">
                                    <h2>Bridesmaids</h2>
                                    <img src="images/section-title-after.png" alt="">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit illo ipsa numquam, quod iusto enim.</p>
                                </div>
                            </div>
                        </div>
                        <div class="section-content">
                            <div class="row">
                                <div class="col-xs-12 col-md-12">
                                    <div class="bride-groomsmen-carousel">
                                        <div class="item">
                                            <div class="best-people">
                                                <div class="thumb">
                                                    <img alt="" src="images/photos/p1.jpg">
                                                    <div class="info">
                                                        <h5 class="name">Mark Hasan</h5>
                                                        <h6 class="relation">Friend</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="best-people">
                                                <div class="thumb">                    
                                                    <img alt="" src="images/photos/p2.jpg">
                                                    <div class="info">
                                                        <h5 class="name">Mark Hasan</h5>
                                                        <h6 class="relation">Friend</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="best-people">
                                                <div class="thumb">                    
                                                    <img alt="" src="images/photos/p3.jpg">
                                                    <div class="info">
                                                        <h5 class="name">Mark Hasan</h5>
                                                        <h6 class="relation">Friend</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="best-people">
                                                <div class="thumb">                    
                                                    <img alt="" src="images/photos/p4.jpg">
                                                    <div class="info">
                                                        <h5 class="name">Mark Hasan</h5>
                                                        <h6 class="relation">Friend</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="best-people">
                                                <div class="thumb">                    
                                                    <img alt="" src="images/photos/p5.jpg">
                                                    <div class="info">
                                                        <h5 class="name">Mark Hasan</h5>
                                                        <h6 class="relation">Friend</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="best-people">
                                                <div class="thumb">                    
                                                    <img alt="" src="images/photos/p6.jpg">
                                                    <div class="info">
                                                        <h5 class="name">Mark Hasan</h5>
                                                        <h6 class="relation">Friend</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Groomsmen -->
                        <div class="section-title">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3 text-center">
                                    <h2>Groomsmen</h2>
                                    <img src="images/section-title-after.png" alt="">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit illo ipsa numquam, quod iusto enim.</p>
                                </div>
                            </div>
                        </div>
                        <div class="section-content">
                            <div class="row">
                                <div class="col-xs-12 col-md-12">
                                    <div class="bride-groomsmen-carousel">
                                        <div class="item">
                                            <div class="best-people">
                                                <div class="thumb">
                                                    <img alt="" src="images/photos/p1.jpg">
                                                    <div class="info">
                                                        <h5 class="name">Mark Hasan</h5>
                                                        <h6 class="relation">Friend</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="best-people">
                                                <div class="thumb">                    
                                                    <img alt="" src="images/photos/p2.jpg">
                                                    <div class="info">
                                                        <h5 class="name">Mark Hasan</h5>
                                                        <h6 class="relation">Friend</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="best-people">
                                                <div class="thumb">                    
                                                    <img alt="" src="images/photos/p3.jpg">
                                                    <div class="info">
                                                        <h5 class="name">Mark Hasan</h5>
                                                        <h6 class="relation">Friend</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="best-people">
                                                <div class="thumb">                    
                                                    <img alt="" src="images/photos/p4.jpg">
                                                    <div class="info">
                                                        <h5 class="name">Mark Hasan</h5>
                                                        <h6 class="relation">Friend</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="best-people">
                                                <div class="thumb">                    
                                                    <img alt="" src="images/photos/p5.jpg">
                                                    <div class="info">
                                                        <h5 class="name">Mark Hasan</h5>
                                                        <h6 class="relation">Friend</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="best-people">
                                                <div class="thumb">                    
                                                    <img alt="" src="images/photos/p6.jpg">
                                                    <div class="info">
                                                        <h5 class="name">Mark Hasan</h5>
                                                        <h6 class="relation">Friend</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Divider: Call To Action  -->
                <section class="divider layer-overlay overlay-light" data-stellar-background-ratio="0.5" data-bg-img="images/bg/bg-sm4.jpg">
                    <div class="container pt-140 pb-140"> 
                        <!-- Section Content -->
                        <div class="section-content">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2 text-center wow fadeInUp animation-delay1">
                                    <i class="fa fa-pied-piper-alt font-72 text-theme-colored"></i>
                                    <h2 class="font-36">Are You Attending! Don’t be late no more.</h2>
                                    <a role="button" class="btn btn-lg btn-dark btn-flat btn-theme-colored mr-20 mt-30 smooth-scroll-to-target" href="#rsvp">RSVP
                                    </a>
                                    <a class="btn btn-lg btn-dark btn-flat btn-theme-colored popup-gmaps text-white mt-30" href="https://maps.google.com/maps?q=221B+Baker+Street,+London,+United+Kingdom&amp;hl=en&amp;t=v&amp;hnear=221B+Baker+St,+London+NW1+6XE,+United+Kingdom">LOCATION</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Diver: Blog  -->
                <section id="blog" class="divider bg-img-center-bottom" data-bg-img="images/bg/bg14.png">
                    <div class="container">
                        <div class="section-title">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3 text-center wow fadeInUp animation-delay1">
                                    <h2 class="title pattern-bottom">Blog</h2>
                                    <img src="images/section-title-after.png" alt="">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque commodi molestiae autem fugit illo ipsa numquam, quod iusto enim.</p>
                                </div>
                            </div>
                        </div>
                        <div class="section-content">
                            <div class="row multi-row-clearfix">
                                <div class="blog-post">
                                    <div class="col-xs-12 col-sm-12 col-md-4 wow fadeInUp animation-delay1">
                                        <article class="post clearfix maxwidth500 mb-40">
                                            <div class="col-sm-12 col-md-12 p-0">
                                                <div class="entry-header">
                                                    <div class="post-thumb">
                                                        <img class="img-responsive img-fullwidth" alt="" src="images/blog/blog-img1.jpg">
                                                    </div>
                                                    <div class="entry-date text-center font-playball">
                                                        <span><i class="fa fa-thumbs-o-up font-24 font-24"></i></span><br>27
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 p-0">
                                                <div class="entry-content p-30 pl-xs-15 pr-xs-15">
                                                    <h3 class="entry-title sm-inline-block mt-0 mt-sm-30 mt-xs-0 pt-0"><a href="#">Our Honeymoon planning</a></h3>
                                                    <div class="entry-meta mb-20">
                                                        <span>By Admin </span>
                                                        <span><i class="fa fa-comments-o text-theme-colored ml-10"></i> 15
                                                        </span>
                                                    </div>
                                                    <p class="mb-20">Lorem ipsum dolor sit amet, consectetur emit adipisicing elit. Reiciendis impedit expedita sit deleniti culpa nam fuga neque smile similique corporis. Sed eligendi perspiciatis.</p>
                                                    <a href="couple_blog.jsp?id=<%=id%>" class="text-theme-colored font-13">Read more <i class="fa fa-angle-double-right"></i></a>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-4 wow fadeInUp animation-delay2">
                                        <article class="post clearfix maxwidth500 mb-40">
                                            <div class="col-sm-12 col-md-12 p-0">
                                                <div class="entry-header">
                                                    <div class="post-thumb">
                                                        <img class="img-responsive img-fullwidth" alt="" src="images/blog/blog-img2.jpg">
                                                    </div>
                                                    <div class="entry-date text-center font-playball">
                                                        <span><i class="fa fa-thumbs-o-up font-24 font-24"></i></span><br>27
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 p-0">
                                                <div class="entry-content p-30 pl-xs-15 pr-xs-15">
                                                    <h3 class="entry-title sm-inline-block mt-0 mt-sm-30 mt-xs-0 pt-0"><a href="#">Our Honeymoon planning</a></h3>
                                                    <div class="entry-meta mb-20">
                                                        <span>By Admin </span>
                                                        <span><i class="fa fa-comments-o text-theme-colored ml-10"></i> 15
                                                        </span>
                                                    </div>
                                                    <p class="mb-20">Lorem ipsum dolor sit amet, consectetur emit adipisicing elit. Reiciendis impedit expedita sit deleniti culpa nam fuga neque smile similique corporis. Sed eligendi perspiciatis.</p>
                                                    <a href="couple_blog.jsp?id=<%=id%>" class="text-theme-colored font-13">Read more <i class="fa fa-angle-double-right"></i></a>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-4 wow fadeInUp animation-delay3">
                                        <article class="post clearfix maxwidth500 mb-40">
                                            <div class="col-sm-12 col-md-12 p-0">
                                                <div class="entry-header">
                                                    <div class="post-thumb">
                                                        <img class="img-responsive img-fullwidth" alt="" src="images/blog/blog-img3.jpg">
                                                    </div>
                                                    <div class="entry-date text-center font-playball">
                                                        <span><i class="fa fa-thumbs-o-up font-24 font-24"></i></span><br>27
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 p-0">
                                                <div class="entry-content p-30 pl-xs-15 pr-xs-15">
                                                    <h3 class="entry-title sm-inline-block mt-0 mt-sm-30 mt-xs-0 pt-0"><a href="#">Our Honeymoon planning</a></h3>
                                                    <div class="entry-meta mb-20">
                                                        <span>By Admin </span>
                                                        <span><i class="fa fa-comments-o text-theme-colored ml-10"></i> 15
                                                        </span>
                                                    </div>
                                                    <p class="mb-20">Lorem ipsum dolor sit amet, consectetur emit adipisicing elit. Reiciendis impedit expedita sit deleniti culpa nam fuga neque smile similique corporis. Sed eligendi perspiciatis.</p>
                                                    <a href="couple_blog.jsp?id=<%=id%>" class="text-theme-colored font-13">Read more <i class="fa fa-angle-double-right"></i></a>
                                                </div>
                                            </div>
                                        </article>
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
                <%@ include file="/static/footer.jsp"%>
            </footer>
            <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
        </div>
        <!-- end wrapper -->

        <!-- Footer Scripts -->
        <!-- JS | Custom script for all pages -->
        <script src="js/custom.js"></script>

    </body>

</html>