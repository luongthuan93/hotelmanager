/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.ImageEntity;
import com.mycompany.spring_mvc_project_final.entities.RoomEntity;
import com.mycompany.spring_mvc_project_final.entities.RoomTypeEntity;
import com.mycompany.spring_mvc_project_final.repository.RoomTypeRepository;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lamde
 */
@Service
public class RoomTypeService {

    @Autowired
    private RoomTypeRepository roomTypeRepository;

    public List<RoomTypeEntity> getListRoomTypes() {
        return (List<RoomTypeEntity>) roomTypeRepository.findAll();
    }

    public void saveRoomType(RoomTypeEntity roomTypeEntity, String action) {

        if (action.equalsIgnoreCase("add")) {
            List<ImageEntity> images = roomTypeEntity.getImages();
            for (ImageEntity image : images) {
                image.setRoomType(roomTypeEntity);
                roomTypeEntity.setImages(images);
            }
        }

        roomTypeRepository.save(roomTypeEntity);
    }

    public RoomTypeEntity getRoomTypeById(int id) {

        Optional<RoomTypeEntity> roomtype = roomTypeRepository.findById(id);
        if (roomtype.isPresent()) {
            return roomtype.get();
        } else {
            return new RoomTypeEntity();
        }
    }

    
    public List<RoomTypeEntity> getRoomTypeInPromotion(Date sDate,Date eDate){
        return roomTypeRepository.findRoomTypeByPromotionDateQuery(sDate, eDate);
    }


    public RoomTypeEntity findById(int id) {
        return roomTypeRepository.findById(id).get();
    }

    public RoomTypeEntity findRoomTypeGetImagesById(int id) {
        return roomTypeRepository.findRoomTypeGetImagesById(id);
    }
    
    public RoomTypeEntity getRoomTypeQueryById(int id) {
        Optional<RoomTypeEntity> roomtype = roomTypeRepository.findRoomTypeQueryById(id);
        if (roomtype.isPresent()) {
            return roomtype.get();
        } else {
            return new RoomTypeEntity();
        }
    }
}
