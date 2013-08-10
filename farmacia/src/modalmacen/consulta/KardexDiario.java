
package modalmacen.consulta;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Documento;
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
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.KardexService;
import com.zarcillo.service.PeriodoService;
import com.zarcillo.service.ProductoService;
import com.zarcillo.service.RegistroEntradaService;
import com.zarcillo.service.RegistroSalidaService;
import com.zarcillo.service.UsuarioService;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.naming.NamingException;
import modmantenimiento.util.MenuPeriodo;
import modmantenimiento.util.PeriodoListener;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.Path;
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
    private Jasperreport rptinventario;
    
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
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winKardex/mperiodo");
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
    
    @Listen("onClick = #btnSalir")
    public void onSalir(Event event) {
        winKardex.onClose();
    }
    

    private void initComponets() {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);

        modeloKardex= new ListModelList();
        lstKardex.setModel(modeloKardex);

        modeloAlmacen = new ListModelList(almacenService.listaGeneral());
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
        List<Kardex> listakardex = kardexService.listaKardex(almacen.getIdalmacen(),txtCodigo.getText(),periodo.getIdperiodo());
        modeloKardex = new ListModelList(listakardex);
        lstKardex.setModel(modeloKardex);
        TotalKardex total=kardexService.busquedaKardex(almacen.getIdalmacen(),txtCodigo.getText() , periodo.getIdperiodo());
        Integer tcompra=0;
        Integer tventa=0;
        for(Kardex k:listakardex){
            tcompra=tcompra+k.getNcompra();
            tventa=tventa+k.getNventa();
        }
        nCompra.setValue(tcompra);
        nVenta.setValue(tventa);
        nSaldo.setValue(total.getNstock());
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
            if(regsalida.getIddocumento().getIddocumento()==(Documento.BOLETA_SUNAT.getIddocumento()))
            {
                Window win =(Window) Executions.createComponents("/modulos/modherramientas/consulta/consultaboletakardex.zul",null, null);
                win.setClosable(true);                
                win.doModal();
            }
            if(regsalida.getIddocumento().getIddocumento()==(Documento.FACTURA_SUNAT.getIddocumento()))
            {
                Window win =(Window) Executions.createComponents("/modulos/modherramientas/consulta/consultafacturakardex.zul",null, null);
                win.setClosable(true);
                win.doModal();
            }
            if(regsalida.getIddocumento().getIddocumento()==(Documento.GUIA_REMISION_SUNAT.getIddocumento()))
            {
                Window win =(Window) Executions.createComponents("/modulos/modherramientas/consulta/consultaguiakardex.zul",null, null);
                win.setClosable(true);
                    win.doModal();
               
            }
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
            
                rptinventario.setSrc(ruta);
                rptinventario.setDatasource(data);
                rptinventario.setParameters(parametro);
                rptinventario.setType("pdf");

        }
        else
            Messagebox.show("No hay datos para mostrar");
        
    }

    public void imprimir()  {
        imprimirdetalle("/modulos/modherramientas/reporte/consultakardex.jasper");
    }
    public void imprimirValorizado()  {
        imprimirdetalle("/modulos/modherramientas/reporte/consultakardexvalorizado.jasper");
    }

    @Override
    public void escribir(Periodo periodo) {
        this.periodo = periodo;
        cargarMovimientos();

    }
    public void exportar() throws IOException {
        EsportaExcel2(lstKardex, producto.getIdproducto()+"-"+Mes.getMes(periodo.getNmes())+".xls");
    }

    public void EsportaExcel2(Listbox box, String nomeFile) throws IOException {
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("hoja");
        HSSFRow row = sheet.createRow(0);
        HSSFFont fontRedBold = workbook.createFont();
        HSSFFont fontNormal = workbook.createFont();
        fontRedBold.setColor(HSSFFont.COLOR_RED);
        fontRedBold.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        fontNormal.setColor(HSSFFont.COLOR_NORMAL);
        fontNormal.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        HSSFCellStyle cellStyleRedBold = workbook.createCellStyle();
        HSSFCellStyle cellStyleNormal = workbook.createCellStyle();
        cellStyleRedBold.setFont(fontRedBold);
        cellStyleNormal.setFont(fontNormal);
        int i = 0;
        row = sheet.createRow(0);
        for (Object head : box.getHeads()) {
            for (Object header : ((Listhead) head).getChildren()) {
                String h = ((Listheader) header).getLabel();
                HSSFCell cell = row.createCell(i);
                cell.setCellStyle(cellStyleRedBold);
                cell.setCellType(HSSFCell.CELL_TYPE_STRING);
                cell.setCellValue(h);
                i++;
            }
        }
        int x = 1;
        int y = 0;
        for (Object item : box.getItems()) {
            row = sheet.createRow(x);
            y = 0;
            for (Object lbCell : ((Listitem) item).getChildren()) {
                String h;
                h = ((Listcell) lbCell).getLabel();
                HSSFCell cell = row.createCell(y);
                cell.setCellStyle(cellStyleNormal);
                cell.setCellType(HSSFCell.CELL_TYPE_STRING);
                cell.setCellValue(h);
                y++;
            }
            x++;
        }
        FileOutputStream fOut = new FileOutputStream(nomeFile);
        workbook.write(fOut);
        fOut.flush();
        fOut.close();
        File file = new File(nomeFile);
        Filedownload.save(file, "XLS");
    }
}
