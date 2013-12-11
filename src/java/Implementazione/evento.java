/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Implementazione;

/**
 *
 * @author Fabio Ricchiuti <Fab1234@hotmail.it>
 */
public class evento {
    int id,capienza;
    String nome, ubicazione;

    public evento() {
    }

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

    public String getUbicazione() {
        return ubicazione;
    }

    public void setUbicazione(String ubicazione) {
        this.ubicazione = ubicazione;
    }

}
