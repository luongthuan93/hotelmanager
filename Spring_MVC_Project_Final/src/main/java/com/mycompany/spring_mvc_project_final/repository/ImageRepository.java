/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.ImageEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author NO1
 */
@Repository
public interface ImageRepository extends CrudRepository<ImageEntity, Integer>{
    
    @Query(value = "SELECT * FROM image WHERE room_type_id = ?1", nativeQuery = true)
    List<ImageEntity> findByRoomTypeId(int roomTypeId);
}
