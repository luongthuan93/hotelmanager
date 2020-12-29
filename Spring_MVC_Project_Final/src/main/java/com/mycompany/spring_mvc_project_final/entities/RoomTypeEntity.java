/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.CommonStatus;
import java.io.Serializable;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author NO1
 */
@Entity
@Table(name = "room_type")
public class RoomTypeEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private String description;
    private double price;
    private int size;

    @Column(name = "number_of_bed")
    private int numberOfBed;
    
    @Enumerated(EnumType.STRING)
    private CommonStatus status = CommonStatus.ACTIVE;

    @ManyToMany(mappedBy = "roomTypes", cascade = {CascadeType.MERGE, CascadeType.REMOVE}, fetch = FetchType.LAZY)
    private Set<PromotionEntity> promotions;

    @OneToMany(mappedBy = "roomType", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<ImageEntity> images;

    @OneToMany(mappedBy = "roomType", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<RoomEntity> rooms;

    @OneToMany(mappedBy = "roomType", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<VoteEntity> votes;

    @OneToMany(mappedBy = "roomType", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<CommentEntity> comments;

    @ManyToMany(cascade = {CascadeType.MERGE, CascadeType.REMOVE}, fetch = FetchType.LAZY)
    @JoinTable(name = "roomType_convenient_relationship",
            joinColumns = @JoinColumn(name = "room_type_id",
                    referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(
                    name = "convenient_id",
                    referencedColumnName = "id"))
    private Set<ConvenientEntity> convenients;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public CommonStatus getStatus() {
        return status;
    }

    public void setStatus(CommonStatus status) {
        this.status = status;
    }

    public Set<PromotionEntity> getPromotions() {
        return promotions;
    }

    public void setPromotions(Set<PromotionEntity> promotions) {
        this.promotions = promotions;
    }

    public List<ImageEntity> getImages() {
        return images;
    }

    public void setImages(List<ImageEntity> images) {
        this.images = images;
    }

    public List<RoomEntity> getRooms() {
        return rooms;
    }

    public void setRooms(List<RoomEntity> rooms) {
        this.rooms = rooms;
    }

    public List<VoteEntity> getVotes() {
        return votes;
    }

    public void setVotes(List<VoteEntity> votes) {
        this.votes = votes;
    }

    public List<CommentEntity> getComments() {
        return comments;
    }

    public void setComments(List<CommentEntity> comments) {
        this.comments = comments;
    }

    public Set<ConvenientEntity> getConvenients() {
        return convenients;
    }

    public void setConvenients(Set<ConvenientEntity> convenients) {
        this.convenients = convenients;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getNumberOfBed() {
        return numberOfBed;
    }

    public void setNumberOfBed(int numberOfBed) {
        this.numberOfBed = numberOfBed;
    }

    
}
