<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Discount</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,600" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="css/style5.css" />

    <!-- jQuery and jQuery UI CSS -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <div id="booking" class="section">
        <a href="admin" class="btn btn-light btn-sm"><h4 class="mb-0">Quay lại</h4></a> 
        <div class="section-center">
            <div class="container">
                <div class="row">
                    <div class="booking-form">
                        <form action="discount" method="post">
                            <div class="centered-text">
                                <h1>Tạo mã giảm giá</h1>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <input class="form-control" type="text" placeholder="abcd" id="code" name="code">
                                    <span class="form-label">Mã</span>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input class="form-control" type="text" placeholder="0" id="percent" name="percent">
                                    <span class="form-label">Phần trăm giảm giá</span>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input class="form-control" id="start_date" name="start_date">
                                    <span class="form-label">Ngày bắt đầu</span>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input class="form-control" id="expire_date" name="expire_date">
                                    <span class="form-label">Ngày kết thúc</span>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-btn">
                                    <button class="submit-btn">Tạo</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script>
        $(function () {
            $("#start_date").datepicker({
                dateFormat: "yy-mm-dd"
            });
            $("#expire_date").datepicker({
                dateFormat: "yy-mm-dd"
            });
        });
    </script>
</body>
