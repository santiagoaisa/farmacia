/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modprueba;

import com.zarcillo.domain.Producto;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author saisa
 */
public class Prueba {
    public static void main(String[] args) {
        List<Producto> listaProducto=new ArrayList<>();
        Producto p1=new Producto("p1");
        Producto p2=new Producto("p2");
        Producto p3=new Producto("p3");
        listaProducto.add(p1);
        listaProducto.add(p2);
        listaProducto.add(p3);
        
        for(Producto p:listaProducto){
            System.out.println(p.getIdproducto());
        }
        
    }
}
