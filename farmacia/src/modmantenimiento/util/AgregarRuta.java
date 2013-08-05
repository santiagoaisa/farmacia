package modmantenimiento.util;

import com.zarcillo.domain.Menu;
import com.zarcillo.domain.Modulo;
import com.zarcillo.service.MenuService;
import javax.naming.NamingException;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class AgregarRuta extends SelectorComposer {

    private ListModelList modeloMapa;    
    private Modulo modulo;
    private String temp;
    
    @Wire
    private Window winRuta;
    
    @Wire
    private Listbox lstMapa;
    
    @Wire
    private Textbox txtModulo;
    
    @WireVariable
    private MenuService menuService;
    
    
    @Listen("onCreate=window#winRuta")
    public void onCreate() throws NamingException {
        modulo= (Modulo) winRuta.getAttribute("MODULO");
        temp=  (String) winRuta.getAttribute("TEMP");
        initComponets();
     }

    private void initComponets() {
        llenarLista();
        txtModulo.setText(modulo.getCnommodulo());
    }

    private void llenarLista(){
        if(temp.equals("A"))
            modeloMapa = new ListModelList(menuService.listaPorIdmoduloMenuArchivo(modulo.getIdmodulo()));
        else if(temp.equals("P")){
            modeloMapa = new ListModelList(menuService.listaPorIdmoduloMenuProceso(modulo.getIdmodulo()));
        }
        else if(temp.equals("C")){
            modeloMapa = new ListModelList(menuService.listaPorIdmoduloMenuConsulta(modulo.getIdmodulo()));
        }
        else if(temp.equals("H")){
            modeloMapa = new ListModelList(menuService.listaPorIdmoduloMenuHerramienta(modulo.getIdmodulo()));
        }
        lstMapa.setModel(modeloMapa);
        lstMapa.onInitRender();
        if(modeloMapa.getSize()>0){
            lstMapa.setSelectedIndex(0);
            lstMapa.getSelectedItem().focus() ;
        }
    }
    public void validar(){
        Menu menu=(Menu) modeloMapa.getElementAt(lstMapa.getSelectedIndex());
        winRuta.setAttribute("MENU", menu);
        winRuta.setAttribute("REST", true);
        winRuta.onClose();
    }

}
