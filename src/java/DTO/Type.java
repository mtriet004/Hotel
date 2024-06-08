/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class Type implements Serializable{
    private int typeId;
    private String typeName;
    private float price;
    private int numPeople;
    private List<Service> list_service;

    public Type() {
    }

    public Type(int typeId, String typeName, float price, int numPeople, List<Service> list_service) {
        this.typeId = typeId;
        this.typeName = typeName;
        this.price = price;
        this.numPeople = numPeople;
        this.list_service = list_service;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getNumPeople() {
        return numPeople;
    }

    public void setNumPeople(int numPeople) {
        this.numPeople = numPeople;
    }

    public List<Service> getList_service() {
        return list_service;
    }

    public void setList_service(List<Service> list_service) {
        this.list_service = list_service;
    }

   


    
}
