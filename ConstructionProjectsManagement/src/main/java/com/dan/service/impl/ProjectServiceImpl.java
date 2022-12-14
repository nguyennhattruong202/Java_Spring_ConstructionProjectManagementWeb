/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dan.service.impl;

import com.dan.pojo.Project;
import com.dan.repository.ProjectRepository;
import com.dan.service.ProjectService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectRepository projectRepository;

    @Override
    public List<Object[]> getProjects() {
        return this.projectRepository.getProjects();
    }

    @Override
    public boolean removedProject(int id) {
        return this.projectRepository.removedProject(id);
    }

    @Override
    public Project findProjectById(int id) {
        return this.projectRepository.findProjectById(id);
    }

    @Override
    public boolean addProject(Project project) {
        return this.projectRepository.addProject(project);
    }

    @Override
    public boolean updateProject(Project project) {
        return this.projectRepository.updateProject(project);
    }
}
