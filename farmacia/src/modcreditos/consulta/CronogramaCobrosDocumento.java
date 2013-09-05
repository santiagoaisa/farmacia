package modcreditos.consulta;

import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.dto.creditos.CronogramaCobroCliente;
import com.zarcillo.dto.finanzas.DetalleCronogramaPagoProveedor;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.naming.NamingException;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.zkoss.zarcillo.ExportarHojaCalculo;
import org.zkoss.zarcillo.ExportarPdf;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire; 
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class CronogramaCobrosDocumento extends SelectorComposer {

    private Usuario usuario;
    private ListModelList modeloDetalle;
    private UnidadNegocio unidad;
    private CronogramaCobroCliente cronograma;
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
        cronograma=(CronogramaCobroCliente) winDocumento.getAttribute("CRONOGRAMACLIENTE");
        dFecha=(Date) winDocumento.getAttribute("FECHA");
        
        modeloDetalle = new ListModelList(cronograma.getDetalleCronogramaCobroClienteCollection());
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
        ExportarPdf.exportJasperToPdf("CronogramaPagos", data, parametro,"/resources/creditos/documentocronogramacobranza.jasper");        
    }
    
    public void exportar(){            
        ExportarHojaCalculo.exportListboxToExcel(lstDetalle,"Cronograma");             
    }  
}
