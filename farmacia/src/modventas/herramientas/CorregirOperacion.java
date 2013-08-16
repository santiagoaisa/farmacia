package modventas.herramientas;

import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.RegistroSalidaService;
import com.zarcillo.service.UnidadNegocioService;
import com.zarcillo.service.UsuarioService;
import java.math.BigDecimal;
import java.math.BigInteger;
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
import org.zkoss.zul.*;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class CorregirOperacion extends SelectorComposer{

    private RegistroSalida regsalida = new RegistroSalida();
    private ListModelList modeloUnidad;
    private Usuario usuario;
    
    @Wire
    private Combobox cboUnidad;
    @Wire
    private Intbox nOperacion;
    @Wire
    private Textbox txtSerori;
    @Wire
    private Textbox txtNumori;
    @Wire
    private Textbox txtCliente;
    @Wire
    private Textbox txtTipo;
    @Wire
    private Decimalbox nImporte;
    @Wire
    private Textbox txtSerie;
    @Wire
    private Textbox txtNumero;
    
    @WireVariable
    UnidadNegocioService unidadNegocioService;
    @WireVariable
    RegistroSalidaService registroSalidaService;
    @WireVariable 
    UsuarioService usuarioService;
    
    private String user_login;
    final Execution exec = Executions.getCurrent();
    
    @Listen("onCreate=window#winCorreccion")
    public void onCreate() throws NamingException {
        initComponets();
    }
    
    @Listen("  onOK = #nOperacion ")
    public void buscarRegsalida() {
        buscar(nOperacion.getValue());
    }
    
    @Listen("onClick = #btnGrabar")
    public void onGrabar(Event event) {
        registrar();
    }
    
    @Listen("onClick = #btnIgnorar")
    public void onIgnorar(Event event) {
        limpiar();
    }
    
    private void initComponets() {        
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        modeloUnidad = new ListModelList(unidadNegocioService.listaPorClogin(usuario.getClogin())); 
        cboUnidad.setModel(modeloUnidad);
        if (modeloUnidad.size() > 0) {
            cboUnidad.onInitRender(new Event("", cboUnidad));
            cboUnidad.close();
            cboUnidad.setSelectedIndex(0);
        }
    }
    
    private void buscar(int operacion){
        validar();
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        regsalida=registroSalidaService.buscarPorIdunidadPorIdregsalida(unidad.getIdunidad(), operacion);
        txtSerori.setValue(regsalida.getCserie());
        txtNumori.setValue(regsalida.getCnumero());
        txtCliente.setValue(regsalida.getIdcliente().getCnomcli());
        txtTipo.setValue(regsalida.getIddocumento().getCnomdocumento());
        nImporte.setValue(regsalida.getNimporte());
        txtSerie.setValue(regsalida.getCserie());
        txtNumero.focus();
    }
    
    private void limpiar(){        
        txtSerie.setConstraint("");
        txtNumero.setConstraint("");
        regsalida=new RegistroSalida();
        txtSerori.setValue("");
        txtNumori.setValue("");
        txtCliente.setValue("");
        txtTipo.setValue("");
        nImporte.setValue(new BigDecimal(BigInteger.ZERO));
        txtSerie.setValue("");
        txtNumero.setValue("");
        nOperacion.setText("");
        nOperacion.focus();
    }    
    

    public void registrar(){        
        if(regsalida.getIdregsalida()==null){
             throw new  ExceptionZarcillo("Debe buscar un Documento");
        }
        txtSerie.setConstraint(new ConstraintCamposObligatorios());
        txtNumero.setConstraint(new ConstraintCamposObligatorios());
        txtSerie.getValue();
        txtNumero.getValue();
        registroSalidaService.reemplazarNumeracion(regsalida.getIdregsalida(),txtSerie.getText(),txtNumero.getText());
        Messagebox.show("Se ha Grabado el Cambio Exitosamente", "Información del Sistema", Messagebox.OK, Messagebox.INFORMATION);
        limpiar();
    }
    
    private void validar() {
        cboUnidad.getValue();
        nOperacion.getValue();
    }
}

