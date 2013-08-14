package modventas.proceso;

import com.zarcillo.domain.MotivoAnulacion;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.AnulacionService;
import com.zarcillo.service.RegistroSalidaService;
import com.zarcillo.service.UnidadNegocioService;
import com.zarcillo.service.UsuarioService;
import com.zarcillo.service.VentaService;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintCamposObligatorios;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Datebox;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.Intbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class AnulaEgresos extends SelectorComposer {

    private Usuario usuario;
    private RegistroSalida regsalida = new RegistroSalida();
    private ListModelList modeloUnidad;
    private ListModelList modeloMotivo;
    @Wire
    private Window winAnulaegreso;
    @Wire
    private Combobox cboUnidad;
    @Wire
    private Combobox cboMotivo;
    
    @Wire
    private Datebox dFecemi;
    @Wire
    private Datebox dFecanu;
    
    @Wire
    private Toolbarbutton btnEliminar;
    @Wire
    private Intbox nOperacion;
    @Wire
    private Textbox txtComprobante;
    @Wire
    private Textbox txtSerie;
    @Wire
    private Textbox txtNumero;
    @Wire
    private Textbox txtDni;
    @Wire
    private Textbox txtCliente;
    @Wire
    private Decimalbox nImporte;
    
    @WireVariable
    AnulacionService anulacionService;
    @WireVariable
    VentaService ventaService;
    @WireVariable
    UnidadNegocioService unidadNegocioService;
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    RegistroSalidaService registroSalidaService;
    private String user_login;
    final Execution exec = Executions.getCurrent();

    @Listen("onCreate=window#winAnulaegreso")
    public void onCreate() throws NamingException {
        initComponets();
    }

    @Listen("onClick = #btnEliminar")
    public void onEliminar(Event event) {
        eliminarSalida();
    }
    
    @Listen("onOK = #nOperacion ")
    public void calcular() {
        buscarSalida();
    }
    
    private void buscarSalida(){
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        regsalida=registroSalidaService.buscarPorIdunidadPorIdregsalida(unidad.getIdunidad(), nOperacion.getValue());
        txtComprobante.setText(regsalida.getIddocumento().getCnomdocumento());
        txtSerie.setText(regsalida.getCserie());
        txtNumero.setText(regsalida.getCnumero());
        dFecemi.setValue(regsalida.getDfecha());
        txtCliente.setValue(regsalida.getIdcliente().getCnomcli());
        nImporte.setValue(regsalida.getNimporte());
    }    

    public void initComponets() {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        modeloUnidad= new ListModelList(unidadNegocioService.listaGeneral());
        cboUnidad.setModel(modeloUnidad);
        if (modeloUnidad.size() > 0) {
            cboUnidad.onInitRender(new Event("", cboUnidad));
            cboUnidad.close();
            cboUnidad.setSelectedIndex(0);
        }
        modeloMotivo = new ListModelList(anulacionService.listaMotivoAnulacion());
        cboMotivo.setModel(modeloMotivo);
        if (modeloMotivo.size() > 0) {
            cboMotivo.onInitRender(new Event("", cboMotivo));
            cboMotivo.close();
            cboMotivo.setSelectedIndex(0);
        }
        dFecanu.setValue(new Date());
        nOperacion.focus();
    }
    
    private void validar() {
        cboUnidad.setConstraint(new ConstraintCamposObligatorios());
        cboUnidad.getValue();
    }
    
    private void limpiar(){
        regsalida=new RegistroSalida();
        txtComprobante.setText("");
        txtSerie.setText("");
        txtNumero.setText("");
        dFecemi.setText("");
        txtCliente.setValue("");
        nImporte.setValue(new BigDecimal(BigInteger.ZERO));
    }

    public void eliminarSalida() {
        validar();
        MotivoAnulacion motivo=(MotivoAnulacion) modeloMotivo.getElementAt(cboMotivo.getSelectedIndex());
        anulacionService.anular(regsalida.getIdregsalida(), motivo, usuario);
        Messagebox.show( "ANULACION SATISFACTORIA","ANULACION", Messagebox.OK, Messagebox.INFORMATION);        
        limpiar();
    }
}
