package modmantenimiento.util;

import com.zarcillo.service.ProveedorService;
import javax.naming.NamingException;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class BusquedaProveedor extends SelectorComposer {
       
    @Wire
    private Listbox lstProveedor; 
    
    @WireVariable
    ProveedorService proveedorService;
    
    private ListModelList modeloProveedor;
    
    @Listen("onCreate=window#WinBproveedor")
    public void onCreate() throws NamingException {
       initComponets();
     }
    
    
    public void initComponets(){
        modeloProveedor=new ListModelList(proveedorService.listaGeneral());
        lstProveedor.setModel(modeloProveedor);
        lstProveedor.onInitRender();
    }      
}