<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Change Room</title>
    </head>
    <body>
        <h1>Change Room</h1>

        <h2>Available Rooms</h2>
        <table border="1">
            <tr>
                <th>Room ID</th>
                <th>Room Type</th>
                <th>Status</th>
                <th>Select</th>
            </tr>
            <c:forEach var="room" items="${roomquery}">
                <tr>
                    <td>${room.roomId}</td>
                    <td>${room.type.typeName}</td>
                    <td>
                        <c:if test="${room.status == 'available'}">
                            <button class="btn badge bg-success" disabled>Hoạt động</button>
                        </c:if>
                        <c:if test="${room.status == 'unavailable'}">
                            <button class="btn badge bg-danger" disabled>Tạm ngưng</button>
                        </c:if>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${room.status == 'available'}">
                                <form action="changeroom" method="POST">
                                    <input type="hidden" name="bookId" value="${bookId}"/>
                                    <input type="hidden" name="newRoomId" value="${room.roomId}"/>
                                    <input type="hidden" name="dateStartStr" value="${dateStartStr}"/>
                                    <input type="hidden" name="dateEndStr" value="${dateEndStr}"/>
                                    <input type="submit" value="Change to this Room"/>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <!-- Room is unavailable, disable the button -->
                                <button disabled>Change to this Room</button>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
