/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dan.service;

import com.dan.pojo.Personnel;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface PersonnelService extends UserDetailsService {

    List<Object[]> getPersonnel(boolean active);

    Personnel findPersonnelById(int id, boolean active);

    List<String> getPersonnelRole();

    boolean addPersonnel(Personnel personnel);

    Personnel getPersonnelByEmail(String email);

    public List<Personnel> getAll(int page, boolean active);

    int countPersonnel();

    boolean updatePersonnel(Personnel personnel);

    void removedPersonnel(int id);
}
