/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.RoomEntity;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author lamde
 */
@Repository
public interface RoomRepository extends CrudRepository<RoomEntity, Integer>{
    
    @Query(value = " SELECT * FROM room r " 
            + "WHERE NOT EXISTS" +
            "( SELECT 1 FROM booking b INNER JOIN booking_detail bd"
            + " ON bd.booking_id = b.id WHERE bd.room_id = r.id AND " + "("
	+ "(:sDate >= b.checkin AND :sDate <= b.checkout)" + "OR" +
         "(:sDate <= b.checkin AND :eDate >= b.checkin)" + ")" + ")", nativeQuery = true)
    List<RoomEntity> findRoomByDate(@Param("sDate") Date sDate,
                                    @Param("eDate") Date eDate);
    
}
