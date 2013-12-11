/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package include;

/**
 *
 * @author Fabio Ricchiuti <Fab1234@hotmail.it>
 */
public class support_functions {
    
    static public Boolean CheckEmailFormat(String e){
        
        String EMAIL_REGEX = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
        
        return e.matches(EMAIL_REGEX);
        
    }
    
}
