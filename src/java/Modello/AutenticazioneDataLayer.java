/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Modello;

/**
 *
 * @author Fabio Ricchiuti <Fab1234@hotmail.it>
 */
public interface AutenticazioneDataLayer {
    
   Boolean Login(String email, String Password);
   void Logout();
   Boolean isAmministratore();
    
}
