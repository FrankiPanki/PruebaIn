package modelo;
// Generated 2/10/2018 03:11:32 PM by Hibernate Tools 4.3.1

import javax.persistence.OneToMany;
import java.util.ArrayList;
import java.util.List;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.Id;

/**
 * Nivel generated by hbm2java
 */
@Entity
@Table(name = "Nivel")
public class Nivel  implements Serializable {

    @Id
    @Column(name = "idNivel")
     private int idNivel;
    @Column(name = "nivel")
     private String nivel;
    @OneToMany(mappedBy = "iIdNivel")
     private List<Interesar> interesar = new ArrayList<>();
    @OneToMany(mappedBy = "mIdNivel")
     private List<Materia> materia  = new ArrayList<>();

    public Nivel() {
    }

	
    public Nivel(int idNivel, String nivel) {
        this.idNivel = idNivel;
        this.nivel = nivel;
    }
    public Nivel(int idNivel, String nivel, List<Interesar> interesar, List<Materia> materia ) {
       this.idNivel = idNivel;
       this.nivel = nivel;
       this.interesar = interesar;
       this.materia = materia;
    }
   
    public int getIdNivel() {
        return this.idNivel;
    }
    
    public void setIdNivel(int idNivel) {
        this.idNivel = idNivel;
    }
    public String getNivel() {
        return this.nivel;
    }
    
    public void setNivel(String nivel) {
        this.nivel = nivel;
    }
    public List<Interesar> getInteresar() {
        return this.interesar;
    }
    
    public void setInteresar(List<Interesar> interesar) {
        this.interesar = interesar;
    }
    public List<Materia> getMateria() {
        return this.materia;
    }
    
    public void setMateria(List<Materia> materia ) {
        this.materia = materia;
    }




}


