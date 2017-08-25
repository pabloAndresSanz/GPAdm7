/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gylgroup.gp.service;

import com.gylgroup.gp.Medico;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.logging.Logger;
import javax.persistence.Query;
import com.fasterxml.jackson.databind.ObjectMapper;
/**
 *
 * @author gyl
 */
@Stateless
@Path("com.gylgroup.gp.medico")
public class MedicoFacadeREST extends AbstractFacade<Medico> {

    @PersistenceContext(unitName = "GPAdm7PU")
    private EntityManager em;

    public MedicoFacadeREST() {
        super(Medico.class);
    }

    @POST
    @Override
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void create(Medico entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void edit(@PathParam("id") Integer id, Medico entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Medico find(@PathParam("id") Integer id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Medico> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Medico> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces(MediaType.TEXT_PLAIN)
    public String countREST() {
        return String.valueOf(super.count());
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    @GET
    @Path("byCoberturaProvinciaEspecialidad/{cobertura}/{provincia}/{especialidad}")
    @Produces(MediaType.APPLICATION_JSON)
    public String findbyCoberturaProvinciaEspecialidad(@PathParam("cobertura") String cobertura,
            @PathParam("provincia") Integer provincia,
            @PathParam("especialidad") Integer especialidad) {
        String[] coberturas=cobertura.split(",");
        /* StringBuilder sb=new StringBuilder("select distinct md from Medicodireccion md, " +
                "IN(md.medico.coberturaCollection) c, " + 
                "IN(md.medico.especialidadCollection) e " +
                "where e.id=:idespecialidad " + 
                "and md.direccion.idprovincia.id=:idprovincia "); */
        StringBuilder sb=new StringBuilder("select distinct m from Medico m, " +
                "IN(m.coberturaCollection) c, " + 
                "IN(m.especialidadCollection) e, " +
                "IN(m.direccionCollection) d " +
                "where e.id=:idespecialidad " + 
                "and d.idprovincia.id=:idprovincia "); 
        if (coberturas.length>1) {
            sb.append("and (c.id=:idcobertura or c.id=1) ");
        }
        else {
            sb.append("and c.id=:idcobertura ");
        }
        sb.append("order by m.id");
        Query q=em.createQuery(sb.toString());
        q.setParameter("idcobertura", Integer.parseInt(coberturas[0]));
        q.setParameter("idespecialidad", especialidad);
        q.setParameter("idprovincia", provincia); 
        ObjectMapper om=new ObjectMapper();
            String result=null;
        try  {
            result=om.writeValueAsString(q.getResultList());
        }
        catch (Exception e) {
            Logger logger=Logger.getGlobal();
            logger.log(java.util.logging.Level.SEVERE, e.getMessage());
        }
        return result;
    }    

    
}
