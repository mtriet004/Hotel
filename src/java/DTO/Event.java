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
public class Event implements Serializable{
    private String name;
    private int toggleEvent;
    private int eventId;
    private String description;
    private int percentage;

    public Event() {
    }

    public Event(String name, int toggleEvent, int eventId, String description, int percentage) {
        this.name = name;
        this.toggleEvent = toggleEvent;
        this.eventId = eventId;
        this.description = description;
        this.percentage = percentage;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getToggleEvent() {
        return toggleEvent;
    }

    public void setToggleEvent(int toggleEvent) {
        this.toggleEvent = toggleEvent;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPercentage() {
        return percentage;
    }

    public void setPercentage(int percentage) {
        this.percentage = percentage;
    }
    
    
}
