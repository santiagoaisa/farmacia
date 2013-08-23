package modprueba;

import com.zarcillo.domain.Linea;
import com.zarcillo.domain.Usuario;
import com.zarcillo.dto.almacen.InventarioValorizado;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import org.zkoss.zul.Listcell;

/**
 *
 * @author saisa
 */
public class NewClass {

    String[] campos = {"idlinea", "ncosto", "pcosto", "nporcentaje", "idlinea.idusuario", "idlinea.nincremento"};

    public static void main(String[] args) {
        InventarioValorizado inventario=new InventarioValorizado();        
        Linea linea=new Linea(4);
        linea.setCnomlinea("UNA LINEA");
        linea.setNincremento(new BigDecimal("19"));
        
        Usuario usuario=new Usuario(1);
        usuario.setCnomusuario("USUARIO DEMO");
        linea.setIdusuario(usuario);
        inventario.setIdlinea(linea);
        
        NewClass nuevo=new NewClass();
        nuevo.mostrar(inventario);
        
    }

    public void mostrar(Object objeto) {
        Class klass = objeto.getClass();
        Field properties[] = klass.getDeclaredFields();
        try {

            String campo;            
            for (int p = 0; p < campos.length; p++) {
                campo = campos[p].trim().toUpperCase();

                String cpropiedad;
                String cpropiedadinterna;
                for (int i = 0; i < properties.length; i++) {
                    Field field = properties[i];
                    field.setAccessible(true);
                    cpropiedad = field.getName().toUpperCase();
                    ////////////////
                    if (cpropiedad.contains(campo)) {
                        System.out.println(cpropiedad);
                        System.out.println(field.get(objeto) + "");
                        break;
                    } else {
                        //PROPIEDADES DE OBJETOS INTERNOS                        
                        Object objetointerno = field.get(objeto);
                            if(objetointerno==null){
                                continue;
                            }                        
                        Class klassinterno = objetointerno.getClass();
                        Field propertiesinternas[] = klassinterno.getDeclaredFields();
                        for (int in = 0; in < propertiesinternas.length; in++) {
                            Field fieldinterno = propertiesinternas[in];
                            fieldinterno.setAccessible(true);
                            cpropiedadinterna = cpropiedad + "." + fieldinterno.getName().toUpperCase();
                            System.out.println(cpropiedadinterna);
                            if (cpropiedadinterna.contains(campo)) {
                                System.out.println(fieldinterno.get(objetointerno) + "");

                                break;
                            }
                        }

                    }

                }//fin for propiedad de clase
            }//fin for campo personalizado
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
