package modalmacen.consulta;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Linea;
import com.zarcillo.domain.Usuario;
import com.zarcillo.dto.almacen.InventarioLote;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.LineaService;
import com.zarcillo.service.ListadoExistenciaService;
import com.zarcillo.service.UsuarioService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
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
import org.zkoss.zul.*;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ListaInventarioLote extends SelectorComposer {

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
    
    @Listen("onSelect = #cboAlmacen")
    public void onLlenarLinea(Event event) {
        llenarLinea();
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
            llenarLinea();
        }
        
    }
    private void llenarLinea(){
        Almacen almacen=(Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        modeloInventario = new ListModelList(lineaService.listaConStock(almacen.getIdalmacen()));
        lstInventario.setModel(modeloInventario);
        lstInventario.onInitRender();
        lstInventario.setMultiple(true);
        lstInventario.setCheckmark(true);
    }

    private void validar() {
        cboAlmacen.getValue();
    }

    private void validarDetalle() {
        if (lstInventario.getSelectedItems().isEmpty()) {
            throw new ExceptionZarcillo("Favor de seleccionar una linea para Imprimir");
        }
    }

    public void imprimir() {
        validar();
        validarDetalle();
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        Set<Listitem> ldatos = lstInventario.getSelectedItems();
        Linea linea;
        List<Integer> listaIdlinea = new ArrayList();
        for (Listitem item : ldatos) {
            linea = (Linea) modeloInventario.getElementAt(item.getIndex());
            listaIdlinea.add(linea.getIdlinea());
        }
        HashMap parametro = new HashMap();
        parametro.put("EMPRESA", almacen.getIdunidad().getIdempresa().getCnomempresa());
        parametro.put("UNIDADNEGOCIO", almacen.getIdunidad().getCnomunidad());
        parametro.put("ALMACEN", almacen.getCnomalmacen());
        parametro.put("USUARIO", usuario.getCnomusuario());
        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(listadoExistenciaService.listaInventarioLotePorIdalmacenPorLineas(almacen.getIdalmacen(), listaIdlinea));
        rptreporte.setSrc("/modulos/almacen/reporte/listainventariolote.jasper");
        rptreporte.setDatasource(data);
        rptreporte.setParameters(parametro);
        rptreporte.setType("pdf");        
    }
    
    public void exportar(){
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());

        Set<Listitem> ldatos = lstInventario.getSelectedItems();
        Linea linea;
        List<Integer> listaIdlinea = new ArrayList();
        for (Listitem item : ldatos) {
            linea = (Linea) modeloInventario.getElementAt(item.getIndex());
            listaIdlinea.add(linea.getIdlinea());
        }
        List<InventarioLote> listaDetalle=new ArrayList<>();
        listaDetalle=listadoExistenciaService.listaInventarioLotePorIdalmacenPorLineas(almacen.getIdalmacen(), listaIdlinea);
        ListModelList modelotemporal=new ListModelList(listaDetalle);
        String[] headers={"CODIGO","PRESENTACION","F/","DESCRIPCION","STOCK","STOCK(F/)","UBICACION","LOTE","VENCIMIENTO","CANT(E)","CANT(F/)"};
        String[] fields={"idproducto.idproducto","idproducto.idpresentacion.cabrev","idproducto.nmenudeo","idproducto.cnomproducto","nstock","nstockm","cubicacion","clote","cfecven","ncanart","ncanartm"};
        ExportarHojaCalculo.exportDataModelToExcel(headers, fields, modelotemporal,almacen.getCnomalmacen().trim());                
    }
}
