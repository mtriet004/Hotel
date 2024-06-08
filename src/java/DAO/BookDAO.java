/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Book;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class BookDAO extends DBContext {

    public int CreateBooking(Book b) {
        int generatedId = -1; // Initialize generatedId with a default value

        try {
            String sql = "INSERT INTO [dbo].[Book] ([DateCreated],[Price],[NumberOfPeople],[IdentityCard],[CheckinDate],[CheckoutDate],[RoomId],[Status])\n"
                    + "VALUES(?,?,?,?,?,?,?,?);";
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setDate(1, Date.valueOf(b.getDateCreated()));
            ps.setFloat(2, b.getPrice());
            ps.setInt(3, b.getNumberOfPeople());
            ps.setString(4, b.getIdentityCard());
            ps.setDate(5, Date.valueOf(b.getCheckinDate()));
            ps.setDate(6, Date.valueOf(b.getCheckoutDate()));
            ps.setInt(7, b.getRoomId());
            ps.setInt(8, b.getStatus());
            ps.executeUpdate();

            // Retrieve the generated keys
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1); // Get the generated BookId
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return generatedId; // Return the generated BookId
    }

    public ArrayList<Book> getBookList(String identityCard) {
        try {
            String sql = "SELECT [DateCreated],[Price],[NumberOfPeople],[BookId],[RoomId],[CheckinDate],[CheckoutDate],[Status] FROM [dbo].[Book] WHERE [IdentityCard] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, identityCard);
            ResultSet rs = ps.executeQuery();
            ArrayList<Book> bookList = new ArrayList<>();
            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getInt("BookId"));
                book.setDateCreated(rs.getDate("DateCreated").toLocalDate());
                book.setPrice(rs.getFloat("Price"));
                book.setNumberOfPeople(rs.getInt("NumberOfPeople"));
                book.setIdentityCard(identityCard);
                book.setCheckinDate(rs.getDate("CheckinDate").toLocalDate());
                book.setCheckoutDate(rs.getDate("CheckoutDate").toLocalDate());
                book.setRoomId(rs.getInt("RoomId"));
                book.setStatus(rs.getInt("Status"));
                bookList.add(book);
            }

            rs.close();
            ps.close();
            return bookList;
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void toggleBookingStatus(int bookId, int status) {
        try {
            String sql = "UPDATE [dbo].[Book] SET [Status] = ? WHERE [BookId] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, bookId);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Book getBookingById(int bookingId) {
        Book booking = null;
        try {
            String sql = "SELECT * FROM [dbo].[Book] WHERE [BookId] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, bookingId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                booking = new Book();
                booking.setBookId(rs.getInt("BookId"));
                booking.setDateCreated(rs.getDate("DateCreated").toLocalDate());
                booking.setPrice(rs.getFloat("Price"));
                booking.setNumberOfPeople(rs.getInt("NumberOfPeople"));
                booking.setIdentityCard(rs.getString("IdentityCard"));
                booking.setCheckinDate(rs.getDate("CheckinDate").toLocalDate());
                booking.setCheckoutDate(rs.getDate("CheckoutDate").toLocalDate());
                booking.setRoomId(rs.getInt("RoomId"));
                booking.setStatus(rs.getInt("Status"));
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return booking;
    }

    public ArrayList<Book> getAllBooking() {
        ArrayList<Book> bookList = new ArrayList<>();
        try {
            String sql = "SELECT [BookId], [DateCreated], [Price], [NumberOfPeople], [IdentityCard], [CheckinDate], [CheckoutDate], [RoomId], [Status] FROM [dbo].[Book]";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getInt("BookId"));
                book.setDateCreated(rs.getDate("DateCreated").toLocalDate());
                book.setPrice(rs.getFloat("Price"));
                book.setNumberOfPeople(rs.getInt("NumberOfPeople"));
                book.setIdentityCard(rs.getString("IdentityCard"));
                book.setCheckinDate(rs.getDate("CheckinDate").toLocalDate());
                book.setCheckoutDate(rs.getDate("CheckoutDate").toLocalDate());
                book.setRoomId(rs.getInt("RoomId"));
                book.setStatus(rs.getInt("Status"));
                bookList.add(book);
            }

            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bookList;
    }

    public boolean updateRoomId(int bookId, int newRoomId) {
        boolean isUpdated = false;
        try {
            String sql = "UPDATE [dbo].[Book] SET [RoomId] = ? WHERE [BookId] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, newRoomId);
            ps.setInt(2, bookId);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isUpdated = true;
            }
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isUpdated;
    }

    public int getRoomIdByBookingId(int bookId) {
        int roomId = -1; // Initialize roomId with a default value

        try {
            String sql = "SELECT RoomId FROM [dbo].[Book] WHERE BookId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, bookId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                roomId = rs.getInt("RoomId"); // Get the RoomId associated with the given bookId
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return roomId; // Return the RoomId
    }

    public boolean updateBookingPrice(int bookId, double newPrice) {
        boolean isUpdated = false;
        try {
            String sql = "UPDATE [dbo].[Book] SET [Price] = ? WHERE [BookId] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDouble(1, newPrice);
            ps.setInt(2, bookId);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isUpdated = true;
            }
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isUpdated;
    }

    public ArrayList<Book> getLatestBookings(int limit) {
        ArrayList<Book> bookList = new ArrayList<>();
        try {
            String sql = "SELECT [BookId], [DateCreated], [Price], [NumberOfPeople], [IdentityCard], [CheckinDate], [CheckoutDate], [RoomId], [Status] FROM [dbo].[Book] ORDER BY [DateCreated] DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getInt("BookId"));
                book.setDateCreated(rs.getDate("DateCreated").toLocalDate());
                book.setPrice(rs.getFloat("Price"));
                book.setNumberOfPeople(rs.getInt("NumberOfPeople"));
                book.setIdentityCard(rs.getString("IdentityCard"));
                book.setCheckinDate(rs.getDate("CheckinDate").toLocalDate());
                book.setCheckoutDate(rs.getDate("CheckoutDate").toLocalDate());
                book.setRoomId(rs.getInt("RoomId"));
                book.setStatus(rs.getInt("Status"));
                bookList.add(book);
            }

            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bookList;
    }

}
