/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ObjectInterfaces;

/**
 *
 * @author Fabio Ricchiuti <Fab1234@hotmail.it>
 */
public class organizzatore {
    private String email,nome,cognome;
    private Boolean pass;

    public organizzatore() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public Boolean isPass() {
        return pass;
    }

    public void setPass(Boolean pass) {
        this.pass = pass;
    }
    
    }
