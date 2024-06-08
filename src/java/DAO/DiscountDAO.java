package DAO;

import DTO.Discount;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * DAO class for handling discounts.
 */
public class DiscountDAO extends DBContext {

    /**
     * Creates a new discount in the database.
     *
     * @param discount The discount to be created.
     * @return true if the discount was successfully created, false otherwise.
     */
    public boolean CreateDiscount(Discount discount) {
        try {
            String sql = "INSERT INTO [dbo].[Discount] (code, discountPercent, DateBegin, DateExpire, Status) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ptsm = connection.prepareStatement(sql);
            ptsm.setString(1, discount.getCode());
            ptsm.setDouble(2, discount.getDiscountPercent());

            // Convert LocalDateTime to java.sql.Timestamp
            Date startDate = discount.getDateBegin();
            Date endDate = discount.getDateExpire();

            // Convert LocalDateTime to java.sql.Timestamp
            // Insert Timestamp directly
            ptsm.setDate(3, startDate);
            ptsm.setDate(4, endDate);
            ptsm.setInt(5, 1);

            int rowsAffected = ptsm.executeUpdate();
            ptsm.close();

            // If insertion was successful, return true; otherwise, return false
            return rowsAffected > 0;
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public ArrayList<Discount> getAllCodes() {

        try {
            String sql = "SELECT code, discountPercent, DateBegin, DateExpire, Status FROM [dbo].[Discount]";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<Discount> allDiscounts = new ArrayList<>();
            while (rs.next()) {
                Discount discount = new Discount();
                discount.setCode(rs.getString("code"));
                discount.setDiscountPercent(rs.getInt("discountPercent"));
                discount.setDateBegin(rs.getDate("DateBegin"));
                discount.setDateExpire(rs.getDate("DateExpire"));
                discount.setStatus(rs.getInt("Status"));
                allDiscounts.add(discount);
            }
            rs.close();
            ps.close();
            return allDiscounts;
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean toggleDiscountStatus(String code, int newStatus) {
        try {
            String sql = "UPDATE [dbo].[Discount] SET status = ? WHERE code = ?";
            PreparedStatement ptsm = connection.prepareStatement(sql);
            ptsm.setInt(1, newStatus);
            ptsm.setString(2, code);

            int rowsAffected = ptsm.executeUpdate();
            ptsm.close();

            // If update was successful, return true; otherwise, return false
            return rowsAffected > 0;
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

}
