/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modmantenimiento.util;

import com.zarcillo.service.AlmacenService;
import javax.naming.NamingException;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.Path;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Window;


@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class BusquedaAlmacen extends SelectorComposer {
    
    @Wire
    private Window WinBalmacen;
    
    @Wire
    private Listbox lstAlmacen;
    
    @WireVariable
    AlmacenService almacenService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloAlmacen;
    
    @Listen("onCreate=window#WinBalmacen")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/WinBalmacen/mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    public void initComponets(){
        modeloAlmacen=new ListModelList(almacenService.listaGeneral());
        lstAlmacen.setModel(modeloAlmacen);
        lstAlmacen.onInitRender();
        menuresultado.setSize(modeloAlmacen.getSize());
    }  
}
