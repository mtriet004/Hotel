package DAO;

import DTO.Rooms;
import DTO.Type;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RoomsDAO extends DBContext {

    public void addRoom(Rooms room) {
        try {
            String query = "INSERT INTO rooms (roomNumber, status, typeId) VALUES (?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, room.getRoomNumber());
            ps.setNString(2, room.getStatus());
            ps.setInt(3, room.getType().getTypeId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Rooms> getAllRooms() {
        try {
            List<Rooms> roomsList = new ArrayList<>();
            String sql = "SELECT r.[RoomId],r.[RoomNumber],r.[Status],t.[TypeId],t.[TypeName]\n"
                    + "From [dbo].[Rooms] r Join [dbo].[Type] t on r.[TypeId]=t.[TypeId]";
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Rooms room = new Rooms();
                room.setRoomId(rs.getInt("roomId"));
                room.setRoomNumber(rs.getString("roomNumber"));
                room.setStatus(rs.getNString("status"));
                Type type = new Type();
                type.setTypeId(rs.getInt("TypeId"));
                type.setTypeName(rs.getNString("TypeName"));
                room.setType(type);
                roomsList.add(room);
            }
            rs.close();
            ps.close();
            return roomsList;

        } catch (SQLException ex) {
            Logger.getLogger(RoomsDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void updateRoomStatus(int roomId, String status) {
        try {
            String sql = "UPDATE rooms SET status = ? WHERE roomId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, roomId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateRoom(Rooms room) {
        try {
            String query = "UPDATE rooms "
                    + "SET roomNumber = ?, "
                    + "        typeId = ? "
                    + "WHERE roomId = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, room.getRoomNumber());
            ps.setInt(2, room.getType().getTypeId());
            ps.setInt(3, room.getRoomId());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(RoomsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void toggleRoom(int roomId, String roomStatus) {
        try {
            String sql = "UPDATE Rooms SET Status = ? WHERE RoomId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, roomStatus);
            ps.setInt(2, roomId);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(RoomsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Rooms> RoomCheck(int typeId, LocalDate checkin, LocalDate checkout) {
        try {
            String sql = "SELECT r.RoomId, r.RoomNumber, r.Status, r.[TypeId], t.TypeName "
                    + "FROM Rooms r "
                    + "JOIN Type t ON r.TypeId = t.TypeId "
                    + "WHERE r.RoomId NOT IN "
                    + "(SELECT RoomId FROM [dbo].[Book] "
                    + "WHERE RoomId = r.RoomId AND "
                    + "((CheckinDate >= ? AND CheckinDate < ?) OR "
                    + "(CheckoutDate > ? AND CheckoutDate <= ?)))";

            if (typeId != 0) {
                sql += " AND r.TypeId = ? ";
            }

            Date checkinDate = Date.valueOf(checkin);
            Date checkoutDate = Date.valueOf(checkout);

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDate(1, checkinDate);
            ps.setDate(2, checkoutDate);
            ps.setDate(3, checkinDate);
            ps.setDate(4, checkoutDate);

            if (typeId != 0) {
                ps.setInt(5, typeId);
            }

            ResultSet rs = ps.executeQuery();

            ArrayList<Rooms> roomslist = new ArrayList<>();
            while (rs.next()) {
                Rooms room = new Rooms();
                room.setRoomId(rs.getInt("RoomId"));
                room.setRoomNumber(rs.getString("RoomNumber"));
                room.setStatus(rs.getNString("Status"));
                Type t = new Type();
                t.setTypeId(rs.getInt("TypeId"));
                t.setTypeName(rs.getNString("TypeName"));
                room.setType(t);
                roomslist.add(room);
            }
            rs.close();
            ps.close();
            return roomslist;
        } catch (SQLException ex) {
            Logger.getLogger(RoomsDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public Rooms getRoomByNumber(String roomNumber) {
        try {
            String sql = "SELECT r.RoomId, r.RoomNumber, r.Status, r.TypeId, t.TypeName "
                    + "FROM Rooms r "
                    + "JOIN Type t ON r.TypeId = t.TypeId "
                    + "WHERE r.RoomNumber = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, roomNumber);
            ResultSet rs = ps.executeQuery();

            Rooms room = null;
            if (rs.next()) {
                room = new Rooms();
                room.setRoomId(rs.getInt("RoomId"));
                room.setRoomNumber(rs.getString("RoomNumber"));
                room.setStatus(rs.getNString("Status"));
                Type type = new Type();
                type.setTypeId(rs.getInt("TypeId"));
                type.setTypeName(rs.getNString("TypeName"));
                room.setType(type);
            }

            rs.close();
            ps.close();
            return room;
        } catch (SQLException ex) {
            Logger.getLogger(RoomsDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public Rooms getRoomById(int selectedRoomId) {
        try {
            String sql = "Select [RoomNumber],[Status],[TypeId]\n"
                    + "From [dbo].[Rooms] \n"
                    + "Where [RoomId]=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, selectedRoomId);
            ResultSet rs = ps.executeQuery();
            Rooms thisRoom = new Rooms();
            if (rs.next()) {
                thisRoom.setRoomId(selectedRoomId);
                thisRoom.setRoomNumber(rs.getString("RoomNumber"));
                thisRoom.setStatus(rs.getString("Status"));
                TypeDAO tdao = new TypeDAO();
                Type thisRoomType = tdao.getTypeInfo(rs.getInt("TypeId"));
                thisRoom.setType(thisRoomType);
            }
            return thisRoom;
        } catch (SQLException ex) {
            Logger.getLogger(RoomsDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }
}
