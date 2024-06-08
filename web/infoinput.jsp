<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Nhập thông tin</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,900" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="css/style2.css" />
    <style>
        .popup-container {
            display: none;
            position: fixed;
            top: 50%;
            left: 30%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 15px;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 550px;
            height: 375px;
        }
    </style>
</head> 
<body>
    <a class="btn btn-light btn-sm"><h4 class="mb-0" onclick="goBack()">Quay lại</h4></a>
    <form action="roommate" method="post">
        <div class="container-login100" style="background-image: url('images/background.jpg');">
            <div id="booking" class="section">
                <div class="section-center">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-5">
                                <div class="booking-cta">
                                    <h1>Blue Pearl Luxury Hotel</h1>
                                    <p>Chào mừng bạn đã đến với khách sạn của chúng tôi. Chúng tôi ở đây để đem lại một kỳ nghỉ tuyệt vời cho bạn.</p>
                                </div>
                            </div>
                            <div class="col-md-6 col-md-offset-1">
                                <div class="booking-form">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input class="form-control" type="text" name="hostName" value="${loggedInAccount.fullName}" required>
                                                <span class="form-label">Họ và tên</span>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input class="form-control" type="text" value="${loggedInAccount.identityCard}" name="hostIdentity" required>
                                                <span class="form-label">Mã số CCCD</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input class="form-control" type="tel" value="${loggedInAccount.phone}" name="hostPhone" required>
                                                <span class="form-label">Số điện thoại</span>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <div class="form-group">
                                                <span class="form-label">Giới tính</span>
                                                <select class="form-control" name="hostSex" id="" required>
                                                    <option <c:if test="${loggedInAccount.sex=='male'}"></c:if>Nam</option>
                                                    <option <c:if test="${loggedInAccount.sex=='female'}"></c:if>Nữ</option>
                                                    <option <c:if test="${loggedInAccount.sex=='other'}"></c:if>Khác</option>
                                                </select>
                                                <span class="select-arrow"></span>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-6">
                                            <div class="form-group">
                                                <span class="form-label">Quốc tịch</span>
                                                <select id="" class="form-control" name="hostType" required>
                                                    <option <c:if test="${loggedInAccount.type=='vn'}"></c:if>Việt Nam</option>
                                                    <option <c:if test="${loggedInAccount.type=='fr'}"></c:if>Nước Ngoài</option>
                                                </select>
                                                <span class="select-arrow"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group">
                                            <input class="form-control" type="email" value="${loggedInAccount.email}" name="hostEmail" required>
                                            <span class="form-label">Địa chỉ email</span>
                                        </div>
                                    </div>
                                    <input type="hidden" name="selectedRoomId" value="${selectedRoomId}" >
                                    <input type="hidden" name="dateStartStr" value="${dateStartStr}" >
                                    <input type="hidden" name="dateEndStr" value="${dateEndStr}" >
                                    <div class="form-btn"> 
                                        <button class="submit-btn" type="submit">Điền thông tin người đi cùng</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script src="js/jquery.min.js"></script>
<script>
    $('.form-control').each(function () {
        floatedLabel($(this));
    });

    $('.form-control').on('input', function () {
        floatedLabel($(this));
    });

    function floatedLabel(input) {
        var $field = input.closest('.form-group');
        if (input.val()) {
            $field.addClass('input-not-empty');
        } else {
            $field.removeClass('input-not-empty');
        }
    }
    function goBack() {
            window.history.back();
        }
</script>
</body>

