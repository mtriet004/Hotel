<%-- 
    Document   : contact
    Created on : Mar 13, 2024, 10:10:01 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Liên Hệ</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <!-- Facebook and Twitter integration -->
        <meta property="og:title" content=""/>
        <meta property="og:image" content=""/>
        <meta property="og:url" content=""/>
        <meta property="og:site_name" content=""/>
        <meta property="og:description" content=""/>
        <meta name="twitter:title" content="" />
        <meta name="twitter:image" content="" />
        <meta name="twitter:url" content="" />
        <meta name="twitter:card" content="" />

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico">
        <!-- <link href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700italic,900,700,900italic' rel='stylesheet' type='text/css'> -->

        <!-- Stylesheets -->
        <!-- Dropdown Menu -->
        <link rel="stylesheet" href="css/superfish.css">
        <!-- Owl Slider -->
        <!-- <link rel="stylesheet" href="css/owl.carousel.css"> -->
        <!-- <link rel="stylesheet" href="css/owl.theme.default.min.css"> -->
        <!-- Date Picker -->
        <link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
        <!-- CS Select -->
        <link rel="stylesheet" href="css/cs-select.css">
        <link rel="stylesheet" href="css/cs-skin-border.css">

        <!-- Themify Icons -->
        <link rel="stylesheet" href="css/themify-icons.css">
        <!-- Flat Icon -->
        <link rel="stylesheet" href="css/flaticon.css">
        <!-- Icomoon -->
        <link rel="stylesheet" href="css/icomoon.css">
        <!-- Flexslider  -->
        <link rel="stylesheet" href="css/flexslider.css">

        <!-- Style -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Modernizr JS -->
        <script src="js/modernizr-2.6.2.min.js"></script>
        <!-- FOR IE9 below -->
        <!--[if lt IE 9]>
        <script src="js/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <div id="fh5co-wrapper">
            <div id="fh5co-page">
                <div id="fh5co-header">
                    <header id="fh5co-header-section">
                        <div class="container">
                            <div class="nav-header">
                                <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
                                <h1 id="fh5co-logo"><a href="index.jsp">BPLH</a></h1>
                                <nav id="fh5co-menu-wrap" role="navigation">
                                    <ul class="sf-menu" id="fh5co-primary-menu">
                                        <li><a href="index.jsp">Trang Chủ</a></li>
                                        <li>
                                            <a class="active" href="room.jsp" class="fh5co-sub-ddown">Phòng</a>
                                            <ul class="fh5co-sub-menu">
                                                <li><a href="#">Deluxe Family Triple</a></li>
                                                <li><a href="#">Executive Suite</a></li>
                                                <li><a href="#">Deluxe King</a></li>
                                                <li><a href="#">Royal Suite</a></li> 
                                                <li><a href="#">Presidential Suite</a></li> 
                                                <li><a href="#">Deluxe Twin</a></li> 
                                            </ul>
                                        </li>
                                        <li><a href="service.jsp">Dịch Vụ</a></li>
                                        <li><a href="blog.jsp">Bài Viết</a></li>
                                        <li><a href="contact.jsp">Liên Hệ</a></li>
                                            <c:if test="${loggedInAccount == null}">
                                            <li><a href="login">Đăng Nhập</a></li>
                                            <li><a href="signup">Đăng Ký</a></li>
                                            </c:if>
                                            <c:if test="${loggedInAccount != null}">
                                            <li>
                                                <a class="fh5co-sub-ddown">${loggedInAccount.fullName}</a>
                                                <ul class="fh5co-sub-menu">
                                                    <li><a href="#">Thông tin cá nhân</a></li>
                                                    <li><a href="#">Lịch sử đặt phòng </a></li> 
                                                    <hr class="dropdown-divider">
                                                    <c:if test="${loggedInAccount.role.roleId == 1}">
                                                        <li><a href="#">Quản lí phòng</a></li>
                                                        <li><a href="#">Báo cáo doanh thu</a></li>
                                                        <hr class="dropdown-divider">
                                                    </c:if>
                                                    <li><a href="logout">Logout </a></li>
                                                </ul>
                                            </li>
                                        </c:if>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </header>

                </div>
                <!-- end:fh5co-header -->
                <div class="fh5co-parallax" style="background-image: url(images/ct.jpg);" data-stellar-background-ratio="0.5">
                    <div class="overlay"></div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 col-md-offset-0 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center fh5co-table">
                                <div class="fh5co-intro fh5co-table-cell">
                                    <h1 class="text-center">Đắm Chìm Trong Những Trải Nghiệm Hoàn Hảo</h1>
                                    <p></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="fh5co-contact-section">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="fh5co-parallax" style="background-image: url(images/map.jpg);"></div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-12">
                                <h3>Địa chỉ của chúng tôi</h3>
                                <p></p>
                                <ul class="contact-info">
                                    <li><i class="ti-map"></i>45 Tân Lập, Đông Hoà, Dĩ An, Bình Dương</li>
                                    <li><i class="ti-mobile"></i>+ 1234 5678 910 </li>
                                    <li><i class="ti-envelope"></i><a href="sngao.com">sieunhangao.com</a></li>
                                    <li><i class="ti-home"></i><a href="#">youtube.com</a></li>
                                </ul>
                            </div>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Tên">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Email">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <textarea name="" class="form-control" id="" cols="30" rows="7" placeholder="Tin nhắn"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="submit" value="Gửi tin nhắn" class="btn btn-primary">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <footer id="footer" class="fh5co-bg-color">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="copyright">
                                    <p><small>&copy; 2016-2024. <br> All Rights Reserved. <br>
                                            Designed by MT
                                            </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <h3>Doanh Nghiệp</h3>
                                                        <ul class="link">
                                                            <li><a href="#">Về Chúng Tôi</a></li>
                                                            <li><a href="#">Các Loại Phòng</a></li>
                                                            <li><a href="#">Chăm Sóc Khách Hàng</a></li>
                                                            <li><a href="#">Liên Hệ</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <h3>Dịch Vụ</h3>
                                                        <ul class="link">
                                                            <li><a href="#">Nhà Hàng</a></li>
                                                            <li><a href="#">Bar</a></li>
                                                            <li><a href="#">Đưa Đón</a></li>
                                                            <li><a href="#">Hồ Bơi</a></li>
                                                            <li><a href="#">Spa</a></li>
                                                            <li><a href="#">Gym</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <h3>Đóng Góp</h3>
                                                        <p>Hãy cho chúng tôi biết thêm về những trải nghiệm của bạn. Cảm ơn bạn vì đã đồng hành cùng chúng tôi.</p>
                                                        <form action="#" id="form-subscribe">
                                                            <div class="form-field">
                                                                <input type="email" placeholder="Địa chỉ email" id="email">
                                                                <input type="submit" id="submit" value="Gửi">
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <ul class="social-icons">
                                                    <li>
                                                        <a href="#"><i class="icon-twitter-with-circle"></i></a>
                                                        <a href="#"><i class="icon-facebook-with-circle"></i></a>
                                                        <a href="#"><i class="icon-instagram-with-circle"></i></a>
                                                        <a href="#"><i class="icon-linkedin-with-circle"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                </div>
                            </div>
                            </footer>

                        </div>
                        <!-- END fh5co-page -->

                    </div>
                    <!-- END fh5co-wrapper -->

                    <!-- Javascripts -->
                    <script src="js/jquery-2.1.4.min.js"></script>
                    <!-- Dropdown Menu -->
                    <script src="js/hoverIntent.js"></script>
                    <script src="js/superfish.js"></script>
                    <!-- Bootstrap -->
                    <script src="js/bootstrap.min.js"></script>
                    <!-- Waypoints -->
                    <script src="js/jquery.waypoints.min.js"></script>
                    <!-- Counters -->
                    <script src="js/jquery.countTo.js"></script>
                    <!-- Stellar Parallax -->
                    <script src="js/jquery.stellar.min.js"></script>
                    <!-- Owl Slider -->
                    <!-- // <script src="js/owl.carousel.min.js"></script> -->
                    <!-- Date Picker -->
                    <script src="js/bootstrap-datepicker.min.js"></script>
                    <!-- CS Select -->
                    <script src="js/classie.js"></script>
                    <script src="js/selectFx.js"></script>
                    <!-- Flexslider -->
                    <script src="js/jquery.flexslider-min.js"></script>
                    <!-- Google Map -->
                    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
                    <script src="js/google_map.js"></script>

                    <script src="js/custom.js"></script>

                    </body>
                    </html>
