/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.RoomTypeEntity;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author lamde
 */
@Repository
public interface RoomTypeRepository extends CrudRepository<RoomTypeEntity, Integer>{
    
    @Query("SELECT DISTINCT rt FROM RoomTypeEntity rt LEFT JOIN FETCH rt.promotions p WHERE (p.startDate between ?1 and ?2) OR (p.endDate between ?1 and ?2) OR ((?1 between p.startDate and p.endDate) AND (?2 between p.startDate and p.endDate)) GROUP BY rt.id")
    List<RoomTypeEntity> findRoomTypeByPromotionDateQuery(Date sDate,Date eDate);
    

    @Query("SELECT DISTINCT rt FROM RoomTypeEntity rt LEFT JOIN FETCH rt.images WHERE rt.id = ?1" )
    Optional<RoomTypeEntity> findRoomTypeQueryById(int id);

    @Query("SELECT rt FROM RoomTypeEntity rt JOIN FETCH rt.images WHERE rt.id = ?1")
    RoomTypeEntity findRoomTypeGetImagesById(int id);
    

}
