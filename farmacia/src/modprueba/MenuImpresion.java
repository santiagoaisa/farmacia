package modprueba;

import java.util.HashMap;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.zkoss.zul.Applet;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Window;

public class MenuImpresion extends Window {
    //objetos

    private Applet applet;

    public MenuImpresion() {
    }

    public void onCreate() {
        initcomponentes();
    }

    private void initcomponentes() {
        applet = (Applet) getFellow("applet");
        applet.setCode("impresion");
        applet.setCodebase("/modulos/");
        applet.setArchive("impresora.jar,commons-collections-2.1.1.jar,commons-logging-1.1.1.jar,jasperreports-applet-5.1.0.jar");

        applet.setParam("code", "impresora");
        applet.setParam("codebase", "/farmacia/modulos/");
        applet.setParam("archive", "impresora.jar,commons-collections-2.1.1.jar,commons-logging-1.1.1.jar,jasperreports-applet-5.1.0.jar");

        applet.setParam("type", "application/x-java-applet");
        applet.setParam("scriptable", "true");
        
        
    }

    public void imprimirReporte(JasperReport reportecompilado, Integer idreporte, HashMap parametro, JRBeanCollectionDataSource data) {
        try {
            //ruta donde se crea archivo .jrprint
            //String destino = "/usr/local/jboss/server/default/deploy/jboss-web.deployer/ROOT.war/reporte/" + idreporte + ".jrprint";
            String destino="C:/Program Files/Apache Software Foundation/Tomcat 7.0/webapps/ROOT/reporte";
            //se crea un archivo .jrprint
            //JasperFillManager.fillReportToFile(reportecompilado, destino, parametro, data);
            String reporte = "../../reporte/" + idreporte + ".jrprint";

            applet.invoke("imprimir", reporte);

//        borrar el archivo una vez impreso
//            File archivo = new File(destino);
//            if (archivo.exists()) {
//                archivo.delete();
//            }
//        fin de borrar el archivo
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void dialogoImpresion(boolean enable) {
        if (!enable) {
            applet.invoke("dialogo", "N");
        }
    }

    public void elegirImpresora(String impresora) {
        //Determinamos la impresora donde vamos a imprimir
        applet.invoke("documento", impresora);
    }
}
