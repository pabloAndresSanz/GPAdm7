/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gylgroup.gp.service;

import java.util.Set;
import javax.ws.rs.core.Application;

/**
 *
 * @author Administrator
 */
@javax.ws.rs.ApplicationPath("webresources")
public class ApplicationConfig extends Application {

    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> resources = new java.util.HashSet<>();
        addRestResourceClasses(resources);
        return resources;
    }

    /**
     * Do not modify addRestResourceClasses() method.
     * It is automatically populated with
     * all resources defined in the project.
     * If required, comment out calling this method in getClasses().
     */
    private void addRestResourceClasses(Set<Class<?>> resources) {
        resources.add(com.gylgroup.gp.service.AgendaFacadeREST.class);
        resources.add(com.gylgroup.gp.service.CoberturaFacadeREST.class);
        resources.add(com.gylgroup.gp.service.DireccionFacadeREST.class);
        resources.add(com.gylgroup.gp.service.EspecialidadFacadeREST.class);
        resources.add(com.gylgroup.gp.service.MedicoFacadeREST.class);
        resources.add(com.gylgroup.gp.service.ProvinciaFacadeREST.class);
        resources.add(com.gylgroup.gp.service.TelefonoFacadeREST.class);
        resources.add(com.gylgroup.gp.service.TurnoFacadeREST.class);
    }
    
}
