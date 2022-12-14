/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dan.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ACER
 */
@Entity
@Table(name = "personnel")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Personnel.findAll", query = "SELECT p FROM Personnel p"),
    @NamedQuery(name = "Personnel.findById", query = "SELECT p FROM Personnel p WHERE p.id = :id"),
    @NamedQuery(name = "Personnel.findByAvatar", query = "SELECT p FROM Personnel p WHERE p.avatar = :avatar"),
    @NamedQuery(name = "Personnel.findByLastName", query = "SELECT p FROM Personnel p WHERE p.lastName = :lastName"),
    @NamedQuery(name = "Personnel.findByFirstName", query = "SELECT p FROM Personnel p WHERE p.firstName = :firstName"),
    @NamedQuery(name = "Personnel.findByGender", query = "SELECT p FROM Personnel p WHERE p.gender = :gender"),
    @NamedQuery(name = "Personnel.findByBirthday", query = "SELECT p FROM Personnel p WHERE p.birthday = :birthday"),
    @NamedQuery(name = "Personnel.findByIdentity", query = "SELECT p FROM Personnel p WHERE p.identity = :identity"),
    @NamedQuery(name = "Personnel.findByPhone", query = "SELECT p FROM Personnel p WHERE p.phone = :phone"),
    @NamedQuery(name = "Personnel.findByEmail", query = "SELECT p FROM Personnel p WHERE p.email = :email"),
    @NamedQuery(name = "Personnel.findByAddress", query = "SELECT p FROM Personnel p WHERE p.address = :address"),
    @NamedQuery(name = "Personnel.findByPassword", query = "SELECT p FROM Personnel p WHERE p.password = :password"),
    @NamedQuery(name = "Personnel.findByRole", query = "SELECT p FROM Personnel p WHERE p.role = :role"),
    @NamedQuery(name = "Personnel.findByActive", query = "SELECT p FROM Personnel p WHERE p.active = :active")})
public class Personnel implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @NotNull
    @NotBlank
    @Size(max = 255)
    @Column(name = "avatar")
    private String avatar;
    @NotNull
    @NotBlank
    @Size(max = 255)
    @Column(name = "last_name")
    private String lastName;
    @NotNull
    @NotBlank
    @Size(max = 255)
    @Column(name = "first_name")
    private String firstName;
    @Size(max = 50)
    @Column(name = "gender")
    private String gender;
    @Column(name = "birthday")
    @Temporal(TemporalType.DATE)
    private Date birthday;
    @Size(max = 50)
    @Column(name = "identity")
    private String identity;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Size(max = 50)
    @Column(name = "phone")
    private String phone;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @NotNull
    @NotBlank
    @Size(max = 255)
    @Column(name = "email")
    private String email;
    @Size(max = 255)
    @Column(name = "address")
    private String address;
    @Size(max = 255)
    @Column(name = "password")
    private String password;
    @Size(max = 255)
    @Column(name = "role")
    private String role;
    @Column(name = "active")
    private Boolean active = true;
    @OneToMany(mappedBy = "idPersonnel")
    private Set<Participation> participationSet;
    @OneToMany(mappedBy = "idPersonnel")
    private Set<Issue> issueSet;
    @OneToMany(mappedBy = "idPersonnel")
    private Set<Change> changeSet;
    @OneToMany(mappedBy = "idPersonnel")
    private Set<Invest> investSet;
    @OneToMany(mappedBy = "idPersonnel")
    private Set<Project> projectSet;
    @OneToMany(mappedBy = "idPersonnel")
    private Set<Task> taskSet;
    @JoinColumn(name = "id_department", referencedColumnName = "id")
    @ManyToOne
    private Department idDepartment;
    @JoinColumn(name = "id_position", referencedColumnName = "id")
    @ManyToOne
    private Position idPosition;
    @OneToMany(mappedBy = "personResponsible")
    private Set<Category> categorySet;
    @OneToMany(mappedBy = "personCreated")
    private Set<Discuss> discussSet;

    public Personnel() {
    }

    public Personnel(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    @XmlTransient
    public Set<Participation> getParticipationSet() {
        return participationSet;
    }

    public void setParticipationSet(Set<Participation> participationSet) {
        this.participationSet = participationSet;
    }

    @XmlTransient
    public Set<Issue> getIssueSet() {
        return issueSet;
    }

    public void setIssueSet(Set<Issue> issueSet) {
        this.issueSet = issueSet;
    }

    @XmlTransient
    public Set<Change> getChangeSet() {
        return changeSet;
    }

    public void setChangeSet(Set<Change> changeSet) {
        this.changeSet = changeSet;
    }

    @XmlTransient
    public Set<Invest> getInvestSet() {
        return investSet;
    }

    public void setInvestSet(Set<Invest> investSet) {
        this.investSet = investSet;
    }

    @XmlTransient
    public Set<Project> getProjectSet() {
        return projectSet;
    }

    public void setProjectSet(Set<Project> projectSet) {
        this.projectSet = projectSet;
    }

    @XmlTransient
    public Set<Task> getTaskSet() {
        return taskSet;
    }

    public void setTaskSet(Set<Task> taskSet) {
        this.taskSet = taskSet;
    }

    public Department getIdDepartment() {
        return idDepartment;
    }

    public void setIdDepartment(Department idDepartment) {
        this.idDepartment = idDepartment;
    }

    public Position getIdPosition() {
        return idPosition;
    }

    public void setIdPosition(Position idPosition) {
        this.idPosition = idPosition;
    }

    @XmlTransient
    public Set<Category> getCategorySet() {
        return categorySet;
    }

    public void setCategorySet(Set<Category> categorySet) {
        this.categorySet = categorySet;
    }

    @XmlTransient
    public Set<Discuss> getDiscussSet() {
        return discussSet;
    }

    public void setDiscussSet(Set<Discuss> discussSet) {
        this.discussSet = discussSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Personnel)) {
            return false;
        }
        Personnel other = (Personnel) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dan.pojo.Personnel[ id=" + id + " ]";
    }
}
