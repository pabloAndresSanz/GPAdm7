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
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author gyl
 */
@Entity
@Table(name = "medico")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Medico.findAll", query = "SELECT m FROM Medico m")
    , @NamedQuery(name = "Medico.findById", query = "SELECT m FROM Medico m WHERE m.id = :id")
    , @NamedQuery(name = "Medico.findByNombre", query = "SELECT m FROM Medico m WHERE m.nombre = :nombre")
    , @NamedQuery(name = "Medico.findByTurnoenmin", query = "SELECT m FROM Medico m WHERE m.turnoenmin = :turnoenmin")})
public class Medico implements Serializable {

    
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 200)
    @Column(name = "nombre")
    private String nombre;
    @Column(name = "turnoenmin")
    private Integer turnoenmin;
    @ManyToMany(mappedBy = "medicoCollection")
    private Collection<Especialidad> especialidadCollection;
    @ManyToMany(mappedBy = "medicoCollection")
    private Collection<Cobertura> coberturaCollection;
    @ManyToMany(mappedBy = "medicoCollection")
    private Collection<Direccion> direccionCollection;
    @JsonIgnore
    @OneToMany(mappedBy = "idmedico")
    private Collection<Turno> turnoCollection;

    public Medico() {
    }

    public Medico(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getTurnoenmin() {
        return turnoenmin;
    }

    public void setTurnoenmin(Integer turnoenmin) {
        this.turnoenmin = turnoenmin;
    }

    @XmlTransient
    public Collection<Especialidad> getEspecialidadCollection() {
        return especialidadCollection;
    }

    public void setEspecialidadCollection(Collection<Especialidad> especialidadCollection) {
        this.especialidadCollection = especialidadCollection;
    }

    @XmlTransient
    public Collection<Cobertura> getCoberturaCollection() {
        return coberturaCollection;
    }

    public void setCoberturaCollection(Collection<Cobertura> coberturaCollection) {
        this.coberturaCollection = coberturaCollection;
    }

    @XmlTransient
    public Collection<Direccion> getDireccionCollection() {
        return direccionCollection;
    }

    public void setDireccionCollection(Collection<Direccion> direccionCollection) {
        this.direccionCollection = direccionCollection;
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
        if (!(object instanceof Medico)) {
            return false;
        }
        Medico other = (Medico) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.gylgroup.gp.Medico[ id=" + id + " ]";
    }

    @XmlTransient
    public Collection<Turno> getTurnoCollection() {
        return turnoCollection;
    }

    public void setTurnoCollection(Collection<Turno> turnoCollection) {
        this.turnoCollection = turnoCollection;
    }
    
}
