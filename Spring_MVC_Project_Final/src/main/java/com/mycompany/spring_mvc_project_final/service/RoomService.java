/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.RoomEntity;
import com.mycompany.spring_mvc_project_final.repository.RoomRepository;
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
public class RoomService {
    
    @Autowired
    private RoomRepository roomRepository;
    
    public List<RoomEntity> searchRoom(Date sDate, Date eDate){
        return roomRepository.findRoomByDate(sDate, eDate);
    }
    
    public List<RoomEntity> getListRoom(){
        return (List<RoomEntity>) roomRepository.findAll();
    }
    
    public RoomEntity findById(int id) {
        return roomRepository.findById(id).get();
    }
    
    public void saveRoom(RoomEntity roomEntity){
        roomRepository.save(roomEntity);
    }
    
    public List<RoomEntity> getAllRooms(){
        return (List<RoomEntity>) roomRepository.findAll();
    }
    
    public RoomEntity findbyRoomId(int id){
        Optional<RoomEntity> room = roomRepository.findById(id);
        if (room.isPresent()) {
            return room.get();
        } else {
            return new RoomEntity();
        }
        
    }

}
