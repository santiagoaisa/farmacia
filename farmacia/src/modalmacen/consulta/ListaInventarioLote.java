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
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
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
    private void exportar() throws IOException{
        validarDetalle();
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
        EsportaExcel3("precios.xls", listaDetalle);
        
    }
    public void EsportaExcel3( String nomeFile,List<InventarioLote> listaInventario) throws IOException {
        
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("ZARCILLO");
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

        // cabecera
        int i = 0;
        row = sheet.createRow(0);
        HSSFCell cell0 = row.createCell(0);
        cell0.setCellStyle(cellStyleRedBold);
        cell0.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell0.setCellValue("idproducto");        
        HSSFCell cell1 = row.createCell(1);
        cell1.setCellStyle(cellStyleRedBold);
        cell1.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell1.setCellValue("Unimed");
        HSSFCell cell2 = row.createCell(2);
        cell2.setCellStyle(cellStyleRedBold);
        cell2.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell2.setCellValue("F/");
        HSSFCell cell3 = row.createCell(3);
        cell3.setCellStyle(cellStyleRedBold);
        cell3.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell3.setCellValue("Descripcion");
        HSSFCell cell4 = row.createCell(4);
        cell4.setCellStyle(cellStyleRedBold);
        cell4.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell4.setCellValue("Stock");
        HSSFCell cell5 = row.createCell(5);
        cell5.setCellStyle(cellStyleRedBold);
        cell5.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell5.setCellValue("Stock(F/)");
        HSSFCell cell6 = row.createCell(6);
        cell6.setCellStyle(cellStyleRedBold);
        cell6.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell6.setCellValue("Ubicacion");
        HSSFCell cell7 = row.createCell(7);
        cell7.setCellStyle(cellStyleRedBold);
        cell7.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell7.setCellValue("Lote");
        HSSFCell cell8 = row.createCell(8);
        cell8.setCellStyle(cellStyleRedBold);
        cell8.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell8.setCellValue("Vencimiento");
        HSSFCell cell9 = row.createCell(9);
        cell9.setCellStyle(cellStyleRedBold);
        cell9.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell9.setCellValue("Cant(Entero)");
        HSSFCell cell10 = row.createCell(10);
        cell10.setCellStyle(cellStyleRedBold);
        cell10.setCellType(HSSFCell.CELL_TYPE_STRING);
        cell10.setCellValue("Cant(Fraccion)");
        
        // detalle
        int x = 1;
        int y = 0;

        for (InventarioLote r : listaInventario) {
            row = sheet.createRow(x);
            HSSFCell cell = row.createCell(0);            
            cell.setCellStyle(cellStyleNormal);
            cell.setCellType(HSSFCell.CELL_TYPE_STRING);
            cell.setCellValue(r.getIdproducto().getIdproducto());
            
            cell = row.createCell(1);            
            cell.setCellStyle(cellStyleNormal);
            cell.setCellType(HSSFCell.CELL_TYPE_STRING);
            cell.setCellValue(r.getIdproducto().getIdpresentacion().getCabrev());

            cell = row.createCell(2);
            cell.setCellStyle(cellStyleNormal);
            cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
            cell.setCellValue(r.getIdproducto().getNmenudeo());
            
            cell = row.createCell(3);            
            cell.setCellStyle(cellStyleNormal);
            cell.setCellType(HSSFCell.CELL_TYPE_STRING);
            cell.setCellValue(r.getIdproducto().getCnomproducto());
            
            cell = row.createCell(4);
            cell.setCellStyle(cellStyleNormal);
            cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
            cell.setCellValue(r.getNstock());
            
            cell = row.createCell(5);
            cell.setCellStyle(cellStyleNormal);
            cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
            cell.setCellValue(r.getNstockm());
            
            cell = row.createCell(6);
            cell.setCellStyle(cellStyleNormal);
            cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
            cell.setCellValue(r.getCubicacion());
            
            cell = row.createCell(7);            
            cell.setCellStyle(cellStyleNormal);
            cell.setCellType(HSSFCell.CELL_TYPE_STRING);
            cell.setCellValue(r.getClote());
            
            cell = row.createCell(8);            
            cell.setCellStyle(cellStyleNormal);
            cell.setCellType(HSSFCell.CELL_TYPE_STRING);
            cell.setCellValue(r.getCfecven());
            
            cell = row.createCell(9);
            cell.setCellStyle(cellStyleNormal);
            cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
            cell.setCellValue(r.getNcanart());
            
            cell = row.createCell(10);
            cell.setCellStyle(cellStyleNormal);
            cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
            cell.setCellValue(r.getNcanartm());             
                        
            x++;
        }
        FileOutputStream fOut = new FileOutputStream(nomeFile);
        // Write the Excel sheet
        workbook.write(fOut);
        fOut.flush();
        // Done deal. Close it.
        fOut.close();
        File file = new File(nomeFile);
        Filedownload.save(file, "XLS");
    }   
}
