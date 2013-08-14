package modventas.consulta;

import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.domain.Vendedor;
import com.zarcillo.service.VendedorService;
import com.zarcillo.estadistica.VentaPorDocumento;
import com.zarcillo.service.ResultadoVentaService;
import com.zarcillo.service.UnidadNegocioService;
import com.zarcillo.service.UsuarioService;
import com.zarcillo.service.VentaService;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintCamposObligatorios;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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
import org.zkoss.zul.Filedownload;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listcell;
import org.zkoss.zul.Listhead;
import org.zkoss.zul.Listheader;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class VentaVendedorFecha extends SelectorComposer {

    private Usuario usuario;
    private RegistroSalida regsalida = new RegistroSalida();
    private ListModelList modeloUnidad;
    private ListModelList modeloDetalle;
    private ListModelList modeloVendedor;
    private Periodo periodo;
    @Wire
    private Window winVenta;
    @Wire
    private Combobox cboUnidad;
    @Wire
    private Combobox cboVendedor;
    @Wire
    private Datebox dFecini;
    @Wire
    private Datebox dFecfin;
    @Wire
    private Button btnProcesar;
    @Wire
    private Listbox lstDetalle;
    @Wire
    private Decimalbox nInafecto;
    @Wire
    private Decimalbox nIgv;
    @Wire
    private Decimalbox nValven;
    @Wire
    private Decimalbox nImporte;
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    VentaService ventaService;
    @WireVariable
    UnidadNegocioService unidadNegocioService;
    @WireVariable
    ResultadoVentaService resultadoVentaService;
    @WireVariable
    VendedorService vendedorService;
    private String user_login;
    final Execution exec = Executions.getCurrent();

    @Listen("onCreate=window#winVenta")
    public void onCreate() throws NamingException {
        initComponets();
    }

    @Listen("onClick = #btnProcesar")
    public void onProcesar(Event event) {
        procesar();
    }

    @Listen("onClick = #btnImprimir")
    public void onImprimir(Event event) {
        imprimir();
    }
    
    @Listen("onClick = #btnExportar")
    public void onExportar(Event event) throws IOException {
        exportar();
    }

    
    public void initComponets() {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        modeloUnidad = new ListModelList(unidadNegocioService.listaGeneral());
        cboUnidad.setModel(modeloUnidad);
        if (modeloUnidad.size() > 0) {
            cboUnidad.onInitRender(new Event("", cboUnidad));
            cboUnidad.close();
            cboUnidad.setSelectedIndex(0);
        }        
        modeloVendedor = new ListModelList(vendedorService.listaGeneral());
        cboVendedor.setModel(modeloVendedor);
        if (modeloVendedor.size() > 0) {
            cboVendedor.onInitRender(new Event("", cboVendedor));
            cboVendedor.close();
            cboVendedor.setSelectedIndex(0);
        }
        modeloDetalle = new ListModelList();
        lstDetalle.setModel(modeloDetalle);
        dFecini.setValue(new Date());
        dFecfin.setValue(new Date());
        btnProcesar.focus();
    }

    private void procesar() {
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        Vendedor vendedor = (Vendedor) modeloVendedor.getElementAt(cboVendedor.getSelectedIndex());
        modeloDetalle = new ListModelList(resultadoVentaService.listaVentaPorDocumentoPorIdunidadPorFechas(unidad.getIdunidad(),vendedor.getIdvendedor(),dFecini.getValue(),dFecfin.getValue()));
        lstDetalle.setModel(modeloDetalle);
        lstDetalle.onInitRender();
        cargarPie();
    }

    private void cargarPie() {
        BigDecimal nafecto = new BigDecimal(BigInteger.ZERO);
        BigDecimal ninafecto = new BigDecimal(BigInteger.ZERO);
        BigDecimal nigv = new BigDecimal(BigInteger.ZERO);
        BigDecimal nprecio = new BigDecimal(BigInteger.ZERO);
        List<Listitem> ldatos = lstDetalle.getItems();
        VentaPorDocumento vpd;
        for (Listitem item : ldatos) {
            vpd=(VentaPorDocumento) modeloDetalle.getElementAt(item.getIndex());
            nafecto = nafecto.add(vpd.getNafecto());
            ninafecto = ninafecto.add(vpd.getNinafecto());
            nigv = nigv.add(vpd.getNigv());
            nprecio = nprecio.add(vpd.getNimporte());
        }
        nInafecto.setValue(regsalida.getNinafecto());
        nValven.setValue(regsalida.getNafecto());
        nIgv.setValue(regsalida.getNigv());
        nImporte.setValue(regsalida.getNimporte());
    }    

    private void validar() {
        cboUnidad.setConstraint(new ConstraintCamposObligatorios());
        cboVendedor.setConstraint(new ConstraintCamposObligatorios());
        cboUnidad.getValue();
        cboVendedor.getValue();
    }
    
    private void imprimir(){
        validar();
    }
    
    public void exportar() throws IOException {
        Vendedor vendedor = (Vendedor) modeloVendedor.getElementAt(cboVendedor.getSelectedIndex());
        EsportaExcel2(lstDetalle,vendedor.getCnomvendedor().trim() + ".xls");
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