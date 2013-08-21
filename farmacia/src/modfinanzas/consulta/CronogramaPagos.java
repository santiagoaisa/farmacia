package modfinanzas.consulta;

import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.dto.finanzas.CronogramaPago;
import com.zarcillo.dto.finanzas.DetalleCronogramaPagoProveedor;
import com.zarcillo.service.ListadoProveedorService;
import com.zarcillo.service.UnidadNegocioService;
import com.zarcillo.service.UsuarioService;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
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
public class CronogramaPagos extends SelectorComposer {

    private Usuario usuario;
    private ListModelList modeloDetalle;
    private ListModelList modeloUnidad;
    private List<DetalleCronogramaPagoProveedor> listaDetalle=new ArrayList<>();
    @Wire
    private Window winCronograma;
    @Wire
    private Datebox dFecfin;
    @Wire
    private Combobox cboUnidad;
    @Wire
    private Button btnProcesar;
    @Wire
    private Listbox lstDetalle;
    @Wire
    private Decimalbox nFactura;
    @Wire
    private Decimalbox nLetra;
    @Wire
    private Decimalbox nTotal;
    @Wire
    private Jasperreport rptreporte;
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    ListadoProveedorService listadoProveedorService;
    @WireVariable
    UnidadNegocioService unidadNegocioService;
    
    private String user_login;
    final Execution exec = Executions.getCurrent();

    @Listen("onCreate=window#winCronograma")
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
    
    @Listen("onClick = #btnDetalle")
    public void onImprimirDetalle(Event event) {
        imprimirDetalle();
    }
    
    @Listen("onClick = #btnExportar")
    public void onExportar(Event event) throws IOException {
        exportar();
    }
    
    @Listen("onOK = #lstDetalle")
    public void onMostrarDetalle(Event event) {
        mostrarDetalle();
    }
    
    @Listen("onDoubleClick = #lstDetalle")
    public void onDetalle(Event event) {
        mostrarDetalle();
    }

    
    public void initComponets() {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        modeloUnidad = new ListModelList(unidadNegocioService.listaPorClogin(usuario.getClogin()));
        cboUnidad.setModel(modeloUnidad);
        if (modeloUnidad.size() > 0) {
            cboUnidad.onInitRender(new Event("", cboUnidad));
            cboUnidad.close();
            cboUnidad.setSelectedIndex(0);
        }  
        modeloDetalle = new ListModelList();
        lstDetalle.setModel(modeloDetalle);
        dFecfin.setValue(new Date());
        btnProcesar.focus();
    }

    private void procesar() {
        listaDetalle=listadoProveedorService.listaDetalleCronogramaPago(dFecfin.getValue());
        modeloDetalle = new ListModelList(listadoProveedorService.listaCronogramaPago(dFecfin.getValue()));
        lstDetalle.setModel(modeloDetalle);
        lstDetalle.onInitRender();
        cargarPie();
    }
    
    private void mostrarDetalle(){
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        Window win = (Window) Executions.createComponents("/modulos/finanzas/consulta/detallecronogramapagos.zul", null, null);
        win.setClosable(true);
        CronogramaPago cronograma = (CronogramaPago) modeloDetalle.getElementAt(lstDetalle.getSelectedIndex());
        win.setAttribute("CRONOGRAMA", cronograma);
        win.setAttribute("UNIDAD", unidad);
        win.setAttribute("USUARIO", usuario);
        win.setAttribute("FECHA", dFecfin.getValue());        
        win.doModal();
    }

    private void cargarPie() {
        BigDecimal nfactura= new BigDecimal(BigInteger.ZERO);
        BigDecimal nletra= new BigDecimal(BigInteger.ZERO);
        BigDecimal ntotal= new BigDecimal(BigInteger.ZERO);
        List<Listitem> ldatos = lstDetalle.getItems();
        CronogramaPago cpd;
        for (Listitem item : ldatos) {
            cpd=  (CronogramaPago) modeloDetalle.getElementAt(item.getIndex());            
            nfactura = nfactura.add(cpd.getNfactura());
            nletra = nletra.add(cpd.getNletra());
            ntotal= ntotal.add(cpd.getNtotal());
        }
        nFactura.setValue(nfactura);
        nLetra.setValue(nletra);
        nTotal.setValue(ntotal);
    }    

    
    private void imprimir(){
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        HashMap parametro = new HashMap();
        parametro.put("RUTA", unidad.getIdempresa().getCruta());        
        parametro.put("UNIDADNEGOCIO", unidad.getCnomunidad());
        parametro.put("FECFIN", dFecfin.getValue());
        parametro.put("USUARIO", usuario.getCnomusuario());

        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modeloDetalle);
        rptreporte.setSrc("/modulos/finanzas/reporte/cronogramapago.jasper");
        rptreporte.setDatasource(data);
        rptreporte.setParameters(parametro);
        rptreporte.setType("pdf");
    }
    
    private void imprimirDetalle(){
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        HashMap parametro = new HashMap();
        parametro.put("RUTA", unidad.getIdempresa().getCruta());        
        parametro.put("UNIDADNEGOCIO", unidad.getCnomunidad());
        parametro.put("FECFIN", dFecfin.getValue());
        parametro.put("USUARIO", usuario.getCnomusuario());

        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(listaDetalle);
        rptreporte.setSrc("/modulos/finanzas/reporte/detallecronograma.jasper");
        rptreporte.setDatasource(data);
        rptreporte.setParameters(parametro);
        rptreporte.setType("pdf");
    }
    
    public void exportar() throws IOException {
        EsportaExcel2(lstDetalle,"cronograma.xls");
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
