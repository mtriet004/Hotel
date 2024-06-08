<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thông tin phòng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous" />
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css'>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js'></script>
    <link rel="stylesheet" href="css/style9.css"/>
</head>

<body style="background-image:url('images/ri.jpg');">
    <form action="infoinput" method="post" >
        <div class="container">
            <div class="row">
                <div class="col-12 mb-3 mb-lg-5">
                    <div class="overflow-hidden card table-nowrap table-card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h4 class="mb-0">Thông tin phòng</h4>
                            <a onclick="goBack()" class="btn btn-light btn-sm"><h4 class="mb-0">Quay lại</h4></a>
                        </div>
                        <div class="table-responsive">
                            <table class="table mb-0">
                                <thead class="small text-uppercase bg-body text-muted">
                                    <tr>
                                        <th style="color:black; font-weight: bold;">Số phòng</th>
                                        <th style="color:black; font-weight: bold;">Loại phòng</th>
                                        <th style="color:black; font-weight: bold;">Dịch vụ</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td style="color:black; font-weight: bold;">${selectedRoom.roomNumber}</td>
                                        <td style="color:black; font-weight: bold;">${selectedRoom.type.typeName}</td>
                                        <td style="color:black; font-weight: bold;">
                                            <ul>
                                                <c:forEach var="service" items="${selectedRoom.type.list_service}">
                                                    <li>${service.serviceName}</li>
                                                    </c:forEach>
                                            </ul>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <input type="submit" class="btn btn-outline-success float-right" value="Điền thông tin">
                            <input type="hidden" name="selectedRoomId" value="${selectedRoom.roomId}" >
                            <input type="hidden" name="dateStartStr" value="${dateStartStr}" >
                            <input type="hidden" name="dateEndStr" value="${dateEndStr}"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>                
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>
