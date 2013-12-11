/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Implementazione;

import Modello.AutenticazioneDataLayer;
import Modello.CentralDataLayer;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;


public class CentralDataLayerMySqlImpl implements CentralDataLayer {

    
        @Override
        public Connection getConnection(ServletContext c)  {
        DataSource ds = (DataSource) c.getAttribute("datasource");
            try {
                return ds.getConnection();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());}
            return null;
    }

    @Override
    public AutenticazioneDataLayer getAutenticazioneDataLayer() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
