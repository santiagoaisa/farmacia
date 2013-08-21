package modventas.herramientas;

import com.zarcillo.domain.Documento;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.dto.numeracion.Formato;
import com.zarcillo.service.DocumentoService;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.NumeracionService;
import com.zarcillo.service.UnidadNegocioService;
import com.zarcillo.service.UsuarioService;
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
public class ActualizarNumeracion extends SelectorComposer{

    private Formato formato;
    private ListModelList modeloUnidad;
    private ListModelList modeloDocumento;
    private Usuario usuario;
    
    @Wire
    private Combobox cboUnidad;
    @Wire
    private Combobox cboDocumento;
    @Wire
    private Textbox txtSerie;
    @Wire
    private Intbox nNumero;
    
    @WireVariable
    UnidadNegocioService unidadNegocioService;
    
    @WireVariable
    DocumentoService documentoService;
    
    @WireVariable
    NumeracionService numeracionService;
    
    @WireVariable 
    UsuarioService usuarioService;
    
    private String user_login;
    final Execution exec = Executions.getCurrent();
    
    
    @Listen("onCreate=window#winActualiza")
    public void onCreate() throws NamingException {
        initComponets();
    }
    
    
    @Listen("onClick = #btnRegistrar")
    public void onGrabar(Event event) {
        registrar();
    }
    
    @Listen("onSelect = #cboDocumento")
    public void onseleccionarDocumento(Event event) {
        buscarNumeracion();
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
                
        modeloDocumento=new ListModelList(documentoService.listaDocumentoVenta());
        cboDocumento.setModel(modeloDocumento);     
    }
    
    private void buscarNumeracion(){
        validar();
        formato=null;
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        Documento documento=(Documento)modeloDocumento.getElementAt(cboDocumento.getSelectedIndex());
        formato=numeracionService.buscarPorIdunidadPorIddocumento(unidad.getIdunidad(),documento.getIddocumento());
        txtSerie.setValue(formato.getCserie());
        nNumero.setValue(formato.getNnumero());
        
    }

    public void agregarConstraint() {
        cboUnidad.setConstraint(new ConstraintCamposObligatorios());
        cboDocumento.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        cboUnidad.setConstraint("");
        cboDocumento.setConstraint("");
    }


    private void validar(){
        agregarConstraint();
        cboUnidad.getValue();
        cboDocumento.getValue();
    }

    public void registrar(){
        validar();
        if(formato==null){
            throw new ExceptionZarcillo("Debe de buscar un Documento");
        }
        formato.setNnumero(nNumero.getValue());
        numeracionService.actualizar(formato);
        Messagebox.show("Numeracion Actualizada");         
    }   
}