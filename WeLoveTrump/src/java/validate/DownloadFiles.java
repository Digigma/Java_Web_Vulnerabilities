/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package validate;

import java.util.HashSet;
import java.util.Set;
import org.owasp.esapi.AccessReferenceMap;
import org.owasp.esapi.reference.RandomAccessReferenceMap;

/**
 *
 * @author digig
 */
public class DownloadFiles {
    public static AccessReferenceMap getDownloadFiles()
    {
        Set filesSet=new HashSet();
        filesSet.add("secretdoc1.pdf");
        filesSet.add("secretdoc2.pdf");
        return new RandomAccessReferenceMap(filesSet);
    }
    
}
