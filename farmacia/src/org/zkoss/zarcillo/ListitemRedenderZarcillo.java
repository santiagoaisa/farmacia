package org.zkoss.zarcillo;

import java.lang.reflect.Field;
import org.zkoss.zul.Listcell;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.ListitemRenderer;

/**
 *
 * @author saisa
 */
public class ListitemRedenderZarcillo implements ListitemRenderer<Object> {

    private String[] campos;

    public ListitemRedenderZarcillo(String[] camposp) {
        this.campos = camposp;
    }

    @Override
    public void render(Listitem item, Object objeto, int index) throws Exception {
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
                    ////////////////
                    if (cpropiedad.equals(campo)) {
                        celda = new Listcell(field.get(objeto) + "");
                        item.appendChild(celda);
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
                                celda = new Listcell(fieldinterno.get(objetointerno) + "");
                                item.appendChild(celda);
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
                                        celda = new Listcell(fielmuydinterno.get(objetomuyinterno) + "");
                                        item.appendChild(celda);
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
