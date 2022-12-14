/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dan.repository.impl;

import com.dan.pojo.Department;
import com.dan.pojo.Personnel;
import com.dan.pojo.Position;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.dan.repository.PersonnelRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;

@Repository
@Transactional
@PropertySource("classpath:databases.properties")
public class PersonnelRepositoryImpl implements PersonnelRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactoryBean;
    @Autowired
    private Environment env;

    @Override
    public List<Object[]> getPersonnel(boolean active) {
        Session session = this.sessionFactoryBean.getObject().getCurrentSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> criteriaQuery = criteriaBuilder.createQuery(Object[].class);
        Root rootPersonnel = criteriaQuery.from(Personnel.class);
        Root rootPosition = criteriaQuery.from(Position.class);
        Root rootDepartment = criteriaQuery.from(Department.class);
        Predicate pActive = criteriaBuilder.equal(rootPersonnel.get("active"), active);
        Predicate pPerPos = criteriaBuilder.equal(rootPersonnel.get("idPosition"), rootPosition.get("id"));
        Predicate pPerDep = criteriaBuilder.equal(rootPersonnel.get("idDepartment"), rootDepartment.get("id"));
        criteriaQuery.where(pActive, pPerPos, pPerDep);
        criteriaQuery.multiselect(rootPersonnel.get("id"), rootPersonnel.get("avatar"),
                rootPersonnel.get("lastName"), rootPersonnel.get("firstName"), rootPersonnel.get("gender"),
                rootPersonnel.get("birthday"), rootPersonnel.get("identity"), rootPersonnel.get("phone"),
                rootPersonnel.get("email"), rootPersonnel.get("address"), rootPersonnel.get("role"),
                rootPosition.get("name"), rootDepartment.get("name"));
        Query query = session.createQuery(criteriaQuery);
        return query.getResultList();
    }

    @Override
    public Personnel findPersonnelById(int id, boolean active) {
        Session session = this.sessionFactoryBean.getObject().getCurrentSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Personnel> criteriaQuery = criteriaBuilder.createQuery(Personnel.class);
        Root root = criteriaQuery.from(Personnel.class);
        Predicate pId = criteriaBuilder.equal(root.get("id"), id);
        Predicate pActive = criteriaBuilder.equal(root.get("active"), active);
        criteriaQuery.select(root).where(pId, pActive);
        Query query = session.createQuery(criteriaQuery);
        return (Personnel) query.getSingleResult();
    }

    @Override
    public List<String> getPersonnelRole() {
        Session session = this.sessionFactoryBean.getObject().getCurrentSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Personnel> criteriaQuery = criteriaBuilder.createQuery(Personnel.class);
        Root root = criteriaQuery.from(Personnel.class);
        criteriaQuery.select(root.get("role"));
        Query query = session.createQuery(criteriaQuery);
        return query.getResultList();
    }

    @Override
    public boolean addPersonnel(Personnel personnel) {
        Session session = this.sessionFactoryBean.getObject().getCurrentSession();
        try {
            session.save(personnel);
            return true;
        } catch (Exception ex) {
            System.err.println("===Add personnel error repository===" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public Personnel getPersonnelByEmail(String email) {
        Session session = this.sessionFactoryBean.getObject().getCurrentSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Personnel> criteriaQuery = criteriaBuilder.createQuery(Personnel.class);
        Root root = criteriaQuery.from(Personnel.class);
        Predicate pEmail = criteriaBuilder.equal(root.get("email"), email);
        Predicate pActive = criteriaBuilder.equal(root.get("active"), true);
        criteriaQuery.select(root).where(pEmail, pActive);
        Query query = session.createQuery(criteriaQuery);
        return (Personnel) query.getSingleResult();
    }

    @Override
    public List<Personnel> getAll(int page, boolean active) {
        Session session = this.sessionFactoryBean.getObject().getCurrentSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Personnel> criteriaQuery = criteriaBuilder.createQuery(Personnel.class);
        Root root = criteriaQuery.from(Personnel.class);
        Predicate pActive = criteriaBuilder.equal(root.get("active"), active);
        criteriaQuery.select(root).where(pActive);
        Query query = session.createQuery(criteriaQuery);
        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            int start = (page - 1) * size;
            query.setFirstResult(start);
            query.setMaxResults(size);
        }
        return query.getResultList();
    }

    @Override
    public int countPersonnel() {
        Session session = this.sessionFactoryBean.getObject().getCurrentSession();
        Query query = session.createQuery("SELECT COUNT(*) FROM Personnel");
        return Integer.parseInt(query.getSingleResult().toString());
    }

    @Override
    public boolean updatePersonnel(Personnel personnel) {
        Session session = this.sessionFactoryBean.getObject().getCurrentSession();
        try {
            session.update(personnel);
            return true;
        } catch (Exception e) {
            System.err.println("===Update failed repo===" + e.getMessage());
            return false;
        }
    }

    @Override
    public void removedPersonnel(int id) {
        Session session = this.sessionFactoryBean.getObject().getCurrentSession();
        try {
            Query query = session.createQuery("UPDATE Personnel SET active=false WHERE id=:id");
            query.setParameter("id", id);
            query.executeUpdate();
        } catch (Exception e) {
            System.err.println("===Remove failed repo===" + e.getMessage());
        }
    }
}
