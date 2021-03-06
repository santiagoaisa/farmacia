package modventas.registro;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.CondicionVenta;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.MotivoSalida;
import com.zarcillo.domain.Movimiento;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.Usuario;
import com.zarcillo.domain.Vendedor;
import com.zarcillo.dto.venta.DetalleVenta;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.CondicionVentaService;
import com.zarcillo.service.DocumentoService;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.PeriodoService;
import com.zarcillo.service.UsuarioService;
import com.zarcillo.service.VentaService;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintCamposObligatorios;
import modventas.util.ConstraintMaximoStock;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Button;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Datebox;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.Intbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listcell;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class NuevaVenta extends SelectorComposer {

    private Usuario usuario;
    private RegistroSalida regsalida = new RegistroSalida();
    private ListModelList modeloAlmacen;
    private ListModelList modeloDetalle;
    private ListModelList modeloCondicion;
    private ListModelList modeloMotivo;
    private ListModelList modeloVendedor;
    private Periodo periodo;
    @Wire
    private Window winVenta;
    @Wire
    private Combobox cboAlmacen;
    @Wire
    private Combobox cboCondicion;
    @Wire
    private Combobox cboMotivo;
    @Wire
    private Combobox cboVendedor;
    @Wire
    private Datebox dFecha;
    @Wire
    private Button btnAgregar;
    @Wire
    private Toolbarbutton btnRegistrar;
    @Wire
    private Listbox lstDetalle;
    @Wire
    private Intbox nPlazo;
    @Wire
    private Decimalbox nInafecto;
    @Wire
    private Decimalbox nIgv;
    @Wire
    private Decimalbox nValven;
    @Wire
    private Decimalbox nImporte;
    @Wire
    private Decimalbox nRedondeo;
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    VentaService ventaService;
    @WireVariable
    AlmacenService almacenService;
    @WireVariable
    PeriodoService periodoService;
    @WireVariable
    CondicionVentaService condicionVentaService;
    @WireVariable
    DocumentoService documentoService;
    private String user_login;
    final Execution exec = Executions.getCurrent();

    @Listen("onCreate=window#winVenta")
    public void onCreate() throws NamingException {
        initComponets();
    }

    @Listen("onClick = #btnAgregar")
    public void onAgregarNuevo(Event event) {
        agregarDetalle();
    }

    @Listen("onClick = #btnRegistrar")
    public void onAgregarImprimir(Event event) {
        registrar();
    }
    
    @Listen("onSelect= #cboCondicion")
    public void oncargarPlazo(Event event) {
        cargarPlazo();
        nPlazo.select();
    }

    @Listen("  onBlur = intbox#i0,intbox#i1 ")
    public void calcular() {
        cargarPie();
    }
    
    
    
    @Listen("  onOK = intbox#i0 ")
    public void onFocoMenudeo(Event event) {
        Intbox sub = (Intbox) event.getTarget();
        Listitem item = (Listitem) (sub.getParent().getParent());
        DetalleVenta detven =  (DetalleVenta) modeloDetalle.getElementAt(item.getIndex());
        sub.setConstraint(new ConstraintMaximoStock(detven.getNstock()));
        sub.getValue();
        Listcell celda6 = (Listcell) item.getChildren().get(6);
        Intbox cantidad = (Intbox) celda6.getFirstChild();
        cantidad.focus();
        cantidad.select();
        cargarPie();
    }
    
    @Listen("  onOK = intbox#i1 ")    
    public void onFocoAgregar(Event event) {
        Intbox sub = (Intbox) event.getTarget();
        Listitem item = (Listitem) (sub.getParent().getParent());
        DetalleVenta detven =  (DetalleVenta) modeloDetalle.getElementAt(item.getIndex());
        sub.setConstraint(new ConstraintMaximoStock(detven.getNstockfraccion()));
        sub.getValue();
        if(detven.getNcanart()>0&&detven.getNcanartm()>0){
                throw new ExceptionZarcillo("No se puede vender en unidades y menudeo...");
         }
        cargarPie();
        btnAgregar.focus();
    }

    @Listen("onClick = #btnQuitar")
    public void onQuitarDetalle(Event event) {
        Toolbarbutton btn = (Toolbarbutton) event.getTarget();
        Listitem item = (Listitem) (btn.getParent().getParent());
        borrarProducto(item.getIndex());
        btnAgregar.focus();
    }

    public void initComponets() {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        modeloAlmacen = new ListModelList(almacenService.listaPorClogin(usuario.getClogin())); 
        cboAlmacen.setModel(modeloAlmacen);
        if (modeloAlmacen.size() > 0) {
            cboAlmacen.onInitRender(new Event("", cboAlmacen));
            cboAlmacen.close();
            cboAlmacen.setSelectedIndex(0);
        }
        modeloCondicion = new ListModelList(ventaService.listaCondicion());
        cboCondicion.setModel(modeloCondicion);
        if (modeloCondicion.size() > 0) {
            cboCondicion.onInitRender(new Event("", cboCondicion));
            cboCondicion.close();
            cboCondicion.setSelectedIndex(0);
            cargarPlazo();
        }
        modeloMotivo = new ListModelList(ventaService.listaMotivo());
        cboMotivo.setModel(modeloMotivo);
        if (modeloMotivo.size() > 0) {
            cboMotivo.onInitRender(new Event("", cboMotivo));
            cboMotivo.close();
            cboMotivo.setSelectedIndex(0);
        }
        modeloVendedor = new ListModelList(ventaService.listaVendedorPorIdusuario(usuario.getIdusuario()));
        cboVendedor.setModel(modeloVendedor);
        if (modeloVendedor.size() > 0) {
            cboVendedor.onInitRender(new Event("", cboVendedor));
            cboVendedor.close();
            cboVendedor.setSelectedIndex(0);
        }
        modeloDetalle = new ListModelList();
        lstDetalle.setModel(modeloDetalle);
        periodo = periodoService.buscarPorDfecha(new Date());
        dFecha.setValue(new Date());
        btnAgregar.focus();
    }
    
    private void cargarPlazo(){
        CondicionVenta condicion=(CondicionVenta) modeloCondicion.getElementAt(cboCondicion.getSelectedIndex());
        nPlazo.setValue(condicion.getNplazo());
    }

    private void borrarProducto(int index) {
        int resp2 = 0;
        resp2 = Messagebox.show("¿Desea eliminar registro?", "Venta", Messagebox.YES | Messagebox.NO, Messagebox.QUESTION);
        if (resp2 == Messagebox.YES) {
            DetalleVenta detalle = (DetalleVenta) modeloDetalle.getElementAt(index);
            modeloDetalle.remove(detalle);
        }
        cargarPie();
    }

    private void agregarDetalle() {
        if(modeloDetalle.getSize()==8)
        {
            throw new  ExceptionZarcillo("Tope de Items");
        }
        cboCondicion.setDisabled(true);
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        CondicionVenta condicion=(CondicionVenta) modeloCondicion.getElementAt(cboCondicion.getSelectedIndex());
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/ventas/util/agregardetalleventa.zul", null, null);
        winbuscaprod.setAttribute("ALMACEN", almacen);
        winbuscaprod.setAttribute("CONDICION", condicion);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            DetalleVenta detventa = (DetalleVenta) winbuscaprod.getAttribute("DETALLEVENTA");
            modeloDetalle.add(detventa);
            lstDetalle.onInitRender();
            focoCantidad();
            cargarPie();
        } else {
            btnRegistrar.focus();
        }
    }
    
    private void focoCantidad(){
        Listitem fila = lstDetalle.getItemAtIndex(modeloDetalle.getSize() - 1);
        Listcell celda5 = (Listcell) fila.getChildren().get(5);
        Intbox cantidad = (Intbox) celda5.getFirstChild();
        cantidad.focus();
        cantidad.select();
    }

    private void cargarPie() {
        BigDecimal nsubtot = new BigDecimal(BigInteger.ZERO);
        BigDecimal nigv = new BigDecimal(BigInteger.ZERO);
        BigDecimal nprecio = new BigDecimal(BigInteger.ZERO);
        List<Listitem> ldatos = lstDetalle.getItems();
        DetalleVenta detalleventa;
        for (Listitem item : ldatos) {
            detalleventa = (DetalleVenta) modeloDetalle.getElementAt(item.getIndex());
            if (detalleventa.getNcanart() > 0 && detalleventa.getNcanartm() > 0) {
                throw new ExceptionZarcillo("No se puede vender en unidades y menudeo...");
            }
            nsubtot = nsubtot.add(detalleventa.getNsubtot());
            nigv = nigv.add(detalleventa.getNigv());
            nprecio = nprecio.add(detalleventa.getNimporte());
        }

        regsalida.setMovimientoCollection(llenarDetalle());
        regsalida.calcula(periodo.getNigv());
        nInafecto.setValue(regsalida.getNinafecto());
        nValven.setValue(regsalida.getNafecto());
        nIgv.setValue(regsalida.getNigv());
        nRedondeo.setValue(regsalida.getNredondeo());
        nImporte.setValue(regsalida.getNimporte());
    }

    private List<Movimiento> llenarDetalle() {
        List<Movimiento> coldetalle = new ArrayList<Movimiento>();
        List<Listitem> ldatos = lstDetalle.getItems();
        DetalleVenta detalleventa;
        Movimiento movimiento;
        for (Listitem item : ldatos) {
            movimiento = new Movimiento();
            detalleventa = new DetalleVenta();
            detalleventa = (DetalleVenta) modeloDetalle.getElementAt(item.getIndex());
            if (!((detalleventa.getNcanart() == 0) && (detalleventa.getNcanartm() == 0))) {
                movimiento.setIdproducto(detalleventa.getExistencia().getIdproducto());
                movimiento.setIdalmacen(detalleventa.getExistencia().getIdalmacen());
                movimiento.setNcosuni(detalleventa.getNcosuni());
                movimiento.setNvaluni(detalleventa.getNvaluni());
                if (detalleventa.getNcanartm() > 0) {
                    movimiento.setNcosuni(detalleventa.getNcosunim());
                    movimiento.setNvaluni(detalleventa.getNvalunim());
                }
                movimiento.setNcantidad(detalleventa.getNcanart());
                movimiento.setNcantidadm(detalleventa.getNcanartm());
                movimiento.setNstock(detalleventa.getNstock());
                movimiento.setNstockm(detalleventa.getNstockm());
                movimiento.setNdesfin(detalleventa.getNdesfin());
                movimiento.setNdeslab(detalleventa.getNdeslab());
                movimiento.setNdesbon(detalleventa.getNdesbon());
                movimiento.setNsubtot(detalleventa.getNsubtot());
                movimiento.setBinafecto(detalleventa.isBinafec());
                coldetalle.add(movimiento);
            }
        }
        return coldetalle;
    }

    private void validar() {
        cboAlmacen.setConstraint(new ConstraintCamposObligatorios());
        cboAlmacen.getValue();
    }

    public void registrar() {
        validar();
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        CondicionVenta condicion = (CondicionVenta) modeloCondicion.getElementAt(cboCondicion.getSelectedIndex());
        MotivoSalida motivo = (MotivoSalida) modeloMotivo.getElementAt(cboMotivo.getSelectedIndex());
        Vendedor vendedor = (Vendedor) modeloVendedor.getElementAt(cboVendedor.getSelectedIndex());
        regsalida.setIdusuario(usuario);
        regsalida.setIdunidad(almacen.getIdunidad());
        regsalida.setIdcondicion(condicion);
        regsalida.setNplazo(nPlazo.getValue());                
        regsalida.setIdmotivo(motivo);
        regsalida.setIdvendedor(vendedor);
        regsalida.setDfecha(dFecha.getValue());
        regsalida.setDfecdig(dFecha.getValue());
        regsalida.setIddocumento(documentoService.buscarPorCcodigosunat(Documento.BOLETA_SUNAT.getCcodigosunat()));
        regsalida.setMovimientoCollection(llenarDetalle());
        int operacion = ventaService.registrar(regsalida, almacen);
        Messagebox.show("OPERACION: " + operacion, "REGISTRO SATISFACTORIO", Messagebox.OK, Messagebox.INFORMATION);

    }
}
