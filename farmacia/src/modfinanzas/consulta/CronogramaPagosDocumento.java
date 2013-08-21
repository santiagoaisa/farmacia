package modfinanzas.consulta;

import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.dto.finanzas.CronogramaPago;
import com.zarcillo.dto.finanzas.CronogramaPagoProveedor;
import com.zarcillo.dto.finanzas.DetalleCronogramaPagoProveedor;
import com.zarcillo.service.ListadoProveedorService;
import com.zarcillo.service.UnidadNegocioService;
import com.zarcillo.service.UsuarioService;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.naming.NamingException;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
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
import org.zkoss.zkex.zul.Jasperreport;
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
public class CronogramaPagosDocumento extends SelectorComposer {

    private Usuario usuario;
    private ListModelList modeloDetalle;
    private UnidadNegocio unidad;
    private CronogramaPagoProveedor cronograma;
    private Date dFecha;
    @Wire
    private Window winDocumento;
    @Wire
    private Listbox lstDetalle;
    @Wire
    private Decimalbox nImporte;
    @Wire
    private Decimalbox nAcuenta;
    @Wire
    private Decimalbox nSaldo;
    @Wire
    private Jasperreport rptreporte;

    @Listen("onCreate=window#winDocumento")
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

    
    public void initComponets() {
        unidad=(UnidadNegocio) winDocumento.getAttribute("UNIDAD");
        usuario=(Usuario) winDocumento.getAttribute("USUARIO");
        cronograma=(CronogramaPagoProveedor) winDocumento.getAttribute("CRONOGRAMAPROVEEDOR");
        dFecha=(Date) winDocumento.getAttribute("FECHA");
        
        modeloDetalle = new ListModelList(cronograma.getDetalleCronogramaPagoProveedorCollection());
        lstDetalle.setModel(modeloDetalle);
        lstDetalle.onInitRender();
        cargarPie();
    }


    private void cargarPie() {
        BigDecimal nimporte= new BigDecimal(BigInteger.ZERO);
        BigDecimal nacuenta= new BigDecimal(BigInteger.ZERO);
        BigDecimal nsaldo= new BigDecimal(BigInteger.ZERO);
        List<Listitem> ldatos = lstDetalle.getItems();
        DetalleCronogramaPagoProveedor cpd;
        for (Listitem item : ldatos) {
            cpd=  (DetalleCronogramaPagoProveedor) modeloDetalle.getElementAt(item.getIndex());            
            nimporte = nimporte.add(cpd.getNimporte());
            nacuenta = nacuenta.add(cpd.getNacuenta());
            nsaldo= nsaldo.add(cpd.getNsaldo());
        }
        nImporte.setValue(nimporte);
        nAcuenta.setValue(nacuenta);
        nSaldo.setValue(nsaldo);
    }    

    
    private void imprimir(){
        HashMap parametro = new HashMap();
        parametro.put("RUTA", unidad.getIdempresa().getCruta());        
        parametro.put("UNIDADNEGOCIO", unidad.getCnomunidad());
        parametro.put("FECHA", dFecha);
        parametro.put("USUARIO", usuario.getCnomusuario());

        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modeloDetalle);
        rptreporte.setSrc("/modulos/finanzas/reporte/documentocronogramapago.jasper");
        rptreporte.setDatasource(data);
        rptreporte.setParameters(parametro);
        rptreporte.setType("pdf");
    }
    
    public void exportar() throws IOException {
        EsportaExcel2(lstDetalle,"cronogramadocumento.xls");
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
                Double a;
                h = ((Listcell) lbCell).getLabel();
                HSSFCell cell = row.createCell(y);
                cell.setCellStyle(cellStyleNormal);
                if (isNumberFloat(h)) {
                    a = new Double(h);
                    cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
                    cell.setCellValue(a);
                } else {
                    cell.setCellType(HSSFCell.CELL_TYPE_STRING);
                    cell.setCellValue(h);
                }
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
    public static boolean isNumberFloat(String cadena) {
        try {
            Float.parseFloat(cadena);
            return true;
        } catch (NumberFormatException nfe) {
            return false;
        }
    }
}
