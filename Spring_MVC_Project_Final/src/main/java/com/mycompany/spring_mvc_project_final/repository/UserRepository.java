/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.UserEntity;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<UserEntity, Integer> {
    UserEntity findByEmailLike(String email);
    
    @Query("SELECT DISTINCT u FROM UserEntity u LEFT JOIN FETCH u.userRoles")
    List<UserEntity> findAllUsersQuery();
    

    @Query("SELECT DISTINCT u FROM UserEntity u LEFT JOIN FETCH u.userRoles WHERE u.id = ?1")
    Optional<UserEntity> findUserByIdQuery(int id);

    UserEntity findByEmail(String email);

}
