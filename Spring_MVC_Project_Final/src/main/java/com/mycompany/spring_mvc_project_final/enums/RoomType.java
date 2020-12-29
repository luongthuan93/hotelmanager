/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.enums;

/**
 *
 * @author NO1
 */
public enum RoomType {
    Single,Double,Quad,King,Suit,Apartments,Villa;
    
    public static RoomType[] getEnumRoomType(){
        return new RoomType[]{Single,Double,Quad,King,Suit,Apartments,Villa};
    }
}
