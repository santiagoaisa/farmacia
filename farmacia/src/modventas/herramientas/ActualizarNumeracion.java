package modventas.herramientas;

import com.zarcillo.domain.Documento;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.dto.numeracion.Formato;
import com.zarcillo.service.DocumentoService;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.NumeracionService;
import com.zarcillo.service.UnidadNegocioService;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintCamposObligatorios;
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
    
    
    @Listen("onCreate=window#winCorreccion")
    public void onCreate() throws NamingException {
        initComponets();
    }
    
    
    @Listen("onClick = #btnGrabar")
    public void onGrabar(Event event) {
        registrar();
    }
    
    @Listen("onSelect = #cboDocumento")
    public void onseleccionarDocumento(Event event) {
        buscarNumeracion();
    }
        

    private void initComponets() {
        modeloUnidad=new ListModelList(unidadNegocioService.listaGeneral());        
        cboUnidad.setModel(modeloUnidad);
        if (modeloUnidad.size() > 0) {
            cboUnidad.onInitRender(new Event("", cboUnidad));
            cboUnidad.close();
            cboUnidad.setSelectedIndex(0);
        }
                
        modeloDocumento=new ListModelList(documentoService.listaDocumentoVenta());
        cboDocumento.setModel(modeloDocumento);

        if (modeloDocumento.size() > 0) {
            cboDocumento.onInitRender(new Event("", cboDocumento));
            cboDocumento.close();
            cboDocumento.setSelectedIndex(0);
        }        
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