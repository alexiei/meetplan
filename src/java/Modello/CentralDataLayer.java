/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Modello;

import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletContext;

/**
 *
 * @author Fabio Ricchiuti <Fab1234@hotmail.it>
 */
public interface CentralDataLayer {
    Connection getConnection(ServletContext c);
    AutenticazioneDataLayer getAutenticazioneDataLayer();
}
