package modalmacen.consulta;

import com.zarcillo.domain.RegistroEntrada;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.RegistroEntradaService;
import com.zarcillo.service.UsuarioService;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Textbox;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import javax.naming.NamingException;
import org.apache.poi.hssf.usermodel.*;
import org.zkoss.zkex.zul.Jasperreport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
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
public class DetalleIngreso extends SelectorComposer {

    private RegistroEntrada rentrada;
    private Usuario usuario;
    private ListModelList modeloDetalle;
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
    @Wire
    private Jasperreport rptreporte;
    @WireVariable
    RegistroEntradaService registroEntradaService;
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

    private void initComponets() {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        rentrada = (RegistroEntrada) winDetalle.getAttribute("INGRESO");
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
        rptreporte.setSrc("/modulos/almacen/reporte/detalleingreso.jasper");
        rptreporte.setDatasource(data);
        rptreporte.setParameters(parametro);
        rptreporte.setType("pdf");

    }

    public void exportar() throws IOException {
        EsportaExcel2(lstDetalle, rentrada.getIdregentrada() + ".xls");
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
