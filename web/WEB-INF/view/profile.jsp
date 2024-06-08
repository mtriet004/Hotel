<%@page import="DTO.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thông Tin Cá Nhân</title>
        <style>
            .back-button {
                position: absolute;
                top: 10px; /* Điều chỉnh khoảng cách từ trên xuống */
                right: 10px; /* Điều chỉnh khoảng cách từ phải sang */
                padding: 10px 20px;
                background-color: #333;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
            }


            body {
                font-family: 'Arial', sans-serif;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)), url('https://source.unsplash.com/random/1920x1080') no-repeat center center fixed;
                background-size: cover;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                animation: changeBackground 15s linear infinite;
            }

            @keyframes changeBackground {

                0%,
                100% {
                    background-image: url('https://source.unsplash.com/random/1920x1080');
                }

                50% {
                    background-image: url('https://source.unsplash.com/random/1920x1080');
                }
            }

            .overlay {
                background-color: rgba(255, 255, 255, 0.9);
                padding: 50px;
                border-radius: 20px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
                max-width: 800px;
                text-align: center;
            }

            h1,
            h2 {
                color: #333;
                margin-bottom: 20px;
            }

            p {
                color: #555;
                margin-bottom: 10px;
            }

            .user-info,
            .service-info {
                text-align: left;
                margin-bottom: 30px;
            }

            .footer {
                margin-top: 20px;
                color: #777;
                font-size: 14px;
            }
        </style>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    </head>

    <body>
        <div class="overlay">
            <%-- Retrieving the account object from the session --%>
            <% Account accounts = (Account) session.getAttribute("loggedInAccount");%>
            <a href="index.jsp" class="back-button"><h4>Quay lại</h4></a>  
            <h1>Thông Tin Cá Nhân</h1>
            <div class="user-info">
                <p><strong>Họ và tên:</strong>
                    ${loggedInAccount.getFullName()}
                </p>
                <p><strong>Giới tính:</strong>
                    <c:choose>
                        <c:when test="${loggedInAccount.getSex().trim() == 'Nam'}">Nam</c:when>
                        <c:when test="${loggedInAccount.getSex().trim() == 'Nữ'}">Nữ</c:when>
                        <c:otherwise>Khác</c:otherwise>
                    </c:choose>

                </p>
                <p><strong>Vai trò:</strong>
                    ${loggedInAccount.getRole().getRoleName()}
                </p>
                <p><strong>Quốc tịch:</strong>
                    ${loggedInAccount.getType()}
                </p>
                <p><strong>Mã số CCCD:</strong>
                    ${loggedInAccount.getIdentityCard()}
                </p>
                <p><strong>Số điện thoại:</strong>
                    ${loggedInAccount.getPhone()}
                </p>
                <p><strong>Email:</strong>
                    ${loggedInAccount.getEmail()}
                </p>
                <p><strong>Địa chỉ:</strong>
                    ${loggedInAccount.getAddress()}
                </p>
            </div>
            <div class="footer">
                Designed by DiamondS &copy;
            </div>
        </div>
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