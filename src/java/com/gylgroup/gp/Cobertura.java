/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gylgroup.gp;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author gyl
 */
@Entity
@Table(name = "cobertura")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cobertura.findAll", query = "SELECT c FROM Cobertura c")
    , @NamedQuery(name = "Cobertura.findById", query = "SELECT c FROM Cobertura c WHERE c.id = :id")
    , @NamedQuery(name = "Cobertura.findByDescripcion", query = "SELECT c FROM Cobertura c WHERE c.descripcion = :descripcion")})
public class Cobertura implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 200)
    @Column(name = "descripcion")
    private String descripcion;
    @JoinTable(name = "medicocobertura", joinColumns = {
        @JoinColumn(name = "idcobertura", referencedColumnName = "id")}, inverseJoinColumns = {
        @JoinColumn(name = "idmedico", referencedColumnName = "id")})
    @ManyToMany
    @JsonIgnore
    private Collection<Medico> medicoCollection;

    public Cobertura() {
    }

    public Cobertura(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @XmlTransient
    public Collection<Medico> getMedicoCollection() {
        return medicoCollection;
    }

    public void setMedicoCollection(Collection<Medico> medicoCollection) {
        this.medicoCollection = medicoCollection;
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
        if (!(object instanceof Cobertura)) {
            return false;
        }
        Cobertura other = (Cobertura) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.gylgroup.gp.Cobertura[ id=" + id + " ]";
    }
    
}
