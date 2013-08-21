package com.zarcillo.dao;

import java.util.Date;
import java.util.List;

public interface ListadoProveedorDAO {
     
     List<Date> listaFechasCronogramaPago(Date dfecha1,Date dfecha2);
}