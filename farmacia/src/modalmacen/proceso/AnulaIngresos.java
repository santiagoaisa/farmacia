package modalmacen.proceso;

import com.zarcillo.domain.RegistroEntrada;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.RegistroEntradaService;
import com.zarcillo.service.UsuarioService;
import com.zarcillo.domain.Almacen;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Textbox;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.HashMap;
import javax.naming.NamingException;
import org.zkoss.zkex.zul.Jasperreport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.zkoss.zarcillo.ExportarHojaCalculo;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.*;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class AnulaIngresos extends SelectorComposer {

    private RegistroEntrada rentrada;
    private Usuario usuario;
    private ListModelList modeloDetalle;
    private ListModelList modeloAlmacen;
    @Wire
    private Window winDetalle;
    @Wire
    private Intbox nOperacion;
    @Wire
    private Textbox txtMotivo;
    @Wire
    private Textbox txtDocumento;
    @Wire
    private Textbox txtSerie;
    @Wire
    private Textbox txtNumero;
    @Wire
    private Combobox cboAlmacen;
    @Wire
    private Listbox lstDetalle;
    @Wire
    private Decimalbox nAfecto;
    @Wire
    private Decimalbox nInafecto;
    @Wire
    private Decimalbox nIgv;
    @Wire
    private Decimalbox nImporte;
    @Wire
    private Textbox txtObservacion;
     
    @WireVariable
    RegistroEntradaService registroEntradaService;
    @WireVariable
    AlmacenService almacenService;
    @WireVariable
    UsuarioService usuarioService;
    private String user_login;
    final Execution exec = Executions.getCurrent();

    @Listen("onCreate=window#winDetalle")
    public void onCreate() throws NamingException {
        initComponets();
    }
    
    @Listen("onClick = #btnImprimir")
    public void onImprimir(Event event) {
        imprimir();
    }
    
    @Listen("onClick = #btnExportar")
    public void onExportar(Event event) throws IOException {
        exportar();
    }
    
    @Listen("onClick = #btnEliminar")
    public void onEliminar(Event event) {
        eliminarIngreso();
    }
    
    @Listen("onClick = #btnIgnorar")
    public void onIgnorar(Event event) {
        limpiar();
    }
    
    @Listen("onOK = #nOperacion")
    public void onBuscarIngreso(Event event) throws IOException {
        buscarIngreso();
    }

    private void initComponets() {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        modeloAlmacen = new ListModelList(almacenService.listaPorClogin(usuario.getClogin()));
        cboAlmacen.setModel(modeloAlmacen);
        if (modeloAlmacen.size() > 0) {
            cboAlmacen.onInitRender(new Event("", cboAlmacen));
            cboAlmacen.close();
            cboAlmacen.setSelectedIndex(0);
        }
        nOperacion.focus();
    }
    private void buscarIngreso(){        
        Almacen almacen=(Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        rentrada=registroEntradaService.buscarPorIdalmacenPorIdregentrada(almacen.getIdalmacen(),nOperacion.getValue());
        llenarDatos();
    }
    
    private void llenarDatos(){
        winDetalle.setTitle(winDetalle.getTitle() + " - " + rentrada.getIdproveedor() + "");
        nOperacion.setValue(rentrada.getIdregentrada());
        txtMotivo.setText(rentrada.getIdmotivo().getCnommotivo());
        txtDocumento.setText(rentrada.getIddocumento().getCnomdocumento());
        txtSerie.setText(rentrada.getCserie());
        txtNumero.setText(rentrada.getCnumero());
        modeloDetalle = new ListModelList(registroEntradaService.listaDetalleIngreso(rentrada.getIdregentrada()));
        lstDetalle.setModel(modeloDetalle);
        nAfecto.setValue(rentrada.getNafecto());
        nInafecto.setValue(rentrada.getNinafecto());
        nIgv.setValue(rentrada.getNigv());
        nImporte.setValue(rentrada.getNimporte());
        txtObservacion.setText(rentrada.getCobservacion());
    }
    
    private void eliminarIngreso(){
        int resp2 = 0;
        resp2 = Messagebox.show("¿Desea eliminar registro?", "Ingreso", Messagebox.YES | Messagebox.NO, Messagebox.QUESTION);
        if (resp2 == Messagebox.YES) {
            registroEntradaService.anular(rentrada.getIdregentrada());
        }
        limpiar();
        
    }
    
    private void limpiar(){
        rentrada=new RegistroEntrada();
        winDetalle.setTitle("");
        nOperacion.setText("");
        txtMotivo.setText("");
        txtDocumento.setText("");
        txtSerie.setText("");
        txtNumero.setText("");
        modeloDetalle = new ListModelList();
        lstDetalle.setModel(modeloDetalle);
        nAfecto.setValue(new BigDecimal(BigInteger.ZERO));
        nInafecto.setValue(new BigDecimal(BigInteger.ZERO));
        nIgv.setValue(new BigDecimal(BigInteger.ZERO));
        nImporte.setValue(new BigDecimal(BigInteger.ZERO));
        txtObservacion.setText("");
        nOperacion.focus();
    }

    public void imprimir()  {
        HashMap parametro = new HashMap();
        parametro.put("RUTA", rentrada.getIdalmacen().getIdunidad().getIdempresa().getCruta());
        parametro.put("IDPROVEEDOR", rentrada.getIdproveedor().getCnomprovee());
        parametro.put("OPERACION", rentrada.getIdregentrada());
        parametro.put("DOCUMENTO", rentrada.getIddocumento().getCnomdocumento());
        parametro.put("SERIE", rentrada.getCserie());
        parametro.put("NUMERO", rentrada.getCnumero());
        parametro.put("FECHA", rentrada.getDfecha());
        parametro.put("UNIDADNEGOCIO", rentrada.getIdalmacen().getIdunidad().getCnomunidad());
        parametro.put("ALMACEN", rentrada.getIdalmacen().getCnomalmacen());
        parametro.put("NAFECTO", rentrada.getNafecto());
        parametro.put("NINAFECTO", rentrada.getNinafecto());
        parametro.put("IGV", rentrada.getNigv());
        parametro.put("TOTAL", rentrada.getNimporte());
        parametro.put("OBSERVACION", rentrada.getCobservacion());
        parametro.put("USUARIO", usuario.getCnomusuario());

        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modeloDetalle);
        Jasperreport rptreporte=new Jasperreport();
        rptreporte.setParent(winDetalle);
        rptreporte.setSrc("/modulos/almacen/reporte/detalleingreso.jasper");
        rptreporte.setDatasource(data);
        rptreporte.setParameters(parametro);
        rptreporte.setType("pdf");

    }
    public void exportar(){            
        ExportarHojaCalculo.exportListboxToExcel(lstDetalle, rentrada.getIdregentrada()+"");             
    }     
}