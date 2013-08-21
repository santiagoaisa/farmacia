package modventas.util;

import modmantenimiento.util.MenuResultado;
import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.CondicionVenta;
import com.zarcillo.dto.venta.DetalleVenta;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.VentaService;
import javax.naming.NamingException;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.Path;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Intbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class AgregarDetalleVenta extends SelectorComposer {
    
    @Wire
    private Window winDetalleVenta;
    
    @Wire
    private Listbox lstExistencia;
    
    @Wire
    private Textbox txtDescripcion;
    
    @Wire
    private Textbox txtReseta;
        
    @WireVariable
    VentaService ventaService;
    
    private MenuResultado menuresultado;
    private ListModelList modeloExistencia;
    private Almacen almacen;
    private CondicionVenta condicion;
    
    @Listen("onCreate=window#winDetalleVenta")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winDetalleVenta/mresultado");
        menuresultado = (MenuResultado) macro.getChildren().get(0);
        initComponets();
     }
    
    @Listen("onOK = #txtDescripcion")
    public void onFocoNombre(Event event) {
        buscar(txtDescripcion.getText().trim());
    }
    @Listen("onOK = #txtReseta")
    public void onBusquedaReceta(Event event) {
        buscarReceta(txtReseta.getText().trim());
    }
    
    @Listen("onOK = #i0   ")
    public void onFocoSubtotal0(Event event) {
        Intbox sub = (Intbox) event.getTarget();
        Listitem item = (Listitem) (sub.getParent().getParent());
        DetalleVenta detven =  (DetalleVenta) modeloExistencia.getElementAt(item.getIndex());
        sub.setConstraint(new ConstraintMaximoStock(detven.getNstock()));
        sub.getValue();
        if(detven.getNcanart()>0&&detven.getNcanartm()>0){
                throw new ExceptionZarcillo("No se puede vender en unidades y menudeo...");
         }
        winDetalleVenta.setAttribute("DETALLEVENTA",detven );
        winDetalleVenta.setAttribute("REST",true );
        winDetalleVenta.onClose();
    }
    @Listen("onOK =  #i1  ")
    public void onFocoSubtotal1(Event event) {
        Intbox sub = (Intbox) event.getTarget();
        Listitem item = (Listitem) (sub.getParent().getParent());
        DetalleVenta detven =  (DetalleVenta) modeloExistencia.getElementAt(item.getIndex());
        sub.setConstraint(new ConstraintMaximoStock(detven.getNstockfraccion()));
        sub.getValue();
        if(detven.getNcanart()>0&&detven.getNcanartm()>0){
                throw new ExceptionZarcillo("No se puede vender en unidades y menudeo...");
         }
        winDetalleVenta.setAttribute("DETALLEVENTA",detven );
        winDetalleVenta.setAttribute("REST",true );
        winDetalleVenta.onClose();
    }
    
    @Listen("onOK = #lstExistencia ")
    public void onEnviarDetalle() {        
        DetalleVenta detven =  (DetalleVenta) modeloExistencia.getElementAt(lstExistencia.getSelectedIndex());        
        winDetalleVenta.setAttribute("DETALLEVENTA",detven );
        winDetalleVenta.setAttribute("REST",true );
        winDetalleVenta.onClose();
    }
    
    
    public void initComponets(){
        almacen=(Almacen) winDetalleVenta.getAttribute("ALMACEN");
        condicion=(CondicionVenta) winDetalleVenta.getAttribute("CONDICION");
        modeloExistencia=new ListModelList();
        lstExistencia.setModel(modeloExistencia);
        lstExistencia.onInitRender();
        menuresultado.setSize(modeloExistencia.getSize());
        txtDescripcion.focus();
    }      
    public void buscarReceta(String criterio) {
        if (criterio.length() >= 3) {
            modeloExistencia=new ListModelList(ventaService.busquedaListaPorIdalmacenPorReceta(almacen.getIdalmacen(),criterio,condicion));
            lstExistencia.setModel(modeloExistencia);
            lstExistencia.onInitRender();
            menuresultado.setSize(modeloExistencia.getSize());
            if (lstExistencia.getItemCount() > 0) {
                lstExistencia.setSelectedIndex(0);
                lstExistencia.getSelectedItem().focus();
            } else {
                txtDescripcion.focus();
            }
        }
    }
    public void buscar(String criterio) {
        if (criterio.length() >= 3) {
            modeloExistencia=new ListModelList(ventaService.busquedaListaPorIdalmacenPorDescripcion(almacen.getIdalmacen(),criterio,condicion));
            lstExistencia.setModel(modeloExistencia);
            lstExistencia.onInitRender();
            menuresultado.setSize(modeloExistencia.getSize());
            if (lstExistencia.getItemCount() > 0) {
                lstExistencia.setSelectedIndex(0);
                lstExistencia.getSelectedItem().focus();
            } else {
                txtDescripcion.focus();
            }
        }
    }
    private void validarDetalle(){
        
    }
}