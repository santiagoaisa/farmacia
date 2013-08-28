package modprueba;

import com.zarcillo.domain.Linea;
import com.zarcillo.domain.Rol;
import com.zarcillo.domain.Usuario;
import com.zarcillo.dto.almacen.InventarioValorizado;
import com.zarcillo.dto.almacen.Kardex;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import org.zkoss.zul.Listcell;

/**
 *
 * @author saisa
 */
public class NewClass {

    String[] campos = {"nventa", "nventam"};

    public static void main(String[] args) {
        String c = "003";
        Kardex kardex = new Kardex();
        NewClass n = new NewClass();
        kardex.setNventa(100);
        kardex.setNventam(null);
        n.mostrar(kardex);

    }

    public void mostrar(Object objeto) {
        Class klass = objeto.getClass();
        Field properties[] = klass.getDeclaredFields();
        try {

            String campo;
            Listcell celda;
            for (int p = 0; p < campos.length; p++) {
                campo = campos[p].trim().toUpperCase();

                String cpropiedad;
                String cpropiedadinterna;
                String cpropiedadmuyinterna;
                for (int i = 0; i < properties.length; i++) {
                    Field field = properties[i];
                    field.setAccessible(true);
                    cpropiedad = field.getName().toUpperCase();
                    System.out.println(cpropiedad);
                    ////////////////
                    if (cpropiedad.equals(campo)) {
                        
                         System.out.println(field.get(objeto) + "a");
                        break;
                    } else {
                        //PROPIEDADES DE OBJETOS INTERNOS
                        Object objetointerno = field.get(objeto);
                        if (objetointerno == null) {
                            continue;
                        }

                        Class klassinterno = objetointerno.getClass();
                        Field propertiesinternas[] = klassinterno.getDeclaredFields();
                        for (int in = 0; in < propertiesinternas.length; in++) {
                            Field fieldinterno = propertiesinternas[in];
                            fieldinterno.setAccessible(true);
                            cpropiedadinterna = cpropiedad + "." + fieldinterno.getName().toUpperCase();

                            if (cpropiedadinterna.equals(campo)) {
                                System.out.println(fieldinterno.get(objetointerno) + "b");
                                break;
                            } else {
                                //PROPIEDADES DE OBJETOS INTERNOS
                                Object objetomuyinterno = fieldinterno.get(objetointerno);
                                if (objetomuyinterno == null) {
                                    continue;
                                }

                                Class klassmuyinterno = objetomuyinterno.getClass();
                                Field propiertermuyinterno[] = klassmuyinterno.getDeclaredFields();
                                for (int mi = 0; mi < propiertermuyinterno.length; mi++) {
                                    Field fielmuydinterno = propiertermuyinterno[mi];
                                    fielmuydinterno.setAccessible(true);
                                    cpropiedadmuyinterna = cpropiedadinterna + "." + fielmuydinterno.getName().toUpperCase();

                                    if (cpropiedadmuyinterna.equals(campo)) {
                                        System.out.println(fielmuydinterno.get(objetomuyinterno) + "c");
                                        break;
                                    }
                                }
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
