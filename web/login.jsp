<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
        <link rel="shortcut icon" href="favicon.ico">
        <!-- <link href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700italic,900,700,900italic' rel='stylesheet' type='text/css'> -->
        <link rel="stylesheet" href="css/icomoon.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="css/login.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng Nhập/Log In</title>
    </head> 
    <body class="d-flex align-items-center py-4 bg-body-tertiary">
        <main class="form-signin w-100 m-auto">
            <form action="login" method="post" autocomplete="off">
                <div class="icon-above-text">
                    <a href="homepage">
                        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" />
                    </a>
                    <h1 class="h3 mb-3 fw-normal" style="color: black">Đăng Nhập / Log In</h1>
                </div>
                <div class="form-floating centered-text-and-icon">
                    <input type="tel" class="form-control" id="floatingInput" placeholder="PhoneNumber" name="phone" autocomplete="off">
                    <label for="floatingInput" class="icon-phone">Số điện thoại/Phone number</label>
                </div>
                <div class="form-floating centered-text-and-icon">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password" autocomplete="off">
                    <label for="floatingPassword" class="icon-key">Mật khẩu/Password</label>
                </div>
                    
                <c:if test="${errorloginmsg != null}"><p style="color: red; font-weight: bold; font-size: 110%; text-align: center; background-color: yellow">${errorloginmsg}</p></c:if>
                    
                <div class="form-check text-start my-3">
                    <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
                    <label class="form-check-label" for="flexCheckDefault" style="color:black">
                        Ghi nhớ tài khoản
                    </label>
                </div>
                <button class="btn btn-primary rounded-pill px-3" type="submit">Đăng nhập</button>
                <div class="form-check text-start my-3">
                    <a href="signup" style="color: black;
                       text-decoration: underline;
                       font-size: 16px;">Chưa có tài khoản?</a>
                </div>
            </form>

        </main>
    </body>
</html>