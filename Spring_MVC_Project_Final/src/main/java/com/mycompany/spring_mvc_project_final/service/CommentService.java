/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.CommentEntity;
import com.mycompany.spring_mvc_project_final.repository.CommentRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author NO1
 */
@Service
public class CommentService {
    
    @Autowired
    private CommentRepository commentRepository;
    
    public List<CommentEntity> getAllComments(){
        return (List<CommentEntity>)commentRepository.findAll();
    }
    
    public void deleteComment(int id){
        commentRepository.deleteById(id);
    }
    
    public CommentEntity findCommentbyId(int id){
        Optional<CommentEntity> comment = commentRepository.findById(id);
        if(comment.isPresent()){
            return comment.get();
        }
        return new CommentEntity();
    }
}
