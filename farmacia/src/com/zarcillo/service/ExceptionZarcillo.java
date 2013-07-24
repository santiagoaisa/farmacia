package com.zarcillo.service;

public class ExceptionZarcillo extends RuntimeException {

    public ExceptionZarcillo(String mensaje) {
        super(mensaje);
    }
}