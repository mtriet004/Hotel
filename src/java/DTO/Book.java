/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.io.Serializable;
import java.time.LocalDate;

/**
 *
 * @author ASUS
 */
public class Book implements Serializable{
    private LocalDate dateCreated;
    private LocalDate checkinDate;
    private LocalDate checkoutDate;
    private float price;
    private int numberOfPeople;
    private int bookId;
    private int roomId;
    private int status;
    private String phone;
    private String code;
    private String identityCard;

    public Book() {
    }

    public Book(LocalDate dateCreated, LocalDate checkinDate, LocalDate checkoutDate, float price, int numberOfPeople, int bookId, int roomId, int status, String phone, String code, String identityCard) {
        this.dateCreated = dateCreated;
        this.checkinDate = checkinDate;
        this.checkoutDate = checkoutDate;
        this.price = price;
        this.numberOfPeople = numberOfPeople;
        this.bookId = bookId;
        this.roomId = roomId;
        this.status = status;
        this.phone = phone;
        this.code = code;
        this.identityCard = identityCard;
    }

    public LocalDate getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(LocalDate dateCreated) {
        this.dateCreated = dateCreated;
    }

    public LocalDate getCheckinDate() {
        return checkinDate;
    }

    public void setCheckinDate(LocalDate checkinDate) {
        this.checkinDate = checkinDate;
    }

    public LocalDate getCheckoutDate() {
        return checkoutDate;
    }

    public void setCheckoutDate(LocalDate checkoutDate) {
        this.checkoutDate = checkoutDate;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(int numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getIdentityCard() {
        return identityCard;
    }

    public void setIdentityCard(String identityCard) {
        this.identityCard = identityCard;
    }

   
    
    
    
}
