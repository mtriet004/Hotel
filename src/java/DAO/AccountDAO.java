/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Account;
import DTO.Role;
import at.favre.lib.crypto.bcrypt.BCrypt;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class AccountDAO extends DBContext {

    public void CreateAccount(Account accounts) {
        try {
            String sql = "INSERT Into [dbo].[Account] ([Email],[Password],[Full_name],[Sex],[Phone],[Type],[IdentityCard],[Address],[Status],[RoleId])\n"
                    + "VALUES (?, ?, ?, ?, ?, ?,? ,?, ?,? );";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setNString(1, accounts.getEmail());
            ps.setNString(2, BCrypt.withDefaults().hashToString(12, accounts.getPassword().toCharArray()));
            ps.setNString(3, accounts.getFullName());
            ps.setNString(4, accounts.getSex());
            ps.setNString(5, accounts.getPhone());
            ps.setNString(6, accounts.getType());
            ps.setNString(7, accounts.getIdentityCard());
            ps.setNString(8, accounts.getAddress());
            ps.setInt(9, 0); // Set the status to 0 by default
            ps.setInt(10, 2); // Assuming roleId 2 for regular users
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Account SigninCheck(Account accounts) {
        try {
            String sql = "SELECT a.[Full_Name], a.[Password], a.[Type], a.[Phone],a.[Address],a.[IdentityCard], a.[Email], a.[Sex],a.[Status],r.[RoleName],r.[RoleId]\n"
                    + "FROM [dbo].[Account] a \n"
                    + "JOIN [dbo].[Role] r ON a.[RoleId] = r.[RoleId]\n"
                    + "Where a.[Phone]= ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, accounts.getPhone());
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getNString("Password");
                String enteredPassword = accounts.getPassword();

                if (BCrypt.verifyer().verify(enteredPassword.toCharArray(), storedPassword).verified) {
                    // Mật khẩu trùng khớp, có thể thực hiện các hành động phù hợp ở đây
                    Account acc = new Account();
                    acc.setEmail(rs.getNString("Email"));
                    acc.setFullName(rs.getNString("Full_name"));
                    acc.setType(rs.getNString("Type")); // Đặt vai trò của người dùng
                    acc.setPhone(accounts.getPhone());
                    acc.setSex(rs.getNString("Sex")); // Đặt giới tính caủa người dùng
                    acc.setAddress(rs.getNString("Address"));
                    acc.setIdentityCard(rs.getNString("IdentityCard"));
                    acc.setStatus(rs.getInt("Status"));
                    Role userRole = new Role();
                    userRole.setRoleId(rs.getInt("RoleId"));
                    userRole.setRoleName(rs.getNString("RoleName"));
                    acc.setRole(userRole);
//                    acc.setBlockedReason(rs.getNString("blocked_reason"));
//                     Có thể đặt các thuộc tính khác của tài khoản ở đây

                    rs.close();
                    pstmt.close();
                    return acc;

                } else {
                    // Mật khẩu không trùng khớp
                    return null;
                }
            } else {
                // Không tìm thấy tài khoản với email đã cung cấp
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public boolean checkRegisteredAccount(String phone, String identityCard) {
        try {
            String sql = "SELECT [Phone] FROM [dbo].[Account] WHERE [Phone] = ? OR [IdentityCard] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.setString(2, identityCard);
            ResultSet rs = ps.executeQuery();
            boolean result = rs.next(); // If there is a result, it means the phone number or identity number is registered
            // Close ResultSet and PreparedStatement
            rs.close();
            ps.close();
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public ArrayList<Account> getAllAccounts() {
        try {
            String sql = "SELECT a.[Full_name], a.[Sex], a.[Phone], a.[Email],a.[Status], r.[RoleName]\n"
                    + "FROM [dbo].[Account] a\n"
                    + "JOIN [dbo].[Role] r ON a.[RoleId] = r.[RoleId]";
            ArrayList<Account> allAccounts = new ArrayList<>();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setFullName(rs.getString("Full_name"));
                account.setSex(rs.getString("Sex"));
                account.setPhone(rs.getString("Phone"));
                account.setEmail(rs.getString("Email"));
                account.setStatus(rs.getInt("Status"));
                Role userRole = new Role(); // Create a new Role object for each account
                userRole.setRoleName(rs.getString("RoleName"));
                account.setRole(userRole); // Set the role for the account
                allAccounts.add(account);
            }
            rs.close();
            ps.close();
            return allAccounts;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public boolean toggleAccountStatus(String phone, int newStatus) {
        try {
            String sql = "UPDATE [dbo].[Account] SET [Status] = ? WHERE [Phone] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, newStatus);
            ps.setString(2, phone);
            int rowsAffected = ps.executeUpdate();
            ps.close();
            return rowsAffected > 0; // Returns true if rows were updated
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

}
