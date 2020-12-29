/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.entities;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author NO1
 */
@Entity
@Table(name = "image")
public class ImageEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private String name;

    @ManyToOne
    @JoinColumn(name = "promotion_id")
    private PromotionEntity promotion;
    
    @ManyToOne
    @JoinColumn(name = "room_type_id")
    private RoomTypeEntity roomType;
    
    @ManyToOne
    @JoinColumn(name = "service_id")
    private ServiceEntity service;
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public PromotionEntity getPromotion() {
        return promotion;
    }

    public void setPromotion(PromotionEntity promotion) {
        this.promotion = promotion;
    }

    public RoomTypeEntity getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomTypeEntity roomType) {
        this.roomType = roomType;
    }

    public ServiceEntity getService() {
        return service;
    }

    public void setService(ServiceEntity service) {
        this.service = service;
    }

    
    
    
}
