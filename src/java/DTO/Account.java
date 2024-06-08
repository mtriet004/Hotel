/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.io.Serializable;

/**
 *
 * @author ASUS
 */
public class Account implements Serializable {

    private String email;
    private String password;
    private String fullName;
    private String phone;
    private String type;
    private String sex;
    private String accountStatus;
    private String address;
    private String notes;
    private String identityCard;
    private int status;
    private Role role;

    public Account(String email, String password, String fullName, String phone, String type, String sex, String accountStatus, String address, String notes, String identityCard, int status, Role role) {
        this.email = email;
        this.password = password;
        this.fullName = fullName;
        this.phone = phone;
        this.type = type;
        this.sex = sex;
        this.accountStatus = accountStatus;
        this.address = address;
        this.notes = notes;
        this.identityCard = identityCard;
        this.status = status;
        this.role = role;
    }

    public Account() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAccountStatus() {
        return accountStatus;
    }

    public void setAccountStatus(String accountStatus) {
        this.accountStatus = accountStatus;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getIdentityCard() {
        return identityCard;
    }

    public void setIdentityCard(String identityCard) {
        this.identityCard = identityCard;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Account(String password, String phone) {
        this.password = password;
        this.phone = phone;

    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
