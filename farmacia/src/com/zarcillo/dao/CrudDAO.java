package com.zarcillo.dao;

import java.util.List;

public interface CrudDAO {
    
    <T> void registrar(T objeto);
    <T> void actualizar(T objeto);
    <T> void eliminar(T objeto);
    <T> T buscar(Class<T> klass,Integer id);
    <T> List<T> listarTodos(Class<T> klass);
    
    
    
}
