<%-- 
    Document   : index
    Created on : Mar 13, 2024, 10:11:09 PM
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
        <title>Trang Chủ</title>

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
        <link rel="stylesheet" href="css/bootstrap.css">
        <!-- Themify Icons -->
        <link rel="stylesheet" href="css/themify-icons.css">
        <!-- Flat Icon -->
        <link rel="stylesheet" href="css/flaticon.css">
        <!-- Icomoon -->
        <link rel="stylesheet" href="css/icomoon.css">
        <!-- Flexslider  -->
        <link rel="stylesheet" href="css/flexslider.css">
        <link rel="stylesheet" href="sass/bootstrap.min.css">
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
                                <h1 id="fh5co-logo"><a href="homepage">BPLH</a></h1>
                                <nav id="fh5co-menu-wrap" role="navigation">
                                    <ul class="sf-menu" id="fh5co-primary-menu">
                                        <li><a class="active" href="homepage">Trang Chủ</a></li>
                                        <li>
                                            <a href="room" class="fh5co-sub-ddown">Phòng</a>
                                            <ul class="fh5co-sub-menu">
                                                <li><a href="#">Deluxe Family Triple</a></li>
                                                <li><a href="#">Executive Suite </a></li>
                                                <li><a href="#">Deluxe King</a></li>
                                                <li><a href="#">Royal Suite</a></li> 
                                                <li><a href="#">Presidential Suite</a></li>
                                                <li><a href="#">Deluxe Twin</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="service">Dịch Vụ</a></li>
                                        <li><a href="blog">Bài Viết</a></li>
                                        <li><a href="contact">Liên Hệ</a></li>
                                            <c:if test="${loggedInAccount == null}">
                                            <li><a href="login">Đăng Nhập</a></li>
                                            <li><a href="signup">Đăng Ký</a></li>
                                            </c:if>
                                            <c:if test="${loggedInAccount != null}">
                                            <li>
                                                <a class="fh5co-sub-ddown">${loggedInAccount.fullName}</a>
                                                <ul class="fh5co-sub-menu">
                                                    <li><a href="profile">Thông tin cá nhân</a></li>
                                                    <li><a href="bookinghistory">Lịch sử đặt phòng </a></li> 
                                                    <li><a href="viewbooking">Chi tiet dat phong </a></li>
                                                    <hr class="dropdown-divider">
                                                    <c:if test="${loggedInAccount.role.roleId == 1}">
                                                        <li><a href="customermanage">Quản lí khách hàng</a></li>
                                                        <li><a href="#">Báo cáo doanh thu</a></li>
                                                        <li><a href="discount">Quản lí Discount</a></li>
                                                        <li><a href="roommanager">Quản lí phòng</a></li>
                                                        <li><a href="servicemanager">Quản lí dịch vụ</a></li>
                                                        <li><a href="priceconfig">Chinh sua gia</a></li>
                                                        <li><a href="managebooking">Quan ly booking</a></li>
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
                <aside id="fh5co-hero" class="js-fullheight">
                    <div class="flexslider js-fullheight">
                        <ul class="slides">
                            <li style="background-image: url(images/anh1.jpg);">
                                <div class="overlay-gradient"></div>
                                <div class="container">
                                    <div class="col-md-12 col-md-offset-0 text-center slider-text">
                                        <div class="slider-text-inner js-fullheight">
                                            <div class="desc">
                                                <p><span>Deluxe Family Triple</span></p>
                                                <h2>Tận Hưởng Kỳ Nghỉ Cùng Gia Đình</h2>
                                                <p>
                                                    <a href="#" class="btn btn-primary btn-lg">Đặt Phòng</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li style="background-image: url(images/bg2.jpg);">
                                <div class="overlay-gradient"></div>
                                <div class="container">
                                    <div class="col-md-12 col-md-offset-0 text-center slider-text">
                                        <div class="slider-text-inner js-fullheight">
                                            <div class="desc">
                                                <p><span>Executive Suite</span></p>
                                                <h2>Biến Kì Nghỉ Của Bạn Trở Nên Tuyệt Vời</h2>
                                                <p>
                                                    <a href="#" class="btn btn-primary btn-lg">Đặt Phòng</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li style="background-image: url(images/bg3.jpg);">
                                <div class="overlay-gradient"></div>
                                <div class="container">
                                    <div class="col-md-12 col-md-offset-0 text-center slider-text">
                                        <div class="slider-text-inner js-fullheight">
                                            <div class="desc">
                                                <p><span>Deluxe King</span></p>
                                                <h2>Nơi Hoàn Hảo Để Chiêm Ngưỡng Cuộc Sống</h2>
                                                <p>
                                                    <a href="#" class="btn btn-primary btn-lg">Đặt Phòng</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li style="background-image: url(images/bg4.jpg);">
                                <div class="overlay-gradient"></div>
                                <div class="container">
                                    <div class="col-md-12 col-md-offset-0 text-center slider-text">
                                        <div class="slider-text-inner js-fullheight">
                                            <div class="desc">
                                                <p><span>Royal Suite</span></p>
                                                <h2>Trải Nghiệm Không Gian Hoàng Gia Sang Trọng</h2>
                                                <p>
                                                    <a href="#" class="btn btn-primary btn-lg">Đặt Phòng</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li style="background-image: url(images/bg5.jpg);">
                                <div class="overlay-gradient"></div>
                                <div class="container">
                                    <div class="col-md-12 col-md-offset-0 text-center slider-text">
                                        <div class="slider-text-inner js-fullheight">
                                            <div class="desc">
                                                <p><span>Presidential Suite</span></p>
                                                <h2>Tận Hưởng Những Dịch Vụ Đẳng Cấp Nhất</h2>
                                                <p>
                                                    <a href="#" class="btn btn-primary btn-lg">Đặt Phòng</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li style="background-image: url(images/bg6.jpg);">
                                <div class="overlay-gradient"></div>
                                <div class="container">
                                    <div class="col-md-12 col-md-offset-0 text-center slider-text">
                                        <div class="slider-text-inner js-fullheight">
                                            <div class="desc">
                                                <p><span>Deluxe Twin</span></p>
                                                <h2>Tạo Nên Những Trải Nghiệm Khác Biệt</h2>
                                                <p>
                                                    <a href="#" class="btn btn-primary btn-lg">Đặt Phòng</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </aside>
                <div class="wrap">
                    <div class="container">
                        <div class="row">
                            <div id="availability">
                                <form action="roomsearch" method="post" id="myForm" autocomplete="off">

                                    <div class="a-col">
                                        <section>
                                            <select class="cs-select cs-skin-border" name="roomtype" required>
                                                <option value="0" selected>Chọn Phòng</option>
                                                <option value="0" >All type</option>
                                                <option value="1" >Low-Cost Room</option>
                                                <option value="2" >Medium-Cost Room</option>
                                                <option value="3" >Luxury Room</option>
                                            </select>
                                        </section>
                                    </div>
                                    <div class="a-col alternate">
                                        <div class="input-field">
                                            <label for="date-start">Ngày Nhận </label>
                                            <input type="text" class="form-control" id="date-start" name="datestart" required />
                                        </div>
                                    </div>
                                    <div class="a-col alternate">
                                        <div class="input-field">
                                            <label for="date-end">Ngày Trả </label>
                                            <input type="text" class="form-control" id="date-end" name="dateend" required />
                                        </div>
                                    </div>
                                    <div class="a-col action">
                                        <a href="#" onclick="submitForm()">
                                            <span>Kiểm Tra</span>
                                            Còn Phòng
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="fh5co-counter-section" class="fh5co-counters">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3 text-center">
                                <span class="fh5co-counter js-counter" data-from="0" data-to="20356" data-speed="5000" data-refresh-interval="50"></span>
                                <span class="fh5co-counter-label">Người Dùng Truy Cập</span>
                            </div>
                            <div class="col-md-3 text-center">
                                <span class="fh5co-counter js-counter" data-from="0" data-to="15501" data-speed="5000" data-refresh-interval="50"></span>
                                <span class="fh5co-counter-label">Phòng</span>
                            </div>
                            <div class="col-md-3 text-center">
                                <span class="fh5co-counter js-counter" data-from="0" data-to="8200" data-speed="5000" data-refresh-interval="50"></span>
                                <span class="fh5co-counter-label">Giao Dịch</span>
                            </div>
                            <div class="col-md-3 text-center">
                                <span class="fh5co-counter js-counter" data-from="0" data-to="8763" data-speed="5000" data-refresh-interval="50"></span>
                                <span class="fh5co-counter-label">Đánh Giá Và Bình Chọn</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="featured-hotel" class="fh5co-bg-color">
                    <div class="container">

                        <div class="row">
                            <div class="col-md-12">
                                <div class="section-title text-center">
                                    <h2>Các Phòng Tiêu Biểu</h2>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="feature-full-1col">
                                <div class="image" style="background-image: url(images/bg5.jpg);">
                                    <div class="descrip text-center">
                                        <p><small>Giá Hiện Tại</small><span>$500/đêm</span></p>
                                    </div>
                                </div>
                                <div class="desc">
                                    <h3>Luxury</h3>
                                    <p>Mang đến cho bạn những trải nghiệm tuyệt vời nhất, đắm chìm trong bầu không khí của sự sang trọng cùng những dịch vụ hàng đầu được thiết kế riêng cho từng cá nhân. </p>
                                    <p><a href="book3" class="btn btn-primary btn-luxe-primary">Đặt Phòng <i class="ti-angle-right"></i></a></p>
                                </div>
                            </div>

                            <div class="feature-full-2col">
                                <div class="f-hotel">
                                    <div class="image" style="background-image: url(images/bg4.jpg);">
                                        <div class="descrip text-center">
                                            <p><small>Giá hiện tại</small><span>$450/đêm</span></p>
                                        </div>
                                    </div>
                                    <div class="desc">
                                        <h3>Normal</h3>
                                        <p>Trải nghiệm những tinh hóa của giới quý tộc, thả mình trong sự lộng lẫy của lối kiến trúc đầy tinh tế từ khắp nơi trên thế giới.</p>
                                        <p><a href="book2" class="btn btn-primary btn-luxe-primary">Đặt Phòng <i class="ti-angle-right"></i></a></p>
                                    </div>
                                </div>
                                <div class="f-hotel">
                                    <div class="image" style="background-image: url(images/anh1.jpg);">
                                        <div class="descrip text-center">
                                            <p><small>Giá hiện tại</small><span>$250/đêm</span></p>
                                        </div>
                                    </div>
                                    <div class="desc">
                                        <h3>Cheap</h3>
                                        <p>Tận hưởng khoảng thời gian tuyệt vời cùng gia đình của bạn, mang đến những phút giây thư giản, thoải mải bên những người bạn yêu thương.</p>
                                        <p><a href="book1" class="btn btn-primary btn-luxe-primary">Đặt Phòng <i class="ti-angle-right"></i></a></p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div id="hotel-facilities">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="section-title text-center">
                                    <h2>Dịch Vụ Khách Sạn</h2>
                                </div>
                            </div>
                        </div>

                        <div id="tabs">
                            <nav class="tabs-nav">
                                <a href="#" class="active" data-tab="tab1">
                                    <i class="flaticon-restaurant icon"></i>
                                    <span>Nhà Hàng</span>
                                </a>
                                <a href="#" data-tab="tab2">
                                    <i class="flaticon-cup icon"></i>
                                    <span>Bar</span>
                                </a>
                                <a href="#" data-tab="tab3">

                                    <i class="flaticon-car icon"></i>
                                    <span>Đưa Đón</span>
                                </a>
                                <a href="#" data-tab="tab4">

                                    <i class="flaticon-swimming icon"></i>
                                    <span>Hồ Bơi</span>
                                </a>
                                <a href="#" data-tab="tab5">

                                    <i class="flaticon-massage icon"></i>
                                    <span>Spa</span>
                                </a>
                                <a href="#" data-tab="tab6">

                                    <i class="flaticon-bicycle icon"></i>
                                    <span>Gym</span>
                                </a>
                            </nav>
                            <div class="tab-content-container">
                                <div class="tab-content active show" data-tab-content="tab1">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <img src="images/nh.jpg" class="img-responsive" alt="Image">
                                            </div>
                                            <div class="col-md-6">
                                                <span class="super-heading-sm">Đẳng Cấp Thế Giới</span>
                                                <h3 class="heading">Nhà Hàng</h3>
                                                <p>Thực đơn đa dạng đến từ khắp mọi nơi trên hành tinh xanh, thực hiện bởi những đầu bếp hàng đầu với tay nghề xuất sắc, thức ăn không chỉ làm bạn no bụng mà còn là sự trải nghiệm những tinh túy của nền ẩm thực thế giới.</p>
                                                <p>Tự hào là một trong những khách sạn hàng đầu thế giới về các trải nghiệm tinh tế, sang trọng, lắp đầy những chiếc bụng đói và làm hài lòng vị giác của bạn là niềm tự hào của chúng tôi.</p>
                                                <p class="service-hour">
                                                    <span>Giờ phục vụ:</span>
                                                    <strong>7:30 AM - 8:00 PM</strong>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-content" data-tab-content="tab2">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <img src="images/bar.jpg" class="img-responsive" alt="Image">
                                            </div>
                                            <div class="col-md-6">
                                                <span class="super-heading-sm">Đẳng Cấp Thế Giới</span>
                                                <h3 class="heading">Bar</h3>
                                                <p>Quầy bar không chỉ là nơi để thưởng thức đồ uống mà còn là nơi để thả mình trong một bầu không khí đầy sự sang trọng, đẳng cấp. Nhân viên phục vụ chuyên nghiệp, thân thiện và nắm vững nghệ thuật pha chế, mang đến cho bạn trải nghiệm đắm chìm trong thế giới đồ uống độc đáo và sáng tạo.
                                                </p>
                                                <p>Thực đơn đa dạng với những ly cocktail và rượu vang chất lượng cao, cùng với đó là không gian âm nhạc nhẹ nhàng giúp bạn có những phút giây thư giản tuyệt vời bên cạnh người thân và bạn bè.</p>
                                                <p class="service-hour">
                                                    <span>Giờ phục vụ:</span>
                                                    <strong>7:30 AM - 8:00 PM</strong>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-content" data-tab-content="tab3">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <img src="images/duadon.jpg" class="img-responsive" alt="Image">
                                            </div>
                                            <div class="col-md-6">
                                                <span class="super-heading-sm">Đẳng Cấp Thế Giới</span>
                                                <h3 class="heading">Đưa đón</h3>
                                                <p>Được thiết kế để đáp ứng tiêu chuẩn sang trọng và thuận tiện, cung cấp dịch vụ đưa đón tận nơi cùng với các phương tiện cao cấp và đội lái xe chuyên nghiệp đảm bảo bạn được phục vụ tốt nhất trên mọi cung đường.</p>
                                                <p class="service-hour">
                                                    <span>Giờ phục vụ:</span>
                                                    <strong>5:00 AM - 12:00 PM</strong>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-content" data-tab-content="tab4">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <img src="images/hoboi.jpg" class="img-responsive" alt="Image">
                                            </div>
                                            <div class="col-md-6">
                                                <span class="super-heading-sm">Đẳng Cấp Thế Giới</span>
                                                <h3 class="heading">Hồ Bơi</h3>
                                                <p>Hồ bơi gồm nhiều khu như khu trẻ em, khu dưới 1,5m và khu từ 1,5m đến 2m, luôn được vệ sinh sạch sẽ sau mỗi ngày, đảm bảo những tiêu chuẩn cần thiệt về chất lượng nước.</p>
                                                <p>Luôn có đội ngũ bảo vệ, nhân viên y tế túc trực, sẵn sàng ứng cứu khi có nguy hiểm xảy ra, đảm bảo bạn lun được vui chơi trong sự an toàn.</p>
                                                <p class="service-hour">
                                                    <span>Giờ phục vụ:</span>
                                                    <strong>7:30 AM - 8:00 PM</strong>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-content" data-tab-content="tab5">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <img src="images/spa.jpg" class="img-responsive" alt="Image">
                                            </div>
                                            <div class="col-md-6">
                                                <span class="super-heading-sm">Đẳng Cấp Thế Giới</span>
                                                <h3 class="heading">Spa</h3>
                                                <p>Mang đến cho bạn những trải nghiệm sang trọng và đẳng cấp với không gian riêng biệt, trang thiết bị hiện đại cùng đội ngũ nhân viên tay nghề cao luôn sẵn sàng hỗ trợ.</p>
                                                <p>Dịch vụ cá nhân hóa và tư vấn chăm sóc da, cùng với lịch trình linh hoạt và thực đơn ăn uống lành mạnh tạo ra một trải nghiệm spa độc đáo.</p>
                                                <p class="service-hour">
                                                    <span>Giờ phục vụ:</span>
                                                    <strong>7:30 AM - 8:00 PM</strong>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-content" data-tab-content="tab6">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <img src="images/gym.jpg" class="img-responsive" alt="Image">
                                            </div>
                                            <div class="col-md-6">
                                                <span class="super-heading-sm">Đẳng Cấp Thế Giới</span>
                                                <h3 class="heading">Gym</h3>
                                                <p>Trang thiết bị hiện đại cùng không gian rộng rãi, thoáng mát, huấn luyện viên chuyên nghiệp đảm bảo phục vụ đa dạng mục tiêu tập luyện của bạn.</p>
                                                <p>Kết hợp với các tiện ích như hồ bơi, spa, các khu thể thao khác, chúng tôi mong muốn đem lại cho bạn sự trải nghiệm toàn diện nhất, việc đảm bảo chất lượng về vệ sinh cũng như các tiêu chí thiết yếu luôn được chúng tôi đặt lên hàng đầu.</p>
                                                <p class="service-hour">
                                                    <span>Giờ phục vụ:</span>
                                                    <strong>7:30 AM - 8:00 PM</strong>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="testimonial">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="section-title text-center">
                                    <h2>Trải Nghiệm Của Khách Hàng</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="testimony">
                                    <blockquote>
                                        &ldquo;Khách sạn tuyệt vời cùng những trải nghiệm đầy sự sang trọng, lộng lẫy và luôn cố gắng làm hài lòng khách hàng. Sẽ ghé thăm lần nữa khi có cơ hội&rdquo;
                                    </blockquote>
                                    <p class="author"><cite>Như Quỳnh</cite></p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="testimony">
                                    <blockquote>
                                        &ldquo;Gia đình chúng tôi đã có một kỳ nghỉ tuyệt vời tại đây, đôi ngũ nhân viên thân thiện và luôn giúp đỡ khách hàng. Mọi người nên trải nghiệm thử&rdquo;
                                    </blockquote>
                                    <p class="author"><cite>Tố Trinh</cite></p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="testimony">
                                    <blockquote>
                                        &ldquo;Chúng tôi đã từng ở nhiều khách sạn sang trong nhưng đây là một trong những nơi hoàn hảo nhất. Mọi thứ đều tuyệt vời từ nhân viên cho đến dịch vụ&rdquo;
                                    </blockquote>
                                    <p class="author"><cite>Xuân Định</cite></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div id="fh5co-blog-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="section-title text-center">
                                    <h2>Bài Viết Của Chúng Tôi</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="blog-grid" style="background-image: url(images/bl1.jpg);">
                                    <div class="date text-center">
                                        <span>01</span>
                                        <small>T2</small>
                                    </div>
                                </div>
                                <div class="desc">
                                    <h3><a href="#">Trải Ngiệm Tuyệt Vời</a></h3>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="blog-grid" style="background-image: url(images/bl2.jpg);">
                                    <div class="date text-center">
                                        <span>09</span>
                                        <small>T8</small>
                                    </div>
                                </div>
                                <div class="desc">
                                    <h3><a href="#">Nơi Đáng Để Thử Một Lần</a></h3>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="blog-grid" style="background-image: url(images/bl3.jpg);">
                                    <div class="date text-center">
                                        <span>05</span>
                                        <small>T9</small>
                                    </div>
                                </div>
                                <div class="desc">
                                    <h3><a href="#">Khám Phá Những Điều Thú Vị</a></h3>
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
                                            Designed by MT <br> 
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
                    <!-- jQuery -->


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

                    <script src="js/custom.js"></script>
                    <script>
                                            function submitForm() {
                                                var startDateString = document.getElementById("date-start").value;
                                                var startDate = new Date(startDateString);
                                                var endDateString = document.getElementById("date-end").value;
                                                var endDate = new Date(endDateString);
                                                var today = new Date();
                                                // Chuyển đổi chuỗi ngày thành đối tượng Date
                                                today.setHours(0, 0, 0, 0);

                                                //Kiểm tra tính hợp lệ của các ngày
                                                if (isNaN(startDate.getTime()) || isNaN(endDate.getTime())) {
                                                    alert("Ngày không hợp lệ.");
                                                    return false;
                                                }
                                                // Kiểm tra ngày nhận phòng phải lớn hơn hoặc bằng hôm nay
                                                if (startDate < today) {
                                                    alert("Ngày nhận phòng tối thiểu phải là ngày hôm nay.");
                                                    return false;
                                                }

                                                // Kiểm tra ngày trả phòng phải lớn hơn ngày nhận phòng ít nhất một ngày
                                                if (endDate <= startDate) {
                                                    alert("Ngày trả phòng tối thiểu phải sau ngày nhận phòng ít nhất một ngày.");
                                                    return false;
                                                }

                                                // Submit form nếu mọi điều kiện đều đúng
                                                document.getElementById("myForm").submit();
                                            }
                    </script>
                    <!--Start of Tawk.to Script-->
                    <script type="text/javascript">
                        var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
                        (function () {
                            var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
                            s1.async = true;
                            s1.src = 'https://embed.tawk.to/66029bc4a0c6737bd124dda3/1hpt30uln';
                            s1.charset = 'UTF-8';
                            s1.setAttribute('crossorigin', '*');
                            s0.parentNode.insertBefore(s1, s0);
                        })();
                    </script>
                    <!--End of Tawk.to Script-->
                    </body>
                    </html>
