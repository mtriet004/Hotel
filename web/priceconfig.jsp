<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chỉnh sửa giá phòng</title>
    <link rel="stylesheet" href="css/custom2.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body style='background-color: #708090'>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Chỉnh sửa giá phòng</h1>        
        <form method="post" action="priceconfig">
            <!-- Phòng Loại A -->
            <div class="form-group row">
                <label for="price_room_A" class="col-sm-3 col-form-label"><strong>Giá phòng Loại A:</strong></label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="price_room_A" name="roomA_price" value="${typeA.price}">
                </div>
            </div>
            <div class="form-group row">
                <label for="people_room_A" class="col-sm-3 col-form-label"><strong>Số người phòng Loại A:</strong></label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="people_room_A" name="roomA_people" value="${typeA.numPeople}">
                    <input type="hidden" name="roomAId" value="${typeA.typeId}">
                </div>
            </div>

            <!-- Phòng Loại B -->
            <div class="form-group row">
                <label for="price_room_B" class="col-sm-3 col-form-label"><strong>Giá phòng Loại B:</strong></label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="price_room_B" name="roomB_price" value="${typeB.price}">
                </div>
            </div>
            <div class="form-group row">
                <label for="people_room_B" class="col-sm-3 col-form-label"><strong>Số người phòng Loại B:</strong></label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="people_room_B" name="roomB_people" value="${typeB.numPeople}">
                    <input type="hidden" name="roomBId" value="${typeB.typeId}">
                </div>
            </div>

            <!-- Phòng Loại C -->
            <div class="form-group row">
                <label for="price_room_C" class="col-sm-3 col-form-label"><strong>Giá phòng Loại C:</strong></label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="price_room_C" name="roomC_price" value="${typeC.price}">
                </div>
            </div>
            <div class="form-group row">
                <label for="people_room_C" class="col-sm-3 col-form-label"><strong>Số người phòng Loại C:</strong></label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="people_room_C" name="roomC_people" value="${typeC.numPeople}">
                    <input type="hidden" name="roomCId" value="${typeC.typeId}">
                </div>
            </div>

            <!-- Extra Prices -->
            <div class="form-group row">
                <label for="foreignPercent" class="col-sm-3 col-form-label"><strong>Hệ số cho khách nước ngoài:</strong></label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="foreignPercent" name="foreignPercent" value="${extraPrice.foreignPercent}">
                </div>
            </div>
            <div class="form-group row">
                <label for="threePeoplePercent" class="col-sm-3 col-form-label"><strong>Phần trăm giá thêm cho 3 người trở lên:</strong></label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="threePeoplePercent" name="threePeoplePercent" value="${extraPrice.threePeoplePercent}">
                    <input type="hidden" name="extraPriceId" value="${extraPrice.extraPriceId}">
                </div>
            </div>           
            <div class="form-group row">
                <div class="col-sm-9 offset-sm-3">
                    <button type="submit" class="btn btn-primary">Lưu</button>
                    <a href="admin" class="btn btn-secondary">Quay lại</a>
                </div>
            </div>
        </form>
    </div>
</body>
