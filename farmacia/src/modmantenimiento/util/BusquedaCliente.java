package modmantenimiento.util;

import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.service.ClienteService;
import javax.naming.NamingException;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class BusquedaCliente extends SelectorComposer {
       
    @Wire
    private Window WinBcliente;
            
    @Wire
    private Listbox lstCliente; 
        
    @WireVariable
    ClienteService clienteService;
    
    private ListModelList modeloCliente;
    
    @Listen("onCreate=window#WinBcliente")
    public void onCreate() throws NamingException {
       initComponets();
     }
    
    
    public void initComponets(){
        UnidadNegocio unidad= (UnidadNegocio) WinBcliente.getAttribute("UNIDAD");
        modeloCliente=new ListModelList(clienteService.listaPorIdunidad(unidad.getIdunidad()));
        lstCliente.setModel(modeloCliente);
        lstCliente.onInitRender();
    }      
}

