/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.frank.sistema_colaborativo;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import modelo.Usuario;
import java.sql.Date;
/**
 *
 * @author dani3
 */
public class Prueba {
    
    private static EntityManager manger;
    private static EntityManagerFactory emf;
    
    
    public static void main(String[] args) {
    emf= Persistence.createEntityManagerFactory("Persistencia");
    manger=emf.createEntityManager();
    Usuario usuario = new Usuario();
    Date nacimiento=new Date(1996,8, 01);
    usuario.setUsername("frankAlumno");
    usuario.setCorreo("frank@frank");
    usuario.setNombre("frank");
    usuario.setDireccion("frankopolis");
    usuario.setFechaNacimiento(nacimiento);
    usuario.setContrasena("123");
    usuario.setNumero(123);
    usuario.setTipoUsuario("alumno");
            
        
    
    
    manger.getTransaction().begin();
    manger.persist(usuario);
    manger.getTransaction().commit();

    System.out.println("FUNCIONA");    
        
    }
}
