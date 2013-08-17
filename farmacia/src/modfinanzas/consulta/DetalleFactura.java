package modfinanzas.consulta;

import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.RegistroEntrada;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.CuentaPagarService;
import com.zarcillo.service.DocumentoService;
import com.zarcillo.service.MonedaService;
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
public class DetalleFactura extends SelectorComposer {

    private CuentaPagar cpagar=new CuentaPagar();
    private Usuario usuario;
    private ListModelList modeloDetalle;
    private ListModelList modeloDocumento;
    private ListModelList modeloMoneda;
    @Wire
    private Window winDetalle;
    @Wire
    private Intbox nOperacion;
    @Wire
    private Datebox dFecemi;
    @Wire
    private Datebox dFecven;
    @Wire
    private Datebox dFeccan;
    @Wire
    private Combobox cboDocumento;
    @Wire
    private Textbox txtSerie;
    @Wire
    private Textbox txtNumero;
    @Wire
    private Textbox txtSergui;
    @Wire
    private Textbox txtNumgui;
    @Wire
    private Intbox nPlazo;
    @Wire
    private Combobox cboMoneda;
    @Wire
    private Decimalbox nAfecto;
    @Wire
    private Decimalbox nInafecto;
    @Wire
    private Decimalbox nIgv;
    @Wire
    private Decimalbox nImporte;
    @Wire
    private Decimalbox nAcuenta;
    @Wire
    private Decimalbox nNotabo;
    @Wire
    private Decimalbox nNotcar;
    @Wire
    private Decimalbox nSaldo;
    @Wire
    private Listbox lstDetalle;    
    @Wire
    private Textbox txtIgv;
    @Wire
    private Jasperreport rptreporte;
    @WireVariable
    CuentaPagarService cuentaPagarService;
    @WireVariable 
    MonedaService monedaService;
    @WireVariable
    DocumentoService documentoService;
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
        //imprimir();
    }
    

    private void initComponets() {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        
        cpagar =  (CuentaPagar) winDetalle.getAttribute("CUENTAPAGAR");
        llenarDatos();
    }
    
    private void llenarDatos(){
        
    }
/*

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

    }*/

    
}
