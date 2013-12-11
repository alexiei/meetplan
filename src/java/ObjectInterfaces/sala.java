/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ObjectInterfaces;

import java.util.List;

/**
 *
 * @author Fabio Ricchiuti <Fab1234@hotmail.it>
 */
public class sala {
    int id,capienza;
    String nome, descrizione;
    List<attrezzatura> attrezzi;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCapienza() {
        return capienza;
    }

    public void setCapienza(int capienza) {
        this.capienza = capienza;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public List<attrezzatura> getAttrezzi() {
        return attrezzi;
    }

    public void setAttrezzi(List<attrezzatura> attrezzi) {
        this.attrezzi = attrezzi;
    }
    
    
}
