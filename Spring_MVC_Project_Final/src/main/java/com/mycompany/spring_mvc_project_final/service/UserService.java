/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.UserEntity;
import com.mycompany.spring_mvc_project_final.repository.UserRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author NO1
 */
@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepository;
    
    public List<UserEntity> findAllUser() {
        return (List<UserEntity>)userRepository.findAll();
    }
    
    public List<UserEntity> findAllUserQuery() {
        return (List<UserEntity>)userRepository.findAllUsersQuery();
    }
    
    public void saveUser(UserEntity userEntity){
        userRepository.save(userEntity);
    }
    
    public String encrytePassword(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.encode(password);
    }
    

    public boolean checkPassword(String password,String bdPassword) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.matches(password, bdPassword);
    }
    
    public UserEntity getUserByIdQuery(int id){
        Optional<UserEntity> user = userRepository.findUserByIdQuery(id);
        if(user.isPresent()){
            return user.get();
        }
        return new UserEntity();
    }
    
    public UserEntity getUserById(int id){
        Optional<UserEntity> user = userRepository.findById(id);
        if(user.isPresent()){
            return user.get();
        }
        return new UserEntity();
    }
    public UserEntity getUserByEmail(String email){
        return userRepository.findByEmail(email);

    }
}
