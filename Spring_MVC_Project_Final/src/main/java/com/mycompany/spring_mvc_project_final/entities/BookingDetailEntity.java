/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.entities;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author NO1
 */
@Entity
@Table(name = "booking_detail")
public class BookingDetailEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private double price;
    private int discount;

    @ManyToOne
    @JoinColumn(name = "booking_id")
    private BookingEntity booking;

    @ManyToMany(cascade = {CascadeType.MERGE, CascadeType.REMOVE}, fetch = FetchType.LAZY)
    @JoinTable(name = "booking_service_relationship",
            joinColumns = @JoinColumn(name = "booking_id",
                    referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(
                    name = "service_id",
                    referencedColumnName = "id"))
    private Set<ServiceEntity> services;

    @ManyToOne
    @JoinColumn(name = "room_id")
    private RoomEntity room;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public BookingEntity getBooking() {
        return booking;
    }

    public void setBooking(BookingEntity booking) {
        this.booking = booking;
    }

    public Set<ServiceEntity> getServices() {
        return services;
    }

    public void setServices(Set<ServiceEntity> services) {
        this.services = services;
    }

    public RoomEntity getRoom() {
        return room;
    }

    public void setRoom(RoomEntity room) {
        this.room = room;
    }

}
