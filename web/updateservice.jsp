<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="fonts/icomoon1/style.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min_1.css">

    <!-- Style -->
    <link rel="stylesheet" href="css/style7.css">

    <title>Cập Nhật Dịch Vụ</title>
</head>
<body>
    <div class="d-lg-flex half">
        <div class="bg order-1 order-md-2" style="background-image: url('images/bg1.jpg');"></div>
        <div class="contents order-2 order-md-1">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="col-md-7">
                        <h3>Cập nhật <strong>Dịch Vụ</strong></h3>
                        <p class="mb-4">Xin mời nhập vào tên dịch vụ và ID dịch vụ</p>
                        <form action="updateservice" method="post" onsubmit="return confirm('Bạn có chắc muốn cập nhật dịch vụ này không?')">
                            <input type="hidden" name="selectedServiceId" value="${serviceId}">
                            <div class="form-group first">
                                <label for="serviceName">Tên dịch vụ</label>
                                <input type="text" class="form-control" placeholder="Tên dịch vụ bạn muốn cập nhật" name="serviceName" id="serviceName"  required>
                            </div>
                            <input type="submit" value="Cập nhật dịch vụ" class="btn btn-block btn-primary">

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="js/jquery-3.3.1.min1.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min1.js"></script>
    <script src="js/main2.js"></script>
</body>
