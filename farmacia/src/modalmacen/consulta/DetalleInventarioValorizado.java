package modalmacen.consulta;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Usuario;
import com.zarcillo.dto.almacen.InventarioValorizado;
import com.zarcillo.dto.compra.ExistenciaValorizada;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.LineaService;
import com.zarcillo.service.ListadoExistenciaService;
import com.zarcillo.service.UsuarioService;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
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
import org.zkoss.zul.*;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class DetalleInventarioValorizado extends SelectorComposer {

    private Usuario usuario;
    private ListModelList modeloDetalle;
    private Almacen almacen;
    private  List<ExistenciaValorizada> listaExistencia=new ArrayList<>();
    private InventarioValorizado inventario;
    @Wire
    private Window winDetalle;
    @Wire
    private Listbox lstDetalle;
    @Wire
    private Jasperreport rptreporte;
    @Wire
    private Decimalbox nCosto;
    @Wire
    private Decimalbox nPcosto;
    final Execution exec = Executions.getCurrent();
    private String user_login;

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
        

    private void initComponets() {
        usuario=(Usuario) winDetalle.getAttribute("USUARIO");
        almacen=(Almacen) winDetalle.getAttribute("ALMACEN");
        inventario=(InventarioValorizado) winDetalle.getAttribute("INVENTARIO");
        listaExistencia=(List<ExistenciaValorizada>) winDetalle.getAttribute("LISTAEXISTENCIA");
        modeloDetalle=new ListModelList(listaExistencia);
        lstDetalle.setModel(modeloDetalle);
        lstDetalle.onInitRender();
        cargarPie();
    }
    
    
    private void cargarPie(){
        BigDecimal ncosto= new BigDecimal(BigInteger.ZERO);
        BigDecimal nprecio = new BigDecimal(BigInteger.ZERO);
        List<Listitem> ldatos = lstDetalle.getItems();
        ExistenciaValorizada invvalorizado;
        for (Listitem item : ldatos) {
            invvalorizado=(ExistenciaValorizada) modeloDetalle.getElementAt(item.getIndex());
            ncosto=ncosto.add(invvalorizado.getNsubcos());
            nprecio=nprecio.add(invvalorizado.getNprecos());
        }
        nCosto.setValue(ncosto);
        nPcosto.setValue(nprecio);
    }

    

    public void imprimir() {
        HashMap parametro = new HashMap();
        parametro.put("RUTA", almacen.getIdunidad().getIdempresa().getCruta()); 
        parametro.put("EMPRESA", almacen.getIdunidad().getIdempresa().getCnomempresa());
        parametro.put("UNIDADNEGOCIO", almacen.getIdunidad().getCnomunidad());
        parametro.put("ALMACEN", almacen.getCnomalmacen());
        parametro.put("USUARIO", usuario.getCnomusuario());
        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modeloDetalle);
        rptreporte.setSrc("/modulos/almacen/reporte/detalleinventariovalorizado.jasper");
        rptreporte.setDatasource(data);
        rptreporte.setParameters(parametro);
        rptreporte.setType("pdf");        
    }
    public void exportar() throws IOException {
        EsportaExcel2(lstDetalle,inventario.getIdlinea().getCnomlinea().trim() + ".xls");
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
