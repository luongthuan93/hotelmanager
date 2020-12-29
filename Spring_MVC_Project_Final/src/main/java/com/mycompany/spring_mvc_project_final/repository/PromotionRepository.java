/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.PromotionEntity;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author NO1
 */
@Repository
public interface PromotionRepository extends CrudRepository<PromotionEntity, Integer>{
    
    @Query("SELECT DISTINCT p FROM PromotionEntity p LEFT JOIN FETCH p.roomTypes")
    List<PromotionEntity> getAllPromotionWithRoomType();
    
    @Query("SELECT DISTINCT p FROM PromotionEntity p LEFT JOIN FETCH p.images WHERE p.id = ?1")
    Optional<PromotionEntity> findPromotionWithImagesById(int id);
    
    @Query("SELECT DISTINCT p FROM PromotionEntity p LEFT JOIN FETCH p.roomTypes WHERE p.id = ?1")
    Optional<PromotionEntity> findPromotionWithRoomTypeById(int id);
    
    @Query("SELECT DISTINCT p FROM PromotionEntity p WHERE (p.startDate between ?1 and ?2) OR (p.endDate between ?1 and ?2) OR ((?1 between p.startDate and p.endDate) AND (?2 between p.startDate and p.endDate))")
    List<PromotionEntity> getAllPromotionAvailable(Date sDate,Date eDate);
}
