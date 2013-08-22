package modmantenimiento.util;

import com.zarcillo.service.TipoCuentaBancariaService;
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
public class BusquedaTipoPago extends SelectorComposer {
       
    @Wire
    private Listbox lstTipopago;    
    @Wire
    private Window WinBtipopago;
    @WireVariable
    TipoCuentaBancariaService tipoCuentaBancariaService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloTipopago;
    
    @Listen("onCreate=window#WinBtipopago")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) WinBtipopago.getFellow("mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }    
    
    public void initComponets(){
        modeloTipopago=new ListModelList(tipoCuentaBancariaService.listaGeneral());
        lstTipopago.setModel(modeloTipopago);
        lstTipopago.onInitRender();
        menuresultado.setSize(modeloTipopago.getSize());
    }      
}