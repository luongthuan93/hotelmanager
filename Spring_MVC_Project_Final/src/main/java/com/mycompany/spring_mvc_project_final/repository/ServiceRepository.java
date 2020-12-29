/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;
import java.util.Optional;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author NO1
 */
@Repository
public interface ServiceRepository extends CrudRepository<ServiceEntity, Integer>{
    
    @Query("SELECT s FROM ServiceEntity s LEFT JOIN FETCH s.images WHERE s.id = ?1 ")
    Optional<ServiceEntity> findServiceQueryById(int id);
}
