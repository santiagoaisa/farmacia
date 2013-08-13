package modmantenimiento.util;

import com.zarcillo.service.ExceptionZarcillo;
import java.util.HashMap;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.zkoss.zul.Applet;
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
        applet.setCode("Impresion.class");
        applet.setCodebase("/applet");
        applet.setArchive("impresion.jar,commons-collections-2.1.1.jar,commons-logging-1.1.1.jar,jasperreports-applet-5.1.0.jar");

        applet.setParam("code", "Impresion.class");
        applet.setParam("codebase", "/applet");
        applet.setParam("archive","impresion.jar,commons-collections-2.1.1.jar,commons-logging-1.1.1.jar,jasperreports-applet-5.1.0.jar");

        applet.setParam("type", "application/x-java-applet");
        applet.setParam("scriptable", "false");
        
        
    }

    public void imprimirReporte(JasperReport reportecompilado, Integer idreporte, HashMap parametro, JRBeanCollectionDataSource data) {
        try {
            //ruta donde se crea archivo .jrprint
            //String destino = "/usr/local/jboss/server/default/deploy/jboss-web.deployer/ROOT.war/reporte/" + idreporte + ".jrprint";
            //descomentar
            String destino="C:/Apache Software Foundation/Tomcat 7.0/webapps/ROOT/reporte/"+ idreporte + ".jrprint";            
            //se crea un archivo .jrprint
            //descomentar
            
            JasperFillManager.fillReportToFile(reportecompilado, destino, parametro, data);
            String reporte = "/reporte/" + idreporte + ".jrprint";

            applet.invoke("imprimir", reporte);

//        borrar el archivo una vez impreso
//            File archivo = new File(destino);
//            if (archivo.exists()) {
//                archivo.delete();
//            }
//        fin de borrar el archivo
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getMessage());
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
