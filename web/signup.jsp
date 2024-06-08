<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="favicon.ico">
        <!-- <link href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700italic,900,700,900italic' rel='stylesheet' type='text/css'> -->
        <link rel="stylesheet" href="css/icomoon.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="css/login.css"/>
        <link rel="stylesheet" href="css/style1.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- MATERIAL DESIGN ICONIC FONT -->
        <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng Ký</title>
        <style>
            body {
                background-image: url('images/bg-registration-form-2.jpg'); /* Đường dẫn đến hình ảnh nền */
                background-size: cover; /* Phù hợp kích thước ảnh với cửa sổ trình duyệt */
                background-position: center; /* Canh giữa hình ảnh */
                background-repeat: no-repeat; /* Không lặp lại hình ảnh */
            }
        </style>
    </head> 
    <body  class="d-flex align-items-center justify-content-center py-4 bg-body-tertiary">
        <h1 style="position: absolute; top: 0; right: 20px;" id="fh5co-logo"><a href="homepage">Trang chủ</a></h1>
        <main class="form-signin w-100 m-auto">
            <%
                // Check if the errorMessage attribute is not null and display it
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
            <div style="color: red;"><%= errorMessage%></div>
            <% }%>
            <form action="signup" method="post" onsubmit="return validatePassword()">
                <div class="icon-above-text">

                    <h1 class="h3 mb-3 fw-normal" style="color: black">Đăng Ký Tài Khoản</h1>
                </div>
                <div class="form-floating centered-text-and-icon">
                    <div class="form-group">
                        <input type="text" placeholder="Họ" class="form-control" name="fname" pattern="^([A-ZÀÁẢÃẠĂẰẮẲẴẶÂẦẤẨẪẬĐÈÉẺẼẸÊỀẾỂỄỆÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴ][a-zàáảãạăằắẳẵặâầấẩẫậèéẻẽẹêềếểễệìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ]+\s?)+$"
                               required>
                        <input type="text" placeholder="Tên" class="form-control" name="lname" pattern="^([A-ZÀÁẢÃẠĂẰẮẲẴẶÂẦẤẨẪẬĐÈÉẺẼẸÊỀẾỂỄỆÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴ][a-zàáảãạăằắẳẵặâầấẩẫậèéẻẽẹêềếểễệìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ]+\s?)+$"
                               required>
                    </div>
                </div>
                <div class="form-wrapper">
                    <input type="text" placeholder="Mã số CCCD" class="form-control" name="identitynum" pattern="[0-9]{12}" required>
                    <i class="zmdi zmdi-card"></i>
                </div>
                <div class="form-wrapper">
                    <input type="tel" placeholder="Số điện thoại" class="form-control" name="phone" pattern="[0-9]{10}" required>
                    <i class="zmdi zmdi-phone"></i>
                </div>
                <div class="form-wrapper">
                    <input type="email" placeholder="Email" class="form-control" name="email" required>
                    <i class="zmdi zmdi-email"></i>
                </div>
                <div class="form-wrapper">
                    <input type="text" placeholder="Địa chỉ" class="form-control" name="address" required>
                    <i class="zmdi zmdi-email"></i>
                </div>
                <div class="form-wrapper">
                    <select name="sex" id="" class="form-control" required>
                        <option value="" disabled selected>Giới tính</option>
                        <option value="male">Nam</option>
                        <option value="female">Nữ</option>
                        <option value="other">Khác</option>
                    </select>
                    <i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
                </div>
                <div class="form-wrapper">
                    <select name="type" id="" class="form-control" required>
                        <option value="" disabled selected>Quốc tịch</option>
                        <option value="vn">Việt Nam</option>
                        <option value="fr">Nước Ngoài</option>
                    </select>
                    <i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
                </div>
                <div class="form-wrapper">
                    <input type="password" placeholder="Mật khẩu" class="form-control" name="password" id="password" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$"required>
                    <i class="zmdi zmdi-lock"></i>
                </div>
                <div class="form-wrapper">
                    <input type="password" placeholder="Xác nhận mật khẩu" class="form-control"  id="confirmPassword" name="confirmPassword" required>
                    <i class="zmdi zmdi-lock"></i>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" required> Tôi đồng ý
                        <a href="url_to_your_terms_and_privacy_policy_page" target="_blank">Điều khoản sử dụng & Chính sách quyền riêng tư</a>
                        <span class="checkmark"></span>
                    </label>
                </div>
                <button class="btn btn-primary rounded-pill px-3" type="submit" onsubmit="validatePassword()">Đăng ký</button>
            </form>
        </main>
        <script>
            function validatePassword() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("confirmPassword").value;

                if (password !== confirmPassword) {
                    alert("Xác nhận mật khẩu không khớp với mật khẩu đã nhập. Vui lòng nhập lại.");
                    return false;
                }
                return true;
            }
        </script>

    </body>

</html>