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
public class PersonInDetail implements Serializable{
   private String name;
   private String identityNumber;
   private String type;
   private String sex;
   private int personId;
   private String phone;
   private String email;
   private int BookId;

    public PersonInDetail() {
    }

    public PersonInDetail(String name, String identityNumber, String type, String sex, int personId, String phone, String email, int BookId) {
        this.name = name;
        this.identityNumber = identityNumber;
        this.type = type;
        this.sex = sex;
        this.personId = personId;
        this.phone = phone;
        this.email = email;
        this.BookId = BookId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIdentityNumber() {
        return identityNumber;
    }

    public void setIdentityNumber(String identityNumber) {
        this.identityNumber = identityNumber;
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

    public int getPersonId() {
        return personId;
    }

    public void setPersonId(int personId) {
        this.personId = personId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getBookId() {
        return BookId;
    }

    public void setBookId(int BookId) {
        this.BookId = BookId;
    }
    
   
}
