package modalmacen.herramientas;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Usuario;
import com.zarcillo.dto.almacen.InventarioValorizado;
import com.zarcillo.dto.compra.ExistenciaValorizada;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.LineaService;
import com.zarcillo.service.ListadoExistenciaService;
import com.zarcillo.service.UsuarioService;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import javax.naming.NamingException;
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
import org.zkoss.zkex.zul.Jasperreport;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class InventarioValorizadoLinea extends SelectorComposer {

    private Usuario usuario;
    private ListModelList modeloInventario;
    private ListModelList modeloAlmacen;
    @Wire
    private Window winInventario;
    @Wire
    private Combobox cboAlmacen;
    @Wire
    private Listbox lstInventario;
    @Wire
    private Jasperreport rptreporte;
    @Wire
    private Decimalbox nCosto;
    @Wire
    private Decimalbox nPcosto;
    @WireVariable
    AlmacenService almacenService;
    @WireVariable
    LineaService lineaService;
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    ListadoExistenciaService listadoExistenciaService;
    final Execution exec = Executions.getCurrent();
    private String user_login;

    @Listen("onCreate=window#winInventario")
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

    @Listen("onClick = #btnProcesar")
    public void onProcesar(Event event) {
        procesar();
    }

    @Listen("onDoubleClick = #lstInventario")
    public void onDetalle(Event event) {
        detalleInventario();
    }

    @Listen("onOK = #lstInventario")
    public void onDetalleInventario(Event event) {
        detalleInventario();
    }

    private void initComponets() {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        modeloAlmacen = new ListModelList(almacenService.listaPorClogin(usuario.getClogin()));
        cboAlmacen.setModel(modeloAlmacen);
        if (modeloAlmacen.size() > 0) {
            cboAlmacen.onInitRender(new Event("", cboAlmacen));
            cboAlmacen.close();
            cboAlmacen.setSelectedIndex(0);
        }

    }

    private void procesar() {
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        modeloInventario = new ListModelList(listadoExistenciaService.listaInventarioValorizadoPorIdalmacen(almacen.getIdalmacen()));
        lstInventario.setModel(modeloInventario);
        lstInventario.onInitRender();
        cargarPie();
    }

    private void cargarPie() {
        BigDecimal ncosto = new BigDecimal(BigInteger.ZERO);
        BigDecimal nprecio = new BigDecimal(BigInteger.ZERO);
        List<Listitem> ldatos = lstInventario.getItems();
        InventarioValorizado invvalorizado;
        for (Listitem item : ldatos) {
            invvalorizado = (InventarioValorizado) modeloInventario.getElementAt(item.getIndex());
            ncosto = ncosto.add(invvalorizado.getNcosto());
            nprecio = nprecio.add(invvalorizado.getPcosto());
        }
        nCosto.setValue(ncosto);
        nPcosto.setValue(nprecio);
    }

    private void validar() {
        cboAlmacen.getValue();
    }

    private void detalleInventario() {
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        InventarioValorizado inventario = (InventarioValorizado) modeloInventario.getElementAt(lstInventario.getSelectedIndex());
        List<ExistenciaValorizada> listaExistencia = listadoExistenciaService.listaExistenciaValorizadaPorIdalmacenPorIdlinea(almacen.getIdalmacen(), inventario.getIdlinea().getIdlinea());
        Window win = (Window) Executions.createComponents("/modulos/almacen/consulta/detalleinventariovalorizado.zul", null, null);
        win.setClosable(true);
        win.setAttribute("LISTAEXISTENCIA", listaExistencia);
        win.setAttribute("INVENTARIO", inventario);
        win.setAttribute("USUARIO", usuario);
        win.setAttribute("ALMACEN", almacen);
        win.doModal();
    }

    public void imprimir() {
        validar();
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        HashMap parametro = new HashMap();
        parametro.put("RUTA", almacen.getIdunidad().getIdempresa().getCruta());
        parametro.put("EMPRESA", almacen.getIdunidad().getIdempresa().getCnomempresa());
        parametro.put("UNIDADNEGOCIO", almacen.getIdunidad().getCnomunidad());
        parametro.put("ALMACEN", almacen.getCnomalmacen());
        parametro.put("USUARIO", usuario.getCnomusuario());
        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modeloInventario);
        rptreporte.setSrc("/modulos/almacen/reporte/inventariovalorizado.jasper");
        rptreporte.setDatasource(data);
        rptreporte.setParameters(parametro);
        rptreporte.setType("pdf");
    }

    public void exportar(){
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        //EsportaExcel2(lstInventario, almacen.getCnomalmacen().trim() + ".xls");
        
        ///ejemplo de exportacion                
        //ExportarHojaCalculo.exportListboxToExcel(lstInventario, almacen.getCnomalmacen());
        String[] headers={"LINEA","VALOR COSTO","PRECIO COSTO","PORCENTAJE"};
        String[] fields={"idlinea","ncosto","pcosto","nporcentaje"};
        ExportarHojaCalculo.exportDataModelToExcel(headers, fields, modeloInventario,almacen.getCnomalmacen().trim());                
    }

}
