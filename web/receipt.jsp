<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Xác nhận</title>
</head>
<body  style="background-image: url('images/pc6.jpg')">
    <form action="confirmbooking" method="post">
        <div class='container mt-5'>
            <div class="row">
                <div class="col-12 col-md-6 mb-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title">Thông tin cá nhân</h5>
                            <div class="row">
                                <div class="col-6"><strong>Họ và tên:</strong> ${loggedInAccount.getFullName()}</div>
                                <div class="col-6"><strong>Giới tính:</strong> ${loggedInAccount.getSex()}</div>
                            </div>
                            <div class="row">
                                <div class="col-6"><strong>Vai trò:</strong> ${loggedInAccount.getRole().getRoleName()}</div>
                                <div class="col-6"><strong>Quốc tịch:</strong> ${loggedInAccount.getType()}</div>
                            </div>
                            <div class="row">
                                <div class="col-6"><strong>Mã số CCCD:</strong> ${loggedInAccount.getIdentityCard()}</div>
                                <div class="col-6"><strong>Số điện thoại:</strong> ${loggedInAccount.getPhone()}</div>
                            </div>
                            <div class="row">
                                <div class="col-6"><strong>Email:</strong> ${loggedInAccount.getEmail()}</div>
                                <div class="col-6"><strong>Địa chỉ:</strong> ${loggedInAccount.getAddress()}</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 mb-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title">Thông tin phòng</h5>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Số phòng</th>
                                        <th>Loại phòng</th>
                                        <th>Dịch vụ</th>
                                        <th>Ngày nhận</th>
                                        <th>Ngày trả</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>${selectedRoom.roomNumber}</td>
                                        <td>${selectedRoom.type.typeName}</td>
                                        <td>
                                            <ul>
                                                <c:forEach var="service" items="${selectedRoom.type.list_service}">
                                                    <li>${service.serviceName}</li>
                                                    </c:forEach>
                                            </ul>
                                        </td>
                                        <td>${dateStartStr}</td>
                                        <td>${dateEndStr}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 mb-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title">Danh sách bạn cùng phòng</h5>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Họ và Tên</th>
                                        <th>CCCD</th>
                                        <th>Giới tính</th>
                                        <th>Quốc tịch</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var='roommate' items="${listroommate}">
                                        <tr>
                                            <td>${roommate.name}</td>
                                            <td>${roommate.identityNumber}</td>
                                            <td>${roommate.sex}</td>
                                            <td>${roommate.type}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" name="datestart" value="${dateStartStr}">
            <input type="hidden" name="dateend" value="${dateEndStr}">
            <input type="hidden" name="selectedRoomId" value="${selectedRoomId}">
            <input type="hidden" name="roomprice" value="${roomprice}">
            <input type="hidden" name="listroomate" value="${listroomate}">
            <div class="text-center mt-3">
                <button type="submit" class="btn btn-secondary btn-lg">Đặt phòng</button>
            </div>
            <div class="text-left mt-3">
                <a href="homepage" class="btn btn-secondary btn-lg">Quay lại</a>
            </div>
        </div>
    </form>
</body>
