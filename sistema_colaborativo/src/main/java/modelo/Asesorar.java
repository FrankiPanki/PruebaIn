package modelo;
// Generated 2/10/2018 03:11:32 PM by Hibernate Tools 4.3.1


import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 * Asesorar generated by hbm2java
 */
@Entity
@Table(name = "Asesorar")
public class Asesorar  implements Serializable {

    @Id
    @Column(name = "idAsesorar")
     private int idAsesorar;
    @Column(name = "aIdAlumno")
    @ManyToOne(fetch = FetchType.LAZY)
     private Alumno aIdAlumno;
    @Column(name = "aIdHorario")
    @ManyToOne(fetch = FetchType.LAZY)
     private Horario aIdHorario;
    @Column(name = "aIdProfesor")
    @ManyToOne(fetch = FetchType.LAZY)
     private Profesor aIdProfesor;
    @Column(name = "aIdTema")     
    @ManyToOne(fetch = FetchType.LAZY)
     private Tema aIdTema;

    public Asesorar() {
    }

    public Asesorar(int idAsesorar, Alumno aIdAlumno, Horario aIdHorario, Profesor aIdProfesor, Tema aIdTema) {
       this.idAsesorar = idAsesorar;
       this.aIdAlumno = aIdAlumno;
       this.aIdHorario = aIdHorario;
       this.aIdProfesor = aIdProfesor;
       this.aIdTema = aIdTema;
    }
   
    public int getAsesorar() {
        return this.idAsesorar;
    }
    
    public void setAsesorar(int idAsesorar) {
        this.idAsesorar = idAsesorar;
    }
    public Alumno getAlumno() {
        return this.aIdAlumno;
    }
    
    public void setAlumno(Alumno aIdAlumno) {
        this.aIdAlumno = aIdAlumno;
    }
    public Horario getHorario() {
        return this.aIdHorario;
    }
    
    public void setHorario(Horario aIdHorario) {
        this.aIdHorario = aIdHorario;
    }
    public Profesor getProfesor() {
        return this.aIdProfesor;
    }
    
    public void setProfesor(Profesor aIdProfesor) {
        this.aIdProfesor = aIdProfesor;
    }
    public Tema getTema() {
        return this.aIdTema;
    }
    
    public void setTema(Tema aIdTema) {
        this.aIdTema = aIdTema;
    }




}


