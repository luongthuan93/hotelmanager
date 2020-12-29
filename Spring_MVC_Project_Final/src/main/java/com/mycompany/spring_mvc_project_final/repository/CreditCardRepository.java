/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.CreditCardEntity;
import java.util.Optional;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author lamde
 */
@Repository
public interface CreditCardRepository extends CrudRepository<CreditCardEntity, Integer>{

    @Query(value = "SELECT * FROM credit_card c WHERE c.number = :number", nativeQuery = true)
    CreditCardEntity findByNumberGetCreditCard(@Param("number") String number);
    
    Optional<CreditCardEntity> findByNumber(String number);
}
