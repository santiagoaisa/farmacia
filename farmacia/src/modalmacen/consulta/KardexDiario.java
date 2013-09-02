package modalmacen.consulta;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.Producto;
import com.zarcillo.domain.RegistroEntrada;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.Usuario;
import com.zarcillo.dto.almacen.Kardex;
import com.zarcillo.dto.almacen.TotalKardex;
import com.zarcillo.negocio.Mes;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.ComprobanteEmitidoService;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.KardexService;
import com.zarcillo.service.PeriodoService;
import com.zarcillo.service.ProductoService;
import com.zarcillo.service.RegistroEntradaService;
import com.zarcillo.service.RegistroSalidaService;
import com.zarcillo.service.UsuarioService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.naming.NamingException;
import modalmacen.util.FiltroSalidaKardex;
import modmantenimiento.util.MenuPeriodo;
import modmantenimiento.util.PeriodoListener;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.apache.commons.collections.CollectionUtils;
import org.zkoss.zarcillo.ExportarHojaCalculo;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zul.Combobox;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zkex.zul.Jasperreport;
import org.zkoss.zul.*;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class KardexDiario extends SelectorComposer implements PeriodoListener {
    //objetos
    private Producto producto;
    private Usuario usuario;
    private Periodo periodo;
    private List<Kardex> listaKardex=new ArrayList<>();
    //controles
    @Wire
    private Window winKardex;
    @Wire
    private Combobox cboAlmacen;
    @Wire
    private Textbox txtLinea;
    @Wire
    private Textbox txtFamilia;
    @Wire
    private Textbox txtCodigo;
    @Wire
    private Textbox txtPresentacion;
    @Wire
    private Textbox txtNombre;
    @Wire
    private Listbox lstKardex;
    @Wire
    private Intbox nCompra;
    @Wire
    private Intbox nVenta;
    @Wire
    private Intbox nSaldo;
    @Wire
    private Intbox nCompram;
    @Wire
    private Intbox nVentam;
    @Wire
    private Intbox nSaldom;
    
    @WireVariable
    AlmacenService almacenService;
    
    @WireVariable
    PeriodoService periodoService;
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    RegistroEntradaService registroEntradaService;
    
    @WireVariable
    RegistroSalidaService registroSalidaService;
    @WireVariable
    ComprobanteEmitidoService comprobanteEmitidoService;
    
    @WireVariable
    KardexService kardexService;
    
    @WireVariable
    ProductoService productoService;
    
    //modelo
    private ListModelList modeloAlmacen;
    private ListModelList modeloKardex;
    //login
    private MenuPeriodo menuperiodo;
    
    private String user_login;
    final Execution exec = Executions.getCurrent();

    @Listen("onCreate=window#winKardex")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) winKardex.getFellow("mperiodo");
        menuperiodo = (MenuPeriodo) macro.getChildren().get(0);
        menuperiodo.setPeriodolistener(this);
        initComponets();
     }
    
    @Listen("onOK= #lstKardex")
    public void onCrearEntrada(Event event) {
        cargarDocumento();
    }
    
    @Listen("onOK= #txtCodigo")
    public void onBuscarProducto(Event event) {
        buscarProducto();
    }
    
    @Listen("onCancel= #txtCodigo")
    public void onSalirCodigo(Event event) {
        winKardex.onClose();
    }
    
    @Listen("onCancel= #winKardex")
    public void onLimpiarVentana(Event event) {
        limpiar();
    }
    
    @Listen("onClick = #btnImprimir")
    public void onBuscarProveedor(Event event) {
        imprimir();
    }
    
    @Listen("onClick = #btnValorizado")
    public void onImprimirValorizado(Event event) {
        imprimirValorizado();
    }
    
    @Listen("onClick = #btnExportar")
    public void onExportar(Event event) throws IOException {
        exportar();
    }
    
    @Listen("onClick = #btnUtilidad")
    public void onExportarUtilidad(Event event) throws IOException {
        exportarUtilidad();
    }
    
    @Listen("onClick = #btnSalir")
    public void onSalir(Event event) {
        winKardex.onClose();
    }
    

    private void initComponets() {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);

        modeloKardex= new ListModelList();
        lstKardex.setModel(modeloKardex);

        modeloAlmacen = new ListModelList(almacenService.listaPorClogin(usuario.getClogin()));
        cboAlmacen.setModel(modeloAlmacen);

        if (modeloAlmacen.size() > 0) {
            cboAlmacen.onInitRender(new Event("", cboAlmacen));
            cboAlmacen.close();
            cboAlmacen.setSelectedIndex(0);
        }
       txtCodigo.focus();
       txtCodigo.setReadonly(false);
    }
    
    @Override
    public void validar() {
        cboAlmacen.getValue();
        if (producto == null) {
            txtCodigo.focus();
            throw new ExceptionZarcillo("Debe buscar un Producto");
        }
    }

    private void cargarMovimientos() {
        validar();
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());        
        listaKardex= kardexService.listaKardex(almacen.getIdalmacen(),txtCodigo.getText(),periodo.getIdperiodo());
        modeloKardex = new ListModelList(listaKardex);
        lstKardex.setModel(modeloKardex);
        TotalKardex total=kardexService.busquedaKardex(almacen.getIdalmacen(),txtCodigo.getText() , periodo.getIdperiodo());
        Integer tcompra=0;
        Integer tventa=0;
        Integer tcompram=0;
        Integer tventam=0;
        for(Kardex k:listaKardex){
            tcompra=tcompra+k.getNcompra();
            tventa=tventa+k.getNventa();
            tcompram=tcompram+k.getNcompram();
            tventam=tventam+k.getNventam();
        }
        nCompra.setValue(tcompra);
        nVenta.setValue(tventa);
        nCompram.setValue(tcompram);
        nVentam.setValue(tventam);
        nSaldo.setValue(total.getNstock());
        nSaldom.setValue(total.getNstockm());
        lstKardex.onInitRender();
        if (modeloKardex.size() > 0) {
            lstKardex.setSelectedIndex(0);
            lstKardex.getSelectedItem().focus();
        }
        else{
            txtCodigo.focus();
        }
    }

    public void buscarProducto() {
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        Existencia existencia;
        if (txtCodigo.getValue().isEmpty()) {
            try {
                Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/buscaexistenciaalmacen.zul", null, null);
                winbuscaprod.setAttribute("ALMACEN", almacen);
                winbuscaprod.setAttribute("REST", true);
                winbuscaprod.doModal();
                Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
                if (rest) {
                    Listbox lstexistencia = (Listbox) winbuscaprod.getFellow("lstExistencia");
                    ListModel modelobuscado = lstexistencia.getModel();
                    existencia = (Existencia) modelobuscado.getElementAt(lstexistencia.getSelectedIndex());
                    producto=existencia.getIdproducto();
                    mostrarProducto();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } else {
            producto = productoService.buscar(txtCodigo.getText().trim());
            mostrarProducto();            
        }
    }
    private void cargarDocumento(){
        Almacen almacen=(Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        Kardex kardex= (Kardex) modeloKardex.getElementAt(lstKardex.getSelectedIndex());
        if(kardex.getCtipmov().contains("S"))
        {
            RegistroSalida regsalida=registroSalidaService.buscarPorIdunidadPorIdregsalida(almacen.getIdunidad().getIdunidad(),kardex.getNregsalida());
            ComprobanteEmitido comprobante=comprobanteEmitidoService.buscarPorIdregsalida(regsalida.getIdregsalida());
            Window wincrea = (Window) Executions.createComponents("/modulos/mantenimiento/util/detallemovimientos.zul", null, null);
            wincrea.setAttribute("COMPROBANTE", comprobante);
            wincrea.setAttribute("UNIDAD", almacen.getIdunidad());
            wincrea.setAttribute("USUARIO", usuario);
            wincrea.doModal();
            }
        else
        {
            RegistroEntrada regentrada=registroEntradaService.buscarPorIdalmacenPorIdregentrada(almacen.getIdalmacen(),kardex.getNregentrada());
            Window win = (Window) Executions.createComponents("/modulos/almacen/consulta/detalleingreso.zul", null, null);
            win.setClosable(true);
            win.setAttribute("INGRESO", regentrada);
            win.doModal();
        }
    }
    private void mostrarProducto() {
        txtCodigo.setReadonly(true);
        txtCodigo.setText(producto.getIdproducto());
        txtNombre.setText(producto.getCnomproducto());
        txtPresentacion.setText(producto.getIdpresentacion().getCabrev());
        txtLinea.setText(producto.getIdsublinea().getIdlinea().getCnomlinea().trim());
        txtFamilia.setText(producto.getIdfamilia().getCnomfamilia().trim());
        menuperiodo.setLista(periodoService.listaGeneral());
        periodo = periodoService.buscarPorDfecha(new Date());
        menuperiodo.setPeriododefecto(periodo);
    }

    public void limpiar() {
        listaKardex=new ArrayList<>();
        txtCodigo.setReadonly(false);
        txtCodigo.setText("");
        txtNombre.setText("");
        txtPresentacion.setText("");
        txtFamilia.setText("");
        txtLinea.setText("");
        modeloKardex=new ListModelList();
        lstKardex.setModel(modeloKardex);
        nCompra.setValue(0);
        nVenta.setValue(0);
        nSaldo.setValue(0);
        nCompram.setValue(0);
        nVentam.setValue(0);
        nSaldom.setValue(0);
        producto = new Producto();
        txtCodigo.focus();

    }
    public void imprimirdetalle(String ruta) {
        validar();
        if(modeloKardex.size()>0)
        {
            Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
            HashMap parametro = new HashMap();
            parametro.put("EMPRESA", almacen.getIdunidad().getIdempresa().getCnomempresa());
            parametro.put("USUARIO", usuario.getCnomusuario());
            parametro.put("RUTA", almacen.getIdunidad().getIdempresa().getCruta());
            parametro.put("UNIDADNEGOCIO", almacen.getIdunidad().getCnomunidad());
            parametro.put("IDPROVEEDOR", producto.getIdfamilia().getCnomfamilia());
            parametro.put("ALMACEN", almacen.getCnomalmacen());
            parametro.put("MES", "KARDEX FISICO "+ Mes.getMes(periodo.getNmes())+" - "+periodo.getNano());
            parametro.put("MES2", "KARDEX FISICO/VALORIZADO AL MES DE "+ Mes.getMes(periodo.getNmes()));
            parametro.put("CODART", producto.getIdproducto());
            parametro.put("TCOMPRA", nCompra.getValue());
            parametro.put("TVENTA", nVenta.getValue());
            parametro.put("TSALDO", nSaldo.getValue());
            parametro.put("UNIART", producto.getIdpresentacion().getCabrev());
            parametro.put("DESART", producto.getCnomproducto());
            parametro.put("LINEA", producto.getIdsublinea().getIdlinea().getCnomlinea());
            JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modeloKardex);
            Jasperreport  rptinventario=new Jasperreport();
            rptinventario.setSrc(ruta);
            rptinventario.setDatasource(data);
            rptinventario.setParameters(parametro);
            rptinventario.setType("pdf");
        }
        else
            Messagebox.show("No hay datos para mostrar");
        
    }

    public void imprimir()  {
        imprimirdetalle("/modulos/almacen/reporte/consultakardex.jasper");
    }
    public void imprimirValorizado()  {
        imprimirdetalle("/modulos/almacen/reporte/consultakardexvalorizado.jasper");
    }

    @Override
    public void escribir(Periodo periodo) {
        this.periodo = periodo;
        cargarMovimientos();

    }
    public void exportar(){            
        ExportarHojaCalculo.exportListboxToExcel(lstKardex,producto.getIdproducto().trim());             
    }   
    
    public void exportarUtilidad(){
        List<Kardex> listaFiltrada=new ArrayList<>();
        String[] headers={"TP","SERIE","NUMERO","CLIENTE","CANT","CANT(F/)","VAL.UNI","COSUNI","UTI(%)","GANANCIA"};
        String[] fields={"cabrev","cserfac","cfactura","cnombre","nventa","nventam","nvaluni","ncosuni","nutilidad","nganancia"};
        listaFiltrada = (List) CollectionUtils.select(listaKardex, new FiltroSalidaKardex());
        ListModelList modelotemporal=new ListModelList(listaFiltrada);
        ExportarHojaCalculo.exportDataModelToExcel(headers, fields, modelotemporal,producto.getIdproducto().trim());                
    }
}
