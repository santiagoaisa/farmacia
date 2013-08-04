--
-- PostgreSQL database dump
--

-- Started on 2013-08-04 12:27:26

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 6 (class 2615 OID 52280)
-- Name: log; Type: SCHEMA; Schema: -; Owner: agewunue_farmacia
--

CREATE SCHEMA log;


ALTER SCHEMA log OWNER TO agewunue_farmacia;

--
-- TOC entry 1048 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--


SET search_path = log, pg_catalog;

--
-- TOC entry 141 (class 1259 OID 52281)
-- Dependencies: 6
-- Name: seq_log_almacen; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_almacen
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_almacen OWNER TO agewunue_farmacia;

--
-- TOC entry 3294 (class 0 OID 0)
-- Dependencies: 141
-- Name: seq_log_almacen; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_almacen', 1, false);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 142 (class 1259 OID 52283)
-- Dependencies: 2379 2380 6
-- Name: log_almacen; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_almacen (
    idlog integer DEFAULT nextval('seq_log_almacen'::regclass) NOT NULL,
    idalmacen integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_almacen OWNER TO agewunue_farmacia;

--
-- TOC entry 143 (class 1259 OID 52291)
-- Dependencies: 6
-- Name: seq_log_autorizacion; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_autorizacion
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_autorizacion OWNER TO agewunue_farmacia;

--
-- TOC entry 3295 (class 0 OID 0)
-- Dependencies: 143
-- Name: seq_log_autorizacion; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_autorizacion', 1, false);


--
-- TOC entry 144 (class 1259 OID 52293)
-- Dependencies: 2381 2382 6
-- Name: log_autorizacion; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_autorizacion (
    idlog integer DEFAULT nextval('seq_log_autorizacion'::regclass) NOT NULL,
    idautorizacion integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_autorizacion OWNER TO agewunue_farmacia;

--
-- TOC entry 145 (class 1259 OID 52301)
-- Dependencies: 6
-- Name: seq_log_aval; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_aval
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_aval OWNER TO agewunue_farmacia;

--
-- TOC entry 3296 (class 0 OID 0)
-- Dependencies: 145
-- Name: seq_log_aval; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_aval', 1, false);


--
-- TOC entry 146 (class 1259 OID 52303)
-- Dependencies: 2383 2384 6
-- Name: log_aval; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_aval (
    idlog integer DEFAULT nextval('seq_log_aval'::regclass) NOT NULL,
    idaval integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_aval OWNER TO agewunue_farmacia;

--
-- TOC entry 147 (class 1259 OID 52311)
-- Dependencies: 6
-- Name: seq_log_banco; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_banco
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_banco OWNER TO agewunue_farmacia;

--
-- TOC entry 3297 (class 0 OID 0)
-- Dependencies: 147
-- Name: seq_log_banco; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_banco', 1, false);


--
-- TOC entry 148 (class 1259 OID 52313)
-- Dependencies: 2385 2386 6
-- Name: log_banco; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_banco (
    idlog integer DEFAULT nextval('seq_log_banco'::regclass) NOT NULL,
    idbanco integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_banco OWNER TO agewunue_farmacia;

--
-- TOC entry 149 (class 1259 OID 52321)
-- Dependencies: 6
-- Name: seq_log_cheque_cliente; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_cheque_cliente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_cheque_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 3298 (class 0 OID 0)
-- Dependencies: 149
-- Name: seq_log_cheque_cliente; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_cheque_cliente', 1, false);


--
-- TOC entry 150 (class 1259 OID 52323)
-- Dependencies: 2387 2388 6
-- Name: log_cheque_cliente; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_cheque_cliente (
    idlog integer DEFAULT nextval('seq_log_cheque_cliente'::regclass) NOT NULL,
    idcheque integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_cheque_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 328 (class 1259 OID 57606)
-- Dependencies: 6
-- Name: seq_log_cheque_proveedor; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_cheque_proveedor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_cheque_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 3299 (class 0 OID 0)
-- Dependencies: 328
-- Name: seq_log_cheque_proveedor; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_cheque_proveedor', 1, false);


--
-- TOC entry 329 (class 1259 OID 57608)
-- Dependencies: 2718 2719 6
-- Name: log_cheque_proveedor; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_cheque_proveedor (
    idlog integer DEFAULT nextval('seq_log_cheque_proveedor'::regclass) NOT NULL,
    idcheque integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_cheque_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 151 (class 1259 OID 52331)
-- Dependencies: 6
-- Name: seq_log_cliente; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_cliente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 3300 (class 0 OID 0)
-- Dependencies: 151
-- Name: seq_log_cliente; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_cliente', 1, false);


--
-- TOC entry 152 (class 1259 OID 52333)
-- Dependencies: 2389 2390 6
-- Name: log_cliente; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_cliente (
    idlog integer DEFAULT nextval('seq_log_cliente'::regclass) NOT NULL,
    idcliente integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 153 (class 1259 OID 52341)
-- Dependencies: 6
-- Name: seq_log_comprobante_emitido; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_comprobante_emitido
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_comprobante_emitido OWNER TO agewunue_farmacia;

--
-- TOC entry 3301 (class 0 OID 0)
-- Dependencies: 153
-- Name: seq_log_comprobante_emitido; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_comprobante_emitido', 1, false);


--
-- TOC entry 154 (class 1259 OID 52343)
-- Dependencies: 2391 2392 6
-- Name: log_comprobante_emitido; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_comprobante_emitido (
    idlog integer DEFAULT nextval('seq_log_comprobante_emitido'::regclass) NOT NULL,
    idcomprobante integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_comprobante_emitido OWNER TO agewunue_farmacia;

--
-- TOC entry 155 (class 1259 OID 52351)
-- Dependencies: 6
-- Name: seq_log_condicion_venta; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_condicion_venta
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_condicion_venta OWNER TO agewunue_farmacia;

--
-- TOC entry 3302 (class 0 OID 0)
-- Dependencies: 155
-- Name: seq_log_condicion_venta; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_condicion_venta', 1, false);


--
-- TOC entry 156 (class 1259 OID 52353)
-- Dependencies: 2393 2394 6
-- Name: log_condicion_venta; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_condicion_venta (
    idlog integer DEFAULT nextval('seq_log_condicion_venta'::regclass) NOT NULL,
    idcondicion integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_condicion_venta OWNER TO agewunue_farmacia;

--
-- TOC entry 157 (class 1259 OID 52361)
-- Dependencies: 6
-- Name: seq_log_cuenta_bancaria; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_cuenta_bancaria
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_cuenta_bancaria OWNER TO agewunue_farmacia;

--
-- TOC entry 3303 (class 0 OID 0)
-- Dependencies: 157
-- Name: seq_log_cuenta_bancaria; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_cuenta_bancaria', 1, false);


--
-- TOC entry 158 (class 1259 OID 52363)
-- Dependencies: 2395 2396 6
-- Name: log_cuenta_bancaria; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_cuenta_bancaria (
    idlog integer DEFAULT nextval('seq_log_cuenta_bancaria'::regclass) NOT NULL,
    idcuenta integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_cuenta_bancaria OWNER TO agewunue_farmacia;

--
-- TOC entry 159 (class 1259 OID 52371)
-- Dependencies: 6
-- Name: seq_log_cuenta_pagar; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_cuenta_pagar
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_cuenta_pagar OWNER TO agewunue_farmacia;

--
-- TOC entry 3304 (class 0 OID 0)
-- Dependencies: 159
-- Name: seq_log_cuenta_pagar; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_cuenta_pagar', 1, false);


--
-- TOC entry 160 (class 1259 OID 52373)
-- Dependencies: 2397 2398 6
-- Name: log_cuenta_pagar; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_cuenta_pagar (
    idlog integer DEFAULT nextval('seq_log_cuenta_pagar'::regclass) NOT NULL,
    idcuenta integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_cuenta_pagar OWNER TO agewunue_farmacia;

--
-- TOC entry 161 (class 1259 OID 52381)
-- Dependencies: 6
-- Name: seq_log_deposito_cliente; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_deposito_cliente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_deposito_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 3305 (class 0 OID 0)
-- Dependencies: 161
-- Name: seq_log_deposito_cliente; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_deposito_cliente', 1, false);


--
-- TOC entry 162 (class 1259 OID 52383)
-- Dependencies: 2399 2400 6
-- Name: log_deposito_cliente; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_deposito_cliente (
    idlog integer DEFAULT nextval('seq_log_deposito_cliente'::regclass) NOT NULL,
    iddeposito integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_deposito_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 163 (class 1259 OID 52391)
-- Dependencies: 6
-- Name: seq_log_detalle_autorizacion; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_detalle_autorizacion
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_detalle_autorizacion OWNER TO agewunue_farmacia;

--
-- TOC entry 3306 (class 0 OID 0)
-- Dependencies: 163
-- Name: seq_log_detalle_autorizacion; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_detalle_autorizacion', 1, false);


--
-- TOC entry 164 (class 1259 OID 52393)
-- Dependencies: 2401 2402 6
-- Name: log_detalle_autorizacion; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_detalle_autorizacion (
    idlog integer DEFAULT nextval('seq_log_detalle_autorizacion'::regclass) NOT NULL,
    iddetalle integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_detalle_autorizacion OWNER TO agewunue_farmacia;

--
-- TOC entry 165 (class 1259 OID 52401)
-- Dependencies: 6
-- Name: seq_log_documento; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_documento
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_documento OWNER TO agewunue_farmacia;

--
-- TOC entry 3307 (class 0 OID 0)
-- Dependencies: 165
-- Name: seq_log_documento; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_documento', 1, false);


--
-- TOC entry 166 (class 1259 OID 52403)
-- Dependencies: 2403 2404 6
-- Name: log_documento; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_documento (
    idlog integer DEFAULT nextval('seq_log_documento'::regclass) NOT NULL,
    iddocumento integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_documento OWNER TO agewunue_farmacia;

--
-- TOC entry 167 (class 1259 OID 52411)
-- Dependencies: 6
-- Name: seq_log_empresa; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_empresa
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_empresa OWNER TO agewunue_farmacia;

--
-- TOC entry 3308 (class 0 OID 0)
-- Dependencies: 167
-- Name: seq_log_empresa; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_empresa', 9, true);


--
-- TOC entry 168 (class 1259 OID 52413)
-- Dependencies: 2405 2406 6
-- Name: log_empresa; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_empresa (
    idlog integer DEFAULT nextval('seq_log_empresa'::regclass) NOT NULL,
    idempresa integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_empresa OWNER TO agewunue_farmacia;

--
-- TOC entry 169 (class 1259 OID 52421)
-- Dependencies: 6
-- Name: seq_log_existencia; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_existencia
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_existencia OWNER TO agewunue_farmacia;

--
-- TOC entry 3309 (class 0 OID 0)
-- Dependencies: 169
-- Name: seq_log_existencia; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_existencia', 1, false);


--
-- TOC entry 170 (class 1259 OID 52423)
-- Dependencies: 2407 2408 6
-- Name: log_existencia; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_existencia (
    idlog integer DEFAULT nextval('seq_log_existencia'::regclass) NOT NULL,
    idalmacen integer NOT NULL,
    idproducto character(6) NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_existencia OWNER TO agewunue_farmacia;

--
-- TOC entry 171 (class 1259 OID 52431)
-- Dependencies: 6
-- Name: seq_log_familia; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_familia
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_familia OWNER TO agewunue_farmacia;

--
-- TOC entry 3310 (class 0 OID 0)
-- Dependencies: 171
-- Name: seq_log_familia; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_familia', 1, false);


--
-- TOC entry 172 (class 1259 OID 52433)
-- Dependencies: 2409 2410 6
-- Name: log_familia; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_familia (
    idlog integer DEFAULT nextval('seq_log_familia'::regclass) NOT NULL,
    idfamilia integer NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_familia OWNER TO agewunue_farmacia;

--
-- TOC entry 173 (class 1259 OID 52441)
-- Dependencies: 6
-- Name: seq_log_letra_proveedor; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_letra_proveedor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_letra_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 3311 (class 0 OID 0)
-- Dependencies: 173
-- Name: seq_log_letra_proveedor; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_letra_proveedor', 1, false);


--
-- TOC entry 174 (class 1259 OID 52443)
-- Dependencies: 2411 2412 6
-- Name: log_letra_proveedor; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_letra_proveedor (
    idlog integer DEFAULT nextval('seq_log_letra_proveedor'::regclass) NOT NULL,
    idletra integer NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_letra_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 175 (class 1259 OID 52451)
-- Dependencies: 6
-- Name: seq_log_linea; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_linea
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_linea OWNER TO agewunue_farmacia;

--
-- TOC entry 3312 (class 0 OID 0)
-- Dependencies: 175
-- Name: seq_log_linea; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_linea', 1, true);


--
-- TOC entry 176 (class 1259 OID 52453)
-- Dependencies: 2413 2414 6
-- Name: log_linea; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_linea (
    idlog integer DEFAULT nextval('seq_log_linea'::regclass) NOT NULL,
    idlinea integer NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_linea OWNER TO agewunue_farmacia;

--
-- TOC entry 177 (class 1259 OID 52461)
-- Dependencies: 6
-- Name: seq_log_lote; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_lote
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_lote OWNER TO agewunue_farmacia;

--
-- TOC entry 3313 (class 0 OID 0)
-- Dependencies: 177
-- Name: seq_log_lote; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_lote', 1, false);


--
-- TOC entry 178 (class 1259 OID 52463)
-- Dependencies: 2415 2416 6
-- Name: log_lote; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_lote (
    idlog integer DEFAULT nextval('seq_log_lote'::regclass) NOT NULL,
    idlote integer NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_lote OWNER TO agewunue_farmacia;

--
-- TOC entry 319 (class 1259 OID 54513)
-- Dependencies: 6
-- Name: seq_log_menu; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_menu
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_menu OWNER TO agewunue_farmacia;

--
-- TOC entry 3314 (class 0 OID 0)
-- Dependencies: 319
-- Name: seq_log_menu; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_menu', 1, false);


--
-- TOC entry 320 (class 1259 OID 54515)
-- Dependencies: 2696 2697 6
-- Name: log_menu; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_menu (
    idlog integer DEFAULT nextval('seq_log_menu'::regclass) NOT NULL,
    idmenu integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_menu OWNER TO agewunue_farmacia;

--
-- TOC entry 317 (class 1259 OID 54486)
-- Dependencies: 6
-- Name: seq_log_modulo; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_modulo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_modulo OWNER TO agewunue_farmacia;

--
-- TOC entry 3315 (class 0 OID 0)
-- Dependencies: 317
-- Name: seq_log_modulo; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_modulo', 1, false);


--
-- TOC entry 318 (class 1259 OID 54488)
-- Dependencies: 2694 2695 6
-- Name: log_modulo; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_modulo (
    idlog integer DEFAULT nextval('seq_log_modulo'::regclass) NOT NULL,
    idmodulo integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_modulo OWNER TO agewunue_farmacia;

--
-- TOC entry 179 (class 1259 OID 52471)
-- Dependencies: 6
-- Name: seq_log_moneda; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_moneda
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_moneda OWNER TO agewunue_farmacia;

--
-- TOC entry 3316 (class 0 OID 0)
-- Dependencies: 179
-- Name: seq_log_moneda; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_moneda', 1, false);


--
-- TOC entry 180 (class 1259 OID 52473)
-- Dependencies: 2417 2418 6
-- Name: log_moneda; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_moneda (
    idlog integer DEFAULT nextval('seq_log_moneda'::regclass) NOT NULL,
    idmoneda integer NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_moneda OWNER TO agewunue_farmacia;

--
-- TOC entry 181 (class 1259 OID 52481)
-- Dependencies: 6
-- Name: seq_log_motivo_entrada; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_motivo_entrada
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_motivo_entrada OWNER TO agewunue_farmacia;

--
-- TOC entry 3317 (class 0 OID 0)
-- Dependencies: 181
-- Name: seq_log_motivo_entrada; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_motivo_entrada', 1, false);


--
-- TOC entry 182 (class 1259 OID 52483)
-- Dependencies: 2419 2420 6
-- Name: log_motivo_entrada; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_motivo_entrada (
    idlog integer DEFAULT nextval('seq_log_motivo_entrada'::regclass) NOT NULL,
    idmotivo integer NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_motivo_entrada OWNER TO agewunue_farmacia;

--
-- TOC entry 183 (class 1259 OID 52491)
-- Dependencies: 6
-- Name: seq_log_motivo_notabo_cliente; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_motivo_notabo_cliente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_motivo_notabo_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 3318 (class 0 OID 0)
-- Dependencies: 183
-- Name: seq_log_motivo_notabo_cliente; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_motivo_notabo_cliente', 1, false);


--
-- TOC entry 184 (class 1259 OID 52493)
-- Dependencies: 2421 2422 6
-- Name: log_motivo_notabo_cliente; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_motivo_notabo_cliente (
    idlog integer DEFAULT nextval('seq_log_motivo_notabo_cliente'::regclass) NOT NULL,
    idmotivo integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_motivo_notabo_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 185 (class 1259 OID 52501)
-- Dependencies: 6
-- Name: seq_log_motivo_notabo_proveedor; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_motivo_notabo_proveedor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_motivo_notabo_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 3319 (class 0 OID 0)
-- Dependencies: 185
-- Name: seq_log_motivo_notabo_proveedor; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_motivo_notabo_proveedor', 1, false);


--
-- TOC entry 186 (class 1259 OID 52503)
-- Dependencies: 2423 2424 6
-- Name: log_motivo_notabo_proveedor; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_motivo_notabo_proveedor (
    idlog integer DEFAULT nextval('seq_log_motivo_notabo_proveedor'::regclass) NOT NULL,
    idmotivo integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_motivo_notabo_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 187 (class 1259 OID 52511)
-- Dependencies: 6
-- Name: seq_log_motivo_notcar_cliente; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_motivo_notcar_cliente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_motivo_notcar_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 3320 (class 0 OID 0)
-- Dependencies: 187
-- Name: seq_log_motivo_notcar_cliente; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_motivo_notcar_cliente', 1, false);


--
-- TOC entry 188 (class 1259 OID 52513)
-- Dependencies: 2425 2426 6
-- Name: log_motivo_notcar_cliente; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_motivo_notcar_cliente (
    idlog integer DEFAULT nextval('seq_log_motivo_notcar_cliente'::regclass) NOT NULL,
    idmotivo integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_motivo_notcar_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 189 (class 1259 OID 52521)
-- Dependencies: 6
-- Name: seq_log_motivo_notcar_proveedor; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_motivo_notcar_proveedor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_motivo_notcar_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 3321 (class 0 OID 0)
-- Dependencies: 189
-- Name: seq_log_motivo_notcar_proveedor; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_motivo_notcar_proveedor', 1, false);


--
-- TOC entry 190 (class 1259 OID 52523)
-- Dependencies: 2427 2428 6
-- Name: log_motivo_notcar_proveedor; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_motivo_notcar_proveedor (
    idlog integer DEFAULT nextval('seq_log_motivo_notcar_proveedor'::regclass) NOT NULL,
    idmotivo integer,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_motivo_notcar_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 191 (class 1259 OID 52531)
-- Dependencies: 6
-- Name: seq_log_motivo_salida; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_motivo_salida
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_motivo_salida OWNER TO agewunue_farmacia;

--
-- TOC entry 3322 (class 0 OID 0)
-- Dependencies: 191
-- Name: seq_log_motivo_salida; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_motivo_salida', 1, false);


--
-- TOC entry 192 (class 1259 OID 52533)
-- Dependencies: 2429 2430 6
-- Name: log_motivo_salida; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_motivo_salida (
    idlog integer DEFAULT nextval('seq_log_motivo_salida'::regclass) NOT NULL,
    idmotivo integer NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_motivo_salida OWNER TO agewunue_farmacia;

--
-- TOC entry 193 (class 1259 OID 52541)
-- Dependencies: 6
-- Name: seq_log_periodo; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_periodo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_periodo OWNER TO agewunue_farmacia;

--
-- TOC entry 3323 (class 0 OID 0)
-- Dependencies: 193
-- Name: seq_log_periodo; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_periodo', 1, false);


--
-- TOC entry 194 (class 1259 OID 52543)
-- Dependencies: 2431 2432 6
-- Name: log_periodo; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_periodo (
    idlog integer DEFAULT nextval('seq_log_periodo'::regclass) NOT NULL,
    idperiodo integer NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_periodo OWNER TO agewunue_farmacia;

--
-- TOC entry 195 (class 1259 OID 52551)
-- Dependencies: 6
-- Name: seq_log_presentacion; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_presentacion
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_presentacion OWNER TO agewunue_farmacia;

--
-- TOC entry 3324 (class 0 OID 0)
-- Dependencies: 195
-- Name: seq_log_presentacion; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_presentacion', 1, false);


--
-- TOC entry 196 (class 1259 OID 52553)
-- Dependencies: 2433 2434 6
-- Name: log_presentacion; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_presentacion (
    idlog integer DEFAULT nextval('seq_log_presentacion'::regclass) NOT NULL,
    idpresentacion integer NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_presentacion OWNER TO agewunue_farmacia;

--
-- TOC entry 197 (class 1259 OID 52561)
-- Dependencies: 6
-- Name: seq_log_producto; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_producto
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_producto OWNER TO agewunue_farmacia;

--
-- TOC entry 3325 (class 0 OID 0)
-- Dependencies: 197
-- Name: seq_log_producto; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_producto', 1, false);


--
-- TOC entry 198 (class 1259 OID 52563)
-- Dependencies: 2435 2436 6
-- Name: log_producto; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_producto (
    idlog integer DEFAULT nextval('seq_log_producto'::regclass) NOT NULL,
    idproducto character(6) NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_producto OWNER TO agewunue_farmacia;

--
-- TOC entry 199 (class 1259 OID 52571)
-- Dependencies: 6
-- Name: seq_log_proveedor; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_proveedor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 3326 (class 0 OID 0)
-- Dependencies: 199
-- Name: seq_log_proveedor; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_proveedor', 1, false);


--
-- TOC entry 200 (class 1259 OID 52573)
-- Dependencies: 2437 2438 6
-- Name: log_proveedor; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_proveedor (
    idlog integer DEFAULT nextval('seq_log_proveedor'::regclass) NOT NULL,
    idproveedor integer NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 201 (class 1259 OID 52581)
-- Dependencies: 6
-- Name: seq_log_rol; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_rol
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_rol OWNER TO agewunue_farmacia;

--
-- TOC entry 3327 (class 0 OID 0)
-- Dependencies: 201
-- Name: seq_log_rol; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_rol', 1, false);


--
-- TOC entry 202 (class 1259 OID 52583)
-- Dependencies: 2439 2440 6
-- Name: log_rol; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_rol (
    idlog integer DEFAULT nextval('seq_log_rol'::regclass) NOT NULL,
    idrol integer NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_rol OWNER TO agewunue_farmacia;

--
-- TOC entry 203 (class 1259 OID 52591)
-- Dependencies: 6
-- Name: seq_log_sublinea; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_sublinea
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_sublinea OWNER TO agewunue_farmacia;

--
-- TOC entry 3328 (class 0 OID 0)
-- Dependencies: 203
-- Name: seq_log_sublinea; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_sublinea', 1, false);


--
-- TOC entry 204 (class 1259 OID 52593)
-- Dependencies: 2441 2442 6
-- Name: log_sublinea; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_sublinea (
    idlog integer DEFAULT nextval('seq_log_sublinea'::regclass) NOT NULL,
    idsublinea integer NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_sublinea OWNER TO agewunue_farmacia;

--
-- TOC entry 205 (class 1259 OID 52601)
-- Dependencies: 6
-- Name: seq_log_tipo_cuenta_bancaria; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_tipo_cuenta_bancaria
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_tipo_cuenta_bancaria OWNER TO agewunue_farmacia;

--
-- TOC entry 3329 (class 0 OID 0)
-- Dependencies: 205
-- Name: seq_log_tipo_cuenta_bancaria; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_tipo_cuenta_bancaria', 1, false);


--
-- TOC entry 206 (class 1259 OID 52603)
-- Dependencies: 2443 2444 6
-- Name: log_tipo_cuenta_bancaria; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_tipo_cuenta_bancaria (
    idlog integer DEFAULT nextval('seq_log_tipo_cuenta_bancaria'::regclass) NOT NULL,
    idtipo integer NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_tipo_cuenta_bancaria OWNER TO agewunue_farmacia;

--
-- TOC entry 207 (class 1259 OID 52611)
-- Dependencies: 6
-- Name: seq_log_tipo_pago; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_tipo_pago
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_tipo_pago OWNER TO agewunue_farmacia;

--
-- TOC entry 3330 (class 0 OID 0)
-- Dependencies: 207
-- Name: seq_log_tipo_pago; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_tipo_pago', 1, false);


--
-- TOC entry 208 (class 1259 OID 52613)
-- Dependencies: 2445 2446 6
-- Name: log_tipo_pago; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_tipo_pago (
    idlog integer DEFAULT nextval('seq_log_tipo_pago'::regclass) NOT NULL,
    idtipo integer NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_tipo_pago OWNER TO agewunue_farmacia;

--
-- TOC entry 209 (class 1259 OID 52621)
-- Dependencies: 6
-- Name: seq_log_tipo_persona; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_tipo_persona
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_tipo_persona OWNER TO agewunue_farmacia;

--
-- TOC entry 3331 (class 0 OID 0)
-- Dependencies: 209
-- Name: seq_log_tipo_persona; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_tipo_persona', 1, false);


--
-- TOC entry 210 (class 1259 OID 52623)
-- Dependencies: 2447 2448 6
-- Name: log_tipo_persona; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_tipo_persona (
    idlog integer DEFAULT nextval('seq_log_tipo_persona'::regclass) NOT NULL,
    idtipo integer NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_tipo_persona OWNER TO agewunue_farmacia;

--
-- TOC entry 211 (class 1259 OID 52631)
-- Dependencies: 6
-- Name: seq_log_unidad_negocio; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_unidad_negocio
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_unidad_negocio OWNER TO agewunue_farmacia;

--
-- TOC entry 3332 (class 0 OID 0)
-- Dependencies: 211
-- Name: seq_log_unidad_negocio; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_unidad_negocio', 1, false);


--
-- TOC entry 212 (class 1259 OID 52633)
-- Dependencies: 2449 2450 6
-- Name: log_unidad_negocio; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_unidad_negocio (
    idlog integer DEFAULT nextval('seq_log_unidad_negocio'::regclass) NOT NULL,
    idunidad integer NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_unidad_negocio OWNER TO agewunue_farmacia;

--
-- TOC entry 213 (class 1259 OID 52641)
-- Dependencies: 6
-- Name: seq_log_vendedor; Type: SEQUENCE; Schema: log; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_log_vendedor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE log.seq_log_vendedor OWNER TO agewunue_farmacia;

--
-- TOC entry 3333 (class 0 OID 0)
-- Dependencies: 213
-- Name: seq_log_vendedor; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_vendedor', 1, false);


--
-- TOC entry 214 (class 1259 OID 52643)
-- Dependencies: 2451 2452 6
-- Name: log_vendedor; Type: TABLE; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE log_vendedor (
    idlog integer DEFAULT nextval('seq_log_vendedor'::regclass) NOT NULL,
    idvendedor integer NOT NULL,
    cmotivo character varying(30),
    cobservacion text,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE log.log_vendedor OWNER TO agewunue_farmacia;

SET search_path = public, pg_catalog;

--
-- TOC entry 316 (class 1259 OID 54464)
-- Dependencies: 7
-- Name: seq_acceso; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_acceso
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_acceso OWNER TO agewunue_farmacia;

--
-- TOC entry 3334 (class 0 OID 0)
-- Dependencies: 316
-- Name: seq_acceso; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_acceso', 1, false);


--
-- TOC entry 315 (class 1259 OID 54461)
-- Dependencies: 2692 2693 7
-- Name: acceso; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE acceso (
    idacceso integer DEFAULT nextval('seq_acceso'::regclass) NOT NULL,
    idusuario integer,
    idalmacen integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.acceso OWNER TO agewunue_farmacia;

--
-- TOC entry 215 (class 1259 OID 52651)
-- Dependencies: 7
-- Name: seq_almacen; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_almacen
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_almacen OWNER TO agewunue_farmacia;

--
-- TOC entry 3335 (class 0 OID 0)
-- Dependencies: 215
-- Name: seq_almacen; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_almacen', 1, false);


--
-- TOC entry 216 (class 1259 OID 52653)
-- Dependencies: 2453 2454 2455 7
-- Name: almacen; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE almacen (
    idalmacen integer DEFAULT nextval('seq_almacen'::regclass) NOT NULL,
    cnomalmacen character varying(30),
    idubigeo character(6),
    cdireccion character varying(40),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    idunidad integer,
    bprincipal boolean DEFAULT false
);


ALTER TABLE public.almacen OWNER TO agewunue_farmacia;

--
-- TOC entry 217 (class 1259 OID 52659)
-- Dependencies: 7
-- Name: seq_amortizacion_cliente; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_amortizacion_cliente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_amortizacion_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 3337 (class 0 OID 0)
-- Dependencies: 217
-- Name: seq_amortizacion_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_amortizacion_cliente', 1, false);


--
-- TOC entry 218 (class 1259 OID 52661)
-- Dependencies: 2456 2457 2458 2459 2460 2461 7
-- Name: amortizacion_cliente; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE amortizacion_cliente (
    idamortizacion integer DEFAULT nextval('seq_amortizacion_cliente'::regclass) NOT NULL,
    iddocumento integer,
    idtipo integer,
    dfecha date,
    idvendedor integer,
    idmoneda integer,
    nimporte numeric(10,2) DEFAULT 0,
    ntipocambio numeric(10,3) DEFAULT 0,
    nimportes numeric(10,2) DEFAULT 0,
    idcomprobante integer,
    idletra integer,
    idnotabo integer,
    idnotcar integer,
    bregistro boolean DEFAULT false,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    idperiodo integer
);


ALTER TABLE public.amortizacion_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 219 (class 1259 OID 52670)
-- Dependencies: 7
-- Name: seq_amortizacion_proveedor; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_amortizacion_proveedor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_amortizacion_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 219
-- Name: seq_amortizacion_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_amortizacion_proveedor', 1, false);


--
-- TOC entry 220 (class 1259 OID 52672)
-- Dependencies: 2462 2463 2464 2465 2466 7
-- Name: amortizacion_proveedor; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE amortizacion_proveedor (
    idamortizacion integer DEFAULT nextval('seq_amortizacion_proveedor'::regclass) NOT NULL,
    iddocumento integer,
    idtipo integer,
    dfecha date,
    idbanco integer,
    idmoneda integer,
    nimporte numeric(10,2) DEFAULT 0,
    ntipocambio numeric(10,2) DEFAULT 0,
    nimportes numeric(10,2) DEFAULT 0,
    idcuenta integer,
    idletra integer,
    idnotabo integer,
    idnotcar integer,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    idcheque integer,
    idperiodo integer
);


ALTER TABLE public.amortizacion_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 221 (class 1259 OID 52680)
-- Dependencies: 7
-- Name: seq_autorizacion; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_autorizacion
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_autorizacion OWNER TO agewunue_farmacia;

--
-- TOC entry 3340 (class 0 OID 0)
-- Dependencies: 221
-- Name: seq_autorizacion; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_autorizacion', 1, false);


--
-- TOC entry 222 (class 1259 OID 52682)
-- Dependencies: 2467 2468 7
-- Name: autorizacion; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE autorizacion (
    idautorizacion integer DEFAULT nextval('seq_autorizacion'::regclass) NOT NULL,
    cnomautorizacion character varying(30),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.autorizacion OWNER TO agewunue_farmacia;

--
-- TOC entry 223 (class 1259 OID 52687)
-- Dependencies: 7
-- Name: seq_aval; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_aval
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_aval OWNER TO agewunue_farmacia;

--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 223
-- Name: seq_aval; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_aval', 1, false);


--
-- TOC entry 224 (class 1259 OID 52689)
-- Dependencies: 2469 2470 7
-- Name: aval; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE aval (
    idaval integer DEFAULT nextval('seq_aval'::regclass) NOT NULL,
    cnomaval character varying(30),
    cdireccion character varying(30),
    cdni character(8),
    idcliente integer,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.aval OWNER TO agewunue_farmacia;

--
-- TOC entry 225 (class 1259 OID 52694)
-- Dependencies: 7
-- Name: seq_banco; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_banco
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_banco OWNER TO agewunue_farmacia;

--
-- TOC entry 3342 (class 0 OID 0)
-- Dependencies: 225
-- Name: seq_banco; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_banco', 1, false);


--
-- TOC entry 226 (class 1259 OID 52696)
-- Dependencies: 2471 2472 7
-- Name: banco; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE banco (
    idbanco integer DEFAULT nextval('seq_banco'::regclass) NOT NULL,
    cnombanco character varying(30),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    ccodigosunat character(2),
    idmoneda integer
);


ALTER TABLE public.banco OWNER TO agewunue_farmacia;

--
-- TOC entry 227 (class 1259 OID 52701)
-- Dependencies: 7
-- Name: seq_cheque_cliente; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_cheque_cliente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_cheque_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 3343 (class 0 OID 0)
-- Dependencies: 227
-- Name: seq_cheque_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_cheque_cliente', 1, false);


--
-- TOC entry 228 (class 1259 OID 52703)
-- Dependencies: 2473 2474 2475 2476 2477 7
-- Name: cheque_cliente; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE cheque_cliente (
    idcheque integer DEFAULT nextval('seq_cheque_cliente'::regclass) NOT NULL,
    dfecha date,
    idbanco integer,
    cnumero character varying(10),
    nimporte numeric(10,2) DEFAULT 0,
    nacuenta numeric(10,2) DEFAULT 0,
    nsaldo numeric(10,2) DEFAULT 0,
    dfeccan date,
    idunidad integer,
    idcliente integer,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    idperiodo integer,
    idmoneda integer
);


ALTER TABLE public.cheque_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 326 (class 1259 OID 57567)
-- Dependencies: 7
-- Name: seq_cheque_proveedor; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_cheque_proveedor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_cheque_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 326
-- Name: seq_cheque_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_cheque_proveedor', 1, false);


--
-- TOC entry 327 (class 1259 OID 57569)
-- Dependencies: 2713 2714 2715 2716 2717 7
-- Name: cheque_proveedor; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE cheque_proveedor (
    idcheque integer DEFAULT nextval('seq_cheque_proveedor'::regclass) NOT NULL,
    dfecha date,
    idbanco integer,
    cnumero character varying(10),
    nimporte numeric(10,2) DEFAULT 0,
    nacuenta numeric(10,2) DEFAULT 0,
    nsaldo numeric(10,2) DEFAULT 0,
    dfeccan date,
    idunidad integer,
    idproveedor integer,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    idperiodo integer,
    cgirado character varying(50),
    idmoneda integer
);


ALTER TABLE public.cheque_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 229 (class 1259 OID 52711)
-- Dependencies: 7
-- Name: seq_cliente; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_cliente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 229
-- Name: seq_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_cliente', 1, false);


--
-- TOC entry 230 (class 1259 OID 52713)
-- Dependencies: 2478 2479 2480 2481 7
-- Name: cliente; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE cliente (
    idcliente integer DEFAULT nextval('seq_cliente'::regclass) NOT NULL,
    cnomcli character varying(40),
    ccomercial character varying(40),
    cruc character(11),
    cdni character(8),
    idubigeo character(6),
    cdircli character varying(40),
    ctelefono character varying(10),
    cfax character varying(10),
    cmovil character varying(10),
    ccorreo character varying(40),
    creferencia character varying(30),
    idtipo integer,
    bagenteretencion boolean DEFAULT false,
    bbloqueado boolean DEFAULT false,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    idunidad integer
);


ALTER TABLE public.cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 231 (class 1259 OID 52720)
-- Dependencies: 7
-- Name: seq_comprobante_emitido; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_comprobante_emitido
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_comprobante_emitido OWNER TO agewunue_farmacia;

--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 231
-- Name: seq_comprobante_emitido; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_comprobante_emitido', 1, false);


--
-- TOC entry 232 (class 1259 OID 52722)
-- Dependencies: 2482 2483 2484 2485 2486 2487 2488 2489 2490 2491 2492 2493 2494 2495 7
-- Name: comprobante_emitido; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE comprobante_emitido (
    idcomprobante integer DEFAULT nextval('seq_comprobante_emitido'::regclass) NOT NULL,
    idregsalida integer,
    cserie character(4),
    cnumero character(8),
    csergui character(4),
    cnumgui character(8),
    dfecemi date,
    idcondicion integer,
    nplazo integer DEFAULT 0,
    dfecven date,
    idcliente integer,
    idvendedor integer,
    nafecto numeric(10,2) DEFAULT 0,
    ninafecto numeric(10,2) DEFAULT 0,
    nigv numeric(10,2) DEFAULT 0,
    nimporte numeric(10,2) DEFAULT 0,
    nredondeo numeric(10,2) DEFAULT 0,
    nacuenta numeric(10,2) DEFAULT 0,
    nnotabo numeric(10,2) DEFAULT 0,
    nnotcar numeric(10,2) DEFAULT 0,
    nsaldo numeric(10,2) DEFAULT 0,
    dfeccan date,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    iddocumento integer,
    ncosto numeric(10,2) DEFAULT 0,
    idunidad integer,
    nfleven numeric(10,2) DEFAULT 0
);


ALTER TABLE public.comprobante_emitido OWNER TO agewunue_farmacia;

--
-- TOC entry 233 (class 1259 OID 52738)
-- Dependencies: 7
-- Name: seq_condicion_venta; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_condicion_venta
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_condicion_venta OWNER TO agewunue_farmacia;

--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 233
-- Name: seq_condicion_venta; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_condicion_venta', 1, false);


--
-- TOC entry 234 (class 1259 OID 52740)
-- Dependencies: 2496 2497 2498 2499 2500 7
-- Name: condicion_venta; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE condicion_venta (
    idcondicion integer DEFAULT nextval('seq_condicion_venta'::regclass) NOT NULL,
    cnomcondicion character varying(30),
    bcontado boolean DEFAULT false,
    nplazo integer DEFAULT 0,
    ndescuento numeric(10,2) DEFAULT 0,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.condicion_venta OWNER TO agewunue_farmacia;

--
-- TOC entry 235 (class 1259 OID 52748)
-- Dependencies: 7
-- Name: seq_cuenta_bancaria; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_cuenta_bancaria
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_cuenta_bancaria OWNER TO agewunue_farmacia;

--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 235
-- Name: seq_cuenta_bancaria; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_cuenta_bancaria', 1, false);


--
-- TOC entry 236 (class 1259 OID 52750)
-- Dependencies: 2501 2502 7
-- Name: cuenta_bancaria; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE cuenta_bancaria (
    idcuenta integer DEFAULT nextval('seq_cuenta_bancaria'::regclass) NOT NULL,
    idproveedor integer,
    idbanco integer,
    ccuenta character varying(30),
    idtipo integer,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.cuenta_bancaria OWNER TO agewunue_farmacia;

--
-- TOC entry 237 (class 1259 OID 52755)
-- Dependencies: 7
-- Name: seq_cuenta_pagar; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_cuenta_pagar
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_cuenta_pagar OWNER TO agewunue_farmacia;

--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 237
-- Name: seq_cuenta_pagar; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_cuenta_pagar', 1, false);


--
-- TOC entry 238 (class 1259 OID 52757)
-- Dependencies: 2503 2504 2505 2506 2507 2508 2509 2510 2511 2512 2513 2514 2515 2516 2517 2518 2519 7
-- Name: cuenta_pagar; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE cuenta_pagar (
    idcuenta integer DEFAULT nextval('seq_cuenta_pagar'::regclass) NOT NULL,
    idregentrada integer,
    idperiodo integer,
    dfecemi date,
    idproveedor integer,
    iddocumento integer,
    cserie character(4),
    cnumero character(8),
    csergui character(4),
    cnumgui character varying(8),
    idmoneda integer,
    nafecto numeric(10,2) DEFAULT 0,
    ninafecto numeric(10,2) DEFAULT 0,
    nigv numeric(10,2) DEFAULT 0,
    nimporte numeric(10,2) DEFAULT 0,
    ntipocambio numeric(10,3) DEFAULT 0,
    nacuenta numeric(10,2) DEFAULT 0,
    nsaldo numeric(10,2) DEFAULT 0,
    nplazo integer DEFAULT 0,
    dfecven date,
    dfeccan date,
    nnotabo numeric(10,2) DEFAULT 0,
    nnotcar numeric(10,2) DEFAULT 0,
    ningreso numeric(10,2) DEFAULT 0,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    idunidad integer,
    npercepcion numeric(10,2) DEFAULT 0,
    nreclamodevolucion numeric(10,2) DEFAULT 0,
    nreclamoprecio numeric(10,2) DEFAULT 0,
    ntotalreclamo numeric(10,2) DEFAULT 0
);


ALTER TABLE public.cuenta_pagar OWNER TO agewunue_farmacia;

--
-- TOC entry 239 (class 1259 OID 52773)
-- Dependencies: 7
-- Name: seq_deposito_cliente; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_deposito_cliente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_deposito_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 239
-- Name: seq_deposito_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_deposito_cliente', 1, false);


--
-- TOC entry 240 (class 1259 OID 52775)
-- Dependencies: 2520 2521 2522 2523 7
-- Name: deposito_cliente; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE deposito_cliente (
    iddeposito integer DEFAULT nextval('seq_deposito_cliente'::regclass) NOT NULL,
    dfecha date,
    idbanco integer,
    coperacion character varying(10),
    nimporte numeric(10,2) DEFAULT 0,
    nacuenta numeric(10,2) DEFAULT 0,
    nsaldo numeric(10,2) DEFAULT 0,
    dfeccan date,
    idunidad integer,
    idcliente integer,
    idusuario integer,
    dfecreg time without time zone,
    idperiodo integer
);


ALTER TABLE public.deposito_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 241 (class 1259 OID 52782)
-- Dependencies: 7
-- Name: seq_detalle_autorizacion; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_detalle_autorizacion
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_detalle_autorizacion OWNER TO agewunue_farmacia;

--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 241
-- Name: seq_detalle_autorizacion; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_detalle_autorizacion', 1, false);


--
-- TOC entry 242 (class 1259 OID 52784)
-- Dependencies: 2524 2525 7
-- Name: detalle_autorizacion; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE detalle_autorizacion (
    iddetalle integer DEFAULT nextval('seq_detalle_autorizacion'::regclass) NOT NULL,
    idusuario integer,
    idautorizacion integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.detalle_autorizacion OWNER TO agewunue_farmacia;

--
-- TOC entry 243 (class 1259 OID 52789)
-- Dependencies: 7
-- Name: seq_documento; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_documento
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_documento OWNER TO agewunue_farmacia;

--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 243
-- Name: seq_documento; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_documento', 1, false);


--
-- TOC entry 244 (class 1259 OID 52791)
-- Dependencies: 2526 2527 2528 2529 2530 2531 7
-- Name: documento; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE documento (
    iddocumento integer DEFAULT nextval('seq_documento'::regclass) NOT NULL,
    cnomdocumento character varying(35),
    bcompra boolean DEFAULT false,
    bventa boolean DEFAULT false,
    ccodigosunat character(2),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    bpago boolean DEFAULT false,
    cabrev character(3),
    nitems integer DEFAULT 0
);


ALTER TABLE public.documento OWNER TO agewunue_farmacia;

--
-- TOC entry 245 (class 1259 OID 52800)
-- Dependencies: 7
-- Name: seq_empresa; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_empresa
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_empresa OWNER TO agewunue_farmacia;

--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 245
-- Name: seq_empresa; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_empresa', 7, true);


--
-- TOC entry 246 (class 1259 OID 52802)
-- Dependencies: 2532 2533 7
-- Name: empresa; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE empresa (
    idempresa integer DEFAULT nextval('seq_empresa'::regclass) NOT NULL,
    cnomempresa character varying(30),
    cruc character(11),
    cdireccion character varying(40),
    idubigeo character(6),
    dfecini date,
    ctelefono character(10),
    cfax character(10),
    cmovil character(10),
    cruta character varying(30),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.empresa OWNER TO agewunue_farmacia;

--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN empresa.cruta; Type: COMMENT; Schema: public; Owner: agewunue_farmacia
--

COMMENT ON COLUMN empresa.cruta IS 'ruta del logo de la empresa';


--
-- TOC entry 247 (class 1259 OID 52807)
-- Dependencies: 2534 2535 2536 2537 2538 2539 2540 2541 7
-- Name: existencia; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE existencia (
    idalmacen integer NOT NULL,
    idproducto character(6) NOT NULL,
    nstock integer DEFAULT 0,
    ncosuni numeric(10,4) DEFAULT 0,
    nultcos numeric(10,4) DEFAULT 0,
    nvalven numeric(10,2) DEFAULT 0,
    nincremento numeric(10,2) DEFAULT 0,
    bactivo boolean DEFAULT false,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    cubicacion character varying(4),
    ntemporal integer DEFAULT 0
);


ALTER TABLE public.existencia OWNER TO agewunue_farmacia;

--
-- TOC entry 248 (class 1259 OID 52817)
-- Dependencies: 7
-- Name: seq_familia; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_familia
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_familia OWNER TO agewunue_farmacia;

--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 248
-- Name: seq_familia; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_familia', 1, false);


--
-- TOC entry 249 (class 1259 OID 52819)
-- Dependencies: 2542 2543 2544 7
-- Name: familia; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE familia (
    idfamilia integer DEFAULT nextval('seq_familia'::regclass) NOT NULL,
    cnomfamilia character varying(30),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    bactivo boolean DEFAULT false
);


ALTER TABLE public.familia OWNER TO agewunue_farmacia;

--
-- TOC entry 250 (class 1259 OID 52825)
-- Dependencies: 7
-- Name: seq_letra_cliente; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_letra_cliente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_letra_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 250
-- Name: seq_letra_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_letra_cliente', 1, false);


--
-- TOC entry 251 (class 1259 OID 52827)
-- Dependencies: 2545 2546 2547 2548 2549 2550 2551 2552 2553 7
-- Name: letra_cliente; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE letra_cliente (
    idletra integer DEFAULT nextval('seq_letra_cliente'::regclass) NOT NULL,
    cnumero character(10),
    dfecemi date,
    nplazo integer DEFAULT 0,
    dfecven date,
    dfecpro date,
    nimporte numeric(10,2) DEFAULT 0,
    nacuenta numeric(10,2) DEFAULT 0,
    nnotabo numeric(10,2) DEFAULT 0,
    nnotcar numeric(10,2) DEFAULT 0,
    nsaldo numeric(10,2) DEFAULT 0,
    nprotesto numeric(10,2) DEFAULT 0,
    dfeccan date,
    idcliente integer,
    idvendedor integer,
    idbanco integer,
    idaval integer,
    idunidad integer,
    idperiodo integer,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.letra_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 252 (class 1259 OID 52839)
-- Dependencies: 7
-- Name: seq_letra_proveedor; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_letra_proveedor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_letra_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 252
-- Name: seq_letra_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_letra_proveedor', 1, false);


--
-- TOC entry 253 (class 1259 OID 52841)
-- Dependencies: 2554 2555 2556 2557 2558 2559 2560 2561 7
-- Name: letra_proveedor; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE letra_proveedor (
    idletra integer DEFAULT nextval('seq_letra_proveedor'::regclass) NOT NULL,
    idproveedor integer,
    idperiodo integer,
    dfecemi date,
    nplazo integer DEFAULT 0,
    dfecven date,
    nimporte numeric(10,2) DEFAULT 0,
    nacuenta numeric(10,2) DEFAULT 0,
    nnotabo numeric(10,2) DEFAULT 0,
    nsaldo numeric(10,2) DEFAULT 0,
    dfeccan date,
    idmoneda integer,
    ntipocambio numeric(10,2) DEFAULT 0,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    idunidad integer,
    cnumero character varying(10)
);


ALTER TABLE public.letra_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 254 (class 1259 OID 52852)
-- Dependencies: 7
-- Name: seq_linea; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_linea
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_linea OWNER TO agewunue_farmacia;

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 254
-- Name: seq_linea; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_linea', 1, true);


--
-- TOC entry 255 (class 1259 OID 52854)
-- Dependencies: 2562 2563 2564 2565 7
-- Name: linea; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE linea (
    idlinea integer DEFAULT nextval('seq_linea'::regclass) NOT NULL,
    cnomlinea character varying(30),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    bactivo boolean DEFAULT false,
    nincremento numeric(10,2) DEFAULT 0
);


ALTER TABLE public.linea OWNER TO agewunue_farmacia;

--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 255
-- Name: TABLE linea; Type: COMMENT; Schema: public; Owner: agewunue_farmacia
--

COMMENT ON TABLE linea IS 'linea de productos marcas o laboratorios';


--
-- TOC entry 256 (class 1259 OID 52861)
-- Dependencies: 7
-- Name: seq_lote; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_lote
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_lote OWNER TO agewunue_farmacia;

--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 256
-- Name: seq_lote; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_lote', 1, false);


--
-- TOC entry 257 (class 1259 OID 52863)
-- Dependencies: 2566 2567 2568 2569 7
-- Name: lote; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE lote (
    idlote integer DEFAULT nextval('seq_lote'::regclass) NOT NULL,
    idalmacen integer,
    idproducto character(6),
    clote character varying(15),
    nstock integer DEFAULT 0,
    cfecven character(7),
    idmotivo integer,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    dfecha date,
    bbloqueado boolean DEFAULT false
);


ALTER TABLE public.lote OWNER TO agewunue_farmacia;

--
-- TOC entry 314 (class 1259 OID 54434)
-- Dependencies: 7
-- Name: seq_mapa; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_mapa
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_mapa OWNER TO agewunue_farmacia;

--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 314
-- Name: seq_mapa; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_mapa', 5, true);


--
-- TOC entry 313 (class 1259 OID 54431)
-- Dependencies: 2690 2691 7
-- Name: mapa; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE mapa (
    idmapa integer DEFAULT nextval('seq_mapa'::regclass) NOT NULL,
    idrol integer,
    idmenu integer,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.mapa OWNER TO agewunue_farmacia;

--
-- TOC entry 312 (class 1259 OID 54383)
-- Dependencies: 7
-- Name: seq_menu; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_menu
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_menu OWNER TO agewunue_farmacia;

--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 312
-- Name: seq_menu; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_menu', 6, true);


--
-- TOC entry 311 (class 1259 OID 54378)
-- Dependencies: 2682 2683 2684 2685 2686 2687 2688 2689 7
-- Name: menu; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE menu (
    idmenu integer DEFAULT nextval('seq_menu'::regclass) NOT NULL,
    cnommenu character varying(30),
    cruta character varying(40),
    nnivel1 integer DEFAULT 0,
    nnivel2 integer DEFAULT 0,
    nnivel3 integer DEFAULT 0,
    norden integer DEFAULT 0,
    bmodal boolean DEFAULT false,
    idmodulo integer DEFAULT 1,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.menu OWNER TO agewunue_farmacia;

--
-- TOC entry 309 (class 1259 OID 54363)
-- Dependencies: 7
-- Name: seq_modulo; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_modulo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_modulo OWNER TO agewunue_farmacia;

--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 309
-- Name: seq_modulo; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_modulo', 4, true);


--
-- TOC entry 310 (class 1259 OID 54365)
-- Dependencies: 2679 2680 2681 7
-- Name: modulo; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE modulo (
    idmodulo integer DEFAULT nextval('seq_modulo'::regclass) NOT NULL,
    cnommodulo character varying(30),
    cimagen character varying(30),
    norden integer DEFAULT 0,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.modulo OWNER TO agewunue_farmacia;

--
-- TOC entry 258 (class 1259 OID 52869)
-- Dependencies: 7
-- Name: seq_moneda; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_moneda
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_moneda OWNER TO agewunue_farmacia;

--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 258
-- Name: seq_moneda; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_moneda', 1, false);


--
-- TOC entry 259 (class 1259 OID 52871)
-- Dependencies: 2570 2571 2572 7
-- Name: moneda; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE moneda (
    idmoneda integer DEFAULT nextval('seq_moneda'::regclass) NOT NULL,
    cnommoneda character varying(30),
    cabrev character(4),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    bnacional boolean DEFAULT false
);


ALTER TABLE public.moneda OWNER TO agewunue_farmacia;

--
-- TOC entry 260 (class 1259 OID 52877)
-- Dependencies: 7
-- Name: seq_motivo_entrada; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_motivo_entrada
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_motivo_entrada OWNER TO agewunue_farmacia;

--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 260
-- Name: seq_motivo_entrada; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_motivo_entrada', 1, false);


--
-- TOC entry 261 (class 1259 OID 52879)
-- Dependencies: 2573 2574 2575 7
-- Name: motivo_entrada; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE motivo_entrada (
    idmotivo integer DEFAULT nextval('seq_motivo_entrada'::regclass) NOT NULL,
    cnommotivo character varying(30),
    bcosteo boolean DEFAULT false,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.motivo_entrada OWNER TO agewunue_farmacia;

--
-- TOC entry 262 (class 1259 OID 52885)
-- Dependencies: 7
-- Name: seq_motivo_notabo_cliente; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_motivo_notabo_cliente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_motivo_notabo_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 262
-- Name: seq_motivo_notabo_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_motivo_notabo_cliente', 1, false);


--
-- TOC entry 263 (class 1259 OID 52887)
-- Dependencies: 2576 2577 2578 2579 7
-- Name: motivo_notabo_cliente; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE motivo_notabo_cliente (
    idmotivo integer DEFAULT nextval('seq_motivo_notabo_cliente'::regclass) NOT NULL,
    cnommotivo character varying(30),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    bdevolucion boolean DEFAULT false,
    bdescuento boolean DEFAULT false
);


ALTER TABLE public.motivo_notabo_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 264 (class 1259 OID 52894)
-- Dependencies: 7
-- Name: seq_motivo_notabo_proveedor; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_motivo_notabo_proveedor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_motivo_notabo_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 264
-- Name: seq_motivo_notabo_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_motivo_notabo_proveedor', 1, false);


--
-- TOC entry 265 (class 1259 OID 52896)
-- Dependencies: 2580 2581 7
-- Name: motivo_notabo_proveedor; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE motivo_notabo_proveedor (
    idmotivo integer DEFAULT nextval('seq_motivo_notabo_proveedor'::regclass) NOT NULL,
    cnommotivo character varying(30),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.motivo_notabo_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 266 (class 1259 OID 52901)
-- Dependencies: 7
-- Name: seq_motivo_notcar_cliente; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_motivo_notcar_cliente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_motivo_notcar_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 266
-- Name: seq_motivo_notcar_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_motivo_notcar_cliente', 1, false);


--
-- TOC entry 267 (class 1259 OID 52903)
-- Dependencies: 2582 2583 7
-- Name: motivo_notcar_cliente; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE motivo_notcar_cliente (
    idmotivo integer DEFAULT nextval('seq_motivo_notcar_cliente'::regclass) NOT NULL,
    cnommotivo character varying(30),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.motivo_notcar_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 268 (class 1259 OID 52908)
-- Dependencies: 7
-- Name: seq_motivo_notcar_proveedor; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_motivo_notcar_proveedor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_motivo_notcar_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 268
-- Name: seq_motivo_notcar_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_motivo_notcar_proveedor', 1, false);


--
-- TOC entry 269 (class 1259 OID 52910)
-- Dependencies: 2584 7
-- Name: motivo_notcar_proveedor; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE motivo_notcar_proveedor (
    idmotivo integer DEFAULT nextval('seq_motivo_notcar_proveedor'::regclass) NOT NULL,
    cnommotivo character varying(30),
    idusuario integer,
    dfecreg timestamp without time zone
);


ALTER TABLE public.motivo_notcar_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 270 (class 1259 OID 52914)
-- Dependencies: 7
-- Name: seq_motivo_salida; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_motivo_salida
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_motivo_salida OWNER TO agewunue_farmacia;

--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 270
-- Name: seq_motivo_salida; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_motivo_salida', 1, false);


--
-- TOC entry 271 (class 1259 OID 52916)
-- Dependencies: 2585 2586 2587 7
-- Name: motivo_salida; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE motivo_salida (
    idmotivo integer DEFAULT nextval('seq_motivo_salida'::regclass) NOT NULL,
    cnommotivo character varying(30),
    bventa boolean DEFAULT false,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.motivo_salida OWNER TO agewunue_farmacia;

--
-- TOC entry 322 (class 1259 OID 54538)
-- Dependencies: 7
-- Name: seq_movimiento; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_movimiento
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_movimiento OWNER TO agewunue_farmacia;

--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 322
-- Name: seq_movimiento; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_movimiento', 1, false);


--
-- TOC entry 321 (class 1259 OID 54535)
-- Dependencies: 2698 2699 2700 2701 2702 2703 2704 2705 2706 2707 2708 7
-- Name: movimiento; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE movimiento (
    idmovimiento integer DEFAULT nextval('seq_movimiento'::regclass) NOT NULL,
    idalmacen integer,
    idproducto character(6),
    ncantidad integer DEFAULT 0,
    ncosuni numeric(10,4) DEFAULT 0,
    ctipmov character(1),
    nstock integer DEFAULT 0,
    nvaluni numeric(10,2) DEFAULT 0,
    ndesfin numeric(10,2) DEFAULT 0,
    ndesbon numeric(10,2) DEFAULT 0,
    ndeslab numeric(10,2) DEFAULT 0,
    binafecto boolean DEFAULT false,
    nsubtot numeric(10,2) DEFAULT 0,
    cfecven character(7),
    clote character varying(7),
    idregsalida integer,
    idregentrada integer,
    norden integer DEFAULT 0
);


ALTER TABLE public.movimiento OWNER TO agewunue_farmacia;

--
-- TOC entry 272 (class 1259 OID 52922)
-- Dependencies: 7
-- Name: seq_notabo_cliente; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_notabo_cliente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_notabo_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 272
-- Name: seq_notabo_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_notabo_cliente', 1, false);


--
-- TOC entry 273 (class 1259 OID 52924)
-- Dependencies: 2588 2589 2590 2591 2592 2593 2594 2595 2596 2597 7
-- Name: notabo_cliente; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE notabo_cliente (
    idnotabo integer DEFAULT nextval('seq_notabo_cliente'::regclass) NOT NULL,
    dfecemi date,
    idperiodo integer,
    idunidad integer,
    cserie character(4),
    cnumero character(10),
    nafecto numeric(10,2) DEFAULT 0,
    ninafecto numeric(10,2) DEFAULT 0,
    nigv numeric(10,2) DEFAULT 0,
    nimporte numeric(10,2) DEFAULT 0,
    nredondeo numeric(10,2) DEFAULT 0,
    nacuenta numeric(10,2) DEFAULT 0,
    nsaldo numeric(10,2) DEFAULT 0,
    idcliente integer,
    idmotivo integer,
    idvendedor integer,
    ncosto numeric(10,2) DEFAULT 0,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.notabo_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 274 (class 1259 OID 52937)
-- Dependencies: 7
-- Name: seq_notabo_proveedor; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_notabo_proveedor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_notabo_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 274
-- Name: seq_notabo_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_notabo_proveedor', 1, false);


--
-- TOC entry 275 (class 1259 OID 52939)
-- Dependencies: 2598 2599 2600 2601 2602 2603 2604 2605 2606 7
-- Name: notabo_proveedor; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE notabo_proveedor (
    idnotabo integer DEFAULT nextval('seq_notabo_proveedor'::regclass) NOT NULL,
    idperiodo integer,
    idproveedor integer,
    dfecemi date,
    nafecto numeric(10,2) DEFAULT 0,
    ninafecto numeric(10,2) DEFAULT 0,
    nigv numeric(10,2) DEFAULT 0,
    nimporte numeric(10,2) DEFAULT 0,
    nacuenta numeric(10,2) DEFAULT 0,
    nsaldo numeric(10,2) DEFAULT 0,
    idmoneda integer,
    ntipocambio numeric(10,2) DEFAULT 0,
    idunidad integer,
    cserie character(4),
    cnumero character(8),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    idmotivo integer
);


ALTER TABLE public.notabo_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 276 (class 1259 OID 52951)
-- Dependencies: 7
-- Name: seq_notcar_cliente; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_notcar_cliente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_notcar_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 276
-- Name: seq_notcar_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_notcar_cliente', 1, false);


--
-- TOC entry 277 (class 1259 OID 52953)
-- Dependencies: 2607 2608 2609 2610 2611 2612 2613 2614 2615 2616 7
-- Name: notcar_cliente; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE notcar_cliente (
    idnotcar integer DEFAULT nextval('seq_notcar_cliente'::regclass) NOT NULL,
    dfecemi date,
    idperiodo integer,
    idunidad integer,
    cserie character(4),
    cnumero character(10),
    nafecto numeric(10,2) DEFAULT 0,
    ninafecto numeric(10,2) DEFAULT 0,
    nigv numeric(10,2) DEFAULT 0,
    nimporte numeric(10,2) DEFAULT 0,
    nredondeo numeric(10,2) DEFAULT 0,
    nacuenta numeric(10,2) DEFAULT 0,
    nsaldo numeric(10,2) DEFAULT 0,
    idcliente integer,
    idmotivo integer,
    idvendedor integer,
    ncosto numeric(10,2) DEFAULT 0,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.notcar_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 278 (class 1259 OID 52966)
-- Dependencies: 7
-- Name: seq_notcar_proveedor; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_notcar_proveedor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_notcar_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 278
-- Name: seq_notcar_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_notcar_proveedor', 1, false);


--
-- TOC entry 279 (class 1259 OID 52968)
-- Dependencies: 2617 2618 2619 2620 2621 2622 2623 2624 2625 7
-- Name: notcar_proveedor; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE notcar_proveedor (
    idnotcar integer DEFAULT nextval('seq_notcar_proveedor'::regclass) NOT NULL,
    idperiodo integer,
    idproveedor integer,
    dfecemi date,
    nafecto numeric(10,2) DEFAULT 0,
    ninafecto numeric(10,2) DEFAULT 0,
    nigv numeric(10,2) DEFAULT 0,
    nimporte numeric(10,2) DEFAULT 0,
    nacuenta numeric(10,2) DEFAULT 0,
    nsaldo numeric(10,2) DEFAULT 0,
    idmoneda integer,
    ntipocambio numeric(10,2) DEFAULT 0,
    idunidad integer,
    cserie character(4),
    cnumero character(8),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    idmotivo integer
);


ALTER TABLE public.notcar_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 325 (class 1259 OID 57485)
-- Dependencies: 7
-- Name: seq_orden_linea; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_orden_linea
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_orden_linea OWNER TO agewunue_farmacia;

--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 325
-- Name: seq_orden_linea; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_orden_linea', 1, false);


--
-- TOC entry 324 (class 1259 OID 57482)
-- Dependencies: 2710 2711 2712 7
-- Name: orden_linea; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE orden_linea (
    idorden integer DEFAULT nextval('seq_orden_linea'::regclass) NOT NULL,
    idunidad integer,
    idlinea integer,
    norden integer DEFAULT 0,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.orden_linea OWNER TO agewunue_farmacia;

--
-- TOC entry 280 (class 1259 OID 52980)
-- Dependencies: 7
-- Name: seq_periodo; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_periodo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_periodo OWNER TO agewunue_farmacia;

--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 280
-- Name: seq_periodo; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_periodo', 1, false);


--
-- TOC entry 281 (class 1259 OID 52982)
-- Dependencies: 2626 2627 2628 2629 2630 7
-- Name: periodo; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE periodo (
    idperiodo integer DEFAULT nextval('seq_periodo'::regclass) NOT NULL,
    nano integer,
    nmes integer,
    dfecinicio date,
    dfecfin date,
    nigv numeric(10,2) DEFAULT 0,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    bactivo boolean DEFAULT false,
    binactivo boolean DEFAULT false
);


ALTER TABLE public.periodo OWNER TO agewunue_farmacia;

--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN periodo.nigv; Type: COMMENT; Schema: public; Owner: agewunue_farmacia
--

COMMENT ON COLUMN periodo.nigv IS 'monto del igv 18.00';


--
-- TOC entry 282 (class 1259 OID 52988)
-- Dependencies: 7
-- Name: seq_presentacion; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_presentacion
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_presentacion OWNER TO agewunue_farmacia;

--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 282
-- Name: seq_presentacion; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_presentacion', 1, false);


--
-- TOC entry 283 (class 1259 OID 52990)
-- Dependencies: 2631 2632 2633 7
-- Name: presentacion; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE presentacion (
    idpresentacion integer DEFAULT nextval('seq_presentacion'::regclass) NOT NULL,
    cnompresentacion character varying(30),
    cabrev character(3),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    bactivo boolean DEFAULT false
);


ALTER TABLE public.presentacion OWNER TO agewunue_farmacia;

--
-- TOC entry 284 (class 1259 OID 52996)
-- Dependencies: 2634 2635 7
-- Name: producto; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE producto (
    idproducto character(6) NOT NULL,
    cnomproducto character varying(40),
    idsublinea integer,
    idfamilia integer,
    idpresentacion integer,
    binafecto boolean DEFAULT false,
    ccodigobarra character varying(30),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.producto OWNER TO agewunue_farmacia;

--
-- TOC entry 285 (class 1259 OID 53001)
-- Dependencies: 7
-- Name: seq_proveedor; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_proveedor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 285
-- Name: seq_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_proveedor', 1, false);


--
-- TOC entry 286 (class 1259 OID 53003)
-- Dependencies: 2636 2637 2638 7
-- Name: proveedor; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE proveedor (
    idproveedor integer DEFAULT nextval('seq_proveedor'::regclass) NOT NULL,
    cnomprovee character varying(30),
    cruc character(11),
    idubigeo character(6),
    cdireccion character varying(40),
    ctelefono character varying(15),
    cfax character varying(15),
    cmovil character varying(15),
    ccorreo character varying(40),
    curl character varying(40),
    cobservacion text,
    bretencion boolean DEFAULT false,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 287 (class 1259 OID 53012)
-- Dependencies: 7
-- Name: seq_registro_entrada; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_registro_entrada
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_registro_entrada OWNER TO agewunue_farmacia;

--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 287
-- Name: seq_registro_entrada; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_registro_entrada', 1, false);


--
-- TOC entry 288 (class 1259 OID 53014)
-- Dependencies: 2639 2640 2641 2642 2643 2644 7
-- Name: registro_entrada; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE registro_entrada (
    idregentrada integer DEFAULT nextval('seq_registro_entrada'::regclass) NOT NULL,
    dfecha date,
    idproveedor integer,
    iddocumento integer,
    cserie character(4),
    cnumero character(8),
    idmotivo integer,
    idperiodo integer,
    idalmacen integer,
    nafecto numeric(10,2) DEFAULT 0,
    ninafecto numeric(10,2) DEFAULT 0,
    nigv numeric(10,2) DEFAULT 0,
    nimporte numeric(10,2) DEFAULT 0,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.registro_entrada OWNER TO agewunue_farmacia;

--
-- TOC entry 289 (class 1259 OID 53023)
-- Dependencies: 7
-- Name: seq_registro_salida; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_registro_salida
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_registro_salida OWNER TO agewunue_farmacia;

--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 289
-- Name: seq_registro_salida; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_registro_salida', 1, false);


--
-- TOC entry 290 (class 1259 OID 53025)
-- Dependencies: 2645 2646 2647 2648 2649 2650 2651 2652 2653 2654 2655 2656 2657 7
-- Name: registro_salida; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE registro_salida (
    idregsalida integer DEFAULT nextval('seq_registro_salida'::regclass) NOT NULL,
    idperiodo integer,
    dfecha date,
    iddocumento integer,
    cserie character(4),
    cnumero character(8),
    csergui character(4),
    cnumgui character(8),
    idvendedor integer,
    idmotivo integer,
    idcondicion integer,
    nplazo integer DEFAULT 0,
    dfecven date,
    dfecdig timestamp without time zone DEFAULT now(),
    dfecimp timestamp without time zone DEFAULT now(),
    nafecto numeric(10,2) DEFAULT 0,
    ninafecto numeric(10,2) DEFAULT 0,
    nigv numeric(10,2) DEFAULT 0,
    nimporte numeric(10,2) DEFAULT 0,
    nredondeo numeric(10,2) DEFAULT 0,
    ncosto numeric(10,2) DEFAULT 0,
    cglosa text,
    cobservacion text,
    idcliente integer,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    bimpreso boolean DEFAULT false,
    idunidad integer,
    idsituacion character(3),
    nfleven numeric(10,2) DEFAULT 0
);


ALTER TABLE public.registro_salida OWNER TO agewunue_farmacia;

--
-- TOC entry 291 (class 1259 OID 53043)
-- Dependencies: 7
-- Name: seq_rol; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_rol
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_rol OWNER TO agewunue_farmacia;

--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 291
-- Name: seq_rol; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_rol', 1, true);


--
-- TOC entry 292 (class 1259 OID 53045)
-- Dependencies: 2658 2659 7
-- Name: rol; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE rol (
    idrol integer DEFAULT nextval('seq_rol'::regclass) NOT NULL,
    cnomrol character varying(30),
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.rol OWNER TO agewunue_farmacia;

--
-- TOC entry 293 (class 1259 OID 53050)
-- Dependencies: 7
-- Name: seq_sublinea; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_sublinea
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_sublinea OWNER TO agewunue_farmacia;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 293
-- Name: seq_sublinea; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_sublinea', 1, false);


--
-- TOC entry 294 (class 1259 OID 53052)
-- Dependencies: 7
-- Name: seq_tipo_cuenta_bancaria; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_tipo_cuenta_bancaria
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_tipo_cuenta_bancaria OWNER TO agewunue_farmacia;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 294
-- Name: seq_tipo_cuenta_bancaria; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_tipo_cuenta_bancaria', 1, false);


--
-- TOC entry 295 (class 1259 OID 53054)
-- Dependencies: 7
-- Name: seq_tipo_pago; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_tipo_pago
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_tipo_pago OWNER TO agewunue_farmacia;

--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 295
-- Name: seq_tipo_pago; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_tipo_pago', 1, false);


--
-- TOC entry 296 (class 1259 OID 53056)
-- Dependencies: 7
-- Name: seq_tipo_pago_cliente; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_tipo_pago_cliente
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_tipo_pago_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 296
-- Name: seq_tipo_pago_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_tipo_pago_cliente', 1, false);


--
-- TOC entry 297 (class 1259 OID 53058)
-- Dependencies: 7
-- Name: seq_tipo_persona; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_tipo_persona
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_tipo_persona OWNER TO agewunue_farmacia;

--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 297
-- Name: seq_tipo_persona; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_tipo_persona', 1, false);


--
-- TOC entry 298 (class 1259 OID 53060)
-- Dependencies: 7
-- Name: seq_unidad_negocio; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_unidad_negocio
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_unidad_negocio OWNER TO agewunue_farmacia;

--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 298
-- Name: seq_unidad_negocio; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_unidad_negocio', 1, false);


--
-- TOC entry 299 (class 1259 OID 53062)
-- Dependencies: 7
-- Name: seq_usuario; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_usuario
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_usuario OWNER TO agewunue_farmacia;

--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 299
-- Name: seq_usuario; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_usuario', 2, true);


--
-- TOC entry 300 (class 1259 OID 53064)
-- Dependencies: 7
-- Name: seq_vendedor; Type: SEQUENCE; Schema: public; Owner: agewunue_farmacia
--

CREATE SEQUENCE seq_vendedor
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_vendedor OWNER TO agewunue_farmacia;

--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 300
-- Name: seq_vendedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_vendedor', 1, false);


--
-- TOC entry 323 (class 1259 OID 57450)
-- Dependencies: 2709 7
-- Name: situacion_pedido; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE situacion_pedido (
    idsituacion character(3) NOT NULL,
    cnomsituacion character varying(30),
    nescala integer DEFAULT 0
);


ALTER TABLE public.situacion_pedido OWNER TO agewunue_farmacia;

--
-- TOC entry 301 (class 1259 OID 53066)
-- Dependencies: 2660 2661 7
-- Name: sublinea; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE sublinea (
    idsublinea integer DEFAULT nextval('seq_sublinea'::regclass) NOT NULL,
    cnomsublinea character varying(30),
    idlinea integer,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.sublinea OWNER TO agewunue_farmacia;

--
-- TOC entry 302 (class 1259 OID 53071)
-- Dependencies: 2662 2663 7
-- Name: tipo_cuenta_bancaria; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE tipo_cuenta_bancaria (
    idtipo integer DEFAULT nextval('seq_tipo_cuenta_bancaria'::regclass) NOT NULL,
    cnomtipo character varying(30),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.tipo_cuenta_bancaria OWNER TO agewunue_farmacia;

--
-- TOC entry 303 (class 1259 OID 53076)
-- Dependencies: 2664 2665 2666 2667 7
-- Name: tipo_pago; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE tipo_pago (
    idtipo integer DEFAULT nextval('seq_tipo_pago'::regclass) NOT NULL,
    cnomtipo character varying(30),
    ccodigosunat character(3),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    bcobro boolean DEFAULT false,
    bpago boolean DEFAULT false
);


ALTER TABLE public.tipo_pago OWNER TO agewunue_farmacia;

--
-- TOC entry 304 (class 1259 OID 53083)
-- Dependencies: 2668 2669 7
-- Name: tipo_persona; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE tipo_persona (
    idtipo integer DEFAULT nextval('seq_tipo_persona'::regclass) NOT NULL,
    cnomtipo character varying(30),
    ccodigosunat character(2),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.tipo_persona OWNER TO agewunue_farmacia;

--
-- TOC entry 305 (class 1259 OID 53088)
-- Dependencies: 7
-- Name: ubigeo; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE ubigeo (
    idubigeo character(6) NOT NULL,
    cubigeo character varying(40),
    cdepartamento character varying(30),
    cprovincia character varying(30),
    cdistrito character varying(30),
    cnomdepartamento character varying(30),
    cnomprovincia character varying(30)
);


ALTER TABLE public.ubigeo OWNER TO agewunue_farmacia;

--
-- TOC entry 306 (class 1259 OID 53091)
-- Dependencies: 2670 2671 7
-- Name: unidad_negocio; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE unidad_negocio (
    idunidad integer DEFAULT nextval('seq_unidad_negocio'::regclass) NOT NULL,
    cnomunidad character varying(30),
    cabrev character(4),
    idubigeo character(6),
    cdireccion character varying(30),
    idempresa integer,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.unidad_negocio OWNER TO agewunue_farmacia;

--
-- TOC entry 307 (class 1259 OID 53096)
-- Dependencies: 2672 2673 2674 2675 7
-- Name: usuario; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE usuario (
    idusuario integer DEFAULT nextval('seq_usuario'::regclass) NOT NULL,
    cnomusuario character varying(30),
    bactivo boolean DEFAULT false,
    idrol integer,
    clogin character varying(15),
    cclave character varying(80),
    dfecreg timestamp without time zone DEFAULT now(),
    dfecmod timestamp without time zone DEFAULT now()
);


ALTER TABLE public.usuario OWNER TO agewunue_farmacia;

--
-- TOC entry 308 (class 1259 OID 53103)
-- Dependencies: 2676 2677 2678 7
-- Name: vendedor; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE vendedor (
    idvendedor integer DEFAULT nextval('seq_vendedor'::regclass) NOT NULL,
    cnomvendedor character varying(40),
    cabrev character(4),
    idubigeo character(6),
    cdireccion character varying(40),
    ctelefono character varying(10),
    cmovil character varying(10),
    bactivo boolean DEFAULT false,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.vendedor OWNER TO agewunue_farmacia;

SET search_path = log, pg_catalog;

--
-- TOC entry 3193 (class 0 OID 52283)
-- Dependencies: 142
-- Data for Name: log_almacen; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_almacen (idlog, idalmacen, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 52293)
-- Dependencies: 144
-- Data for Name: log_autorizacion; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_autorizacion (idlog, idautorizacion, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 52303)
-- Dependencies: 146
-- Data for Name: log_aval; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_aval (idlog, idaval, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 52313)
-- Dependencies: 148
-- Data for Name: log_banco; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_banco (idlog, idbanco, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 52323)
-- Dependencies: 150
-- Data for Name: log_cheque_cliente; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_cheque_cliente (idlog, idcheque, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3288 (class 0 OID 57608)
-- Dependencies: 329
-- Data for Name: log_cheque_proveedor; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_cheque_proveedor (idlog, idcheque, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 52333)
-- Dependencies: 152
-- Data for Name: log_cliente; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_cliente (idlog, idcliente, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 52343)
-- Dependencies: 154
-- Data for Name: log_comprobante_emitido; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_comprobante_emitido (idlog, idcomprobante, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 52353)
-- Dependencies: 156
-- Data for Name: log_condicion_venta; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_condicion_venta (idlog, idcondicion, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3201 (class 0 OID 52363)
-- Dependencies: 158
-- Data for Name: log_cuenta_bancaria; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_cuenta_bancaria (idlog, idcuenta, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 52373)
-- Dependencies: 160
-- Data for Name: log_cuenta_pagar; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_cuenta_pagar (idlog, idcuenta, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3203 (class 0 OID 52383)
-- Dependencies: 162
-- Data for Name: log_deposito_cliente; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_deposito_cliente (idlog, iddeposito, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3204 (class 0 OID 52393)
-- Dependencies: 164
-- Data for Name: log_detalle_autorizacion; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_detalle_autorizacion (idlog, iddetalle, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 52403)
-- Dependencies: 166
-- Data for Name: log_documento; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_documento (idlog, iddocumento, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 52413)
-- Dependencies: 168
-- Data for Name: log_empresa; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_empresa (idlog, idempresa, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
1	3	REGISTRO		2	2013-07-30 08:16:31.39
2	4	REGISTRO	]	2	2013-07-30 08:19:22.355
3	5	REGISTRO	[]	2	2013-07-30 08:22:07.137
4	6	REGISTRO	[]	2	2013-07-30 08:25:13.719
5	7	REGISTRO	[]	2	2013-07-30 08:28:15.97
6	5	ACTUALIZACION	[IDEMPRESA:5|CNOMEMPRESA:DIMEXA S.A.|CRUC:20100220700|CDIRECCION:URB SANTA MARIA B-12|DFECINI:null|CTELEFONO:463787    |CFAX:463786    |CMOVIL:958020402 |CRUTA:null|IDUBIGEO:CAYMA|]	2	2013-07-30 08:51:01.317
7	4	ACTUALIZACION	[IDEMPRESA:4|CNOMEMPRESA:ZARCILLO ZOLUCIONES |CRUC:20324499921|CDIRECCION:AV AVIACION 1104 FCO BOLOGNESI|DFECINI:null|CTELEFONO:20304002  |CFAX:132312    |CMOVIL:12312     |CRUTA:null|IDUBIGEO:CAYMA|]	2	2013-07-30 09:15:07.027
8	5	ACTUALIZACION	[IDEMPRESA:5|CNOMEMPRESA:DIMEXA S.A.|CRUC:20100220700|CDIRECCION:URB SANTA MARIA B-12|DFECINI:null|CTELEFONO:463787    |CFAX:463786    |CMOVIL:958020402 |CRUTA:null|IDUBIGEO:CAYMA|]	2	2013-07-30 10:32:28.787
9	6	ACTUALIZACION	[IDEMPRESA:6|CNOMEMPRESA:ESTA ES UNA EMPRESA|CRUC:20100220899|CDIRECCION:UNA DIRECCION|DFECINI:null|CTELEFONO:456090    |CFAX:123123    |CMOVIL:958020402 |CRUTA:null|IDUBIGEO:CAYMA|]	2	2013-07-30 10:32:38.995
\.


--
-- TOC entry 3207 (class 0 OID 52423)
-- Dependencies: 170
-- Data for Name: log_existencia; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_existencia (idlog, idalmacen, idproducto, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3208 (class 0 OID 52433)
-- Dependencies: 172
-- Data for Name: log_familia; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_familia (idlog, idfamilia, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3209 (class 0 OID 52443)
-- Dependencies: 174
-- Data for Name: log_letra_proveedor; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_letra_proveedor (idlog, idletra, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 52453)
-- Dependencies: 176
-- Data for Name: log_linea; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_linea (idlog, idlinea, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
1	1	REGISTRO	[IDLINEA:1|CNOMLINEA:UNA LINEA|BACTIVO:true|NINCREMENTO:0|]	2	2013-07-30 13:09:04.836
\.


--
-- TOC entry 3211 (class 0 OID 52463)
-- Dependencies: 178
-- Data for Name: log_lote; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_lote (idlog, idlote, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3283 (class 0 OID 54515)
-- Dependencies: 320
-- Data for Name: log_menu; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_menu (idlog, idmenu, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3282 (class 0 OID 54488)
-- Dependencies: 318
-- Data for Name: log_modulo; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_modulo (idlog, idmodulo, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 52473)
-- Dependencies: 180
-- Data for Name: log_moneda; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_moneda (idlog, idmoneda, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 52483)
-- Dependencies: 182
-- Data for Name: log_motivo_entrada; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_motivo_entrada (idlog, idmotivo, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3214 (class 0 OID 52493)
-- Dependencies: 184
-- Data for Name: log_motivo_notabo_cliente; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_motivo_notabo_cliente (idlog, idmotivo, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3215 (class 0 OID 52503)
-- Dependencies: 186
-- Data for Name: log_motivo_notabo_proveedor; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_motivo_notabo_proveedor (idlog, idmotivo, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 52513)
-- Dependencies: 188
-- Data for Name: log_motivo_notcar_cliente; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_motivo_notcar_cliente (idlog, idmotivo, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3217 (class 0 OID 52523)
-- Dependencies: 190
-- Data for Name: log_motivo_notcar_proveedor; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_motivo_notcar_proveedor (idlog, idmotivo, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3218 (class 0 OID 52533)
-- Dependencies: 192
-- Data for Name: log_motivo_salida; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_motivo_salida (idlog, idmotivo, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3219 (class 0 OID 52543)
-- Dependencies: 194
-- Data for Name: log_periodo; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_periodo (idlog, idperiodo, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3220 (class 0 OID 52553)
-- Dependencies: 196
-- Data for Name: log_presentacion; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_presentacion (idlog, idpresentacion, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3221 (class 0 OID 52563)
-- Dependencies: 198
-- Data for Name: log_producto; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_producto (idlog, idproducto, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3222 (class 0 OID 52573)
-- Dependencies: 200
-- Data for Name: log_proveedor; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_proveedor (idlog, idproveedor, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3223 (class 0 OID 52583)
-- Dependencies: 202
-- Data for Name: log_rol; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_rol (idlog, idrol, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3224 (class 0 OID 52593)
-- Dependencies: 204
-- Data for Name: log_sublinea; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_sublinea (idlog, idsublinea, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3225 (class 0 OID 52603)
-- Dependencies: 206
-- Data for Name: log_tipo_cuenta_bancaria; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_tipo_cuenta_bancaria (idlog, idtipo, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3226 (class 0 OID 52613)
-- Dependencies: 208
-- Data for Name: log_tipo_pago; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_tipo_pago (idlog, idtipo, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3227 (class 0 OID 52623)
-- Dependencies: 210
-- Data for Name: log_tipo_persona; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_tipo_persona (idlog, idtipo, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3228 (class 0 OID 52633)
-- Dependencies: 212
-- Data for Name: log_unidad_negocio; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_unidad_negocio (idlog, idunidad, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3229 (class 0 OID 52643)
-- Dependencies: 214
-- Data for Name: log_vendedor; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

COPY log_vendedor (idlog, idvendedor, cmotivo, cobservacion, idusuario, dfecreg) FROM stdin;
\.


SET search_path = public, pg_catalog;

--
-- TOC entry 3281 (class 0 OID 54461)
-- Dependencies: 315
-- Data for Name: acceso; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY acceso (idacceso, idusuario, idalmacen, dfecreg) FROM stdin;
\.


--
-- TOC entry 3230 (class 0 OID 52653)
-- Dependencies: 216
-- Data for Name: almacen; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY almacen (idalmacen, cnomalmacen, idubigeo, cdireccion, idusuario, dfecreg, idunidad, bprincipal) FROM stdin;
\.


--
-- TOC entry 3231 (class 0 OID 52661)
-- Dependencies: 218
-- Data for Name: amortizacion_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY amortizacion_cliente (idamortizacion, iddocumento, idtipo, dfecha, idvendedor, idmoneda, nimporte, ntipocambio, nimportes, idcomprobante, idletra, idnotabo, idnotcar, bregistro, idusuario, dfecreg, idperiodo) FROM stdin;
\.


--
-- TOC entry 3232 (class 0 OID 52672)
-- Dependencies: 220
-- Data for Name: amortizacion_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY amortizacion_proveedor (idamortizacion, iddocumento, idtipo, dfecha, idbanco, idmoneda, nimporte, ntipocambio, nimportes, idcuenta, idletra, idnotabo, idnotcar, idusuario, dfecreg, idcheque, idperiodo) FROM stdin;
\.


--
-- TOC entry 3233 (class 0 OID 52682)
-- Dependencies: 222
-- Data for Name: autorizacion; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY autorizacion (idautorizacion, cnomautorizacion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3234 (class 0 OID 52689)
-- Dependencies: 224
-- Data for Name: aval; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY aval (idaval, cnomaval, cdireccion, cdni, idcliente, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3235 (class 0 OID 52696)
-- Dependencies: 226
-- Data for Name: banco; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY banco (idbanco, cnombanco, idusuario, dfecreg, ccodigosunat, idmoneda) FROM stdin;
\.


--
-- TOC entry 3236 (class 0 OID 52703)
-- Dependencies: 228
-- Data for Name: cheque_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY cheque_cliente (idcheque, dfecha, idbanco, cnumero, nimporte, nacuenta, nsaldo, dfeccan, idunidad, idcliente, idusuario, dfecreg, idperiodo, idmoneda) FROM stdin;
\.


--
-- TOC entry 3287 (class 0 OID 57569)
-- Dependencies: 327
-- Data for Name: cheque_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY cheque_proveedor (idcheque, dfecha, idbanco, cnumero, nimporte, nacuenta, nsaldo, dfeccan, idunidad, idproveedor, idusuario, dfecreg, idperiodo, cgirado, idmoneda) FROM stdin;
\.


--
-- TOC entry 3237 (class 0 OID 52713)
-- Dependencies: 230
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY cliente (idcliente, cnomcli, ccomercial, cruc, cdni, idubigeo, cdircli, ctelefono, cfax, cmovil, ccorreo, creferencia, idtipo, bagenteretencion, bbloqueado, idusuario, dfecreg, idunidad) FROM stdin;
\.


--
-- TOC entry 3238 (class 0 OID 52722)
-- Dependencies: 232
-- Data for Name: comprobante_emitido; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY comprobante_emitido (idcomprobante, idregsalida, cserie, cnumero, csergui, cnumgui, dfecemi, idcondicion, nplazo, dfecven, idcliente, idvendedor, nafecto, ninafecto, nigv, nimporte, nredondeo, nacuenta, nnotabo, nnotcar, nsaldo, dfeccan, idusuario, dfecreg, iddocumento, ncosto, idunidad, nfleven) FROM stdin;
\.


--
-- TOC entry 3239 (class 0 OID 52740)
-- Dependencies: 234
-- Data for Name: condicion_venta; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY condicion_venta (idcondicion, cnomcondicion, bcontado, nplazo, ndescuento, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3240 (class 0 OID 52750)
-- Dependencies: 236
-- Data for Name: cuenta_bancaria; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY cuenta_bancaria (idcuenta, idproveedor, idbanco, ccuenta, idtipo, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3241 (class 0 OID 52757)
-- Dependencies: 238
-- Data for Name: cuenta_pagar; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY cuenta_pagar (idcuenta, idregentrada, idperiodo, dfecemi, idproveedor, iddocumento, cserie, cnumero, csergui, cnumgui, idmoneda, nafecto, ninafecto, nigv, nimporte, ntipocambio, nacuenta, nsaldo, nplazo, dfecven, dfeccan, nnotabo, nnotcar, ningreso, idusuario, dfecreg, idunidad, npercepcion, nreclamodevolucion, nreclamoprecio, ntotalreclamo) FROM stdin;
\.


--
-- TOC entry 3242 (class 0 OID 52775)
-- Dependencies: 240
-- Data for Name: deposito_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY deposito_cliente (iddeposito, dfecha, idbanco, coperacion, nimporte, nacuenta, nsaldo, dfeccan, idunidad, idcliente, idusuario, dfecreg, idperiodo) FROM stdin;
\.


--
-- TOC entry 3243 (class 0 OID 52784)
-- Dependencies: 242
-- Data for Name: detalle_autorizacion; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY detalle_autorizacion (iddetalle, idusuario, idautorizacion, dfecreg) FROM stdin;
\.


--
-- TOC entry 3244 (class 0 OID 52791)
-- Dependencies: 244
-- Data for Name: documento; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY documento (iddocumento, cnomdocumento, bcompra, bventa, ccodigosunat, idusuario, dfecreg, bpago, cabrev, nitems) FROM stdin;
\.


--
-- TOC entry 3245 (class 0 OID 52802)
-- Dependencies: 246
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY empresa (idempresa, cnomempresa, cruc, cdireccion, idubigeo, dfecini, ctelefono, cfax, cmovil, cruta, idusuario, dfecreg) FROM stdin;
1	UNA EMPRESA	20100220700	AVV	040201	\N	          	          	          	\N	2	2013-07-29 08:36:43.033
3	UNA EMPRESA	20100220700	UNA DIRECCION	040103	\N	463787    	1234877   	958020402 	\N	2	2013-07-30 08:16:31.297
4	ZARCILLO ZOLUCIONES 	20324499921	AV AVIACION 1104 FCO BOLOGNESI	040103	\N	20304002  	132312    	12312     	\N	2	2013-07-30 08:19:22.26
5	DIMEXA S.A.	20100220700	URB SANTA MARIA B-12	040103	\N	463787    	463786    	958020402 	\N	2	2013-07-30 08:22:07.043
6	ESTA ES UNA EMPRESA	20100220899	UNA DIRECCION	040103	\N	456090    	123123    	958020402 	\N	2	2013-07-30 08:25:13.622
7	UNA EMPRESA	20100220700	ESTA ES UNA DIRECCION	040112	\N	9580200   	34342     	95802402  	\N	2	2013-07-30 08:28:15.875
\.


--
-- TOC entry 3246 (class 0 OID 52807)
-- Dependencies: 247
-- Data for Name: existencia; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY existencia (idalmacen, idproducto, nstock, ncosuni, nultcos, nvalven, nincremento, bactivo, idusuario, dfecreg, cubicacion, ntemporal) FROM stdin;
\.


--
-- TOC entry 3247 (class 0 OID 52819)
-- Dependencies: 249
-- Data for Name: familia; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY familia (idfamilia, cnomfamilia, idusuario, dfecreg, bactivo) FROM stdin;
\.


--
-- TOC entry 3248 (class 0 OID 52827)
-- Dependencies: 251
-- Data for Name: letra_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY letra_cliente (idletra, cnumero, dfecemi, nplazo, dfecven, dfecpro, nimporte, nacuenta, nnotabo, nnotcar, nsaldo, nprotesto, dfeccan, idcliente, idvendedor, idbanco, idaval, idunidad, idperiodo, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3249 (class 0 OID 52841)
-- Dependencies: 253
-- Data for Name: letra_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY letra_proveedor (idletra, idproveedor, idperiodo, dfecemi, nplazo, dfecven, nimporte, nacuenta, nnotabo, nsaldo, dfeccan, idmoneda, ntipocambio, idusuario, dfecreg, idunidad, cnumero) FROM stdin;
\.


--
-- TOC entry 3250 (class 0 OID 52854)
-- Dependencies: 255
-- Data for Name: linea; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY linea (idlinea, cnomlinea, idusuario, dfecreg, bactivo, nincremento) FROM stdin;
1	UNA LINEA	2	2013-07-30 13:09:04.745	t	0.00
\.


--
-- TOC entry 3251 (class 0 OID 52863)
-- Dependencies: 257
-- Data for Name: lote; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY lote (idlote, idalmacen, idproducto, clote, nstock, cfecven, idmotivo, idusuario, dfecreg, dfecha, bbloqueado) FROM stdin;
\.


--
-- TOC entry 3280 (class 0 OID 54431)
-- Dependencies: 313
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY mapa (idmapa, idrol, idmenu, idusuario, dfecreg) FROM stdin;
1	1	3	2	2013-08-03 09:54:29.195
2	1	4	2	2013-08-03 09:54:37.08
3	1	5	2	2013-08-03 09:54:42.103
5	1	6	2	2013-08-03 09:54:50.177
\.


--
-- TOC entry 3279 (class 0 OID 54378)
-- Dependencies: 311
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY menu (idmenu, cnommenu, cruta, nnivel1, nnivel2, nnivel3, norden, bmodal, idmodulo, idusuario, dfecreg) FROM stdin;
3	ARCHIVO	\N	1	0	0	1	f	2	2	2013-08-03 09:52:50.369
4	PROCESO	\N	2	0	0	2	f	2	2	2013-08-03 09:53:06.031
5	CONSULTA	\N	3	0	0	3	f	2	2	2013-08-03 09:53:20.026
6	HERRAMIENTA	\N	4	0	0	4	f	2	2	2013-08-03 09:53:32.448
\.


--
-- TOC entry 3278 (class 0 OID 54365)
-- Dependencies: 310
-- Data for Name: modulo; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY modulo (idmodulo, cnommodulo, cimagen, norden, idusuario, dfecreg) FROM stdin;
2	ALMACEN	/img/almacen.png	1	2	2013-08-03 09:51:06.186
3	VENTAS	/img/ventas.png	2	2	2013-08-03 09:51:53.679
4	CAJA	/img/caja.png	3	2	2013-08-03 09:51:59.951
\.


--
-- TOC entry 3252 (class 0 OID 52871)
-- Dependencies: 259
-- Data for Name: moneda; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY moneda (idmoneda, cnommoneda, cabrev, idusuario, dfecreg, bnacional) FROM stdin;
\.


--
-- TOC entry 3253 (class 0 OID 52879)
-- Dependencies: 261
-- Data for Name: motivo_entrada; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY motivo_entrada (idmotivo, cnommotivo, bcosteo, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3254 (class 0 OID 52887)
-- Dependencies: 263
-- Data for Name: motivo_notabo_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY motivo_notabo_cliente (idmotivo, cnommotivo, idusuario, dfecreg, bdevolucion, bdescuento) FROM stdin;
\.


--
-- TOC entry 3255 (class 0 OID 52896)
-- Dependencies: 265
-- Data for Name: motivo_notabo_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY motivo_notabo_proveedor (idmotivo, cnommotivo, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3256 (class 0 OID 52903)
-- Dependencies: 267
-- Data for Name: motivo_notcar_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY motivo_notcar_cliente (idmotivo, cnommotivo, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3257 (class 0 OID 52910)
-- Dependencies: 269
-- Data for Name: motivo_notcar_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY motivo_notcar_proveedor (idmotivo, cnommotivo, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3258 (class 0 OID 52916)
-- Dependencies: 271
-- Data for Name: motivo_salida; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY motivo_salida (idmotivo, cnommotivo, bventa, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3284 (class 0 OID 54535)
-- Dependencies: 321
-- Data for Name: movimiento; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY movimiento (idmovimiento, idalmacen, idproducto, ncantidad, ncosuni, ctipmov, nstock, nvaluni, ndesfin, ndesbon, ndeslab, binafecto, nsubtot, cfecven, clote, idregsalida, idregentrada, norden) FROM stdin;
\.


--
-- TOC entry 3259 (class 0 OID 52924)
-- Dependencies: 273
-- Data for Name: notabo_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY notabo_cliente (idnotabo, dfecemi, idperiodo, idunidad, cserie, cnumero, nafecto, ninafecto, nigv, nimporte, nredondeo, nacuenta, nsaldo, idcliente, idmotivo, idvendedor, ncosto, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3260 (class 0 OID 52939)
-- Dependencies: 275
-- Data for Name: notabo_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY notabo_proveedor (idnotabo, idperiodo, idproveedor, dfecemi, nafecto, ninafecto, nigv, nimporte, nacuenta, nsaldo, idmoneda, ntipocambio, idunidad, cserie, cnumero, idusuario, dfecreg, idmotivo) FROM stdin;
\.


--
-- TOC entry 3261 (class 0 OID 52953)
-- Dependencies: 277
-- Data for Name: notcar_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY notcar_cliente (idnotcar, dfecemi, idperiodo, idunidad, cserie, cnumero, nafecto, ninafecto, nigv, nimporte, nredondeo, nacuenta, nsaldo, idcliente, idmotivo, idvendedor, ncosto, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3262 (class 0 OID 52968)
-- Dependencies: 279
-- Data for Name: notcar_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY notcar_proveedor (idnotcar, idperiodo, idproveedor, dfecemi, nafecto, ninafecto, nigv, nimporte, nacuenta, nsaldo, idmoneda, ntipocambio, idunidad, cserie, cnumero, idusuario, dfecreg, idmotivo) FROM stdin;
\.


--
-- TOC entry 3286 (class 0 OID 57482)
-- Dependencies: 324
-- Data for Name: orden_linea; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY orden_linea (idorden, idunidad, idlinea, norden, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3263 (class 0 OID 52982)
-- Dependencies: 281
-- Data for Name: periodo; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY periodo (idperiodo, nano, nmes, dfecinicio, dfecfin, nigv, idusuario, dfecreg, bactivo, binactivo) FROM stdin;
\.


--
-- TOC entry 3264 (class 0 OID 52990)
-- Dependencies: 283
-- Data for Name: presentacion; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY presentacion (idpresentacion, cnompresentacion, cabrev, idusuario, dfecreg, bactivo) FROM stdin;
\.


--
-- TOC entry 3265 (class 0 OID 52996)
-- Dependencies: 284
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY producto (idproducto, cnomproducto, idsublinea, idfamilia, idpresentacion, binafecto, ccodigobarra, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3266 (class 0 OID 53003)
-- Dependencies: 286
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY proveedor (idproveedor, cnomprovee, cruc, idubigeo, cdireccion, ctelefono, cfax, cmovil, ccorreo, curl, cobservacion, bretencion, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3267 (class 0 OID 53014)
-- Dependencies: 288
-- Data for Name: registro_entrada; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY registro_entrada (idregentrada, dfecha, idproveedor, iddocumento, cserie, cnumero, idmotivo, idperiodo, idalmacen, nafecto, ninafecto, nigv, nimporte, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3268 (class 0 OID 53025)
-- Dependencies: 290
-- Data for Name: registro_salida; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY registro_salida (idregsalida, idperiodo, dfecha, iddocumento, cserie, cnumero, csergui, cnumgui, idvendedor, idmotivo, idcondicion, nplazo, dfecven, dfecdig, dfecimp, nafecto, ninafecto, nigv, nimporte, nredondeo, ncosto, cglosa, cobservacion, idcliente, idusuario, dfecreg, bimpreso, idunidad, idsituacion, nfleven) FROM stdin;
\.


--
-- TOC entry 3269 (class 0 OID 53045)
-- Dependencies: 292
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY rol (idrol, cnomrol, dfecreg) FROM stdin;
1	ADMINISTRADOR	\N
\.


--
-- TOC entry 3285 (class 0 OID 57450)
-- Dependencies: 323
-- Data for Name: situacion_pedido; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY situacion_pedido (idsituacion, cnomsituacion, nescala) FROM stdin;
001	DIGITADO	10
002	IMPRESO	30
003	ENTREGADO	50
\.


--
-- TOC entry 3270 (class 0 OID 53066)
-- Dependencies: 301
-- Data for Name: sublinea; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY sublinea (idsublinea, cnomsublinea, idlinea, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3271 (class 0 OID 53071)
-- Dependencies: 302
-- Data for Name: tipo_cuenta_bancaria; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY tipo_cuenta_bancaria (idtipo, cnomtipo, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3272 (class 0 OID 53076)
-- Dependencies: 303
-- Data for Name: tipo_pago; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY tipo_pago (idtipo, cnomtipo, ccodigosunat, idusuario, dfecreg, bcobro, bpago) FROM stdin;
\.


--
-- TOC entry 3273 (class 0 OID 53083)
-- Dependencies: 304
-- Data for Name: tipo_persona; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY tipo_persona (idtipo, cnomtipo, ccodigosunat, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3274 (class 0 OID 53088)
-- Dependencies: 305
-- Data for Name: ubigeo; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) FROM stdin;
010106	CHUQUIBAMBA	01	01	06	AMAZONAS                 	CHACHAPOYAS              
010107	GRANADA	01	01	07	AMAZONAS                 	CHACHAPOYAS              
170400	PUERTO MALDONADO	17	04	00	\N	\N
020609	SHILLA	02	06	09	ANCASH                   	CARHUAZ                  
020610	TINCO	02	06	10	ANCASH                   	CARHUAZ                  
030202	ANDARAPA	03	02	02	APURIMAC                 	ANDAHUAYLAS              
030203	CHIARA	03	02	03	APURIMAC                 	ANDAHUAYLAS              
040407	HUANCARQUI	04	04	07	AREQUIPA                 	CASTILLA                 
040409	ORCOPAMPA	04	04	09	AREQUIPA                 	CASTILLA                 
050808	SAN JAVIER DE ALPABAMBA	05	08	08	AYACUCHO                 	PAUCAR DEL SARA SARA     
061002	CHANCAY	06	10	02	CAJAMARCA                	SAN MARCOS               
061003	EDUARDO VILLANUEVA	06	10	03	CAJAMARCA                	SAN MARCOS               
081106	KOS¥IPATA	08	11	06	CUSCO                    	PAUCARTAMBO              
100204	CONCHAMARCA	10	02	04	HUANUCO                  	AMBO                     
100206	SAN FRANCISCO	10	02	06	HUANUCO                  	AMBO                     
120133	SAPALLANGA	12	01	33	JUNIN                    	HUANCAYO                 
120134	SICAYA	12	01	34	JUNIN                    	HUANCAYO                 
130403	PUEBLO NUEVO	13	04	03	LA LIBERTAD              	CHEPEN                   
130501	JULCAN	13	05	01	LA LIBERTAD              	JULCAN                   
150135	SAN MARTIN DE PORRES	15	01	35	LIMA                     	LIMA                     
151029	TAURIPAMPA	15	10	29	LIMA                     	YAUYOS                   
200208	SAPILLICA	20	02	08	PIURA                    	AYABACA                  
200209	SICCHEZ	20	02	09	PIURA                    	AYABACA                  
210902	CONIMA	21	09	02	PUNO                     	MOHO                     
210903	HUAYRAPATA	21	09	03	PUNO                     	MOHO                     
010104	CHETO	01	01	04	AMAZONAS                 	CHACHAPOYAS              
010109	LA JALCA	01	01	09	AMAZONAS                 	CHACHAPOYAS              
021904	CASHAPAMPA	02	19	04	ANCASH                   	SIHUAS                   
021909	SAN JUAN	02	19	09	ANCASH                   	SIHUAS                   
022004	MATACOTO	02	20	04	ANCASH                   	YUNGAY                   
021900	SIHUAS	02	19	00	\N	\N
060108	LOS BA¥OS DEL INCA	06	01	08	CAJAMARCA                	CAJAMARCA                
060200	CAJABAMBA	06	02	00	\N	\N
090704	AHUAYCHA	09	07	04	HUANCAVELICA             	TAYACAJA                 
090709	HUARIBAMBA	09	07	09	HUANCAVELICA             	TAYACAJA                 
100100	HUANUCO	10	01	00	\N	\N
130809	PATAZ	13	08	09	LA LIBERTAD              	PATAZ                    
130813	URPAY	13	08	13	LA LIBERTAD              	PATAZ                    
130905	MARCABAL	13	09	05	LA LIBERTAD              	SANCHEZ CARRION          
170300	TAHUAMANU	17	03	00	\N	\N
180300	ILO	18	03	00	\N	\N
010108	HUANCAS	01	01	08	AMAZONAS                 	CHACHAPOYAS              
010117	QUINJALCA	01	01	17	AMAZONAS                 	CHACHAPOYAS              
040402	ANDAGUA	04	04	02	AREQUIPA                 	CASTILLA                 
040408	MACHAGUAY	04	04	08	AREQUIPA                 	CASTILLA                 
100323	YANAS	10	03	23	HUANUCO                  	DOS DE MAYO              
100502	ARANCAY	10	05	02	HUANUCO                  	HUAMALIES                
010110	LEIMEBAMBA	01	01	10	AMAZONAS                 	CHACHAPOYAS              
010111	LEVANTO	01	01	11	AMAZONAS                 	CHACHAPOYAS              
080605	PITUMARCA	08	06	05	CUSCO                    	CANCHIS                  
150103	ATE	15	01	03	LIMA                     	LIMA                     
151001	YAUYOS	15	10	01	LIMA                     	YAUYOS                   
160109	PUTUMAYO	16	01	09	LORETO                   	MAYNAS                   
190301	OXAPAMPA	19	03	01	PASCO                    	OXAPAMPA                 
220906	EL PORVENIR	22	09	06	SAN MARTIN               	SAN MARTIN               
170100	TAMBOPATA	17	01	00	\N	\N
210700	LAMPA	21	07	00	\N	\N
010112	MAGDALENA	01	01	12	AMAZONAS                 	CHACHAPOYAS              
010115	MONTEVIDEO	01	01	15	AMAZONAS                 	CHACHAPOYAS              
010119	SAN ISIDRO DE MAINO	01	01	19	AMAZONAS                 	CHACHAPOYAS              
010121	SONCHE	01	01	21	AMAZONAS                 	CHACHAPOYAS              
010203	COPALLIN	01	02	03	AMAZONAS                 	BAGUA                    
010301	JUMBILLA	01	03	01	AMAZONAS                 	BONGARA                  
010304	COROSHA	01	03	04	AMAZONAS                 	BONGARA                  
010306	FLORIDA	01	03	06	AMAZONAS                 	BONGARA                  
010310	SHIPASBAMBA	01	03	10	AMAZONAS                 	BONGARA                  
010401	NIEVA	01	04	01	AMAZONAS                 	CONDORCANQUI             
010403	RIO SANTIAGO	01	04	03	AMAZONAS                 	CONDORCANQUI             
010504	COLCAMAR	01	05	04	AMAZONAS                 	LUYA                     
010507	LONGUITA	01	05	07	AMAZONAS                 	LUYA                     
010509	LUYA	01	05	09	AMAZONAS                 	LUYA                     
010513	OCUMAL	01	05	13	AMAZONAS                 	LUYA                     
010516	SAN CRISTOBAL	01	05	16	AMAZONAS                 	LUYA                     
010518	SAN JERONIMO	01	05	18	AMAZONAS                 	LUYA                     
010522	TINGO	01	05	22	AMAZONAS                 	LUYA                     
010601	SAN NICOLAS	01	06	01	AMAZONAS                 	RODRIGUEZ DE MENDOZA     
010604	HUAMBO	01	06	04	AMAZONAS                 	RODRIGUEZ DE MENDOZA     
010608	MILPUC	01	06	08	AMAZONAS                 	RODRIGUEZ DE MENDOZA     
010610	SANTA ROSA	01	06	10	AMAZONAS                 	RODRIGUEZ DE MENDOZA     
010701	BAGUA GRANDE	01	07	01	AMAZONAS                 	UTCUBAMBA                
010705	JAMALCA	01	07	05	AMAZONAS                 	UTCUBAMBA                
010707	YAMON	01	07	07	AMAZONAS                 	UTCUBAMBA                
020103	COLCABAMBA	02	01	03	ANCASH                   	HUARAZ                   
020106	JANGAS	02	01	06	ANCASH                   	HUARAZ                   
020109	PAMPAS	02	01	09	ANCASH                   	HUARAZ                   
020112	TARICA	02	01	12	ANCASH                   	HUARAZ                   
020203	HUACLLAN	02	02	03	ANCASH                   	AIJA                     
020301	LLAMELLIN	02	03	01	ANCASH                   	ANTONIO RAYMONDI         
020303	CHACCHO	02	03	03	ANCASH                   	ANTONIO RAYMONDI         
020401	CHACAS	02	04	01	ANCASH                   	ASUNCION                 
020502	ABELARDO PARDO LEZAMETA	02	05	02	ANCASH                   	BOLOGNESI                
020504	AQUIA	02	05	04	ANCASH                   	BOLOGNESI                
020508	HUALLANCA	02	05	08	ANCASH                   	BOLOGNESI                
020511	LA PRIMAVERA	02	05	11	ANCASH                   	BOLOGNESI                
020513	PACLLON	02	05	13	ANCASH                   	BOLOGNESI                
020602	ACOPAMPA	02	06	02	ANCASH                   	CARHUAZ                  
020604	ANTA	02	06	04	ANCASH                   	CARHUAZ                  
020703	YAUYA	02	07	03	ANCASH                   	CARLOS F. FITZCARRALD    
020802	BUENA VISTA ALTA	02	08	02	ANCASH                   	CASMA                    
020901	CORONGO	02	09	01	ANCASH                   	CORONGO                  
020905	LA PAMPA	02	09	05	ANCASH                   	CORONGO                  
020907	YUPAN	02	09	07	ANCASH                   	CORONGO                  
021003	CAJAY	02	10	03	ANCASH                   	HUARI                    
021006	HUACCHIS	02	10	06	ANCASH                   	HUARI                    
021009	MASIN	02	10	09	ANCASH                   	HUARI                    
021011	PONTO	02	10	11	ANCASH                   	HUARI                    
021101	HUARMEY	02	11	01	ANCASH                   	HUARMEY                  
021102	COCHAPETI	02	11	02	ANCASH                   	HUARMEY                  
021104	HUAYAN	02	11	04	ANCASH                   	HUARMEY                  
021203	HUATA	02	12	03	ANCASH                   	HUAYLAS                  
021206	PAMPAROMAS	02	12	06	ANCASH                   	HUAYLAS                  
021208	SANTA CRUZ	02	12	08	ANCASH                   	HUAYLAS                  
021302	CASCA	02	13	02	ANCASH                   	MARISCAL LUZURIAGA       
021305	LLAMA	02	13	05	ANCASH                   	MARISCAL LUZURIAGA       
021307	LUCMA	02	13	07	ANCASH                   	MARISCAL LUZURIAGA       
021403	CAJAMARQUILLA	02	14	03	ANCASH                   	OCROS                    
021405	COCHAS	02	14	05	ANCASH                   	OCROS                    
021408	SAN CRISTOBAL DE RAJAN	02	14	08	ANCASH                   	OCROS                    
021502	BOLOGNESI	02	15	02	ANCASH                   	PALLASCA                 
021504	HUACASCHUQUE	02	15	04	ANCASH                   	PALLASCA                 
021507	LLAPO	02	15	07	ANCASH                   	PALLASCA                 
021511	TAUCA	02	15	11	ANCASH                   	PALLASCA                 
021602	HUAYLLAN	02	16	02	ANCASH                   	POMABAMBA                
021701	RECUAY	02	17	01	ANCASH                   	RECUAY                   
021704	HUAYLLAPAMPA	02	17	04	ANCASH                   	RECUAY                   
021706	MARCA	02	17	06	ANCASH                   	RECUAY                   
021708	PARARIN	02	17	08	ANCASH                   	RECUAY                   
021802	CACERES DEL PERU	02	18	02	ANCASH                   	DEL SANTA                
021805	MORO	02	18	05	ANCASH                   	DEL SANTA                
021807	SAMANCO	02	18	07	ANCASH                   	DEL SANTA                
021902	ACOBAMBA	02	19	02	ANCASH                   	SIHUAS                   
021905	CHINGALPO	02	19	05	ANCASH                   	SIHUAS                   
021907	QUICHES	02	19	07	ANCASH                   	SIHUAS                   
022001	YUNGAY	02	20	01	ANCASH                   	YUNGAY                   
022003	MANCOS	02	20	03	ANCASH                   	YUNGAY                   
022006	RANRAHIRCA	02	20	06	ANCASH                   	YUNGAY                   
030102	CHACOCHE	03	01	02	APURIMAC                 	ABANCAY                  
030104	CURAHUASI	03	01	04	APURIMAC                 	ABANCAY                  
030201	ANDAHUAYLAS	03	02	01	APURIMAC                 	ANDAHUAYLAS              
030207	KISHUARA	03	02	07	APURIMAC                 	ANDAHUAYLAS              
030209	PACUCHA	03	02	09	APURIMAC                 	ANDAHUAYLAS              
030212	SAN ANTONIO DE CACHI	03	02	12	APURIMAC                 	ANDAHUAYLAS              
030216	TALAVERA	03	02	16	APURIMAC                 	ANDAHUAYLAS              
030218	TURPO	03	02	18	APURIMAC                 	ANDAHUAYLAS              
030302	EL ORO	03	03	02	APURIMAC                 	ANTABAMBA                
030306	PACHACONAS	03	03	06	APURIMAC                 	ANTABAMBA                
030401	CHALHUANCA	03	04	01	APURIMAC                 	AYMARAES                 
030404	CHAPIMARCA	03	04	04	APURIMAC                 	AYMARAES                 
030408	JUSTO APU SAHUARAURA	03	04	08	APURIMAC                 	AYMARAES                 
030410	POCOHUANCA	03	04	10	APURIMAC                 	AYMARAES                 
030413	SORAYA	03	04	13	APURIMAC                 	AYMARAES                 
030416	TORAYA	03	04	16	APURIMAC                 	AYMARAES                 
030502	COTABAMBAS	03	05	02	APURIMAC                 	COTABAMBAS               
030505	MARA	03	05	05	APURIMAC                 	COTABAMBAS               
030602	ANCO_HUALLO	03	06	02	APURIMAC                 	CHINCHEROS               
030605	OCOBAMBA	03	06	05	APURIMAC                 	CHINCHEROS               
030607	URANMARCA	03	06	07	APURIMAC                 	CHINCHEROS               
030703	GAMARRA	03	07	03	APURIMAC                 	GRAU                     
030706	MICAELA BASTIDAS	03	07	06	APURIMAC                 	GRAU                     
030708	PROGRESO	03	07	08	APURIMAC                 	GRAU                     
030712	VILCABAMBA	03	07	12	APURIMAC                 	GRAU                     
040101	AREQUIPA	04	01	01	AREQUIPA                 	AREQUIPA                 
040103	CAYMA	04	01	03	AREQUIPA                 	AREQUIPA                 
040105	CHARACATO	04	01	05	AREQUIPA                 	AREQUIPA                 
040109	MARIANO MELGAR	04	01	09	AREQUIPA                 	AREQUIPA                 
040112	PAUCARPATA	04	01	12	AREQUIPA                 	AREQUIPA                 
040114	POLOBAYA	04	01	14	AREQUIPA                 	AREQUIPA                 
040118	SAN JUAN DE SIGUAS	04	01	18	AREQUIPA                 	AREQUIPA                 
040121	SANTA RITA DE SIGUAS	04	01	21	AREQUIPA                 	AREQUIPA                 
040123	TIABAYA	04	01	23	AREQUIPA                 	AREQUIPA                 
040127	YARABAMBA	04	01	27	AREQUIPA                 	AREQUIPA                 
040129	JOSE LUIS BUSTAMANTE Y RIVERO	04	01	29	AREQUIPA                 	AREQUIPA                 
040203	MARIANO NICOLAS VALCARCEL	04	02	03	AREQUIPA                 	CAMANA                   
040207	QUILCA	04	02	07	AREQUIPA                 	CAMANA                   
040301	CARAVELI	04	03	01	AREQUIPA                 	CARAVELI                 
040304	ATIQUIPA	04	03	04	AREQUIPA                 	CARAVELI                 
040308	CHAPARRA	04	03	08	AREQUIPA                 	CARAVELI                 
040310	JAQUI	04	03	10	AREQUIPA                 	CARAVELI                 
040313	YAUCA	04	03	13	AREQUIPA                 	CARAVELI                 
040410	PAMPACOLCA	04	04	10	AREQUIPA                 	CASTILLA                 
040413	URACA	04	04	13	AREQUIPA                 	CASTILLA                 
040502	ACHOMA	04	05	02	AREQUIPA                 	CAYLLOMA                 
040505	CAYLLOMA	04	05	05	AREQUIPA                 	CAYLLOMA                 
040508	HUANCA	04	05	08	AREQUIPA                 	CAYLLOMA                 
040510	LARI	04	05	10	AREQUIPA                 	CAYLLOMA                 
040514	SAN ANTONIO DE CHUCA	04	05	14	AREQUIPA                 	CAYLLOMA                 
040517	TISCO	04	05	17	AREQUIPA                 	CAYLLOMA                 
040519	YANQUE	04	05	19	AREQUIPA                 	CAYLLOMA                 
040604	CHICHAS	04	06	04	AREQUIPA                 	CONDESUYOS               
040607	SALAMANCA	04	06	07	AREQUIPA                 	CONDESUYOS               
040701	MOLLENDO	04	07	01	AREQUIPA                 	ISLAY                    
040705	MEJIA	04	07	05	AREQUIPA                 	ISLAY                    
040801	COTAHUASI	04	08	01	AREQUIPA                 	LA UNION                 
040804	HUAYNACOTAS	04	08	04	AREQUIPA                 	LA UNION                 
040808	SAYLA	04	08	08	AREQUIPA                 	LA UNION                 
040810	TOMEPAMPA	04	08	10	AREQUIPA                 	LA UNION                 
050102	ACOCRO	05	01	02	AYACUCHO                 	HUAMANGA                 
050106	OCROS	05	01	06	AYACUCHO                 	HUAMANGA                 
050108	QUINUA	05	01	08	AYACUCHO                 	HUAMANGA                 
050111	SANTIAGO DE PISCHA	05	01	11	AYACUCHO                 	HUAMANGA                 
050201	CANGALLO	05	02	01	AYACUCHO                 	CANGALLO                 
050203	LOS MOROCHUCOS	05	02	03	AYACUCHO                 	CANGALLO                 
050206	TOTOS	05	02	06	AYACUCHO                 	CANGALLO                 
050303	SACSAMARCA	05	03	03	AYACUCHO                 	HUANCA SANCOS            
050402	AYAHUANCO	05	04	02	AYACUCHO                 	HUANTA                   
050404	IGUAIN	05	04	04	AYACUCHO                 	HUANTA                   
050501	SAN MIGUEL	05	05	01	AYACUCHO                 	LA MAR                   
050504	CHILCAS	05	05	04	AYACUCHO                 	LA MAR                   
050506	LUIS CARRANZA	05	05	06	AYACUCHO                 	LA MAR                   
050602	AUCARA	05	06	02	AYACUCHO                 	LUCANAS                  
050605	CHAVI¥A	05	06	05	AYACUCHO                 	LUCANAS                  
050607	HUAC-HUAS	05	06	07	AYACUCHO                 	LUCANAS                  
050611	LUCANAS	05	06	11	AYACUCHO                 	LUCANAS                  
050614	SAISA	05	06	14	AYACUCHO                 	LUCANAS                  
050616	SAN JUAN	05	06	16	AYACUCHO                 	LUCANAS                  
050620	SANTA ANA DE HUAYCAHUACHO	05	06	20	AYACUCHO                 	LUCANAS                  
050702	CHUMPI	05	07	02	AYACUCHO                 	PARINACOCHAS             
050704	PACAPAUSA	05	07	04	AYACUCHO                 	PARINACOCHAS             
050708	UPAHUACHO	05	07	08	AYACUCHO                 	PARINACOCHAS             
050802	COLTA	05	08	02	AYACUCHO                 	PAUCAR DEL SARA SARA     
050901	QUEROBAMBA	05	09	01	AYACUCHO                 	SUCRE                    
050904	CHILCAYOC	05	09	04	AYACUCHO                 	SUCRE                    
050907	PAICO	05	09	07	AYACUCHO                 	SUCRE                    
050910	SANTIAGO DE PAUCARAY	05	09	10	AYACUCHO                 	SUCRE                    
051002	ALCAMENCA	05	10	02	AYACUCHO                 	VICTOR FAJARDO           
051004	ASQUIPATA	05	10	04	AYACUCHO                 	VICTOR FAJARDO           
051008	HUAMANQUIQUIA	05	10	08	AYACUCHO                 	VICTOR FAJARDO           
051011	SARHUA	05	10	11	AYACUCHO                 	VICTOR FAJARDO           
051101	VILCAS HUAMAN	05	11	01	AYACUCHO                 	VILCAS HUAMAN            
051105	HUAMBALPA	05	11	05	AYACUCHO                 	VILCAS HUAMAN            
051108	VISCHONGO	05	11	08	AYACUCHO                 	VILCAS HUAMAN            
060102	ASUNCION	06	01	02	CAJAMARCA                	CAJAMARCA                
060106	JESUS	06	01	06	CAJAMARCA                	CAJAMARCA                
060109	MAGDALENA	06	01	09	CAJAMARCA                	CAJAMARCA                
060111	NAMORA	06	01	11	CAJAMARCA                	CAJAMARCA                
060203	CONDEBAMBA	06	02	03	CAJAMARCA                	CAJABAMBA                
060301	CELENDIN	06	03	01	CAJAMARCA                	CELENDIN                 
060304	HUASMIN	06	03	04	CAJAMARCA                	CELENDIN                 
060308	OXAMARCA	06	03	08	CAJAMARCA                	CELENDIN                 
060310	SUCRE	06	03	10	CAJAMARCA                	CELENDIN                 
060401	CHOTA	06	04	01	CAJAMARCA                	CHOTA                    
060405	CHIMBAN	06	04	05	CAJAMARCA                	CHOTA                    
060407	COCHABAMBA	06	04	07	CAJAMARCA                	CHOTA                    
060410	LAJAS	06	04	10	CAJAMARCA                	CHOTA                    
060413	PACCHA	06	04	13	CAJAMARCA                	CHOTA                    
060416	SAN JUAN DE LICUPIS	06	04	16	CAJAMARCA                	CHOTA                    
060419	CHALAMARCA	06	04	19	CAJAMARCA                	CHOTA                    
060503	CUPISNIQUE	06	05	03	CAJAMARCA                	CONTUMAZA                
060506	SANTA CRUZ DE TOLED	06	05	06	CAJAMARCA                	CONTUMAZA                
060508	YONAN	06	05	08	CAJAMARCA                	CONTUMAZA                
060604	CUJILLO	06	06	04	CAJAMARCA                	CUTERVO                  
060607	QUEROCOTILLO	06	06	07	CAJAMARCA                	CUTERVO                  
060609	SAN JUAN DE CUTERVO	06	06	09	CAJAMARCA                	CUTERVO                  
060613	SANTO TOMAS	06	06	13	CAJAMARCA                	CUTERVO                  
060701	BAMBAMARCA	06	07	01	CAJAMARCA                	HUALGAYOC                
060703	HUALGAYOC	06	07	03	CAJAMARCA                	HUALGAYOC                
060804	COLASAY	06	08	04	CAJAMARCA                	JAEN                     
060806	LAS PIRIAS	06	08	06	CAJAMARCA                	JAEN                     
060809	SALLIQUE	06	08	09	CAJAMARCA                	JAEN                     
060901	SAN IGNACIO	06	09	01	CAJAMARCA                	SAN IGNACIO              
060903	HUARANGO	06	09	03	CAJAMARCA                	SAN IGNACIO              
060907	TABACONAS	06	09	07	CAJAMARCA                	SAN IGNACIO              
061007	JOSE SABOGAL	06	10	07	CAJAMARCA                	SAN MARCOS               
061102	BOLIVAR	06	11	02	CAJAMARCA                	SAN MIGUEL               
061105	EL PRADO	06	11	05	CAJAMARCA                	SAN MIGUEL               
061109	NIEPOS	06	11	09	CAJAMARCA                	SAN MIGUEL               
061111	SAN SILVESTRE DE COCHAN	06	11	11	CAJAMARCA                	SAN MIGUEL               
061201	SAN PABLO	06	12	01	CAJAMARCA                	SAN PABLO                
061204	TUMBADEN	06	12	04	CAJAMARCA                	SAN PABLO                
061303	CATACHE	06	13	03	CAJAMARCA                	SANTA CRUZ               
061306	NINABAMBA	06	13	06	CAJAMARCA                	SANTA CRUZ               
061309	SEXI	06	13	09	CAJAMARCA                	SANTA CRUZ               
070101	CALLAO	07	01	01	CALLAO                   	CALLAO                   
070103	CARMEN DE LA LEGUA REYNOSO	07	01	03	CALLAO                   	CALLAO                   
080101	CUSCO	08	01	01	CUSCO                    	CUSCO                    
080104	SAN JERONIMO	08	01	04	CUSCO                    	CUSCO                    
080106	SANTIAGO	08	01	06	CUSCO                    	CUSCO                    
080202	ACOPIA	08	02	02	CUSCO                    	ACOMAYO                  
080205	POMACANCHI	08	02	05	CUSCO                    	ACOMAYO                  
080207	SANGARARA	08	02	07	CUSCO                    	ACOMAYO                  
080304	CHINCHAYPUJIO	08	03	04	CUSCO                    	ANTA                     
080306	LIMATAMBO	08	03	06	CUSCO                    	ANTA                     
080309	ZURITE	08	03	09	CUSCO                    	ANTA                     
080404	LARES	08	04	04	CUSCO                    	CALCA                    
080406	SAN SALVADOR	08	04	06	CUSCO                    	CALCA                    
080501	YANAOCA	08	05	01	CUSCO                    	CANAS                    
080505	LAYO	08	05	05	CUSCO                    	CANAS                    
080507	QUEHUE	08	05	07	CUSCO                    	CANAS                    
080602	CHECACUPE	08	06	02	CUSCO                    	CANCHIS                  
080606	SAN PABLO	08	06	06	CUSCO                    	CANCHIS                  
080608	TINTA	08	06	08	CUSCO                    	CANCHIS                  
080703	CHAMACA	08	07	03	CUSCO                    	CHUMBIVILCAS             
080706	LLUSCO	08	07	06	CUSCO                    	CHUMBIVILCAS             
080801	ESPINAR	08	08	01	CUSCO                    	ESPINAR                  
080803	COPORAQUE	08	08	03	CUSCO                    	ESPINAR                  
080807	SUYCKUTAMBO	08	08	07	CUSCO                    	ESPINAR                  
080902	ECHARATE	08	09	02	CUSCO                    	LA CONVENCION            
080904	MARANURA	08	09	04	CUSCO                    	LA CONVENCION            
080909	VILCABAMBA	08	09	09	CUSCO                    	LA CONVENCION            
081001	PARURO	08	10	01	CUSCO                    	PARURO                   
081003	CCAPI	08	10	03	CUSCO                    	PARURO                   
081008	PILLPINTO	08	10	08	CUSCO                    	PARURO                   
081201	URCOS	08	12	01	CUSCO                    	QUISPICANCHI             
081204	CCARHUAYO	08	12	04	CUSCO                    	QUISPICANCHI             
081208	LUCRE	08	12	08	CUSCO                    	QUISPICANCHI             
081211	OROPESA	08	12	11	CUSCO                    	QUISPICANCHI             
081302	CHINCHERO	08	13	02	CUSCO                    	URUBAMBA                 
081306	OLLANTAYTAMBO	08	13	06	CUSCO                    	URUBAMBA                 
081307	YUCAY	08	13	07	CUSCO                    	URUBAMBA                 
090102	ACOBAMBILLA	09	01	02	HUANCAVELICA             	HUANCAVELICA             
090108	IZCUCHACA	09	01	08	HUANCAVELICA             	HUANCAVELICA             
090109	LARIA	09	01	09	HUANCAVELICA             	HUANCAVELICA             
090113	NUEVO OCCORO	09	01	13	HUANCAVELICA             	HUANCAVELICA             
090115	PILCHACA	09	01	15	HUANCAVELICA             	HUANCAVELICA             
090202	ANDABAMBA	09	02	02	HUANCAVELICA             	ACOBAMBA                 
090203	ANTA	09	02	03	HUANCAVELICA             	ACOBAMBA                 
090208	ROSARIO	09	02	08	HUANCAVELICA             	ACOBAMBA                 
090303	CALLANMARCA	09	03	03	HUANCAVELICA             	ANGARAES                 
090305	CHINCHO	09	03	05	HUANCAVELICA             	ANGARAES                 
090309	JULCAMARCA	09	03	09	HUANCAVELICA             	ANGARAES                 
090312	SECCLLA	09	03	12	HUANCAVELICA             	ANGARAES                 
090401	CASTROVIRREYNA	09	04	01	HUANCAVELICA             	CASTROVIRREYNA           
090405	CHUPAMARCA	09	04	05	HUANCAVELICA             	CASTROVIRREYNA           
090407	HUACHOS	09	04	07	HUANCAVELICA             	CASTROVIRREYNA           
090410	SAN JUAN	09	04	10	HUANCAVELICA             	CASTROVIRREYNA           
090501	CHURCAMPA	09	05	01	HUANCAVELICA             	CHURCAMPA                
090504	EL CARMEN	09	05	04	HUANCAVELICA             	CHURCAMPA                
090507	PAUCARBAMBA	09	05	07	HUANCAVELICA             	CHURCAMPA                
090602	AYAVI	09	06	02	HUANCAVELICA             	HUAYTARA                 
090604	HUAYACUNDO ARMA	09	06	04	HUANCAVELICA             	HUAYTARA                 
090607	PILPICHACA	09	06	07	HUANCAVELICA             	HUAYTARA                 
090611	SAN FRANCISCO DE SANGAYAICO	09	06	11	HUANCAVELICA             	HUAYTARA                 
090613	SANTIAGO DE CHOCORVOS	09	06	13	HUANCAVELICA             	HUAYTARA                 
090616	TAMBO	09	06	16	HUANCAVELICA             	HUAYTARA                 
090703	ACRAQUIA	09	07	03	HUANCAVELICA             	TAYACAJA                 
090706	DANIEL HERNANDEZ	09	07	06	HUANCAVELICA             	TAYACAJA                 
090708	HUANDO	09	07	08	HUANCAVELICA             	TAYACAJA                 
090712	PACHAMARCA	09	07	12	HUANCAVELICA             	TAYACAJA                 
090714	SALCABAMBA	09	07	14	HUANCAVELICA             	TAYACAJA                 
090717	SURCUBAMBA	09	07	17	HUANCAVELICA             	TAYACAJA                 
100101	HUANUCO	10	01	01	HUANUCO                  	HUANUCO                  
100104	CHURUBAMBA	10	01	04	HUANUCO                  	HUANUCO                  
100108	SAN PEDRO DE CHAULAN	10	01	08	HUANUCO                  	HUANUCO                  
100201	AMBO	10	02	01	HUANUCO                  	AMBO                     
100202	CAYNA	10	02	02	HUANUCO                  	AMBO                     
100301	LA UNION	10	03	01	HUANUCO                  	DOS DE MAYO              
100311	MARIAS	10	03	11	HUANUCO                  	DOS DE MAYO              
100321	SHUNQUI	10	03	21	HUANUCO                  	DOS DE MAYO              
100401	HUACAYBAMBA	10	04	01	HUANUCO                  	HUACAYBAMBA              
100403	COCHABAMBA	10	04	03	HUANUCO                  	HUACAYBAMBA              
100503	CHAVIN DE PARIARCA	10	05	03	HUANUCO                  	HUAMALIES                
100505	JIRCAN	10	05	05	HUANUCO                  	HUAMALIES                
100508	PUNCHAO	10	05	08	HUANUCO                  	HUAMALIES                
100511	TANTAMAYO	10	05	11	HUANUCO                  	HUAMALIES                
100603	HERMILIO VALDIZAN	10	06	03	HUANUCO                  	LEONCIO PRADO            
100606	MARIANO DAMASO BERAUN	10	06	06	HUANUCO                  	LEONCIO PRADO            
100702	CHOLON	10	07	02	HUANUCO                  	MARA¾ON                  
100803	MOLINO	10	08	03	HUANUCO                  	PACHITEA                 
100902	CODO DEL POZUZO	10	09	02	HUANUCO                  	PUERTO INCA              
100904	TOURNAVISTA	10	09	04	HUANUCO                  	PUERTO INCA              
101003	JIVIA	10	10	03	HUANUCO                  	LAURICOCHA               
101007	SAN MIGUEL DE CAURI	10	10	07	HUANUCO                  	LAURICOCHA               
101101	CHAVINILLO	10	11	01	HUANUCO                  	YAROWILCA                
101105	JACAS CHICO	10	11	05	HUANUCO                  	YAROWILCA                
110101	ICA	11	01	01	ICA                      	ICA                      
110103	LOS AQUIJES	11	01	03	ICA                      	ICA                      
110107	PUEBLO NUEVO	11	01	07	ICA                      	ICA                      
110111	SANTIAGO	11	01	11	ICA                      	ICA                      
110112	SUBTANJALLA	11	01	12	ICA                      	ICA                      
110202	ALTO LARAN	11	02	02	ICA                      	CHINCHA                  
110204	CHINCHA BAJA	11	02	04	ICA                      	CHINCHA                  
110207	PUEBLO NUEVO	11	02	07	ICA                      	CHINCHA                  
110211	TAMBO DE MORA	11	02	11	ICA                      	CHINCHA                  
110302	CHANGUILLO	11	03	02	ICA                      	NAZCA                    
110305	VISTA ALEGRE	11	03	05	ICA                      	NAZCA                    
110404	SANTA CRUZ	11	04	04	ICA                      	PALPA                    
110501	PISCO	11	05	01	ICA                      	PISCO                    
110504	INDEPENDENCIA	11	05	04	ICA                      	PISCO                    
110507	SAN CLEMENTE	11	05	07	ICA                      	PISCO                    
120104	CARHUACALLANGA	12	01	04	JUNIN                    	HUANCAYO                 
120106	CHICCHE	12	01	06	JUNIN                    	HUANCAYO                 
120112	COLCA	12	01	12	JUNIN                    	HUANCAYO                 
120116	HUACRAPUQUIO	12	01	16	JUNIN                    	HUANCAYO                 
120119	HUANCAN	12	01	19	JUNIN                    	HUANCAYO                 
120124	PARIAHUANCA	12	01	24	JUNIN                    	HUANCAYO                 
120135	SANTO DOMINGO DE ACOBAMBA	12	01	35	JUNIN                    	HUANCAYO                 
120203	ANDAMARCA	12	02	03	JUNIN                    	CONCEPCION               
120206	COMAS	12	02	06	JUNIN                    	CONCEPCION               
120208	MANZANARES	12	02	08	JUNIN                    	CONCEPCION               
120212	NUEVE DE JULIO	12	02	12	JUNIN                    	CONCEPCION               
120301	CHANCHAMAYO	12	03	01	JUNIN                    	CHANCHAMAYO              
120302	PERENE	12	03	02	JUNIN                    	CHANCHAMAYO              
120306	VITOC	12	03	06	JUNIN                    	CHANCHAMAYO              
120137	LA MERCED	12	01	37	JUNIN                    	HUANCAYO                 
120403	APATA	12	04	03	JUNIN                    	JAUJA                    
120405	CANCHAYLLO	12	04	05	JUNIN                    	JAUJA                    
120409	HUARIPAMPA	12	04	09	JUNIN                    	JAUJA                    
120411	JANJAILLO	12	04	11	JUNIN                    	JAUJA                    
120414	LLOCLLAPAMPA	12	04	14	JUNIN                    	JAUJA                    
120418	MOLINOS	12	04	18	JUNIN                    	JAUJA                    
120420	MUQUI	12	04	20	JUNIN                    	JAUJA                    
120423	PACCHA	12	04	23	JUNIN                    	JAUJA                    
120427	RICRAN	12	04	27	JUNIN                    	JAUJA                    
120429	SAN PEDRO DE CHUNAN	12	04	29	JUNIN                    	JAUJA                    
120432	TUNAN MARCA	12	04	32	JUNIN                    	JAUJA                    
120502	CARHUAMAYO	12	05	02	JUNIN                    	JUNIN                    
120504	ULCUMAYO	12	05	04	JUNIN                    	JUNIN                    
120603	LLAYLLA	12	06	03	JUNIN                    	SATIPO                   
120606	PANGOA	12	06	06	JUNIN                    	SATIPO                   
120701	TARMA	12	07	01	JUNIN                    	TARMA                    
120703	HUARICOLCA	12	07	03	JUNIN                    	TARMA                    
120707	PALCAMAYO	12	07	07	JUNIN                    	TARMA                    
120801	LA OROYA	12	08	01	JUNIN                    	YAULI                    
120803	HUAY-HUAY	12	08	03	JUNIN                    	YAULI                    
120808	SANTA ROSA DE SACCO	12	08	08	JUNIN                    	YAULI                    
120810	YAULI	12	08	10	JUNIN                    	YAULI                    
120902	AHUAC	12	09	02	JUNIN                    	CHUPACA                  
120906	SAN JUAN DE YSCOS	12	09	06	JUNIN                    	CHUPACA                  
120909	YANACANCHA	12	09	09	JUNIN                    	CHUPACA                  
130102	EL PORVENIR	13	01	02	LA LIBERTAD              	TRUJILLO                 
130106	LAREDO	13	01	06	LA LIBERTAD              	TRUJILLO                 
130108	POROTO	13	01	08	LA LIBERTAD              	TRUJILLO                 
130111	VICTOR LARCO HERRERA	13	01	11	LA LIBERTAD              	TRUJILLO                 
130204	MAGDALENA DE CAO	13	02	04	LA LIBERTAD              	ASCOPE                   
130206	RAZURI	13	02	06	LA LIBERTAD              	ASCOPE                   
130302	BAMBAMARCA	13	03	02	LA LIBERTAD              	BOLIVAR                  
130503	CARABAMBA	13	05	03	LA LIBERTAD              	JULCAN                   
130602	AGALLPAMPA	13	06	02	LA LIBERTAD              	OTUZCO                   
130605	HUARANCHAL	13	06	05	LA LIBERTAD              	OTUZCO                   
130611	SALPO	13	06	11	LA LIBERTAD              	OTUZCO                   
130702	GUADALUPE	13	07	02	LA LIBERTAD              	PACASMAYO                
130703	JEQUETEPEQUE	13	07	03	LA LIBERTAD              	PACASMAYO                
130802	BULDIBUYO	13	08	02	LA LIBERTAD              	PATAZ                    
130805	HUAYLILLAS	13	08	05	LA LIBERTAD              	PATAZ                    
130807	ONGON	13	08	07	LA LIBERTAD              	PATAZ                    
130812	TAURIJA	13	08	12	LA LIBERTAD              	PATAZ                    
130901	HUAMACHUCO	13	09	01	LA LIBERTAD              	SANCHEZ CARRION          
130903	COCHORCO	13	09	03	LA LIBERTAD              	SANCHEZ CARRION          
130907	SARIN	13	09	07	LA LIBERTAD              	SANCHEZ CARRION          
131003	CACHICADAN	13	10	03	LA LIBERTAD              	SANTIAGO DE CHUCO        
131004	MOLLEBAMBA	13	10	04	LA LIBERTAD              	SANTIAGO DE CHUCO        
131008	SITABAMBA	13	10	08	LA LIBERTAD              	SANTIAGO DE CHUCO        
131102	LUCMA	13	11	02	LA LIBERTAD              	GRAN CHIMU               
131201	VIRU	13	12	01	LA LIBERTAD              	VIRU                     
140103	ETEN	14	01	03	LAMBAYEQUE               	CHICLAYO                 
140105	JOSE LEONARDO ORTIZ	14	01	05	LAMBAYEQUE               	CHICLAYO                 
140107	LAGUNAS	14	01	07	LAMBAYEQUE               	CHICLAYO                 
140112	PIMENTEL	14	01	12	LAMBAYEQUE               	CHICLAYO                 
140114	SANTA ROSA	14	01	14	LAMBAYEQUE               	CHICLAYO                 
140202	CA¥ARIS	14	02	02	LAMBAYEQUE               	FERRE¥AFE                
140206	PUEBLO NUEVO	14	02	06	LAMBAYEQUE               	FERRE¥AFE                
140301	LAMBAYEQUE	14	03	01	LAMBAYEQUE               	LAMBAYEQUE               
140304	JAYANCA	14	03	04	LAMBAYEQUE               	LAMBAYEQUE               
140307	MOTUPE	14	03	07	LAMBAYEQUE               	LAMBAYEQUE               
140311	SAN JOSE	14	03	11	LAMBAYEQUE               	LAMBAYEQUE               
150102	ANCON	15	01	02	LIMA                     	LIMA                     
150106	CARABAYLLO	15	01	06	LIMA                     	LIMA                     
150109	CIENEGUILLA	15	01	09	LIMA                     	LIMA                     
150111	EL AGUSTINO	15	01	11	LIMA                     	LIMA                     
150114	LA MOLINA	15	01	14	LIMA                     	LIMA                     
150128	RIMAC	15	01	28	LIMA                     	LIMA                     
150139	SANTA ROSA	15	01	39	LIMA                     	LIMA                     
150118	LURIGANCHO	15	01	18	LIMA                     	LIMA                     
150122	MIRAFLORES	15	01	22	LIMA                     	LIMA                     
150123	PACHACAMAC	15	01	23	LIMA                     	LIMA                     
150127	PUNTA NEGRA	15	01	27	LIMA                     	LIMA                     
150137	SANTA ANITA	15	01	37	LIMA                     	LIMA                     
150133	SAN JUAN DE MIRAFLORES	15	01	33	LIMA                     	LIMA                     
150201	BARRANCA	15	02	01	LIMA                     	BARRANCA                 
150203	PATIVILCA	15	02	03	LIMA                     	BARRANCA                 
150301	CAJATAMBO	15	03	01	LIMA                     	CAJATAMBO                
150305	MANAS	15	03	05	LIMA                     	CAJATAMBO                
150402	ARAHUAY	15	04	02	LIMA                     	CANTA                    
150405	LACHAQUI	15	04	05	LIMA                     	CANTA                    
150501	SAN VICENTE DE CA¥ETE	15	05	01	LIMA                     	CA¥ETE                   
150504	CERRO AZUL	15	05	04	LIMA                     	CA¥ETE                   
150507	IMPERIAL	15	05	07	LIMA                     	CA¥ETE                   
150510	NUEVO IMPERIAL	15	05	10	LIMA                     	CA¥ETE                   
150513	SAN ANTONIO	15	05	13	LIMA                     	CA¥ETE                   
150515	SANTA CRUZ DE FLORES	15	05	15	LIMA                     	CA¥ETE                   
150603	ATAVILLOS BAJO	15	06	03	LIMA                     	HUARAL                   
150606	IHUARI	15	06	06	LIMA                     	HUARAL                   
150608	PACARAOS	15	06	08	LIMA                     	HUARAL                   
150701	MATUCANA	15	07	01	LIMA                     	HUAROCHIRI               
150703	CALLAHUANCA	15	07	03	LIMA                     	HUAROCHIRI               
150705	CHICLA	15	07	05	LIMA                     	HUAROCHIRI               
150709	HUAROCHIRI	15	07	09	LIMA                     	HUAROCHIRI               
150711	LANGA	15	07	11	LIMA                     	HUAROCHIRI               
150714	RICARDO PALMA	15	07	14	LIMA                     	HUAROCHIRI               
150718	SAN DAMIAN	15	07	18	LIMA                     	HUAROCHIRI               
150720	SAN JUAN DE TANTARANCHE	15	07	20	LIMA                     	HUAROCHIRI               
150723	SAN MATEO DE OTAO	15	07	23	LIMA                     	HUAROCHIRI               
150727	SANTA CRUZ DE COCACHACRA	15	07	27	LIMA                     	HUAROCHIRI               
150729	SANTIAGO DE ANCHUCAYA	15	07	29	LIMA                     	HUAROCHIRI               
150732	SURCO	15	07	32	LIMA                     	HUAROCHIRI               
150802	AMBAR	15	08	02	LIMA                     	HUAURA                   
150805	HUALMAY	15	08	05	LIMA                     	HUAURA                   
150809	SANTA LEONOR	15	08	09	LIMA                     	HUAURA                   
150811	SAYAN	15	08	11	LIMA                     	HUAURA                   
150902	ANDAJES	15	09	02	LIMA                     	OYON                     
150905	NAVAN	15	09	05	LIMA                     	OYON                     
151003	AYAUCA	15	10	03	LIMA                     	YAUYOS                   
151006	CACRA	15	10	06	LIMA                     	YAUYOS                   
151008	CATAHUASI	15	10	08	LIMA                     	YAUYOS                   
151012	HONGOS	15	10	12	LIMA                     	YAUYOS                   
151015	HUANGASCAR	15	10	15	LIMA                     	YAUYOS                   
151017	HUA¥EC	15	10	17	LIMA                     	YAUYOS                   
151021	MIRAFLORES	15	10	21	LIMA                     	YAUYOS                   
151030	TOMAS	15	10	30	LIMA                     	YAUYOS                   
160101	IQUITOS	16	01	01	LORETO                   	MAYNAS                   
160103	FERNANDO LORES	16	01	03	LORETO                   	MAYNAS                   
160106	MAZAN	16	01	06	LORETO                   	MAYNAS                   
160110	TORRES CAUSANA	16	01	10	LORETO                   	MAYNAS                   
160202	BALSAPUERTO	16	02	02	LORETO                   	ALTO AMAZONAS            
160210	SANTA CRUZ	16	02	10	LORETO                   	ALTO AMAZONAS            
160303	TIGRE	16	03	03	LORETO                   	LORETO                   
160305	URARINAS	16	03	05	LORETO                   	LORETO                   
160403	YAVARI	16	04	03	LORETO                   	MARISCAL RAMON CASTILLA  
160503	CAPELO	16	05	03	LORETO                   	REQUENA                  
160505	MAQUIA	16	05	05	LORETO                   	REQUENA                  
160508	SOPLIN	16	05	08	LORETO                   	REQUENA                  
160601	CONTAMANA	16	06	01	LORETO                   	UCAYALI                  
160604	PAMPA HERMOSA	16	06	04	LORETO                   	UCAYALI                  
160606	VARGAS GUERRA	16	06	06	LORETO                   	UCAYALI                  
170104	LABERINTO	17	01	04	MADRE DE DIOS            	TAMBOPATA                
170203	MADRE DE DIOS	17	02	03	MADRE DE DIOS            	MANU                     
170302	IBERIA	17	03	02	MADRE DE DIOS            	TAHUAMANU                
160111	YAQUERANA	16	01	11	LORETO                   	MAYNAS                   
160204	CHAMBARA	16	02	04	LORETO                   	ALTO AMAZONAS            
160208	MANZANARES	16	02	08	LORETO                   	ALTO AMAZONAS            
180101	MOQUEGUA	18	01	01	MOQUEGUA                 	MARISCAL NIETO           
180104	SAMEGUA	18	01	04	MOQUEGUA                 	MARISCAL NIETO           
180201	OMATE	18	02	01	MOQUEGUA                 	GENERAL SANCHEZ CERRO    
180204	ICHU¥A	18	02	04	MOQUEGUA                 	GENERAL SANCHEZ CERRO    
180207	MATALAQUE	18	02	07	MOQUEGUA                 	GENERAL SANCHEZ CERRO    
180210	UBINAS	18	02	10	MOQUEGUA                 	GENERAL SANCHEZ CERRO    
180301	ILO	18	03	01	MOQUEGUA                 	ILO                      
190102	HUACHON	19	01	02	PASCO                    	PASCO                    
190105	NINACACA	19	01	05	PASCO                    	PASCO                    
190107	PAUCARTAMBO	19	01	07	PASCO                    	PASCO                    
190111	TINYAHUARCO	19	01	11	PASCO                    	PASCO                    
190201	YANAHUANCA	19	02	01	PASCO                    	DANIEL ALCIDES CARRION   
190203	GOYLLARISQUIZGA	19	02	03	PASCO                    	DANIEL ALCIDES CARRION   
190207	TAPUC	19	02	07	PASCO                    	DANIEL ALCIDES CARRION   
190302	CHONTABAMBA	19	03	02	PASCO                    	OXAPAMPA                 
190304	PALCAZU	19	03	04	PASCO                    	OXAPAMPA                 
200101	PIURA	20	01	01	PIURA                    	PIURA                    
200105	CATACAOS	20	01	05	PIURA                    	PIURA                    
200109	LA ARENA	20	01	09	PIURA                    	PIURA                    
200201	AYABACA	20	02	01	PIURA                    	AYABACA                  
200203	JILILI	20	02	03	PIURA                    	AYABACA                  
200206	PACAIPAMPA	20	02	06	PIURA                    	AYABACA                  
200303	EL CARMEN DE LA FRONTERA	20	03	03	PIURA                    	HUANCABAMBA              
200305	LALAQUIZ	20	03	05	PIURA                    	HUANCABAMBA              
200308	SONDORILLO	20	03	08	PIURA                    	HUANCABAMBA              
200404	LA MATANZA	20	04	04	PIURA                    	MORROPON                 
200406	SALITRAL	20	04	06	PIURA                    	MORROPON                 
200409	SANTO DOMINGO	20	04	09	PIURA                    	MORROPON                 
200502	AMOTAPE	20	05	02	PIURA                    	PAITA                    
200505	LA HUACA	20	05	05	PIURA                    	PAITA                    
200507	VICHAYAL	20	05	07	PIURA                    	PAITA                    
200604	LANCONES	20	06	04	PIURA                    	SULLANA                  
200607	QUERECOTILLO	20	06	07	PIURA                    	SULLANA                  
200701	PARI¥AS	20	07	01	PIURA                    	TALARA                   
200705	LOS ORGANOS	20	07	05	PIURA                    	TALARA                   
200802	BELLAVISTA DE LA UNION	20	08	02	PIURA                    	SECHURA                  
200804	CRISTO NOS VALGA	20	08	04	PIURA                    	SECHURA                  
210102	ACORA	21	01	02	PUNO                     	PUNO                     
210105	CAPACHICA	21	01	05	PUNO                     	PUNO                     
210107	COATA	21	01	07	PUNO                     	PUNO                     
210111	PICHACANI	21	01	11	PUNO                     	PUNO                     
210113	SAN ANTONIO	21	01	13	PUNO                     	PUNO                     
210201	AZANGARO	21	02	01	PUNO                     	AZANGARO                 
210205	CAMINACA	21	02	05	PUNO                     	AZANGARO                 
210207	JOSE DOMINGO CHOQUEHUANCA	21	02	07	PUNO                     	AZANGARO                 
210210	SAMAN	21	02	10	PUNO                     	AZANGARO                 
210214	SANTIAGO DE PUPUJA	21	02	14	PUNO                     	AZANGARO                 
210301	MACUSANI	21	03	01	PUNO                     	CARABAYA                 
210304	COASA	21	03	04	PUNO                     	CARABAYA                 
210308	OLLACHEA	21	03	08	PUNO                     	CARABAYA                 
210310	USICAYOS	21	03	10	PUNO                     	CARABAYA                 
210403	HUACULLANI	21	04	03	PUNO                     	CHUCUITO                 
210406	POMATA	21	04	06	PUNO                     	CHUCUITO                 
210502	CAPAZO	21	05	02	PUNO                     	EL COLLAO                
210602	COJATA	21	06	02	PUNO                     	HUANCANE                 
210605	PUSI	21	06	05	PUNO                     	HUANCANE                 
210607	TARACO	21	06	07	PUNO                     	HUANCANE                 
210703	CALAPUJA	21	07	03	PUNO                     	LAMPA                    
210704	NICASIO	21	07	04	PUNO                     	LAMPA                    
210708	PUCARA	21	07	08	PUNO                     	LAMPA                    
210802	ANTAUTA	21	08	02	PUNO                     	MELGAR                   
210804	LLALLI	21	08	04	PUNO                     	MELGAR                   
211003	PEDRO VILCA APAZA	21	10	03	PUNO                     	SAN ANTONIO DE PUTINA    
211005	SINA	21	10	05	PUNO                     	SAN ANTONIO DE PUTINA    
010200	BAGUA	01	02	00	\N	\N
010300	BONGARA	01	03	00	\N	\N
010400	CONDORCANQUI	01	04	00	\N	\N
010500	LUYA	01	05	00	\N	\N
010600	RODRIGUEZ DE MENDOZA	01	06	00	\N	\N
010700	UTCUBAMBA	01	07	00	\N	\N
020000	ANCASH	02	00	00	\N	\N
020100	HUARAZ	02	01	00	\N	\N
020200	AIJA	02	02	00	\N	\N
020300	ANTONIO RAYMONDI	02	03	00	\N	\N
010000	AMAZONAS	01	00	00	\N	\N
020400	ASUNCION	02	04	00	\N	\N
020500	BOLOGNESI	02	05	00	\N	\N
020600	CARHUAZ	02	06	00	\N	\N
020700	CARLOS FERMIN FITZCARRALD	02	07	00	\N	\N
010202	ARAMANGO	01	02	02	AMAZONAS                 	BAGUA                    
010307	JAZAN	01	03	07	AMAZONAS                 	BONGARA                  
010506	INGUILPATA	01	05	06	AMAZONAS                 	LUYA                     
010520	SANTA CATALINA	01	05	20	AMAZONAS                 	LUYA                     
010607	MARISCAL BENAVIDES	01	06	07	AMAZONAS                 	RODRIGUEZ DE MENDOZA     
020107	LA LIBERTAD	02	01	07	ANCASH                   	HUARAZ                   
020204	LA MERCED	02	02	04	ANCASH                   	AIJA                     
020505	CAJACAY	02	05	05	ANCASH                   	BOLOGNESI                
020605	ATAQUERO	02	06	05	ANCASH                   	CARHUAZ                  
210808	SANTA ROSA	21	08	08	PUNO                     	MELGAR                   
211103	CABANILLAS	21	11	03	PUNO                     	SAN ROMAN                
211203	LIMBANI	21	12	03	PUNO                     	SANDIA                   
211205	PHARA	21	12	05	PUNO                     	SANDIA                   
211208	YANAHUAYA	21	12	08	PUNO                     	SANDIA                   
211303	COPANI	21	13	03	PUNO                     	YUNGUYO                  
211305	OLLARAYA	21	13	05	PUNO                     	YUNGUYO                  
220101	MOYOBAMBA	22	01	01	SAN MARTIN               	MOYOBAMBA                
220105	SORITOR	22	01	05	SAN MARTIN               	MOYOBAMBA                
220201	BELLAVISTA	22	02	01	SAN MARTIN               	BELLAVISTA               
220204	HUALLAGA	22	02	04	SAN MARTIN               	BELLAVISTA               
220301	SAN JOSE DE SISA	22	03	01	SAN MARTIN               	EL DORADO                
220304	SANTA ROSA	22	03	04	SAN MARTIN               	EL DORADO                
220401	SAPOSOA	22	04	01	SAN MARTIN               	HUALLAGA                 
220405	SACANCHE	22	04	05	SAN MARTIN               	HUALLAGA                 
220503	BARRANQUITA	22	05	03	SAN MARTIN               	LAMAS                    
220504	CAYNARACHI	22	05	04	SAN MARTIN               	LAMAS                    
220509	SHANAO	22	05	09	SAN MARTIN               	LAMAS                    
220511	ZAPATERO	22	05	11	SAN MARTIN               	LAMAS                    
220602	CAMPANILLA	22	06	02	SAN MARTIN               	MARISCAL CACERES         
220701	PICOTA	22	07	01	SAN MARTIN               	PICOTA                   
220704	PILLUANA	22	07	04	SAN MARTIN               	PICOTA                   
220706	SAN CRISTOBAL	22	07	06	SAN MARTIN               	PICOTA                   
220710	TRES UNIDOS	22	07	10	SAN MARTIN               	PICOTA                   
220802	AWAJUN	22	08	02	SAN MARTIN               	RIOJA                    
220805	PARDO MIGUEL	22	08	05	SAN MARTIN               	RIOJA                    
220809	YURACYACU	22	08	09	SAN MARTIN               	RIOJA                    
220902	ALBERTO LEVEAU	22	09	02	SAN MARTIN               	SAN MARTIN               
220905	CHIPURANA	22	09	05	SAN MARTIN               	SAN MARTIN               
220909	LA BANDA DE SHILCAYO	22	09	09	SAN MARTIN               	SAN MARTIN               
220911	PAPAPLAYA	22	09	11	SAN MARTIN               	SAN MARTIN               
220914	SHAPAJA	22	09	14	SAN MARTIN               	SAN MARTIN               
221003	POLVORA	22	10	03	SAN MARTIN               	TOCACHE                  
230101	TACNA	23	01	01	TACNA                    	TACNA                    
230104	CIUDAD NUEVA	23	01	04	TACNA                    	TACNA                    
230107	PALCA	23	01	07	TACNA                    	TACNA                    
230201	CANDARAVE	23	02	01	TACNA                    	CANDARAVE                
230203	CAMILACA	23	02	03	TACNA                    	CANDARAVE                
230301	LOCUMBA	23	03	01	TACNA                    	JORGE BASADRE            
230404	ESTIQUE-PAMPA	23	04	04	TACNA                    	TARATA                   
230406	SUSAPAYA	23	04	06	TACNA                    	TARATA                   
240102	CORRALES	24	01	02	TUMBES                   	TUMBES                   
240106	SAN JUAN DE LA VIRGEN	24	01	06	TUMBES                   	TUMBES                   
240201	ZORRITOS	24	02	01	TUMBES                   	CONTRALMIRANTE VILLAR    
240303	MATAPALO	24	03	03	TUMBES                   	ZARUMILLA                
250101	CALLERIA	25	01	01	UCAYALI                  	CORONEL PORTILLO         
250104	MASISEA	25	01	04	UCAYALI                  	CORONEL PORTILLO         
250202	SEPAHUA	25	02	02	UCAYALI                  	ATALAYA                  
250204	YURUA	25	02	04	UCAYALI                  	ATALAYA                  
250303	CURIMANA	25	03	03	UCAYALI                  	PADRE ABAD               
020800	CASMA	02	08	00	\N	\N
020900	CORONGO	02	09	00	\N	\N
021100	HUARMEY	02	11	00	\N	\N
021200	HUAYLAS	02	12	00	\N	\N
021300	MARISCAL LUZURIAGA	02	13	00	\N	\N
021400	OCROS	02	14	00	\N	\N
021500	PALLASCA	02	15	00	\N	\N
021600	POMABAMBA	02	16	00	\N	\N
021700	RECUAY	02	17	00	\N	\N
030000	APURIMAC	03	00	00	\N	\N
030100	ABANCAY	03	01	00	\N	\N
030200	ANDAHUAYLAS	03	02	00	\N	\N
030300	ANTABAMBA	03	03	00	\N	\N
030400	AYMARAES	03	04	00	\N	\N
030500	COTABAMBAS	03	05	00	\N	\N
030700	GRAU	03	07	00	\N	\N
040000	AREQUIPA	04	00	00	\N	\N
040100	AREQUIPA	04	01	00	\N	\N
040200	CAMANA	04	02	00	\N	\N
040300	CARAVELI	04	03	00	\N	\N
040500	CAYLLOMA	04	05	00	\N	\N
040600	CONDESUYOS	04	06	00	\N	\N
040700	ISLAY	04	07	00	\N	\N
040800	LA UNION	04	08	00	\N	\N
050000	AYACUCHO	05	00	00	\N	\N
050100	HUAMANGA	05	01	00	\N	\N
230206	QUILAHUANI	23	02	06	TACNA                    	CANDARAVE                
050200	CANGALLO	05	02	00	\N	\N
050300	HUANCA SANCOS	05	03	00	\N	\N
050400	HUANTA	05	04	00	\N	\N
050408	LLOCHEGUA	05	04	08	AYACUCHO	HUANTA
050500	LA MAR	05	05	00	\N	\N
050600	LUCANAS	05	06	00	\N	\N
050700	PARINACOCHAS	05	07	00	\N	\N
050800	PAUCAR DEL SARA SARA	05	08	00	\N	\N
050900	SUCRE	05	09	00	\N	\N
051000	VICTOR FAJARDO	05	10	00	\N	\N
051100	VILCAS HUAMAN	05	11	00	\N	\N
060400	CHOTA	06	04	00	\N	\N
060500	CONTUMAZA	06	05	00	\N	\N
060700	HUALGAYOC	06	07	00	\N	\N
060900	SAN IGNACIO	06	09	00	\N	\N
061000	SAN MARCOS	06	10	00	\N	\N
061100	SAN MIGUEL	06	11	00	\N	\N
061200	SAN PABLO	06	12	00	\N	\N
061300	SANTA CRUZ	06	13	00	\N	\N
021002	ANRA	02	10	02	ANCASH                   	HUARI                    
021012	RAHUAPAMPA	02	10	12	ANCASH                   	HUARI                    
021205	MATO	02	12	05	ANCASH                   	HUAYLAS                  
021401	OCROS	02	14	01	ANCASH                   	OCROS                    
021501	CABANA	02	15	01	ANCASH                   	PALLASCA                 
021604	QUINUABAMBA	02	16	04	ANCASH                   	POMABAMBA                
030101	ABANCAY	03	01	01	APURIMAC                 	ABANCAY                  
030106	LAMBRAMA	03	01	06	APURIMAC                 	ABANCAY                  
030205	HUANCARAY	03	02	05	APURIMAC                 	ANDAHUAYLAS              
030219	KAQUIABAMBA	03	02	19	APURIMAC                 	ANDAHUAYLAS              
030407	HUAYLLO	03	04	07	APURIMAC                 	AYMARAES                 
030417	YANACA	03	04	17	APURIMAC                 	AYMARAES                 
030608	RANRACANCHA	03	06	08	APURIMAC                 	CHINCHEROS               
030705	MAMARA	03	07	05	APURIMAC                 	GRAU                     
040115	QUEQUE¥A	04	01	15	AREQUIPA                 	AREQUIPA                 
040125	VITOR	04	01	25	AREQUIPA                 	AREQUIPA                 
040201	CAMANA	04	02	01	AREQUIPA                 	CAMANA                   
040307	CHALA	04	03	07	AREQUIPA                 	CARAVELI                 
040403	AYO	04	04	03	AREQUIPA                 	CASTILLA                 
040501	CHIVAY	04	05	01	AREQUIPA                 	CAYLLOMA                 
040516	TAPAY	04	05	16	AREQUIPA                 	CAYLLOMA                 
040703	DEAN VALDIVIA	04	07	03	AREQUIPA                 	ISLAY                    
040811	TORO	04	08	11	AREQUIPA                 	LA UNION                 
050114	VINCHOS	05	01	14	AYACUCHO                 	HUAMANGA                 
050405	LURICOCHA	05	04	05	AYACUCHO                 	HUANTA                   
050604	CARMEN SALCEDO	05	06	04	AYACUCHO                 	LUCANAS                  
050613	OTOCA	05	06	13	AYACUCHO                 	LUCANAS                  
050706	PUYUSCA	05	07	06	AYACUCHO                 	PARINACOCHAS             
050807	PARARCA	05	08	07	AYACUCHO                 	PAUCAR DEL SARA SARA     
050906	MORCOLLA	05	09	06	AYACUCHO                 	SUCRE                    
051010	HUAYA	05	10	10	AYACUCHO                 	VICTOR FAJARDO           
060302	CHUMUCH	06	03	02	CAJAMARCA                	CELENDIN                 
060311	UTCO	06	03	11	CAJAMARCA                	CELENDIN                 
060414	PION	06	04	14	CAJAMARCA                	CHOTA                    
060504	GUZMANGO	06	05	04	CAJAMARCA                	CONTUMAZA                
060606	PIMPINGOS	06	06	06	CAJAMARCA                	CUTERVO                  
060615	TORIBIO CASANOVA	06	06	15	CAJAMARCA                	CUTERVO                  
060807	POMAHUACA	06	08	07	CAJAMARCA                	JAEN                     
060905	NAMBALLE	06	09	05	CAJAMARCA                	SAN IGNACIO              
061006	JOSE MANUEL QUIROZ	06	10	06	CAJAMARCA                	SAN MARCOS               
061113	UNION AGUA BLANCA	06	11	13	CAJAMARCA                	SAN MIGUEL               
061310	UTICYACU	06	13	10	CAJAMARCA                	SANTA CRUZ               
230401	TARATA	23	04	01	TACNA                    	TARATA                   
170401	PTO.MALDONADO	17	04	01	MADRE DE DIOS            	PTO.MALDONADO            
040520	MAJES	04	05	20	AREQUIPA                 	CAYLLOMA                 
070000	CALLAO	07	00	00	\N	\N
070100	CALLAO	07	01	00	\N	\N
080100	CUSCO	08	01	00	\N	\N
080200	ACOMAYO	08	02	00	\N	\N
080300	ANTA	08	03	00	\N	\N
080400	CALCA	08	04	00	\N	\N
080500	CANAS	08	05	00	\N	\N
080600	CANCHIS	08	06	00	\N	\N
080700	CHUMBIVILCAS	08	07	00	\N	\N
080800	ESPINAR	08	08	00	\N	\N
080900	LA CONVENCION	08	09	00	\N	\N
081000	PARURO	08	10	00	\N	\N
081100	PAUCARTAMBO	08	11	00	\N	\N
081200	QUISPICANCHI	08	12	00	\N	\N
081300	URUBAMBA	08	13	00	\N	\N
090100	HUANCAVELICA	09	01	00	\N	\N
090119	HUANDO	09	01	19	\N	\N
090200	ACOBAMBA	09	02	00	\N	\N
090300	ANGARAES	09	03	00	\N	\N
090400	CASTROVIRREYNA	09	04	00	\N	\N
090500	CHURCAMPA	09	05	00	\N	\N
090600	HUAYTARA	09	06	00	\N	\N
060100	CAJAMARCA	06	01	00	\N	\N
100111	PILLCO MARCA	10	01	11	HUANUCO	HUANUCO
100300	DOS DE MAYO	10	03	00	\N	\N
100400	HUACAYBAMBA	10	04	00	\N	\N
100500	HUAMALIES	10	05	00	\N	\N
100700	MARA¥ON	10	07	00	\N	\N
100800	PACHITEA	10	08	00	\N	\N
101000	LAURICOCHA	10	10	00	\N	\N
101100	YAROWILCA	10	11	00	\N	\N
101108	CHORAS	10	11	08	\N	\N
110000	ICA	11	00	00	\N	\N
110100	ICA	11	01	00	\N	\N
110200	CHINCHA	11	02	00	\N	\N
110400	PALPA	11	04	00	\N	\N
110500	PISCO	11	05	00	\N	\N
120000	JUNIN	12	00	00	\N	\N
120100	HUANCAYO	12	01	00	\N	\N
120300	CHANCHAMAYO	12	03	00	\N	\N
120500	JUNIN	12	05	00	\N	\N
120600	SATIPO	12	06	00	\N	\N
120700	TARMA	12	07	00	\N	\N
120900	CHUPACA	12	09	00	\N	\N
130100	TRUJILLO	13	01	00	\N	\N
130200	ASCOPE	13	02	00	\N	\N
130208	CASA GRANDE	13	02	08	\N	\N
130300	BOLIVAR	13	03	00	\N	\N
130400	CHEPEN	13	04	00	\N	\N
130500	JULCAN	13	05	00	\N	\N
130600	OTUZCO	13	06	00	\N	\N
090700	TAYACAJA	09	07	00	\N	\N
080103	POROY	08	01	03	CUSCO                    	CUSCO                    
080302	ANCAHUASI	08	03	02	CUSCO                    	ANTA                     
080402	COYA	08	04	02	CUSCO                    	CALCA                    
080601	SICUANI	08	06	01	CUSCO                    	CANCHIS                  
080707	QUI¥OTA	08	07	07	CUSCO                    	CHUMBIVILCAS             
080905	OCOBAMBA	08	09	05	CUSCO                    	LA CONVENCION            
081009	YAURISQUE	08	10	09	CUSCO                    	PARURO                   
081104	COLQUEPATA	08	11	04	CUSCO                    	PAUCARTAMBO              
081212	QUIQUIJANA	08	12	12	CUSCO                    	QUISPICANCHI             
090103	ACORIA	09	01	03	HUANCAVELICA             	HUANCAVELICA             
090112	MOYA	09	01	12	HUANCAVELICA             	HUANCAVELICA             
090205	MARCAS	09	02	05	HUANCAVELICA             	ACOBAMBA                 
090404	CAPILLAS	09	04	04	HUANCAVELICA             	CASTROVIRREYNA           
090408	HUAMATAMBO	09	04	08	HUANCAVELICA             	CASTROVIRREYNA           
090715	SALCAHUASI	09	07	15	HUANCAVELICA             	TAYACAJA                 
100102	AMARILIS	10	01	02	HUANUCO                  	HUANUCO                  
100110	YARUMAYO	10	01	10	HUANUCO                  	HUANUCO                  
100208	TOMAY KICHWA	10	02	08	HUANUCO                  	AMBO                     
100501	LLATA	10	05	01	HUANUCO                  	HUAMALIES                
100510	SINGA	10	05	10	HUANUCO                  	HUAMALIES                
100703	SAN BUENAVENTURA	10	07	03	HUANUCO                  	MARA¾ON                  
100905	YUYAPICHIS	10	09	05	HUANUCO                  	PUERTO INCA              
101107	PAMPAMARCA	10	11	07	HUANUCO                  	YAROWILCA                
110114	YAUCA DEL ROSARIO	11	01	14	ICA                      	ICA                      
110210	SUNAMPE	11	02	10	ICA                      	CHINCHA                  
110403	RIO GRANDE	11	04	03	ICA                      	PALPA                    
120107	CHILCA	12	01	07	JUNIN                    	HUANCAYO                 
120126	PUCARA	12	01	26	JUNIN                    	HUANCAYO                 
120130	SAN JERONIMO DE TUNAN	12	01	30	JUNIN                    	HUANCAYO                 
120204	CHAMBARA	12	02	04	JUNIN                    	CONCEPCION               
120214	SAN JOSE DE QUERO	12	02	14	JUNIN                    	CONCEPCION               
120402	ACOLLA	12	04	02	JUNIN                    	JAUJA                    
120412	JULCAN	12	04	12	JUNIN                    	JAUJA                    
120426	POMACANCHA	12	04	26	JUNIN                    	JAUJA                    
120501	JUNIN	12	05	01	JUNIN                    	JUNIN                    
120704	HUASAHUASI	12	07	04	JUNIN                    	TARMA                    
120804	MARCAPOMACOCHA	12	08	04	JUNIN                    	YAULI                    
120904	HUACHAC	12	09	04	JUNIN                    	CHUPACA                  
130104	HUANCHACO	13	01	04	LA LIBERTAD              	TRUJILLO                 
130109	SALAVERRY	13	01	09	LA LIBERTAD              	TRUJILLO                 
130305	UCHUMARCA	13	03	05	LA LIBERTAD              	BOLIVAR                  
130606	LA CUESTA	13	06	06	LA LIBERTAD              	OTUZCO                   
131000	SANTIAGO DE CHUCO	13	10	00	\N	\N
131200	VIRU	13	12	00	\N	\N
140000	LAMBAYEQUE	14	00	00	\N	\N
140100	CHICLAYO	14	01	00	\N	\N
140116	CAYALTI	14	01	16	\N	\N
140117	PATAPO	14	01	17	\N	\N
140119	PUCALA	14	01	19	\N	\N
140120	TUMAN	14	01	20	\N	\N
140200	FERRE¥AFE	14	02	00	\N	\N
140300	LAMBAYEQUE	14	03	00	\N	\N
150000	LIMA	15	00	00	\N	\N
150100	LIMA	15	01	00	\N	\N
150200	BARRANCA	15	02	00	\N	\N
150400	CANTA	15	04	00	\N	\N
150500	CA¥ETE	15	05	00	\N	\N
150600	HUARAL	15	06	00	\N	\N
150700	HUAROCHIRI	15	07	00	\N	\N
150800	HUAURA	15	08	00	\N	\N
150900	OYON	15	09	00	\N	\N
151000	YAUYOS	15	10	00	\N	\N
160000	LORETO	16	00	00	\N	\N
160100	MAYNAS	16	01	00	\N	\N
160113	SAN JUAN BAUTISTA	16	01	13	\N	\N
160114	TENIENTE MANUEL CLAVERO	16	01	14	\N	\N
160200	ALTO AMAZONAS	16	02	00	\N	\N
160300	LORETO	16	03	00	\N	\N
160400	MARISCAL RAMON CASTILLA	16	04	00	\N	\N
160500	REQUENA	16	05	00	\N	\N
160511	YAQUERANA	16	05	11	\N	\N
160600	UCAYALI	16	06	00	\N	\N
160700	DATEM DEL MARA¥ON	16	07	00	\N	\N
160701	BARRANCA	16	07	01	\N	\N
160703	MANSERICHE	16	07	03	\N	\N
160704	MORONA	16	07	04	\N	\N
160705	PASTAZA	16	07	05	\N	\N
160706	ANDOAS	16	07	06	\N	\N
130800	PATAZ	13	08	00	\N	\N
180000	MOQUEGUA	18	00	00	\N	\N
180100	MARISCAL NIETO	18	01	00	\N	\N
180200	GENERAL SANCHEZ CERRO	18	02	00	\N	\N
190000	PASCO	19	00	00	\N	\N
190100	PASCO	19	01	00	\N	\N
190200	DANIEL ALCIDES CARRION	19	02	00	\N	\N
190300	OXAPAMPA	19	03	00	\N	\N
200000	PIURA	20	00	00	\N	\N
200100	PIURA	20	01	00	\N	\N
200200	AYABACA	20	02	00	\N	\N
200300	HUANCABAMBA	20	03	00	\N	\N
200400	MORROPON	20	04	00	\N	\N
200500	PAITA	20	05	00	\N	\N
200600	SULLANA	20	06	00	\N	\N
200700	TALARA	20	07	00	\N	\N
210000	PUNO	21	00	00	\N	\N
210100	PUNO	21	01	00	\N	\N
210200	AZANGARO	21	02	00	\N	\N
210300	CARABAYA	21	03	00	\N	\N
210400	CHUCUITO	21	04	00	\N	\N
210500	EL COLLAO	21	05	00	\N	\N
210600	HUANCANE	21	06	00	\N	\N
210800	MELGAR	21	08	00	\N	\N
131007	SANTA CRUZ DE CHUCA	13	10	07	LA LIBERTAD              	SANTIAGO DE CHUCO        
140101	CHICLAYO	14	01	01	LAMBAYEQUE               	CHICLAYO                 
140115	SA¥A	14	01	15	LAMBAYEQUE               	CHICLAYO                 
140308	OLMOS	14	03	08	LAMBAYEQUE               	LAMBAYEQUE               
150120	MAGDALENA DEL MAR	15	01	20	LIMA                     	LIMA                     
150141	SURQUILLO	15	01	41	LIMA                     	LIMA                     
150143	VILLA MARIA DEL TRIUNFO	15	01	43	LIMA                     	LIMA                     
150205	SUPE PUERTO	15	02	05	LIMA                     	BARRANCA                 
150404	HUAROS	15	04	04	LIMA                     	CANTA                    
150511	PACARAN	15	05	11	LIMA                     	CA¥ETE                   
150605	CHANCAY	15	06	05	LIMA                     	HUARAL                   
150707	HUACHUPAMPA	15	07	07	LIMA                     	HUAROCHIRI               
150716	SAN ANTONIO	15	07	16	LIMA                     	HUAROCHIRI               
150803	CALETA DE CARQUIN	15	08	03	LIMA                     	HUAURA                   
150901	OYON	15	09	01	LIMA                     	OYON                     
151004	AYAVIRI	15	10	04	LIMA                     	YAUYOS                   
151018	LARAOS	15	10	18	LIMA                     	YAUYOS                   
151024	QUINCHES	15	10	24	LIMA                     	YAUYOS                   
160104	INDIANA	16	01	04	LORETO                   	MAYNAS                   
160205	JEBEROS	16	02	05	LORETO                   	ALTO AMAZONAS            
160502	ALTO TAPICHE	16	05	02	LORETO                   	REQUENA                  
180105	SAN CRISTOBAL	18	01	05	MOQUEGUA                 	MARISCAL NIETO           
180302	EL ALGARROBAL	18	03	02	MOQUEGUA                 	ILO                      
190113	YANACANCHA	19	01	13	PASCO                    	PASCO                    
190306	PUERTO BERMUDEZ	19	03	06	PASCO                    	OXAPAMPA                 
200204	LAGUNAS	20	02	04	PIURA                    	AYABACA                  
200302	CANCHAQUE	20	03	02	PIURA                    	HUANCABAMBA              
200408	SANTA CATALINA DE MOSSA	20	04	08	PIURA                    	MORROPON                 
200605	MARCAVELICA	20	06	05	PIURA                    	SULLANA                  
200801	SECHURA	20	08	01	PIURA                    	SECHURA                  
210109	MA¥AZO	21	01	09	PUNO                     	PUNO                     
210203	ARAPA	21	02	03	PUNO                     	AZANGARO                 
210303	AYAPATA	21	03	03	PUNO                     	CARABAYA                 
210402	DESAGUADERO	21	04	02	PUNO                     	CHUCUITO                 
210604	INCHUPALLA	21	06	04	PUNO                     	HUANCANE                 
210706	PALCA	21	07	06	PUNO                     	LAMPA                    
210805	MACARI	21	08	05	PUNO                     	MELGAR                   
210900	MOHO	21	09	00	\N	\N
211000	SAN ANTONIO DE PUTINA	21	10	00	\N	\N
211100	SAN ROMAN	21	11	00	\N	\N
211200	SANDIA	21	12	00	\N	\N
211210	SAN PEDRO DE PUTINA PUNCO	21	12	10	\N	\N
220000	SAN MARTIN	22	00	00	\N	\N
220100	MOYOBAMBA	22	01	00	\N	\N
220300	EL DORADO	22	03	00	\N	\N
220400	HUALLAGA	22	04	00	\N	\N
220500	LAMAS	22	05	00	\N	\N
220600	MARISCAL CACERES	22	06	00	\N	\N
220700	PICOTA	22	07	00	\N	\N
220800	RIOJA	22	08	00	\N	\N
170200	MANU	17	02	00	\N	\N
221000	TOCACHE	22	10	00	\N	\N
230100	TACNA	23	01	00	\N	\N
230200	CANDARAVE	23	02	00	\N	\N
230300	JORGE BASADRE	23	03	00	\N	\N
230400	TARATA	23	04	00	\N	\N
240000	TUMBES	24	00	00	\N	\N
240200	CONTRALMIRANTE VILLAR	24	02	00	\N	\N
240203	CANOAS DE PUNTA SAL	24	02	03	\N	\N
240300	ZARUMILLA	24	03	00	\N	\N
250000	UCAYALI	25	00	00	\N	\N
250100	CORONEL PORTILLO	25	01	00	\N	\N
250200	ATALAYA	25	02	00	\N	\N
250400	PURUS	25	04	00	\N	\N
010100	CHACHAPOYAS	01	01	00	\N	\N
021000	HUARI	02	10	00	\N	\N
021800	SANTA	02	18	00	\N	\N
022000	YUNGAY	02	20	00	\N	\N
030600	CHINCHEROS	03	06	00	\N	\N
010205	IMAZA	01	02	05	AMAZONAS                 	BAGUA                    
010311	VALERA	01	03	11	AMAZONAS                 	BONGARA                  
010511	MARIA	01	05	11	AMAZONAS                 	LUYA                     
010521	SANTO TOMAS	01	05	21	AMAZONAS                 	LUYA                     
010611	TOTORA	01	06	11	AMAZONAS                 	RODRIGUEZ DE MENDOZA     
020202	CORIS	02	02	02	ANCASH                   	AIJA                     
020304	CHINGAS	02	03	04	ANCASH                   	ANTONIO RAYMONDI         
020507	COLQUIOC	02	05	07	ANCASH                   	BOLOGNESI                
020601	CARHUAZ	02	06	01	ANCASH                   	CARHUAZ                  
020702	SAN NICOLAS	02	07	02	ANCASH                   	CARLOS F. FITZCARRALD    
021013	RAPAYAN	02	10	13	ANCASH                   	HUARI                    
021105	MALVAS	02	11	05	ANCASH                   	HUARMEY                  
021209	SANTO TORIBIO	02	12	09	ANCASH                   	HUAYLAS                  
021308	MUSGA	02	13	08	ANCASH                   	MARISCAL LUZURIAGA       
021505	HUANDOVAL	02	15	05	ANCASH                   	PALLASCA                 
021705	LLACLLIN	02	17	05	ANCASH                   	RECUAY                   
021901	SIHUAS	02	19	01	ANCASH                   	SIHUAS                   
022008	YANAMA	02	20	08	ANCASH                   	YUNGAY                   
030107	PICHIRHUA	03	01	07	APURIMAC                 	ABANCAY                  
030214	SAN MIGUEL DE CHACCRAMPA	03	02	14	APURIMAC                 	ANDAHUAYLAS              
030304	JUAN ESPINOZA MEDRANO	03	03	04	APURIMAC                 	ANTABAMBA                
030406	COTARUSE	03	04	06	APURIMAC                 	AYMARAES                 
030601	CHINCHEROS	03	06	01	APURIMAC                 	CHINCHEROS               
030709	SAN ANTONIO	03	07	09	APURIMAC                 	GRAU                     
040111	MOLLEBAYA	04	01	11	AREQUIPA                 	AREQUIPA                 
040124	UCHUMAYO	04	01	24	AREQUIPA                 	AREQUIPA                 
040503	CABANACONDE	04	05	03	AREQUIPA                 	CAYLLOMA                 
040512	MACA	04	05	12	AREQUIPA                 	CAYLLOMA                 
040602	ANDARAY	04	06	02	AREQUIPA                 	CONDESUYOS               
040805	PAMPAMARCA	04	08	05	AREQUIPA                 	LA UNION                 
050103	ACOS VINCHOS	05	01	03	AYACUCHO                 	HUAMANGA                 
050112	SOCOS	05	01	12	AYACUCHO                 	HUAMANGA                 
050304	SANTIAGO DE LUCANAMARCA	05	03	04	AYACUCHO                 	HUANCA SANCOS            
050508	TAMBO	05	05	08	AYACUCHO                 	LA MAR                   
050618	SAN PEDRO DE PALCO	05	06	18	AYACUCHO                 	LUCANAS                  
050707	SAN FRANCISCO DE RAVACAYCO	05	07	07	AYACUCHO                 	PARINACOCHAS             
050810	SARA SARA	05	08	10	AYACUCHO                 	PAUCAR DEL SARA SARA     
170201	MANU	17	02	01	MADRE DE DIOS            	MANU                     
211001	PUTINA	21	10	01	PUNO                     	SAN ANTONIO DE PUTINA    
211206	QUIACA	21	12	06	PUNO                     	SANDIA                   
211307	UNICACHI	21	13	07	PUNO                     	YUNGUYO                  
220203	BAJO BIAVO	22	02	03	SAN MARTIN               	BELLAVISTA               
220406	TINGO DE SAPOSOA	22	04	06	SAN MARTIN               	HUALLAGA                 
220510	TABALOSOS	22	05	10	SAN MARTIN               	LAMAS                    
220708	SHAMBOYACU	22	07	08	SAN MARTIN               	PICOTA                   
220903	CACATACHI	22	09	03	SAN MARTIN               	SAN MARTIN               
220913	SAUCE	22	09	13	SAN MARTIN               	SAN MARTIN               
230103	CALANA	23	01	03	TACNA                    	TACNA                    
230403	ESTIQUE	23	04	03	TACNA                    	TARATA                   
240105	SAN JACINTO	24	01	05	TUMBES                   	TUMBES                   
250201	RAYMONDI	25	02	01	UCAYALI                  	ATALAYA                  
060000	CAJAMARCA	06	00	00	\N	\N
060300	CELENDIN	06	03	00	\N	\N
060800	JAEN	06	08	00	\N	\N
080000	CUSCO	08	00	00	\N	\N
090000	HUANCAVELICA	09	00	00	\N	\N
100000	HUANUCO	10	00	00	\N	\N
040400	CASTILLA	04	04	00	\N	\N
100600	LEONCIO PRADO	10	06	00	\N	\N
100900	PUERTO INCA	10	09	00	\N	\N
110300	NAZCA	11	03	00	\N	\N
120200	CONCEPCION	12	02	00	\N	\N
120400	JAUJA	12	04	00	\N	\N
120800	YAULI	12	08	00	\N	\N
130000	LA LIBERTAD	13	00	00	\N	\N
130700	PACASMAYO	13	07	00	\N	\N
130900	SANCHEZ CARRION	13	09	00	\N	\N
131100	GRAN CHIMU	13	11	00	\N	\N
140118	POMALCA	14	01	18	\N	\N
150300	CAJATAMBO	15	03	00	\N	\N
050911	SORAS	05	09	11	AYACUCHO                 	SUCRE                    
051104	CONCEPCION	05	11	04	AYACUCHO                 	VILCAS HUAMAN            
060202	CACHACHI	06	02	02	CAJAMARCA                	CAJABAMBA                
060403	CHADIN	06	04	03	CAJAMARCA                	CHOTA                    
060412	MIRACOSTA	06	04	12	CAJAMARCA                	CHOTA                    
060603	CHOROS	06	06	03	CAJAMARCA                	CUTERVO                  
060803	CHONTALI	06	08	03	CAJAMARCA                	JAEN                     
060812	SANTA ROSA	06	08	12	CAJAMARCA                	JAEN                     
061104	CATILLUC	06	11	04	CAJAMARCA                	SAN MIGUEL               
061106	LA FLORIDA	06	11	06	CAJAMARCA                	SAN MIGUEL               
061301	SANTA CRUZ	06	13	01	CAJAMARCA                	SANTA CRUZ               
070105	LA PUNTA	07	01	05	CALLAO                   	CALLAO                   
080301	ANTA	08	03	01	CUSCO                    	ANTA                     
080401	CALCA	08	04	01	CUSCO                    	CALCA                    
080502	CHECCA	08	05	02	CUSCO                    	CANAS                    
080704	COLQUEMARCA	08	07	04	CUSCO                    	CHUMBIVILCAS             
080906	QUELLOUNO	08	09	06	CUSCO                    	LA CONVENCION            
081004	COLCHA	08	10	04	CUSCO                    	PARURO                   
081102	CAICAY	08	11	02	CUSCO                    	PAUCARTAMBO              
081206	CUSIPATA	08	12	06	CUSCO                    	QUISPICANCHI             
090105	CUENCA	09	01	05	HUANCAVELICA             	HUANCAVELICA             
090206	PAUCARA	09	02	06	HUANCAVELICA             	ACOBAMBA                 
090403	AURAHUA	09	04	03	HUANCAVELICA             	CASTROVIRREYNA           
090412	TANTARA	09	04	12	HUANCAVELICA             	CASTROVIRREYNA           
090608	QUERCO	09	06	08	HUANCAVELICA             	HUAYTARA                 
090701	PAMPAS	09	07	01	HUANCAVELICA             	TAYACAJA                 
090711	PAZOS	09	07	11	HUANCAVELICA             	TAYACAJA                 
100601	RUPA-RUPA	10	06	01	HUANUCO                  	LEONCIO PRADO            
101001	JESUS	10	10	01	HUANUCO                  	LAURICOCHA               
101103	CHACABAMBA	10	11	03	HUANUCO                  	YAROWILCA                
110105	PACHACUTEC	11	01	05	ICA                      	ICA                      
110208	SAN JUAN DE YANAC	11	02	08	ICA                      	CHINCHA                  
110503	HUMAY	11	05	03	ICA                      	PISCO                    
120120	HUASICANCHA	12	01	20	JUNIN                    	HUANCAYO                 
120128	QUILCAS	12	01	28	JUNIN                    	HUANCAYO                 
120210	MATAHUASI	12	02	10	JUNIN                    	CONCEPCION               
120406	CURICACA	12	04	06	JUNIN                    	JAUJA                    
120421	MUQUIYAUYO	12	04	21	JUNIN                    	JAUJA                    
120434	YAUYOS	12	04	34	JUNIN                    	JAUJA                    
120605	PAMPA HERMOSA	12	06	05	JUNIN                    	SATIPO                   
120806	PACCHA	12	08	06	JUNIN                    	YAULI                    
130202	CHICAMA	13	02	02	LA LIBERTAD              	ASCOPE                   
130304	LONGOTEA	13	03	04	LA LIBERTAD              	BOLIVAR                  
130502	CALAMARCA	13	05	02	LA LIBERTAD              	JULCAN                   
130613	SINSICAP	13	06	13	LA LIBERTAD              	OTUZCO                   
130810	PIAS	13	08	10	LA LIBERTAD              	PATAZ                    
131006	QUIRUVILCA	13	10	06	LA LIBERTAD              	SANTIAGO DE CHUCO        
140106	LA VICTORIA	14	01	06	LAMBAYEQUE               	CHICLAYO                 
140203	INCAHUASI	14	02	03	LAMBAYEQUE               	FERRE¥AFE                
140306	MORROPE	14	03	06	LAMBAYEQUE               	LAMBAYEQUE               
230302	ILABAYA	23	03	02	TACNA                    	JORGE BASADRE            
150130	SAN BORJA	15	01	30	LIMA                     	LIMA                     
150302	COPA	15	03	02	LIMA                     	CAJATAMBO                
150406	SAN BUENAVENTURA	15	04	06	LIMA                     	CANTA                    
150508	LUNAHUANA	15	05	08	LIMA                     	CA¥ETE                   
150610	SANTA CRUZ DE ANDAMARCA	15	06	10	LIMA                     	HUARAL                   
150706	CUENCA	15	07	06	LIMA                     	HUAROCHIRI               
150721	SAN LORENZO DE QUINTI	15	07	21	LIMA                     	HUAROCHIRI               
160702	CAHUAPANAS	16	07	02	\N	\N
170000	MADRE DE DIOS	17	00	00	\N	\N
200800	SECHURA	20	08	00	\N	\N
211300	YUNGUYO	21	13	00	\N	\N
220200	BELLAVISTA	22	02	00	\N	\N
220900	SAN MARTIN	22	09	00	\N	\N
230000	TACNA	23	00	00	\N	\N
240100	TUMBES	24	01	00	\N	\N
250300	PADRE ABAD	25	03	00	\N	\N
060600	CUTERVO	06	06	00	\N	\N
100200	AMBO	10	02	00	\N	\N
160112	BELEN	16	01	12	\N	\N
010101	CHACHAPOYAS	01	01	01	AMAZONAS                 	CHACHAPOYAS              
010102	ASUNCION	01	01	02	AMAZONAS                 	CHACHAPOYAS              
010103	BALSAS	01	01	03	AMAZONAS                 	CHACHAPOYAS              
010105	CHILIQUIN	01	01	05	AMAZONAS                 	CHACHAPOYAS              
010113	MARISCAL CASTILLA	01	01	13	AMAZONAS                 	CHACHAPOYAS              
010114	MOLINOPAMPA	01	01	14	AMAZONAS                 	CHACHAPOYAS              
010116	OLLEROS	01	01	16	AMAZONAS                 	CHACHAPOYAS              
010118	SAN FRANCISCO DE DAGUAS	01	01	18	AMAZONAS                 	CHACHAPOYAS              
010120	SOLOCO	01	01	20	AMAZONAS                 	CHACHAPOYAS              
010201	LA PECA	01	02	01	AMAZONAS                 	BAGUA                    
010204	EL PARCO	01	02	04	AMAZONAS                 	BAGUA                    
010302	CHISQUILLA	01	03	02	AMAZONAS                 	BONGARA                  
010303	CHURUJA	01	03	03	AMAZONAS                 	BONGARA                  
010305	CUISPES	01	03	05	AMAZONAS                 	BONGARA                  
010308	RECTA	01	03	08	AMAZONAS                 	BONGARA                  
010309	SAN CARLOS	01	03	09	AMAZONAS                 	BONGARA                  
010312	YAMBRASBAMBA	01	03	12	AMAZONAS                 	BONGARA                  
010402	EL CENEPA	01	04	02	AMAZONAS                 	CONDORCANQUI             
010501	LAMUD	01	05	01	AMAZONAS                 	LUYA                     
010502	CAMPORREDONDO	01	05	02	AMAZONAS                 	LUYA                     
021709	TAPACOCHA	02	17	09	ANCASH                   	RECUAY                   
040205	NICOLAS DE PIEROLA	04	02	05	AREQUIPA                 	CAMANA                   
051107	SAURAMA	05	11	07	AYACUCHO                 	VILCAS HUAMAN            
090605	LARAMARCA	09	06	05	HUANCAVELICA             	HUAYTARA                 
100317	RIPAN	10	03	17	HUANUCO                  	DOS DE MAYO              
130105	LA ESPERANZA	13	01	05	LA LIBERTAD              	TRUJILLO                 
150724	SAN PEDRO DE CASTA	15	07	24	LIMA                     	HUAROCHIRI               
150808	PACCHO	15	08	08	LIMA                     	HUAURA                   
151009	CHOCOS	15	10	09	LIMA                     	YAUYOS                   
151019	LINCHA	15	10	19	LIMA                     	YAUYOS                   
151027	SAN PEDRO DE PILAS	15	10	27	LIMA                     	YAUYOS                   
160301	NAUTA	16	03	01	LORETO                   	LORETO                   
160501	REQUENA	16	05	01	LORETO                   	REQUENA                  
160510	JENARO HERRERA	16	05	10	LORETO                   	REQUENA                  
170103	LAS PIEDRAS	17	01	03	MADRE DE DIOS            	TAMBOPATA                
180103	CUCHUMBAYA	18	01	03	MOQUEGUA                 	MARISCAL NIETO           
180208	PUQUINA	18	02	08	MOQUEGUA                 	GENERAL SANCHEZ CERRO    
190103	HUARIACA	19	01	03	PASCO                    	PASCO                    
190206	SANTA ANA DE TUSI	19	02	06	PASCO                    	DANIEL ALCIDES CARRION   
200111	LAS LOMAS	20	01	11	PIURA                    	PIURA                    
200210	SUYO	20	02	10	PIURA                    	AYABACA                  
200401	CHULUCANAS	20	04	01	PIURA                    	MORROPON                 
200503	ARENAL	20	05	03	PIURA                    	PAITA                    
200703	LA BREA	20	07	03	PIURA                    	TALARA                   
210104	ATUNCOLLA	21	01	04	PUNO                     	PUNO                     
210202	ACHAYA	21	02	02	PUNO                     	AZANGARO                 
210213	SAN JUAN DE SALINAS	21	02	13	PUNO                     	AZANGARO                 
210404	KELLUYO	21	04	04	PUNO                     	CHUCUITO                 
210601	HUANCANE	21	06	01	PUNO                     	HUANCANE                 
210710	VILAVILA	21	07	10	PUNO                     	LAMPA                    
210807	ORURILLO	21	08	07	PUNO                     	MELGAR                   
211101	JULIACA	21	11	01	PUNO                     	SAN ROMAN                
220102	CALZADA	22	01	02	SAN MARTIN               	MOYOBAMBA                
220205	SAN PABLO	22	02	05	SAN MARTIN               	BELLAVISTA               
220403	EL ESLABON	22	04	03	SAN MARTIN               	HUALLAGA                 
220603	HUICUNGO	22	06	03	SAN MARTIN               	MARISCAL CACERES         
220707	SAN HILARION	22	07	07	SAN MARTIN               	PICOTA                   
220806	POSIC	22	08	06	SAN MARTIN               	RIOJA                    
230105	INCLAN	23	01	05	TACNA                    	TACNA                    
230205	HUANUARA	23	02	05	TACNA                    	CANDARAVE                
240202	CASITAS	24	02	02	TUMBES                   	CONTRALMIRANTE VILLAR    
250105	YARINACOCHA	25	01	05	UCAYALI                  	CORONEL PORTILLO         
010503	COCABAMBA	01	05	03	AMAZONAS                 	LUYA                     
010505	CONILA	01	05	05	AMAZONAS                 	LUYA                     
010508	LONYA CHICO	01	05	08	AMAZONAS                 	LUYA                     
010510	LUYA VIEJO	01	05	10	AMAZONAS                 	LUYA                     
010512	OCALLI	01	05	12	AMAZONAS                 	LUYA                     
010514	PISUQUIA	01	05	14	AMAZONAS                 	LUYA                     
010515	PROVIDENCIA	01	05	15	AMAZONAS                 	LUYA                     
010517	SAN FRANCISCO DEL YESO	01	05	17	AMAZONAS                 	LUYA                     
010519	SAN JUAN DE LOPECANCHA	01	05	19	AMAZONAS                 	LUYA                     
010523	TRITA	01	05	23	AMAZONAS                 	LUYA                     
010602	CHIRIMOTO	01	06	02	AMAZONAS                 	RODRIGUEZ DE MENDOZA     
010603	COCHAMAL	01	06	03	AMAZONAS                 	RODRIGUEZ DE MENDOZA     
010605	LIMABAMBA	01	06	05	AMAZONAS                 	RODRIGUEZ DE MENDOZA     
010606	LONGAR	01	06	06	AMAZONAS                 	RODRIGUEZ DE MENDOZA     
010609	OMIA	01	06	09	AMAZONAS                 	RODRIGUEZ DE MENDOZA     
010612	VISTA ALEGRE	01	06	12	AMAZONAS                 	RODRIGUEZ DE MENDOZA     
010702	CAJARURO	01	07	02	AMAZONAS                 	UTCUBAMBA                
010703	CUMBA	01	07	03	AMAZONAS                 	UTCUBAMBA                
010704	EL MILAGRO	01	07	04	AMAZONAS                 	UTCUBAMBA                
010706	LONYA GRANDE	01	07	06	AMAZONAS                 	UTCUBAMBA                
020101	HUARAZ	02	01	01	ANCASH                   	HUARAZ                   
020102	COCHABAMBA	02	01	02	ANCASH                   	HUARAZ                   
020104	HUANCHAY	02	01	04	ANCASH                   	HUARAZ                   
020105	INDEPENDENCIA	02	01	05	ANCASH                   	HUARAZ                   
020108	OLLEROS	02	01	08	ANCASH                   	HUARAZ                   
020110	PARIACOTO	02	01	10	ANCASH                   	HUARAZ                   
020111	PIRA	02	01	11	ANCASH                   	HUARAZ                   
020201	AIJA	02	02	01	ANCASH                   	AIJA                     
020205	SUCCHA	02	02	05	ANCASH                   	AIJA                     
020302	ACZO	02	03	02	ANCASH                   	ANTONIO RAYMONDI         
020305	MIRGAS	02	03	05	ANCASH                   	ANTONIO RAYMONDI         
020306	SAN JUAN DE RONTOY	02	03	06	ANCASH                   	ANTONIO RAYMONDI         
020402	ACOCHACA	02	04	02	ANCASH                   	ASUNCION                 
020501	CHIQUIAN	02	05	01	ANCASH                   	BOLOGNESI                
020503	ANTONIO RAYMONDI	02	05	03	ANCASH                   	BOLOGNESI                
020506	CANIS	02	05	06	ANCASH                   	BOLOGNESI                
020509	HUASTA	02	05	09	ANCASH                   	BOLOGNESI                
020510	HUAYLLACAYAN	02	05	10	ANCASH                   	BOLOGNESI                
020512	MANGAS	02	05	12	ANCASH                   	BOLOGNESI                
020514	SAN MIGUEL DE CORPANQUI	02	05	14	ANCASH                   	BOLOGNESI                
020515	TICLLOS	02	05	15	ANCASH                   	BOLOGNESI                
020603	AMASHCA	02	06	03	ANCASH                   	CARHUAZ                  
020606	MARCARA	02	06	06	ANCASH                   	CARHUAZ                  
020607	PARIAHUANCA	02	06	07	ANCASH                   	CARHUAZ                  
020608	SAN MIGUEL DE ACO	02	06	08	ANCASH                   	CARHUAZ                  
020611	YUNGAR	02	06	11	ANCASH                   	CARHUAZ                  
020701	SAN LUIS	02	07	01	ANCASH                   	CARLOS F. FITZCARRALD    
020801	CASMA	02	08	01	ANCASH                   	CASMA                    
020803	COMANDANTE NOEL	02	08	03	ANCASH                   	CASMA                    
020804	YAUTAN	02	08	04	ANCASH                   	CASMA                    
020902	ACO	02	09	02	ANCASH                   	CORONGO                  
020903	BAMBAS	02	09	03	ANCASH                   	CORONGO                  
020904	CUSCA	02	09	04	ANCASH                   	CORONGO                  
020906	YANAC	02	09	06	ANCASH                   	CORONGO                  
021001	HUARI	02	10	01	ANCASH                   	HUARI                    
021004	CHAVIN DE HUANTAR	02	10	04	ANCASH                   	HUARI                    
021005	HUACACHI	02	10	05	ANCASH                   	HUARI                    
021007	HUACHIS	02	10	07	ANCASH                   	HUARI                    
021008	HUANTAR	02	10	08	ANCASH                   	HUARI                    
021010	PAUCAS	02	10	10	ANCASH                   	HUARI                    
021014	SAN MARCOS	02	10	14	ANCASH                   	HUARI                    
021015	SAN PEDRO DE CHANA	02	10	15	ANCASH                   	HUARI                    
021016	UCO	02	10	16	ANCASH                   	HUARI                    
021103	CULEBRAS	02	11	03	ANCASH                   	HUARMEY                  
021201	CARAZ	02	12	01	ANCASH                   	HUAYLAS                  
021202	HUALLANCA	02	12	02	ANCASH                   	HUAYLAS                  
021204	HUAYLAS	02	12	04	ANCASH                   	HUAYLAS                  
021207	PUEBLO LIBRE	02	12	07	ANCASH                   	HUAYLAS                  
021210	YURACMARCA	02	12	10	ANCASH                   	HUAYLAS                  
021301	PISCOBAMBA	02	13	01	ANCASH                   	MARISCAL LUZURIAGA       
021303	ELEAZAR GUZMAN BARRON	02	13	03	ANCASH                   	MARISCAL LUZURIAGA       
021304	FIDEL OLIVAS ESCUDERO	02	13	04	ANCASH                   	MARISCAL LUZURIAGA       
021306	LLUMPA	02	13	06	ANCASH                   	MARISCAL LUZURIAGA       
021402	ACAS	02	14	02	ANCASH                   	OCROS                    
021404	CARHUAPAMPA	02	14	04	ANCASH                   	OCROS                    
021406	CONGAS	02	14	06	ANCASH                   	OCROS                    
021407	LLIPA	02	14	07	ANCASH                   	OCROS                    
021409	SAN PEDRO	02	14	09	ANCASH                   	OCROS                    
021410	SANTIAGO DE CHILCAS	02	14	10	ANCASH                   	OCROS                    
021503	CONCHUCOS	02	15	03	ANCASH                   	PALLASCA                 
021506	LACABAMBA	02	15	06	ANCASH                   	PALLASCA                 
021508	PALLASCA	02	15	08	ANCASH                   	PALLASCA                 
021509	PAMPAS	02	15	09	ANCASH                   	PALLASCA                 
021510	SANTA ROSA	02	15	10	ANCASH                   	PALLASCA                 
021601	POMABAMBA	02	16	01	ANCASH                   	POMABAMBA                
021603	PAROBAMBA	02	16	03	ANCASH                   	POMABAMBA                
021702	CATAC	02	17	02	ANCASH                   	RECUAY                   
021703	COTAPARACO	02	17	03	ANCASH                   	RECUAY                   
021707	PAMPAS CHICO	02	17	07	ANCASH                   	RECUAY                   
021710	TICAPAMPA	02	17	10	ANCASH                   	RECUAY                   
021801	CHIMBOTE	02	18	01	ANCASH                   	DEL SANTA                
021803	COISHCO	02	18	03	ANCASH                   	DEL SANTA                
021804	MACATE	02	18	04	ANCASH                   	DEL SANTA                
021806	NEPE¥A	02	18	06	ANCASH                   	DEL SANTA                
021808	SANTA	02	18	08	ANCASH                   	DEL SANTA                
021809	NUEVO CHIMBOTE	02	18	09	ANCASH                   	DEL SANTA                
021903	ALFONSO UGARTE	02	19	03	ANCASH                   	SIHUAS                   
021906	HUAYLLABAMBA	02	19	06	ANCASH                   	SIHUAS                   
021908	RAGASH	02	19	08	ANCASH                   	SIHUAS                   
021910	SICSIBAMBA	02	19	10	ANCASH                   	SIHUAS                   
022002	CASCAPARA	02	20	02	ANCASH                   	YUNGAY                   
022005	QUILLO	02	20	05	ANCASH                   	YUNGAY                   
022007	SHUPLUY	02	20	07	ANCASH                   	YUNGAY                   
030103	CIRCA	03	01	03	APURIMAC                 	ABANCAY                  
030105	HUANIPACA	03	01	05	APURIMAC                 	ABANCAY                  
030108	SAN PEDRO DE CACHORA	03	01	08	APURIMAC                 	ABANCAY                  
030109	TAMBURCO	03	01	09	APURIMAC                 	ABANCAY                  
030204	HUANCARAMA	03	02	04	APURIMAC                 	ANDAHUAYLAS              
030206	HUAYANA	03	02	06	APURIMAC                 	ANDAHUAYLAS              
030208	PACOBAMBA	03	02	08	APURIMAC                 	ANDAHUAYLAS              
030210	PAMPACHIRI	03	02	10	APURIMAC                 	ANDAHUAYLAS              
030211	POMACOCHA	03	02	11	APURIMAC                 	ANDAHUAYLAS              
030213	SAN JERONIMO	03	02	13	APURIMAC                 	ANDAHUAYLAS              
030215	SANTA MARIA DE CHICMO	03	02	15	APURIMAC                 	ANDAHUAYLAS              
030217	TUMAY HUARACA	03	02	17	APURIMAC                 	ANDAHUAYLAS              
030301	ANTABAMBA	03	03	01	APURIMAC                 	ANTABAMBA                
030303	HUAQUIRCA	03	03	03	APURIMAC                 	ANTABAMBA                
030305	OROPESA	03	03	05	APURIMAC                 	ANTABAMBA                
030307	SABAINO	03	03	07	APURIMAC                 	ANTABAMBA                
030402	CAPAYA	03	04	02	APURIMAC                 	AYMARAES                 
030403	CARAYBAMBA	03	04	03	APURIMAC                 	AYMARAES                 
030405	COLCABAMBA	03	04	05	APURIMAC                 	AYMARAES                 
030409	LUCRE	03	04	09	APURIMAC                 	AYMARAES                 
030411	SAN JUAN DE CHAC¥A	03	04	11	APURIMAC                 	AYMARAES                 
030412	SA¥AYCA	03	04	12	APURIMAC                 	AYMARAES                 
030414	TAPAIRIHUA	03	04	14	APURIMAC                 	AYMARAES                 
030415	TINTAY	03	04	15	APURIMAC                 	AYMARAES                 
030501	TAMBOBAMBA	03	05	01	APURIMAC                 	COTABAMBAS               
030503	COYLLURQUI	03	05	03	APURIMAC                 	COTABAMBAS               
030504	HAQUIRA	03	05	04	APURIMAC                 	COTABAMBAS               
030506	CHALLHUAHUACHO	03	05	06	APURIMAC                 	COTABAMBAS               
030603	COCHARCAS	03	06	03	APURIMAC                 	CHINCHEROS               
030604	HUACCANA	03	06	04	APURIMAC                 	CHINCHEROS               
030606	ONGOY	03	06	06	APURIMAC                 	CHINCHEROS               
030701	CHUQUIBAMBILLA	03	07	01	APURIMAC                 	GRAU                     
030702	CURPAHUASI	03	07	02	APURIMAC                 	GRAU                     
030704	HUAYLLATI	03	07	04	APURIMAC                 	GRAU                     
030707	PATAYPAMPA	03	07	07	APURIMAC                 	GRAU                     
030710	SANTA ROSA	03	07	10	APURIMAC                 	GRAU                     
030711	TURPAY	03	07	11	APURIMAC                 	GRAU                     
030713	VIRUNDO	03	07	13	APURIMAC                 	GRAU                     
030714	CURASCO	03	07	14	APURIMAC                 	GRAU                     
040102	ALTO SELVA ALEGRE	04	01	02	AREQUIPA                 	AREQUIPA                 
040104	CERRO COLORADO	04	01	04	AREQUIPA                 	AREQUIPA                 
040106	CHIGUATA	04	01	06	AREQUIPA                 	AREQUIPA                 
040107	JACOBO HUNTER	04	01	07	AREQUIPA                 	AREQUIPA                 
040108	LA JOYA	04	01	08	AREQUIPA                 	AREQUIPA                 
040110	MIRAFLORES	04	01	10	AREQUIPA                 	AREQUIPA                 
040113	POCSI	04	01	13	AREQUIPA                 	AREQUIPA                 
040116	SABANDIA	04	01	16	AREQUIPA                 	AREQUIPA                 
040117	SACHACA	04	01	17	AREQUIPA                 	AREQUIPA                 
040119	SAN JUAN DE TARUCANI	04	01	19	AREQUIPA                 	AREQUIPA                 
040120	SANTA ISABEL DE SIGUAS	04	01	20	AREQUIPA                 	AREQUIPA                 
040122	SOCABAYA	04	01	22	AREQUIPA                 	AREQUIPA                 
040126	YANAHUARA	04	01	26	AREQUIPA                 	AREQUIPA                 
040128	YURA	04	01	28	AREQUIPA                 	AREQUIPA                 
040202	JOSE MARIA QUIMPER	04	02	02	AREQUIPA                 	CAMANA                   
040204	MARISCAL CACERES	04	02	04	AREQUIPA                 	CAMANA                   
040206	OCO¥A	04	02	06	AREQUIPA                 	CAMANA                   
040208	SAMUEL PASTOR	04	02	08	AREQUIPA                 	CAMANA                   
040302	ACARI	04	03	02	AREQUIPA                 	CARAVELI                 
040303	ATICO	04	03	03	AREQUIPA                 	CARAVELI                 
040305	BELLA UNION	04	03	05	AREQUIPA                 	CARAVELI                 
040306	CAHUACHO	04	03	06	AREQUIPA                 	CARAVELI                 
040309	HUANUHUANU	04	03	09	AREQUIPA                 	CARAVELI                 
040311	LOMAS	04	03	11	AREQUIPA                 	CARAVELI                 
040312	QUICACHA	04	03	12	AREQUIPA                 	CARAVELI                 
040401	APLAO	04	04	01	AREQUIPA                 	CASTILLA                 
040404	CHACHAS	04	04	04	AREQUIPA                 	CASTILLA                 
040405	CHILCAYMARCA	04	04	05	AREQUIPA                 	CASTILLA                 
040406	CHOCO	04	04	06	AREQUIPA                 	CASTILLA                 
040411	TIPAN	04	04	11	AREQUIPA                 	CASTILLA                 
040412	U¥ON	04	04	12	AREQUIPA                 	CASTILLA                 
040414	VIRACO	04	04	14	AREQUIPA                 	CASTILLA                 
040504	CALLALLI	04	05	04	AREQUIPA                 	CAYLLOMA                 
040506	COPORAQUE	04	05	06	AREQUIPA                 	CAYLLOMA                 
040507	HUAMBO	04	05	07	AREQUIPA                 	CAYLLOMA                 
040509	ICHUPAMPA	04	05	09	AREQUIPA                 	CAYLLOMA                 
040511	LLUTA	04	05	11	AREQUIPA                 	CAYLLOMA                 
040513	MADRIGAL	04	05	13	AREQUIPA                 	CAYLLOMA                 
040515	SIBAYO	04	05	15	AREQUIPA                 	CAYLLOMA                 
040518	TUTI	04	05	18	AREQUIPA                 	CAYLLOMA                 
040601	CHUQUIBAMBA	04	06	01	AREQUIPA                 	CONDESUYOS               
040603	CAYARANI	04	06	03	AREQUIPA                 	CONDESUYOS               
040605	IRAY	04	06	05	AREQUIPA                 	CONDESUYOS               
040606	RIO GRANDE	04	06	06	AREQUIPA                 	CONDESUYOS               
040608	YANAQUIHUA	04	06	08	AREQUIPA                 	CONDESUYOS               
040702	COCACHACRA	04	07	02	AREQUIPA                 	ISLAY                    
040704	ISLAY	04	07	04	AREQUIPA                 	ISLAY                    
040706	PUNTA DE BOMBON	04	07	06	AREQUIPA                 	ISLAY                    
040802	ALCA	04	08	02	AREQUIPA                 	LA UNION                 
040803	CHARCANA	04	08	03	AREQUIPA                 	LA UNION                 
040806	PUYCA	04	08	06	AREQUIPA                 	LA UNION                 
040807	QUECHUALLA	04	08	07	AREQUIPA                 	LA UNION                 
040809	TAURIA	04	08	09	AREQUIPA                 	LA UNION                 
050101	AYACUCHO	05	01	01	AYACUCHO                 	HUAMANGA                 
050104	CARMEN ALTO	05	01	04	AYACUCHO                 	HUAMANGA                 
050105	CHIARA	05	01	05	AYACUCHO                 	HUAMANGA                 
050107	PACAYCASA	05	01	07	AYACUCHO                 	HUAMANGA                 
050109	SAN JOSE DE TICLLAS	05	01	09	AYACUCHO                 	HUAMANGA                 
050110	SAN JUAN BAUTISTA	05	01	10	AYACUCHO                 	HUAMANGA                 
050113	TAMBILLO	05	01	13	AYACUCHO                 	HUAMANGA                 
050202	CHUSCHI	05	02	02	AYACUCHO                 	CANGALLO                 
050204	MARIA PARADO DE BELLIDO	05	02	04	AYACUCHO                 	CANGALLO                 
050205	PARAS	05	02	05	AYACUCHO                 	CANGALLO                 
050301	SANCOS	05	03	01	AYACUCHO                 	HUANCA SANCOS            
050302	CARAPO	05	03	02	AYACUCHO                 	HUANCA SANCOS            
050401	HUANTA	05	04	01	AYACUCHO                 	HUANTA                   
050403	HUAMANGUILLA	05	04	03	AYACUCHO                 	HUANTA                   
050406	SANTILLANA	05	04	06	AYACUCHO                 	HUANTA                   
050407	SIVIA	05	04	07	AYACUCHO                 	HUANTA                   
050502	ANCO	05	05	02	AYACUCHO                 	LA MAR                   
050503	AYNA	05	05	03	AYACUCHO                 	LA MAR                   
050505	CHUNGUI	05	05	05	AYACUCHO                 	LA MAR                   
050507	SANTA ROSA	05	05	07	AYACUCHO                 	LA MAR                   
050601	PUQUIO	05	06	01	AYACUCHO                 	LUCANAS                  
050603	CABANA	05	06	03	AYACUCHO                 	LUCANAS                  
050606	CHIPAO	05	06	06	AYACUCHO                 	LUCANAS                  
050608	LARAMATE	05	06	08	AYACUCHO                 	LUCANAS                  
050609	LEONCIO PRADO	05	06	09	AYACUCHO                 	LUCANAS                  
050610	LLAUTA	05	06	10	AYACUCHO                 	LUCANAS                  
050612	OCA¥A	05	06	12	AYACUCHO                 	LUCANAS                  
050615	SAN CRISTOBAL	05	06	15	AYACUCHO                 	LUCANAS                  
050617	SAN PEDRO	05	06	17	AYACUCHO                 	LUCANAS                  
050619	SANCOS	05	06	19	AYACUCHO                 	LUCANAS                  
050621	SANTA LUCIA	05	06	21	AYACUCHO                 	LUCANAS                  
050701	CORACORA	05	07	01	AYACUCHO                 	PARINACOCHAS             
050703	CORONEL CASTA¥EDA	05	07	03	AYACUCHO                 	PARINACOCHAS             
050705	PULLO	05	07	05	AYACUCHO                 	PARINACOCHAS             
050801	PAUSA	05	08	01	AYACUCHO                 	PAUCAR DEL SARA SARA     
050803	CORCULLA	05	08	03	AYACUCHO                 	PAUCAR DEL SARA SARA     
050804	LAMPA	05	08	04	AYACUCHO                 	PAUCAR DEL SARA SARA     
050805	MARCABAMBA	05	08	05	AYACUCHO                 	PAUCAR DEL SARA SARA     
050806	OYOLO	05	08	06	AYACUCHO                 	PAUCAR DEL SARA SARA     
050809	SAN JOSE DE USHUA	05	08	09	AYACUCHO                 	PAUCAR DEL SARA SARA     
050902	BELEN	05	09	02	AYACUCHO                 	SUCRE                    
050903	CHALCOS	05	09	03	AYACUCHO                 	SUCRE                    
050905	HUACA¥A	05	09	05	AYACUCHO                 	SUCRE                    
050908	SAN PEDRO DE LARCAY	05	09	08	AYACUCHO                 	SUCRE                    
050909	SAN SALVADOR DE QUIJE	05	09	09	AYACUCHO                 	SUCRE                    
051001	HUANCAPI	05	10	01	AYACUCHO                 	VICTOR FAJARDO           
051003	APONGO	05	10	03	AYACUCHO                 	VICTOR FAJARDO           
051005	CANARIA	05	10	05	AYACUCHO                 	VICTOR FAJARDO           
051006	CAYARA	05	10	06	AYACUCHO                 	VICTOR FAJARDO           
051007	COLCA	05	10	07	AYACUCHO                 	VICTOR FAJARDO           
051009	HUANCARAYLLA	05	10	09	AYACUCHO                 	VICTOR FAJARDO           
051012	VILCANCHOS	05	10	12	AYACUCHO                 	VICTOR FAJARDO           
051102	ACCOMARCA	05	11	02	AYACUCHO                 	VILCAS HUAMAN            
051103	CARHUANCA	05	11	03	AYACUCHO                 	VILCAS HUAMAN            
051106	INDEPENDENCIA	05	11	06	AYACUCHO                 	VILCAS HUAMAN            
060101	CAJAMARCA	06	01	01	CAJAMARCA                	CAJAMARCA                
060103	CHETILLA	06	01	03	CAJAMARCA                	CAJAMARCA                
060104	COSPAN	06	01	04	CAJAMARCA                	CAJAMARCA                
060105	ENCA¥ADA	06	01	05	CAJAMARCA                	CAJAMARCA                
060107	LLACANORA	06	01	07	CAJAMARCA                	CAJAMARCA                
060110	MATARA	06	01	10	CAJAMARCA                	CAJAMARCA                
060112	SAN JUAN	06	01	12	CAJAMARCA                	CAJAMARCA                
060201	CAJABAMBA	06	02	01	CAJAMARCA                	CAJABAMBA                
060204	SITACOCHA	06	02	04	CAJAMARCA                	CAJABAMBA                
060303	CORTEGANA	06	03	03	CAJAMARCA                	CELENDIN                 
060305	JORGE CHAVEZ	06	03	05	CAJAMARCA                	CELENDIN                 
060306	JOSE GALVEZ	06	03	06	CAJAMARCA                	CELENDIN                 
060307	MIGUEL IGLESIAS	06	03	07	CAJAMARCA                	CELENDIN                 
060309	SOROCHUCO	06	03	09	CAJAMARCA                	CELENDIN                 
060312	LA LIBERTAD DE PALLAN	06	03	12	CAJAMARCA                	CELENDIN                 
060402	ANGUIA	06	04	02	CAJAMARCA                	CHOTA                    
060404	CHIGUIRIP	06	04	04	CAJAMARCA                	CHOTA                    
060406	CHOROPAMPA	06	04	06	CAJAMARCA                	CHOTA                    
060408	CONCHAN	06	04	08	CAJAMARCA                	CHOTA                    
060409	HUAMBOS	06	04	09	CAJAMARCA                	CHOTA                    
060411	LLAMA	06	04	11	CAJAMARCA                	CHOTA                    
060415	QUEROCOTO	06	04	15	CAJAMARCA                	CHOTA                    
060417	TACABAMBA	06	04	17	CAJAMARCA                	CHOTA                    
060418	TOCMOCHE	06	04	18	CAJAMARCA                	CHOTA                    
060501	CONTUMAZA	06	05	01	CAJAMARCA                	CONTUMAZA                
060502	CHILETE	06	05	02	CAJAMARCA                	CONTUMAZA                
060505	SAN BENITO	06	05	05	CAJAMARCA                	CONTUMAZA                
060507	TANTARICA	06	05	07	CAJAMARCA                	CONTUMAZA                
060601	CUTERVO	06	06	01	CAJAMARCA                	CUTERVO                  
060602	CALLAYUC	06	06	02	CAJAMARCA                	CUTERVO                  
060605	LA RAMADA	06	06	05	CAJAMARCA                	CUTERVO                  
060608	SAN ANDRES DE CUTERVO	06	06	08	CAJAMARCA                	CUTERVO                  
060610	SAN LUIS DE LUCMA	06	06	10	CAJAMARCA                	CUTERVO                  
060611	SANTA CRUZ	06	06	11	CAJAMARCA                	CUTERVO                  
060612	SANTO DOMINGO DE LA CAPILLA	06	06	12	CAJAMARCA                	CUTERVO                  
060614	SOCOTA	06	06	14	CAJAMARCA                	CUTERVO                  
060702	CHUGUR	06	07	02	CAJAMARCA                	HUALGAYOC                
060801	JAEN	06	08	01	CAJAMARCA                	JAEN                     
060802	BELLAVISTA	06	08	02	CAJAMARCA                	JAEN                     
060805	HUABAL	06	08	05	CAJAMARCA                	JAEN                     
060808	PUCARA	06	08	08	CAJAMARCA                	JAEN                     
060810	SAN FELIPE	06	08	10	CAJAMARCA                	JAEN                     
060811	SAN JOSE DEL ALTO	06	08	11	CAJAMARCA                	JAEN                     
060902	CHIRINOS	06	09	02	CAJAMARCA                	SAN IGNACIO              
060904	LA COIPA	06	09	04	CAJAMARCA                	SAN IGNACIO              
060906	SAN JOSE DE LOURDES	06	09	06	CAJAMARCA                	SAN IGNACIO              
061001	PEDRO GALVEZ	06	10	01	CAJAMARCA                	SAN MARCOS               
061004	GREGORIO PITA	06	10	04	CAJAMARCA                	SAN MARCOS               
061005	ICHOCAN	06	10	05	CAJAMARCA                	SAN MARCOS               
061101	SAN MIGUEL	06	11	01	CAJAMARCA                	SAN MIGUEL               
061103	CALQUIS	06	11	03	CAJAMARCA                	SAN MIGUEL               
061107	LLAPA	06	11	07	CAJAMARCA                	SAN MIGUEL               
061108	NANCHOC	06	11	08	CAJAMARCA                	SAN MIGUEL               
061110	SAN GREGORIO	06	11	10	CAJAMARCA                	SAN MIGUEL               
061112	TONGOD	06	11	12	CAJAMARCA                	SAN MIGUEL               
061202	SAN BERNARDINO	06	12	02	CAJAMARCA                	SAN PABLO                
061203	SAN LUIS	06	12	03	CAJAMARCA                	SAN PABLO                
061302	ANDABAMBA	06	13	02	CAJAMARCA                	SANTA CRUZ               
061304	CHANCAYBA¥OS	06	13	04	CAJAMARCA                	SANTA CRUZ               
061305	LA ESPERANZA	06	13	05	CAJAMARCA                	SANTA CRUZ               
061307	PULAN	06	13	07	CAJAMARCA                	SANTA CRUZ               
061308	SAUCEPAMPA	06	13	08	CAJAMARCA                	SANTA CRUZ               
061311	YAUYUCAN	06	13	11	CAJAMARCA                	SANTA CRUZ               
070102	BELLAVISTA	07	01	02	CALLAO                   	CALLAO                   
070104	LA PERLA	07	01	04	CALLAO                   	CALLAO                   
070106	VENTANILLA	07	01	06	CALLAO                   	CALLAO                   
080102	CCORCA	08	01	02	CUSCO                    	CUSCO                    
080105	SAN SEBASTIAN	08	01	05	CUSCO                    	CUSCO                    
080107	SAYLLA	08	01	07	CUSCO                    	CUSCO                    
080108	WANCHAQ	08	01	08	CUSCO                    	CUSCO                    
080201	ACOMAYO	08	02	01	CUSCO                    	ACOMAYO                  
080203	ACOS	08	02	03	CUSCO                    	ACOMAYO                  
080204	MOSOC LLACTA	08	02	04	CUSCO                    	ACOMAYO                  
080206	RONDOCAN	08	02	06	CUSCO                    	ACOMAYO                  
080303	CACHIMAYO	08	03	03	CUSCO                    	ANTA                     
080305	HUAROCONDO	08	03	05	CUSCO                    	ANTA                     
080307	MOLLEPATA	08	03	07	CUSCO                    	ANTA                     
080308	PUCYURA	08	03	08	CUSCO                    	ANTA                     
080403	LAMAY	08	04	03	CUSCO                    	CALCA                    
080405	PISAC	08	04	05	CUSCO                    	CALCA                    
080407	TARAY	08	04	07	CUSCO                    	CALCA                    
080408	YANATILE	08	04	08	CUSCO                    	CALCA                    
080503	KUNTURKANKI	08	05	03	CUSCO                    	CANAS                    
080504	LANGUI	08	05	04	CUSCO                    	CANAS                    
080506	PAMPAMARCA	08	05	06	CUSCO                    	CANAS                    
080508	TUPAC AMARU	08	05	08	CUSCO                    	CANAS                    
080603	COMBAPATA	08	06	03	CUSCO                    	CANCHIS                  
080604	MARANGANI	08	06	04	CUSCO                    	CANCHIS                  
080607	SAN PEDRO	08	06	07	CUSCO                    	CANCHIS                  
080701	SANTO TOMAS	08	07	01	CUSCO                    	CHUMBIVILCAS             
080702	CAPACMARCA	08	07	02	CUSCO                    	CHUMBIVILCAS             
080705	LIVITACA	08	07	05	CUSCO                    	CHUMBIVILCAS             
080708	VELILLE	08	07	08	CUSCO                    	CHUMBIVILCAS             
080802	CONDOROMA	08	08	02	CUSCO                    	ESPINAR                  
080804	OCORURO	08	08	04	CUSCO                    	ESPINAR                  
080805	PALLPATA	08	08	05	CUSCO                    	ESPINAR                  
080806	PICHIGUA	08	08	06	CUSCO                    	ESPINAR                  
080808	ALTO PICHIGUA	08	08	08	CUSCO                    	ESPINAR                  
080901	SANTA ANA	08	09	01	CUSCO                    	LA CONVENCION            
080903	HUAYOPATA	08	09	03	CUSCO                    	LA CONVENCION            
080907	KIMBIRI	08	09	07	CUSCO                    	LA CONVENCION            
080908	SANTA TERESA	08	09	08	CUSCO                    	LA CONVENCION            
080910	PICHARI	08	09	10	CUSCO                    	LA CONVENCION            
081002	ACCHA	08	10	02	CUSCO                    	PARURO                   
081005	HUANOQUITE	08	10	05	CUSCO                    	PARURO                   
081006	OMACHA	08	10	06	CUSCO                    	PARURO                   
081007	PACCARITAMBO	08	10	07	CUSCO                    	PARURO                   
081101	PAUCARTAMBO	08	11	01	CUSCO                    	PAUCARTAMBO              
081103	CHALLABAMBA	08	11	03	CUSCO                    	PAUCARTAMBO              
081105	HUANCARANI	08	11	05	CUSCO                    	PAUCARTAMBO              
081202	ANDAHUAYLILLAS	08	12	02	CUSCO                    	QUISPICANCHI             
081203	CAMANTI	08	12	03	CUSCO                    	QUISPICANCHI             
081205	CCATCA	08	12	05	CUSCO                    	QUISPICANCHI             
081207	HUARO	08	12	07	CUSCO                    	QUISPICANCHI             
081209	MARCAPATA	08	12	09	CUSCO                    	QUISPICANCHI             
081210	OCONGATE	08	12	10	CUSCO                    	QUISPICANCHI             
081301	URUBAMBA	08	13	01	CUSCO                    	URUBAMBA                 
081303	HUAYLLABAMBA	08	13	03	CUSCO                    	URUBAMBA                 
081304	MACHUPICCHU	08	13	04	CUSCO                    	URUBAMBA                 
081305	MARAS	08	13	05	CUSCO                    	URUBAMBA                 
090101	HUANCAVELICA	09	01	01	HUANCAVELICA             	HUANCAVELICA             
090104	CONAYCA	09	01	04	HUANCAVELICA             	HUANCAVELICA             
090106	HUACHOCOLPA	09	01	06	HUANCAVELICA             	HUANCAVELICA             
090107	HUAYLLAHUARA	09	01	07	HUANCAVELICA             	HUANCAVELICA             
090110	MANTA	09	01	10	HUANCAVELICA             	HUANCAVELICA             
090111	MARISCAL CACERES	09	01	11	HUANCAVELICA             	HUANCAVELICA             
090114	PALCA	09	01	14	HUANCAVELICA             	HUANCAVELICA             
090116	VILCA	09	01	16	HUANCAVELICA             	HUANCAVELICA             
090117	YAULI	09	01	17	HUANCAVELICA             	HUANCAVELICA             
090201	ACOBAMBA	09	02	01	HUANCAVELICA             	ACOBAMBA                 
090204	CAJA	09	02	04	HUANCAVELICA             	ACOBAMBA                 
090207	POMACOCHA	09	02	07	HUANCAVELICA             	ACOBAMBA                 
090301	LIRCAY	09	03	01	HUANCAVELICA             	ANGARAES                 
090302	ANCHONGA	09	03	02	HUANCAVELICA             	ANGARAES                 
090304	CCOCHACCASA	09	03	04	HUANCAVELICA             	ANGARAES                 
090306	CONGALLA	09	03	06	HUANCAVELICA             	ANGARAES                 
090307	HUANCA-HUANCA	09	03	07	HUANCAVELICA             	ANGARAES                 
090308	HUAYLLAY GRANDE	09	03	08	HUANCAVELICA             	ANGARAES                 
090310	SAN ANTONIO DE ANTAPARCO	09	03	10	HUANCAVELICA             	ANGARAES                 
090311	SANTO TOMAS DE PATA	09	03	11	HUANCAVELICA             	ANGARAES                 
090402	ARMA	09	04	02	HUANCAVELICA             	CASTROVIRREYNA           
090406	COCAS	09	04	06	HUANCAVELICA             	CASTROVIRREYNA           
090409	MOLLEPAMPA	09	04	09	HUANCAVELICA             	CASTROVIRREYNA           
090411	SANTA ANA	09	04	11	HUANCAVELICA             	CASTROVIRREYNA           
090413	TICRAPO	09	04	13	HUANCAVELICA             	CASTROVIRREYNA           
090502	ANCO	09	05	02	HUANCAVELICA             	CHURCAMPA                
090503	CHINCHIHUASI	09	05	03	HUANCAVELICA             	CHURCAMPA                
090505	LA MERCED	09	05	05	HUANCAVELICA             	CHURCAMPA                
090506	LOCROJA	09	05	06	HUANCAVELICA             	CHURCAMPA                
090508	SAN MIGUEL DE MAYOCC	09	05	08	HUANCAVELICA             	CHURCAMPA                
090509	SAN PEDRO DE CORIS	09	05	09	HUANCAVELICA             	CHURCAMPA                
090601	HUAYTARA	09	06	01	HUANCAVELICA             	HUAYTARA                 
090603	CORDOVA	09	06	03	HUANCAVELICA             	HUAYTARA                 
090606	OCOYO	09	06	06	HUANCAVELICA             	HUAYTARA                 
090609	QUITO-ARMA	09	06	09	HUANCAVELICA             	HUAYTARA                 
090610	SAN ANTONIO DE CUSICANCHA	09	06	10	HUANCAVELICA             	HUAYTARA                 
090612	SAN ISIDRO	09	06	12	HUANCAVELICA             	HUAYTARA                 
090614	SANTIAGO DE QUIRAHUARA	09	06	14	HUANCAVELICA             	HUAYTARA                 
090615	SANTO DOMINGO DE CAPILLAS	09	06	15	HUANCAVELICA             	HUAYTARA                 
090702	ACOSTAMBO	09	07	02	HUANCAVELICA             	TAYACAJA                 
090705	COLCABAMBA	09	07	05	HUANCAVELICA             	TAYACAJA                 
230303	ITE	23	03	03	TACNA                    	JORGE BASADRE            
090707	HUACHOCOLPA	09	07	07	HUANCAVELICA             	TAYACAJA                 
090710	¥AHUIMPUQUIO	09	07	10	HUANCAVELICA             	TAYACAJA                 
090713	QUISHUAR	09	07	13	HUANCAVELICA             	TAYACAJA                 
090716	SAN MARCOS DE ROCCHAC	09	07	16	HUANCAVELICA             	TAYACAJA                 
090718	TINTAY PUNCU	09	07	18	HUANCAVELICA             	TAYACAJA                 
100103	CHINCHAO	10	01	03	HUANUCO                  	HUANUCO                  
100105	MARGOS	10	01	05	HUANUCO                  	HUANUCO                  
100106	QUISQUI	10	01	06	HUANUCO                  	HUANUCO                  
100107	SAN FRANCISCO DE CAYRAN	10	01	07	HUANUCO                  	HUANUCO                  
100109	SANTA MARIA DEL VALLE	10	01	09	HUANUCO                  	HUANUCO                  
100203	COLPAS	10	02	03	HUANUCO                  	AMBO                     
100205	HUACAR	10	02	05	HUANUCO                  	AMBO                     
100207	SAN RAFAEL	10	02	07	HUANUCO                  	AMBO                     
100307	CHUQUIS	10	03	07	HUANUCO                  	DOS DE MAYO              
100313	PACHAS	10	03	13	HUANUCO                  	DOS DE MAYO              
100316	QUIVILLA	10	03	16	HUANUCO                  	DOS DE MAYO              
100322	SILLAPATA	10	03	22	HUANUCO                  	DOS DE MAYO              
100402	CANCHABAMBA	10	04	02	HUANUCO                  	HUACAYBAMBA              
100404	PINRA	10	04	04	HUANUCO                  	HUACAYBAMBA              
100504	JACAS GRANDE	10	05	04	HUANUCO                  	HUAMALIES                
100506	MIRAFLORES	10	05	06	HUANUCO                  	HUAMALIES                
100507	MONZON	10	05	07	HUANUCO                  	HUAMALIES                
100509	PU¥OS	10	05	09	HUANUCO                  	HUAMALIES                
100602	DANIEL ALOMIAS ROBLES	10	06	02	HUANUCO                  	LEONCIO PRADO            
100604	JOSE CRESPO Y CASTILLO	10	06	04	HUANUCO                  	LEONCIO PRADO            
100605	LUYANDO	10	06	05	HUANUCO                  	LEONCIO PRADO            
100701	HUACRACHUCO	10	07	01	HUANUCO                  	MARA¾ON                  
100801	PANAO	10	08	01	HUANUCO                  	PACHITEA                 
100802	CHAGLLA	10	08	02	HUANUCO                  	PACHITEA                 
100804	UMARI	10	08	04	HUANUCO                  	PACHITEA                 
100901	PUERTO INCA	10	09	01	HUANUCO                  	PUERTO INCA              
100903	HONORIA	10	09	03	HUANUCO                  	PUERTO INCA              
101002	BA¥OS	10	10	02	HUANUCO                  	LAURICOCHA               
101004	QUEROPALCA	10	10	04	HUANUCO                  	LAURICOCHA               
101005	RONDOS	10	10	05	HUANUCO                  	LAURICOCHA               
101006	SAN FRANCISCO DE ASIS	10	10	06	HUANUCO                  	LAURICOCHA               
101102	CAHUAC	10	11	02	HUANUCO                  	YAROWILCA                
101104	APARICIO POMARES	10	11	04	HUANUCO                  	YAROWILCA                
101106	OBAS	10	11	06	HUANUCO                  	YAROWILCA                
110102	LA TINGUI¥A	11	01	02	ICA                      	ICA                      
110104	OCUCAJE	11	01	04	ICA                      	ICA                      
110106	PARCONA	11	01	06	ICA                      	ICA                      
110108	SALAS	11	01	08	ICA                      	ICA                      
110109	SAN JOSE DE LOS MOLINOS	11	01	09	ICA                      	ICA                      
110110	SAN JUAN BAUTISTA	11	01	10	ICA                      	ICA                      
110113	TATE	11	01	13	ICA                      	ICA                      
110201	CHINCHA ALTA	11	02	01	ICA                      	CHINCHA                  
110203	CHAVIN	11	02	03	ICA                      	CHINCHA                  
110205	EL CARMEN	11	02	05	ICA                      	CHINCHA                  
110206	GROCIO PRADO	11	02	06	ICA                      	CHINCHA                  
110209	SAN PEDRO DE HUACARPANA	11	02	09	ICA                      	CHINCHA                  
110301	NAZCA	11	03	01	ICA                      	NAZCA                    
110303	EL INGENIO	11	03	03	ICA                      	NAZCA                    
110304	MARCONA	11	03	04	ICA                      	NAZCA                    
110401	PALPA	11	04	01	ICA                      	PALPA                    
110402	LLIPATA	11	04	02	ICA                      	PALPA                    
110405	TIBILLO	11	04	05	ICA                      	PALPA                    
110502	HUANCANO	11	05	02	ICA                      	PISCO                    
110505	PARACAS	11	05	05	ICA                      	PISCO                    
110506	SAN ANDRES	11	05	06	ICA                      	PISCO                    
110508	TUPAC AMARU INCA	11	05	08	ICA                      	PISCO                    
120101	HUANCAYO	12	01	01	JUNIN                    	HUANCAYO                 
120105	CHACAPAMPA	12	01	05	JUNIN                    	HUANCAYO                 
120108	CHONGOS ALTO	12	01	08	JUNIN                    	HUANCAYO                 
120111	CHUPURO	12	01	11	JUNIN                    	HUANCAYO                 
120113	CULLHUAS	12	01	13	JUNIN                    	HUANCAYO                 
120114	EL TAMBO	12	01	14	JUNIN                    	HUANCAYO                 
120117	HUALHUAS	12	01	17	JUNIN                    	HUANCAYO                 
120121	HUAYUCACHI	12	01	21	JUNIN                    	HUANCAYO                 
120122	INGENIO	12	01	22	JUNIN                    	HUANCAYO                 
120125	PILCOMAYO	12	01	25	JUNIN                    	HUANCAYO                 
120127	QUICHUAY	12	01	27	JUNIN                    	HUANCAYO                 
120129	SAN AGUSTIN	12	01	29	JUNIN                    	HUANCAYO                 
120132	SA¥O	12	01	32	JUNIN                    	HUANCAYO                 
120136	VIQUES	12	01	36	JUNIN                    	HUANCAYO                 
120201	CONCEPCION	12	02	01	JUNIN                    	CONCEPCION               
120202	ACO	12	02	02	JUNIN                    	CONCEPCION               
120205	COCHAS	12	02	05	JUNIN                    	CONCEPCION               
120207	HEROINAS TOLEDO	12	02	07	JUNIN                    	CONCEPCION               
120209	MARISCAL CASTILLA	12	02	09	JUNIN                    	CONCEPCION               
120211	MITO	12	02	11	JUNIN                    	CONCEPCION               
120213	ORCOTUNA	12	02	13	JUNIN                    	CONCEPCION               
120215	SANTA ROSA DE OCOPA	12	02	15	JUNIN                    	CONCEPCION               
120303	PICHANAQUI	12	03	03	JUNIN                    	CHANCHAMAYO              
120304	SAN LUIS DE SHUARO	12	03	04	JUNIN                    	CHANCHAMAYO              
120305	SAN RAMON	12	03	05	JUNIN                    	CHANCHAMAYO              
120401	JAUJA	12	04	01	JUNIN                    	JAUJA                    
120404	ATAURA	12	04	04	JUNIN                    	JAUJA                    
120407	EL MANTARO	12	04	07	JUNIN                    	JAUJA                    
120408	HUAMALI	12	04	08	JUNIN                    	JAUJA                    
120410	HUERTAS	12	04	10	JUNIN                    	JAUJA                    
120413	LEONOR ORDO¥EZ	12	04	13	JUNIN                    	JAUJA                    
120415	MARCO	12	04	15	JUNIN                    	JAUJA                    
120416	MASMA	12	04	16	JUNIN                    	JAUJA                    
120417	MASMA CHICCHE	12	04	17	JUNIN                    	JAUJA                    
120419	MONOBAMBA	12	04	19	JUNIN                    	JAUJA                    
120422	PACA	12	04	22	JUNIN                    	JAUJA                    
120424	PANCAN	12	04	24	JUNIN                    	JAUJA                    
120425	PARCO	12	04	25	JUNIN                    	JAUJA                    
120428	SAN LORENZO	12	04	28	JUNIN                    	JAUJA                    
120430	SAUSA	12	04	30	JUNIN                    	JAUJA                    
120431	SINCOS	12	04	31	JUNIN                    	JAUJA                    
120433	YAULI	12	04	33	JUNIN                    	JAUJA                    
120503	ONDORES	12	05	03	JUNIN                    	JUNIN                    
120601	SATIPO	12	06	01	JUNIN                    	SATIPO                   
120602	COVIRIALI	12	06	02	JUNIN                    	SATIPO                   
120604	MAZAMARI	12	06	04	JUNIN                    	SATIPO                   
120607	RIO NEGRO	12	06	07	JUNIN                    	SATIPO                   
120608	RIO TAMBO	12	06	08	JUNIN                    	SATIPO                   
120702	ACOBAMBA	12	07	02	JUNIN                    	TARMA                    
120705	LA UNION	12	07	05	JUNIN                    	TARMA                    
120706	PALCA	12	07	06	JUNIN                    	TARMA                    
120708	SAN PEDRO DE CAJAS	12	07	08	JUNIN                    	TARMA                    
120709	TAPO	12	07	09	JUNIN                    	TARMA                    
120802	CHACAPALPA	12	08	02	JUNIN                    	YAULI                    
120805	MOROCOCHA	12	08	05	JUNIN                    	YAULI                    
120807	SANTA BARBARA DE CARHUACAYAN	12	08	07	JUNIN                    	YAULI                    
120809	SUITUCANCHA	12	08	09	JUNIN                    	YAULI                    
120901	CHUPACA	12	09	01	JUNIN                    	CHUPACA                  
120903	CHONGOS BAJO	12	09	03	JUNIN                    	CHUPACA                  
120905	HUAMANCACA CHICO	12	09	05	JUNIN                    	CHUPACA                  
120907	SAN JUAN DE JARPA	12	09	07	JUNIN                    	CHUPACA                  
120908	TRES DE DICIEMBRE	12	09	08	JUNIN                    	CHUPACA                  
130101	TRUJILLO	13	01	01	LA LIBERTAD              	TRUJILLO                 
130103	FLORENCIA DE MORA	13	01	03	LA LIBERTAD              	TRUJILLO                 
130107	MOCHE	13	01	07	LA LIBERTAD              	TRUJILLO                 
130110	SIMBAL	13	01	10	LA LIBERTAD              	TRUJILLO                 
130201	ASCOPE	13	02	01	LA LIBERTAD              	ASCOPE                   
130203	CHOCOPE	13	02	03	LA LIBERTAD              	ASCOPE                   
130205	PAIJAN	13	02	05	LA LIBERTAD              	ASCOPE                   
130207	SANTIAGO DE CAO	13	02	07	LA LIBERTAD              	ASCOPE                   
130301	BOLIVAR	13	03	01	LA LIBERTAD              	BOLIVAR                  
130303	CONDORMARCA	13	03	03	LA LIBERTAD              	BOLIVAR                  
130306	UCUNCHA	13	03	06	LA LIBERTAD              	BOLIVAR                  
130401	CHEPEN	13	04	01	LA LIBERTAD              	CHEPEN                   
130402	PACANGA	13	04	02	LA LIBERTAD              	CHEPEN                   
130504	HUASO	13	05	04	LA LIBERTAD              	JULCAN                   
130601	OTUZCO	13	06	01	LA LIBERTAD              	OTUZCO                   
130604	CHARAT	13	06	04	LA LIBERTAD              	OTUZCO                   
130608	MACHE	13	06	08	LA LIBERTAD              	OTUZCO                   
130610	PARANDAY	13	06	10	LA LIBERTAD              	OTUZCO                   
130614	USQUIL	13	06	14	LA LIBERTAD              	OTUZCO                   
130701	SAN PEDRO DE LLOC	13	07	01	LA LIBERTAD              	PACASMAYO                
130704	PACASMAYO	13	07	04	LA LIBERTAD              	PACASMAYO                
130705	SAN JOSE	13	07	05	LA LIBERTAD              	PACASMAYO                
130801	TAYABAMBA	13	08	01	LA LIBERTAD              	PATAZ                    
130803	CHILLIA	13	08	03	LA LIBERTAD              	PATAZ                    
130804	HUANCASPATA	13	08	04	LA LIBERTAD              	PATAZ                    
130806	HUAYO	13	08	06	LA LIBERTAD              	PATAZ                    
130808	PARCOY	13	08	08	LA LIBERTAD              	PATAZ                    
130811	SANTIAGO DE CHALLAS	13	08	11	LA LIBERTAD              	PATAZ                    
130902	CHUGAY	13	09	02	LA LIBERTAD              	SANCHEZ CARRION          
130904	CURGOS	13	09	04	LA LIBERTAD              	SANCHEZ CARRION          
130906	SANAGORAN	13	09	06	LA LIBERTAD              	SANCHEZ CARRION          
130908	SARTIMBAMBA	13	09	08	LA LIBERTAD              	SANCHEZ CARRION          
131001	SANTIAGO DE CHUCO	13	10	01	LA LIBERTAD              	SANTIAGO DE CHUCO        
131002	ANGASMARCA	13	10	02	LA LIBERTAD              	SANTIAGO DE CHUCO        
131005	MOLLEPATA	13	10	05	LA LIBERTAD              	SANTIAGO DE CHUCO        
131101	CASCAS	13	11	01	LA LIBERTAD              	GRAN CHIMU               
131103	COMPIN	13	11	03	LA LIBERTAD              	GRAN CHIMU               
131104	SAYAPULLO	13	11	04	LA LIBERTAD              	GRAN CHIMU               
131202	CHAO	13	12	02	LA LIBERTAD              	VIRU                     
131203	GUADALUPITO	13	12	03	LA LIBERTAD              	VIRU                     
140102	CHONGOYAPE	14	01	02	LAMBAYEQUE               	CHICLAYO                 
140104	ETEN PUERTO	14	01	04	LAMBAYEQUE               	CHICLAYO                 
140108	MONSEFU	14	01	08	LAMBAYEQUE               	CHICLAYO                 
140109	NUEVA ARICA	14	01	09	LAMBAYEQUE               	CHICLAYO                 
140110	OYOTUN	14	01	10	LAMBAYEQUE               	CHICLAYO                 
140111	PICSI	14	01	11	LAMBAYEQUE               	CHICLAYO                 
140113	REQUE	14	01	13	LAMBAYEQUE               	CHICLAYO                 
140201	FERRE¥AFE	14	02	01	LAMBAYEQUE               	FERRE¥AFE                
140204	MANUEL ANTONIO MESONES MURO	14	02	04	LAMBAYEQUE               	FERRE¥AFE                
140205	PITIPO	14	02	05	LAMBAYEQUE               	FERRE¥AFE                
140302	CHOCHOPE	14	03	02	LAMBAYEQUE               	LAMBAYEQUE               
140303	ILLIMO	14	03	03	LAMBAYEQUE               	LAMBAYEQUE               
140305	MOCHUMI	14	03	05	LAMBAYEQUE               	LAMBAYEQUE               
140309	PACORA	14	03	09	LAMBAYEQUE               	LAMBAYEQUE               
140310	SALAS	14	03	10	LAMBAYEQUE               	LAMBAYEQUE               
140312	TUCUME	14	03	12	LAMBAYEQUE               	LAMBAYEQUE               
150101	LIMA	15	01	01	LIMA                     	LIMA                     
150104	BARRANCO	15	01	04	LIMA                     	LIMA                     
150108	CHORRILLOS	15	01	08	LIMA                     	LIMA                     
150140	SANTIAGO DE SURCO	15	01	40	LIMA                     	LIMA                     
150107	CHACLACAYO	15	01	07	LIMA                     	LIMA                     
150110	COMAS	15	01	10	LIMA                     	LIMA                     
150112	INDEPENDENCIA	15	01	12	LIMA                     	LIMA                     
150113	JESUS MARIA	15	01	13	LIMA                     	LIMA                     
150115	LA VICTORIA	15	01	15	LIMA                     	LIMA                     
150116	LINCE	15	01	16	LIMA                     	LIMA                     
150117	LOS OLIVOS	15	01	17	LIMA                     	LIMA                     
150119	LURIN	15	01	19	LIMA                     	LIMA                     
150124	PUCUSANA	15	01	24	LIMA                     	LIMA                     
150125	PUENTE PIEDRA	15	01	25	LIMA                     	LIMA                     
150126	PUNTA HERMOSA	15	01	26	LIMA                     	LIMA                     
150136	SAN MIGUEL	15	01	36	LIMA                     	LIMA                     
150129	SAN BARTOLO	15	01	29	LIMA                     	LIMA                     
150131	SAN ISIDRO	15	01	31	LIMA                     	LIMA                     
150132	SAN JUAN DE LURIGANCHO	15	01	32	LIMA                     	LIMA                     
150138	SANTA MARIA DEL MAR	15	01	38	LIMA                     	LIMA                     
150134	SAN LUIS	15	01	34	LIMA                     	LIMA                     
150142	VILLA EL SALVADOR	15	01	42	LIMA                     	LIMA                     
150202	PARAMONGA	15	02	02	LIMA                     	BARRANCA                 
150204	SUPE	15	02	04	LIMA                     	BARRANCA                 
150303	GORGOR	15	03	03	LIMA                     	CAJATAMBO                
150304	HUANCAPON	15	03	04	LIMA                     	CAJATAMBO                
150401	CANTA	15	04	01	LIMA                     	CANTA                    
150403	HUAMANTANGA	15	04	03	LIMA                     	CANTA                    
150407	SANTA ROSA DE QUIVES	15	04	07	LIMA                     	CANTA                    
150502	ASIA	15	05	02	LIMA                     	CA¥ETE                   
150503	CALANGO	15	05	03	LIMA                     	CA¥ETE                   
150505	CHILCA	15	05	05	LIMA                     	CA¥ETE                   
150506	COAYLLO	15	05	06	LIMA                     	CA¥ETE                   
150509	MALA	15	05	09	LIMA                     	CA¥ETE                   
150512	QUILMANA	15	05	12	LIMA                     	CA¥ETE                   
150514	SAN LUIS	15	05	14	LIMA                     	CA¥ETE                   
150516	ZU¥IGA	15	05	16	LIMA                     	CA¥ETE                   
150601	HUARAL	15	06	01	LIMA                     	HUARAL                   
150602	ATAVILLOS ALTO	15	06	02	LIMA                     	HUARAL                   
150604	AUCALLAMA	15	06	04	LIMA                     	HUARAL                   
150607	LAMPIAN	15	06	07	LIMA                     	HUARAL                   
150609	SAN MIGUEL DE ACOS	15	06	09	LIMA                     	HUARAL                   
150611	SUMBILCA	15	06	11	LIMA                     	HUARAL                   
150612	VEINTISIETE DE NOVIEMBRE	15	06	12	LIMA                     	HUARAL                   
150702	ANTIOQUIA	15	07	02	LIMA                     	HUAROCHIRI               
150704	CARAMPOMA	15	07	04	LIMA                     	HUAROCHIRI               
150708	HUANZA	15	07	08	LIMA                     	HUAROCHIRI               
150710	LAHUAYTAMBO	15	07	10	LIMA                     	HUAROCHIRI               
150712	LARAOS	15	07	12	LIMA                     	HUAROCHIRI               
150713	MARIATANA	15	07	13	LIMA                     	HUAROCHIRI               
150715	SAN ANDRES DE TUPICOCHA	15	07	15	LIMA                     	HUAROCHIRI               
150717	SAN BARTOLOME	15	07	17	LIMA                     	HUAROCHIRI               
150719	SAN JUAN DE IRIS	15	07	19	LIMA                     	HUAROCHIRI               
150722	SAN MATEO	15	07	22	LIMA                     	HUAROCHIRI               
150725	SAN PEDRO DE HUANCAYRE	15	07	25	LIMA                     	HUAROCHIRI               
150726	SANGALLAYA	15	07	26	LIMA                     	HUAROCHIRI               
150728	SANTA EULALIA	15	07	28	LIMA                     	HUAROCHIRI               
150730	SANTIAGO DE TUNA	15	07	30	LIMA                     	HUAROCHIRI               
150731	SANTO DOMINGO DE LOS OLLEROS	15	07	31	LIMA                     	HUAROCHIRI               
150801	HUACHO	15	08	01	LIMA                     	HUAURA                   
150804	CHECRAS	15	08	04	LIMA                     	HUAURA                   
150806	HUAURA	15	08	06	LIMA                     	HUAURA                   
150807	LEONCIO PRADO	15	08	07	LIMA                     	HUAURA                   
150810	SANTA MARIA	15	08	10	LIMA                     	HUAURA                   
150812	VEGUETA	15	08	12	LIMA                     	HUAURA                   
150903	CAUJUL	15	09	03	LIMA                     	OYON                     
150904	COCHAMARCA	15	09	04	LIMA                     	OYON                     
150906	PACHANGARA	15	09	06	LIMA                     	OYON                     
151002	ALIS	15	10	02	LIMA                     	YAUYOS                   
151005	AZANGARO	15	10	05	LIMA                     	YAUYOS                   
151007	CARANIA	15	10	07	LIMA                     	YAUYOS                   
151010	COCHAS	15	10	10	LIMA                     	YAUYOS                   
151011	COLONIA	15	10	11	LIMA                     	YAUYOS                   
151013	HUAMPARA	15	10	13	LIMA                     	YAUYOS                   
151014	HUANCAYA	15	10	14	LIMA                     	YAUYOS                   
151016	HUANTAN	15	10	16	LIMA                     	YAUYOS                   
151020	MADEAN	15	10	20	LIMA                     	YAUYOS                   
151022	OMAS	15	10	22	LIMA                     	YAUYOS                   
151023	PUTINZA	15	10	23	LIMA                     	YAUYOS                   
151025	QUINOCAY	15	10	25	LIMA                     	YAUYOS                   
151026	SAN JOAQUIN	15	10	26	LIMA                     	YAUYOS                   
151028	TANTA	15	10	28	LIMA                     	YAUYOS                   
151031	TUPE	15	10	31	LIMA                     	YAUYOS                   
151032	VI¥AC	15	10	32	LIMA                     	YAUYOS                   
151033	VITIS	15	10	33	LIMA                     	YAUYOS                   
160102	ALTO NANAY	16	01	02	LORETO                   	MAYNAS                   
160105	LAS AMAZONAS	16	01	05	LORETO                   	MAYNAS                   
160107	NAPO	16	01	07	LORETO                   	MAYNAS                   
160108	PUNCHANA	16	01	08	LORETO                   	MAYNAS                   
160201	YURIMAGUAS	16	02	01	LORETO                   	ALTO AMAZONAS            
160203	ANDAMARCA	12	01	03	LORETO                   	ALTO AMAZONAS            
160206	LAGUNAS	16	02	06	LORETO                   	ALTO AMAZONAS            
160207	MANSERICHE	16	02	07	LORETO                   	ALTO AMAZONAS            
160209	MARISCAL CASTILLA	16	02	09	LORETO                   	ALTO AMAZONAS            
160211	TENIENTE CESAR LOPEZ ROJAS	16	02	11	LORETO                   	ALTO AMAZONAS            
160302	PARINARI	16	03	02	LORETO                   	LORETO                   
160304	TROMPETEROS	16	03	04	LORETO                   	LORETO                   
160401	RAMON CASTILLA	16	04	01	LORETO                   	MARISCAL RAMON CASTILLA  
160402	PEBAS	16	04	02	LORETO                   	MARISCAL RAMON CASTILLA  
160404	SAN PABLO	16	04	04	LORETO                   	MARISCAL RAMON CASTILLA  
160504	EMILIO SAN MARTIN	16	05	04	LORETO                   	REQUENA                  
160506	PUINAHUA	16	05	06	LORETO                   	REQUENA                  
160507	SAQUENA	16	05	07	LORETO                   	REQUENA                  
160509	TAPICHE	16	05	09	LORETO                   	REQUENA                  
160602	INAHUAYA	16	06	02	LORETO                   	UCAYALI                  
160603	PADRE MARQUEZ	16	06	03	LORETO                   	UCAYALI                  
160605	SARAYACU	16	06	05	LORETO                   	UCAYALI                  
170101	TAMBOPATA	17	01	01	MADRE DE DIOS            	TAMBOPATA                
170102	INAMBARI	17	01	02	MADRE DE DIOS            	TAMBOPATA                
170202	FITZCARRALD	17	02	02	MADRE DE DIOS            	MANU                     
170301	I¥APARI	17	03	01	MADRE DE DIOS            	TAHUAMANU                
170303	TAHUAMANU	17	03	03	MADRE DE DIOS            	TAHUAMANU                
180102	CARUMAS	18	01	02	MOQUEGUA                 	MARISCAL NIETO           
180106	TORATA	18	01	06	MOQUEGUA                 	MARISCAL NIETO           
180202	CHOJATA	18	02	02	MOQUEGUA                 	GENERAL SANCHEZ CERRO    
180203	COALAQUE	18	02	03	MOQUEGUA                 	GENERAL SANCHEZ CERRO    
180205	LA CAPILLA	18	02	05	MOQUEGUA                 	GENERAL SANCHEZ CERRO    
180206	LLOQUE	18	02	06	MOQUEGUA                 	GENERAL SANCHEZ CERRO    
180209	QUINISTAQUILLAS	18	02	09	MOQUEGUA                 	GENERAL SANCHEZ CERRO    
180211	YUNGA	18	02	11	MOQUEGUA                 	GENERAL SANCHEZ CERRO    
180303	PACOCHA	18	03	03	MOQUEGUA                 	ILO                      
190101	CHAUPIMARCA	19	01	01	PASCO                    	PASCO                    
190104	HUAYLLAY	19	01	04	PASCO                    	PASCO                    
190106	PALLANCHACRA	19	01	06	PASCO                    	PASCO                    
190108	SAN FRANCISCO DE ASIS DE YARUSYACAN	19	01	08	PASCO                    	PASCO                    
190109	SIMON BOLIVAR	19	01	09	PASCO                    	PASCO                    
190110	TICLACAYAN	19	01	10	PASCO                    	PASCO                    
190112	VICCO	19	01	12	PASCO                    	PASCO                    
190202	CHACAYAN	19	02	02	PASCO                    	DANIEL ALCIDES CARRION   
190204	PAUCAR	19	02	04	PASCO                    	DANIEL ALCIDES CARRION   
190205	SAN PEDRO DE PILLAO	19	02	05	PASCO                    	DANIEL ALCIDES CARRION   
190208	VILCABAMBA	19	02	08	PASCO                    	DANIEL ALCIDES CARRION   
190303	HUANCABAMBA	19	03	03	PASCO                    	OXAPAMPA                 
190305	POZUZO	19	03	05	PASCO                    	OXAPAMPA                 
190307	VILLA RICA	19	03	07	PASCO                    	OXAPAMPA                 
200104	CASTILLA	20	01	04	PIURA                    	PIURA                    
200107	CURA MORI	20	01	07	PIURA                    	PIURA                    
200108	EL TALLAN	20	01	08	PIURA                    	PIURA                    
200110	LA UNION	20	01	10	PIURA                    	PIURA                    
200114	TAMBO GRANDE	20	01	14	PIURA                    	PIURA                    
200202	FRIAS	20	02	02	PIURA                    	AYABACA                  
200205	MONTERO	20	02	05	PIURA                    	AYABACA                  
200207	PAIMAS	20	02	07	PIURA                    	AYABACA                  
200301	HUANCABAMBA	20	03	01	PIURA                    	HUANCABAMBA              
200304	HUARMACA	20	03	04	PIURA                    	HUANCABAMBA              
200306	SAN MIGUEL DE EL FAIQUE	20	03	06	PIURA                    	HUANCABAMBA              
200307	SONDOR	20	03	07	PIURA                    	HUANCABAMBA              
200402	BUENOS AIRES	20	04	02	PIURA                    	MORROPON                 
200403	CHALACO	20	04	03	PIURA                    	MORROPON                 
200405	MORROPON	20	04	05	PIURA                    	MORROPON                 
200407	SAN JUAN DE BIGOTE	20	04	07	PIURA                    	MORROPON                 
200410	YAMANGO	20	04	10	PIURA                    	MORROPON                 
200501	PAITA	20	05	01	PIURA                    	PAITA                    
200504	COLAN	20	05	04	PIURA                    	PAITA                    
200506	TAMARINDO	20	05	06	PIURA                    	PAITA                    
200601	SULLANA	20	06	01	PIURA                    	SULLANA                  
200602	BELLAVISTA	20	06	02	PIURA                    	SULLANA                  
200603	IGNACIO ESCUDERO	20	06	03	PIURA                    	SULLANA                  
200606	MIGUEL CHECA	20	06	06	PIURA                    	SULLANA                  
200608	SALITRAL	20	06	08	PIURA                    	SULLANA                  
200702	EL ALTO	20	07	02	PIURA                    	TALARA                   
200704	LOBITOS	20	07	04	PIURA                    	TALARA                   
200706	MANCORA	20	07	06	PIURA                    	TALARA                   
200803	BERNAL	20	08	03	PIURA                    	SECHURA                  
200805	VICE	20	08	05	PIURA                    	SECHURA                  
200806	RINCONADA LLICUAR	20	08	06	PIURA                    	SECHURA                  
210101	PUNO	21	01	01	PUNO                     	PUNO                     
210103	AMANTANI	21	01	03	PUNO                     	PUNO                     
210106	CHUCUITO	21	01	06	PUNO                     	PUNO                     
210108	HUATA	21	01	08	PUNO                     	PUNO                     
210110	PAUCARCOLLA	21	01	10	PUNO                     	PUNO                     
210112	PLATERIA	21	01	12	PUNO                     	PUNO                     
210114	TIQUILLACA	21	01	14	PUNO                     	PUNO                     
210115	VILQUE	21	01	15	PUNO                     	PUNO                     
210204	ASILLO	21	02	04	PUNO                     	AZANGARO                 
210206	CHUPA	21	02	06	PUNO                     	AZANGARO                 
210208	MU¥ANI	21	02	08	PUNO                     	AZANGARO                 
210209	POTONI	21	02	09	PUNO                     	AZANGARO                 
210211	SAN ANTON	21	02	11	PUNO                     	AZANGARO                 
210212	SAN JOSE	21	02	12	PUNO                     	AZANGARO                 
210215	TIRAPATA	21	02	15	PUNO                     	AZANGARO                 
210302	AJOYANI	21	03	02	PUNO                     	CARABAYA                 
210305	CORANI	21	03	05	PUNO                     	CARABAYA                 
210306	CRUCERO	21	03	06	PUNO                     	CARABAYA                 
210307	ITUATA	21	03	07	PUNO                     	CARABAYA                 
210309	SAN GABAN	21	03	09	PUNO                     	CARABAYA                 
210401	JULI	21	04	01	PUNO                     	CHUCUITO                 
210405	PISACOMA	21	04	05	PUNO                     	CHUCUITO                 
210407	ZEPITA	21	04	07	PUNO                     	CHUCUITO                 
210501	ILAVE	21	05	01	PUNO                     	EL COLLAO                
210503	PILCUYO	21	05	03	PUNO                     	EL COLLAO                
210504	SANTA ROSA	21	05	04	PUNO                     	EL COLLAO                
210505	CONDURIRI	21	05	05	PUNO                     	EL COLLAO                
210603	HUATASANI	21	06	03	PUNO                     	HUANCANE                 
210606	ROSASPATA	21	06	06	PUNO                     	HUANCANE                 
210608	VILQUE CHICO	21	06	08	PUNO                     	HUANCANE                 
210701	LAMPA	21	07	01	PUNO                     	LAMPA                    
210702	CABANILLA	21	07	02	PUNO                     	LAMPA                    
210705	OCUVIRI	21	07	05	PUNO                     	LAMPA                    
210707	PARATIA	21	07	07	PUNO                     	LAMPA                    
210709	SANTA LUCIA	21	07	09	PUNO                     	LAMPA                    
210801	AYAVIRI	21	08	01	PUNO                     	MELGAR                   
210803	CUPI	21	08	03	PUNO                     	MELGAR                   
210806	NU¥OA	21	08	06	PUNO                     	MELGAR                   
210809	UMACHIRI	21	08	09	PUNO                     	MELGAR                   
210901	MOHO	21	09	01	PUNO                     	MOHO                     
210904	TILALI	21	09	04	PUNO                     	MOHO                     
211002	ANANEA	21	10	02	PUNO                     	SAN ANTONIO DE PUTINA    
211004	QUILCAPUNCU	21	10	04	PUNO                     	SAN ANTONIO DE PUTINA    
211102	CABANA	21	11	02	PUNO                     	SAN ROMAN                
211104	CARACOTO	21	11	04	PUNO                     	SAN ROMAN                
211201	SANDIA	21	12	01	PUNO                     	SANDIA                   
211202	CUYOCUYO	21	12	02	PUNO                     	SANDIA                   
211204	PATAMBUCO	21	12	04	PUNO                     	SANDIA                   
211207	SAN JUAN DEL ORO	21	12	07	PUNO                     	SANDIA                   
211209	ALTO INAMBARI	21	12	09	PUNO                     	SANDIA                   
211301	YUNGUYO	21	13	01	PUNO                     	YUNGUYO                  
211302	ANAPIA	21	13	02	PUNO                     	YUNGUYO                  
211304	CUTURAPI	21	13	04	PUNO                     	YUNGUYO                  
211306	TINICACHI	21	13	06	PUNO                     	YUNGUYO                  
220103	HABANA	22	01	03	SAN MARTIN               	MOYOBAMBA                
220104	JEPELACIO	22	01	04	SAN MARTIN               	MOYOBAMBA                
220106	YANTALO	22	01	06	SAN MARTIN               	MOYOBAMBA                
220202	ALTO BIAVO	22	02	02	SAN MARTIN               	BELLAVISTA               
220206	SAN RAFAEL	22	02	06	SAN MARTIN               	BELLAVISTA               
220302	AGUA BLANCA	22	03	02	SAN MARTIN               	EL DORADO                
220303	SAN MARTIN	22	03	03	SAN MARTIN               	EL DORADO                
220305	SHATOJA	22	03	05	SAN MARTIN               	EL DORADO                
220402	ALTO SAPOSOA	22	04	02	SAN MARTIN               	HUALLAGA                 
220404	PISCOYACU	22	04	04	SAN MARTIN               	HUALLAGA                 
220501	LAMAS	22	05	01	SAN MARTIN               	LAMAS                    
220502	ALONSO DE ALVARADO	22	05	02	SAN MARTIN               	LAMAS                    
220505	CU¥UMBUQUI	22	05	05	SAN MARTIN               	LAMAS                    
220506	PINTO RECODO	22	05	06	SAN MARTIN               	LAMAS                    
220507	RUMISAPA	22	05	07	SAN MARTIN               	LAMAS                    
220508	SAN ROQUE DE CUMBAZA	22	05	08	SAN MARTIN               	LAMAS                    
220601	JUANJUI	22	06	01	SAN MARTIN               	MARISCAL CACERES         
220604	PACHIZA	22	06	04	SAN MARTIN               	MARISCAL CACERES         
220605	PAJARILLO	22	06	05	SAN MARTIN               	MARISCAL CACERES         
220702	BUENOS AIRES	22	07	02	SAN MARTIN               	PICOTA                   
220703	CASPISAPA	22	07	03	SAN MARTIN               	PICOTA                   
220705	PUCACACA	22	07	05	SAN MARTIN               	PICOTA                   
220709	TINGO DE PONASA	22	07	09	SAN MARTIN               	PICOTA                   
220801	RIOJA	22	08	01	SAN MARTIN               	RIOJA                    
220803	ELIAS SOPLIN VARGAS	22	08	03	SAN MARTIN               	RIOJA                    
220804	NUEVA CAJAMARCA	22	08	04	SAN MARTIN               	RIOJA                    
220807	SAN FERNANDO	22	08	07	SAN MARTIN               	RIOJA                    
220808	YORONGOS	22	08	08	SAN MARTIN               	RIOJA                    
220901	TARAPOTO	22	09	01	SAN MARTIN               	SAN MARTIN               
220904	CHAZUTA	22	09	04	SAN MARTIN               	SAN MARTIN               
220907	HUIMBAYOC	22	09	07	SAN MARTIN               	SAN MARTIN               
220908	JUAN GUERRA	22	09	08	SAN MARTIN               	SAN MARTIN               
220910	MORALES	22	09	10	SAN MARTIN               	SAN MARTIN               
220912	SAN ANTONIO	22	09	12	SAN MARTIN               	SAN MARTIN               
221001	TOCACHE	22	10	01	SAN MARTIN               	TOCACHE                  
221002	NUEVO PROGRESO	22	10	02	SAN MARTIN               	TOCACHE                  
221004	SHUNTE	22	10	04	SAN MARTIN               	TOCACHE                  
221005	UCHIZA	22	10	05	SAN MARTIN               	TOCACHE                  
230102	ALTO DE LA ALIANZA	23	01	02	TACNA                    	TACNA                    
230106	PACHIA	23	01	06	TACNA                    	TACNA                    
230108	POCOLLAY	23	01	08	TACNA                    	TACNA                    
230109	SAMA	23	01	09	TACNA                    	TACNA                    
230202	CAIRANI	23	02	02	TACNA                    	CANDARAVE                
230204	CURIBAYA	23	02	04	TACNA                    	CANDARAVE                
230402	HEROES ALBARRACIN	23	04	02	TACNA                    	TARATA                   
230405	SITAJARA	23	04	05	TACNA                    	TARATA                   
230407	TARUCACHI	23	04	07	TACNA                    	TARATA                   
230408	TICACO	23	04	08	TACNA                    	TARATA                   
240101	TUMBES	24	01	01	TUMBES                   	TUMBES                   
240103	LA CRUZ	24	01	03	TUMBES                   	TUMBES                   
240104	PAMPAS DE HOSPITAL	24	01	04	TUMBES                   	TUMBES                   
240301	ZARUMILLA	24	03	01	TUMBES                   	ZARUMILLA                
240302	AGUAS VERDES	24	03	02	TUMBES                   	ZARUMILLA                
240304	PAPAYAL	24	03	04	TUMBES                   	ZARUMILLA                
250102	CAMPOVERDE	25	01	02	UCAYALI                  	CORONEL PORTILLO         
250103	IPARIA	25	01	03	UCAYALI                  	CORONEL PORTILLO         
250106	NUEVA REQUENA	25	01	06	UCAYALI                  	CORONEL PORTILLO         
250203	TAHUANIA	25	02	03	UCAYALI                  	ATALAYA                  
250301	PADRE ABAD	25	03	01	UCAYALI                  	PADRE ABAD               
250302	IRAZOLA	25	03	02	UCAYALI                  	PADRE ABAD               
250401	PURUS	25	04	01	UCAYALI                  	PURUS                    
080109	IZCUCHACA	08	01	09	CUSCO                    	CUSCO                    
250501	UCAYALI	25	05	01	UCAYALI                  	PUCALLPA                 
230110	CORONEL GREGORIO ALBARRACIN LANCHIPA	23	01	10	TACNA                    	TACNA                    
150121	PUEBLO LIBRE	15	01	21	LIMA                     	LIMA                     
170204	HUEPETUHE	17	02	04	MADRE DE DIOS	MANU
050115	JESUS NAZARENO	05	01	15	AYACUCHO	HUAMANGA
250107	MANANTAY	25	01	07	UCAYALI	CORONEL PORTILLO
090118	ASCENSION	09	01	18	HUANCAVELICA	HUANCAVELICA
090510	PACHAMARCA	09	05	10	HUANCAVELICA             	CHURCAMPA                
150105	BREÑA	15	01	05	LIMA                     	LIMA                     
\.


--
-- TOC entry 3275 (class 0 OID 53091)
-- Dependencies: 306
-- Data for Name: unidad_negocio; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY unidad_negocio (idunidad, cnomunidad, cabrev, idubigeo, cdireccion, idempresa, idusuario, dfecreg) FROM stdin;
\.


--
-- TOC entry 3276 (class 0 OID 53096)
-- Dependencies: 307
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY usuario (idusuario, cnomusuario, bactivo, idrol, clogin, cclave, dfecreg, dfecmod) FROM stdin;
2	USUARIO DEMO	t	1	zarcillo	89fda8694151031cfefdab162332feaf6bdfba92a604fc5c48d9bb146b74d7f1	2013-07-24 09:12:59.218738	2013-07-24 09:12:59.218738
\.


--
-- TOC entry 3277 (class 0 OID 53103)
-- Dependencies: 308
-- Data for Name: vendedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

COPY vendedor (idvendedor, cnomvendedor, cabrev, idubigeo, cdireccion, ctelefono, cmovil, bactivo, idusuario, dfecreg) FROM stdin;
\.


SET search_path = log, pg_catalog;

--
-- TOC entry 2721 (class 2606 OID 53110)
-- Dependencies: 142 142
-- Name: log_almacen_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_almacen
    ADD CONSTRAINT log_almacen_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2723 (class 2606 OID 53112)
-- Dependencies: 144 144
-- Name: log_autorizacion_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_autorizacion
    ADD CONSTRAINT log_autorizacion_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2725 (class 2606 OID 53114)
-- Dependencies: 146 146
-- Name: log_aval_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_aval
    ADD CONSTRAINT log_aval_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2727 (class 2606 OID 53116)
-- Dependencies: 148 148
-- Name: log_banco_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_banco
    ADD CONSTRAINT log_banco_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2729 (class 2606 OID 53118)
-- Dependencies: 150 150
-- Name: log_cheque_cliente_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_cheque_cliente
    ADD CONSTRAINT log_cheque_cliente_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2945 (class 2606 OID 57617)
-- Dependencies: 329 329
-- Name: log_cheque_proveedor_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_cheque_proveedor
    ADD CONSTRAINT log_cheque_proveedor_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2731 (class 2606 OID 53120)
-- Dependencies: 152 152
-- Name: log_cliente_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_cliente
    ADD CONSTRAINT log_cliente_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2733 (class 2606 OID 53122)
-- Dependencies: 154 154
-- Name: log_comprobante_emitido_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_comprobante_emitido
    ADD CONSTRAINT log_comprobante_emitido_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2735 (class 2606 OID 53124)
-- Dependencies: 156 156
-- Name: log_condicion_venta_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_condicion_venta
    ADD CONSTRAINT log_condicion_venta_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2737 (class 2606 OID 53126)
-- Dependencies: 158 158
-- Name: log_cuenta_bancaria_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_cuenta_bancaria
    ADD CONSTRAINT log_cuenta_bancaria_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2739 (class 2606 OID 53128)
-- Dependencies: 160 160
-- Name: log_cuenta_pagar_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_cuenta_pagar
    ADD CONSTRAINT log_cuenta_pagar_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2741 (class 2606 OID 53130)
-- Dependencies: 162 162
-- Name: log_deposito_cliente_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_deposito_cliente
    ADD CONSTRAINT log_deposito_cliente_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2743 (class 2606 OID 53132)
-- Dependencies: 164 164
-- Name: log_detalle_autorizacion_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_detalle_autorizacion
    ADD CONSTRAINT log_detalle_autorizacion_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2745 (class 2606 OID 53134)
-- Dependencies: 166 166
-- Name: log_documento_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_documento
    ADD CONSTRAINT log_documento_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2747 (class 2606 OID 53136)
-- Dependencies: 168 168
-- Name: log_empresa_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_empresa
    ADD CONSTRAINT log_empresa_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2749 (class 2606 OID 53138)
-- Dependencies: 170 170
-- Name: log_existencia_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_existencia
    ADD CONSTRAINT log_existencia_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2751 (class 2606 OID 53140)
-- Dependencies: 172 172
-- Name: log_familia_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_familia
    ADD CONSTRAINT log_familia_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2753 (class 2606 OID 53142)
-- Dependencies: 174 174
-- Name: log_letra_proveedor_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_letra_proveedor
    ADD CONSTRAINT log_letra_proveedor_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2755 (class 2606 OID 53144)
-- Dependencies: 176 176
-- Name: log_linea_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_linea
    ADD CONSTRAINT log_linea_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2757 (class 2606 OID 53146)
-- Dependencies: 178 178
-- Name: log_lote_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_lote
    ADD CONSTRAINT log_lote_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2933 (class 2606 OID 54524)
-- Dependencies: 320 320
-- Name: log_menu_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_menu
    ADD CONSTRAINT log_menu_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2931 (class 2606 OID 54497)
-- Dependencies: 318 318
-- Name: log_modulo_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_modulo
    ADD CONSTRAINT log_modulo_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2759 (class 2606 OID 53148)
-- Dependencies: 180 180
-- Name: log_moneda_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_moneda
    ADD CONSTRAINT log_moneda_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2761 (class 2606 OID 53150)
-- Dependencies: 182 182
-- Name: log_motivo_entrada_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_motivo_entrada
    ADD CONSTRAINT log_motivo_entrada_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2763 (class 2606 OID 53152)
-- Dependencies: 184 184
-- Name: log_motivo_notabo_cliente_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_motivo_notabo_cliente
    ADD CONSTRAINT log_motivo_notabo_cliente_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2765 (class 2606 OID 53154)
-- Dependencies: 186 186
-- Name: log_motivo_notabo_proveedor_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_motivo_notabo_proveedor
    ADD CONSTRAINT log_motivo_notabo_proveedor_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2767 (class 2606 OID 53156)
-- Dependencies: 188 188
-- Name: log_motivo_notcar_cliente_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_motivo_notcar_cliente
    ADD CONSTRAINT log_motivo_notcar_cliente_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2769 (class 2606 OID 53158)
-- Dependencies: 190 190
-- Name: log_motivo_notcar_proveedor_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_motivo_notcar_proveedor
    ADD CONSTRAINT log_motivo_notcar_proveedor_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2771 (class 2606 OID 53160)
-- Dependencies: 192 192
-- Name: log_motivo_salida_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_motivo_salida
    ADD CONSTRAINT log_motivo_salida_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2773 (class 2606 OID 53162)
-- Dependencies: 194 194
-- Name: log_periodo_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_periodo
    ADD CONSTRAINT log_periodo_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2775 (class 2606 OID 53164)
-- Dependencies: 196 196
-- Name: log_presentacion_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_presentacion
    ADD CONSTRAINT log_presentacion_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2777 (class 2606 OID 53166)
-- Dependencies: 198 198
-- Name: log_producto_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_producto
    ADD CONSTRAINT log_producto_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2779 (class 2606 OID 53168)
-- Dependencies: 200 200
-- Name: log_proveedor_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_proveedor
    ADD CONSTRAINT log_proveedor_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2781 (class 2606 OID 53170)
-- Dependencies: 202 202
-- Name: log_rol_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_rol
    ADD CONSTRAINT log_rol_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2783 (class 2606 OID 53172)
-- Dependencies: 204 204
-- Name: log_sublinea_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_sublinea
    ADD CONSTRAINT log_sublinea_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2785 (class 2606 OID 53174)
-- Dependencies: 206 206
-- Name: log_tipo_cuenta_bancaria_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_tipo_cuenta_bancaria
    ADD CONSTRAINT log_tipo_cuenta_bancaria_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2787 (class 2606 OID 53176)
-- Dependencies: 208 208
-- Name: log_tipo_pago_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_tipo_pago
    ADD CONSTRAINT log_tipo_pago_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2789 (class 2606 OID 53178)
-- Dependencies: 210 210
-- Name: log_tipo_persona_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_tipo_persona
    ADD CONSTRAINT log_tipo_persona_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2791 (class 2606 OID 53180)
-- Dependencies: 212 212
-- Name: log_unidad_negocio_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_unidad_negocio
    ADD CONSTRAINT log_unidad_negocio_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2793 (class 2606 OID 53182)
-- Dependencies: 214 214
-- Name: log_vendedor_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_vendedor
    ADD CONSTRAINT log_vendedor_pkey PRIMARY KEY (idlog);


SET search_path = public, pg_catalog;

--
-- TOC entry 2929 (class 2606 OID 54475)
-- Dependencies: 315 315
-- Name: acceso_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY acceso
    ADD CONSTRAINT acceso_pkey PRIMARY KEY (idacceso);


--
-- TOC entry 2795 (class 2606 OID 53184)
-- Dependencies: 216 216
-- Name: almacen_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY almacen
    ADD CONSTRAINT almacen_pkey PRIMARY KEY (idalmacen);


--
-- TOC entry 2797 (class 2606 OID 53186)
-- Dependencies: 218 218
-- Name: amortizacion_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_pkey PRIMARY KEY (idamortizacion);


--
-- TOC entry 2799 (class 2606 OID 53188)
-- Dependencies: 220 220
-- Name: amortizacion_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_pkey PRIMARY KEY (idamortizacion);


--
-- TOC entry 2801 (class 2606 OID 53190)
-- Dependencies: 222 222
-- Name: autorizacion_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY autorizacion
    ADD CONSTRAINT autorizacion_pkey PRIMARY KEY (idautorizacion);


--
-- TOC entry 2803 (class 2606 OID 53192)
-- Dependencies: 224 224
-- Name: aval_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY aval
    ADD CONSTRAINT aval_pkey PRIMARY KEY (idaval);


--
-- TOC entry 2805 (class 2606 OID 57529)
-- Dependencies: 226 226
-- Name: banco_ccodigosunat_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY banco
    ADD CONSTRAINT banco_ccodigosunat_key UNIQUE (ccodigosunat);


--
-- TOC entry 2807 (class 2606 OID 53194)
-- Dependencies: 226 226
-- Name: banco_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY banco
    ADD CONSTRAINT banco_pkey PRIMARY KEY (idbanco);


--
-- TOC entry 2809 (class 2606 OID 53196)
-- Dependencies: 228 228
-- Name: cheque_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_pkey PRIMARY KEY (idcheque);


--
-- TOC entry 2941 (class 2606 OID 57605)
-- Dependencies: 327 327 327 327 327
-- Name: cheque_proveedor_idbanco_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY cheque_proveedor
    ADD CONSTRAINT cheque_proveedor_idbanco_key UNIQUE (idbanco, cnumero, nimporte, dfecha);


--
-- TOC entry 2943 (class 2606 OID 57578)
-- Dependencies: 327 327
-- Name: cheque_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY cheque_proveedor
    ADD CONSTRAINT cheque_proveedor_pkey PRIMARY KEY (idcheque);


--
-- TOC entry 2811 (class 2606 OID 53198)
-- Dependencies: 230 230
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);


--
-- TOC entry 2813 (class 2606 OID 57525)
-- Dependencies: 232 232 232 232 232
-- Name: comprobante_emitido_idunidad_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idunidad_key UNIQUE (idunidad, iddocumento, cserie, cnumero);


--
-- TOC entry 2815 (class 2606 OID 53200)
-- Dependencies: 232 232
-- Name: comprobante_emitido_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_pkey PRIMARY KEY (idcomprobante);


--
-- TOC entry 2817 (class 2606 OID 53202)
-- Dependencies: 234 234
-- Name: condicion_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY condicion_venta
    ADD CONSTRAINT condicion_venta_pkey PRIMARY KEY (idcondicion);


--
-- TOC entry 2819 (class 2606 OID 57531)
-- Dependencies: 236 236 236 236
-- Name: cuenta_bancaria_idbanco_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_idbanco_key UNIQUE (idbanco, idproveedor, ccuenta);


--
-- TOC entry 2821 (class 2606 OID 53204)
-- Dependencies: 236 236
-- Name: cuenta_bancaria_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_pkey PRIMARY KEY (idcuenta);


--
-- TOC entry 2823 (class 2606 OID 57420)
-- Dependencies: 238 238 238 238 238
-- Name: cuenta_pagar_idproveedor_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idproveedor_key UNIQUE (idproveedor, iddocumento, cserie, cnumero);


--
-- TOC entry 2825 (class 2606 OID 53206)
-- Dependencies: 238 238
-- Name: cuenta_pagar_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_pkey PRIMARY KEY (idcuenta);


--
-- TOC entry 2827 (class 2606 OID 57533)
-- Dependencies: 240 240 240 240 240
-- Name: deposito_cliente_idbanco_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_idbanco_key UNIQUE (idbanco, dfecha, coperacion, nimporte);


--
-- TOC entry 2829 (class 2606 OID 53208)
-- Dependencies: 240 240
-- Name: deposito_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_pkey PRIMARY KEY (iddeposito);


--
-- TOC entry 2831 (class 2606 OID 53210)
-- Dependencies: 242 242
-- Name: detalle_autorizacion_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY detalle_autorizacion
    ADD CONSTRAINT detalle_autorizacion_pkey PRIMARY KEY (iddetalle);


--
-- TOC entry 2833 (class 2606 OID 57519)
-- Dependencies: 244 244
-- Name: documento_ccodigosunat_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY documento
    ADD CONSTRAINT documento_ccodigosunat_key UNIQUE (ccodigosunat);


--
-- TOC entry 2835 (class 2606 OID 53212)
-- Dependencies: 244 244
-- Name: documento_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY documento
    ADD CONSTRAINT documento_pkey PRIMARY KEY (iddocumento);


--
-- TOC entry 2837 (class 2606 OID 53214)
-- Dependencies: 246 246
-- Name: empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (idempresa);


--
-- TOC entry 2839 (class 2606 OID 53216)
-- Dependencies: 247 247 247
-- Name: existencia_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY existencia
    ADD CONSTRAINT existencia_pkey PRIMARY KEY (idalmacen, idproducto);


--
-- TOC entry 2841 (class 2606 OID 53218)
-- Dependencies: 249 249
-- Name: familia_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY familia
    ADD CONSTRAINT familia_pkey PRIMARY KEY (idfamilia);


--
-- TOC entry 2843 (class 2606 OID 57535)
-- Dependencies: 251 251
-- Name: letra_cliente_cnumero_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_cnumero_key UNIQUE (cnumero);


--
-- TOC entry 2845 (class 2606 OID 53220)
-- Dependencies: 251 251
-- Name: letra_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_pkey PRIMARY KEY (idletra);


--
-- TOC entry 2847 (class 2606 OID 53222)
-- Dependencies: 253 253
-- Name: letra_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY letra_proveedor
    ADD CONSTRAINT letra_proveedor_pkey PRIMARY KEY (idletra);


--
-- TOC entry 2849 (class 2606 OID 53224)
-- Dependencies: 255 255
-- Name: linea_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY linea
    ADD CONSTRAINT linea_pkey PRIMARY KEY (idlinea);


--
-- TOC entry 2851 (class 2606 OID 53226)
-- Dependencies: 257 257
-- Name: lote_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY lote
    ADD CONSTRAINT lote_pkey PRIMARY KEY (idlote);


--
-- TOC entry 2927 (class 2606 OID 54445)
-- Dependencies: 313 313
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (idmapa);


--
-- TOC entry 2925 (class 2606 OID 54382)
-- Dependencies: 311 311
-- Name: menu_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (idmenu);


--
-- TOC entry 2923 (class 2606 OID 54372)
-- Dependencies: 310 310
-- Name: modulo_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT modulo_pkey PRIMARY KEY (idmodulo);


--
-- TOC entry 2853 (class 2606 OID 53228)
-- Dependencies: 259 259
-- Name: moneda_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY moneda
    ADD CONSTRAINT moneda_pkey PRIMARY KEY (idmoneda);


--
-- TOC entry 2857 (class 2606 OID 53230)
-- Dependencies: 263 263
-- Name: motivo_notabo_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY motivo_notabo_cliente
    ADD CONSTRAINT motivo_notabo_pkey PRIMARY KEY (idmotivo);


--
-- TOC entry 2859 (class 2606 OID 53232)
-- Dependencies: 265 265
-- Name: motivo_notabo_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY motivo_notabo_proveedor
    ADD CONSTRAINT motivo_notabo_proveedor_pkey PRIMARY KEY (idmotivo);


--
-- TOC entry 2861 (class 2606 OID 53234)
-- Dependencies: 267 267
-- Name: motivo_notcar_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY motivo_notcar_cliente
    ADD CONSTRAINT motivo_notcar_pkey PRIMARY KEY (idmotivo);


--
-- TOC entry 2863 (class 2606 OID 53236)
-- Dependencies: 269 269
-- Name: motivo_notcar_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY motivo_notcar_proveedor
    ADD CONSTRAINT motivo_notcar_proveedor_pkey PRIMARY KEY (idmotivo);


--
-- TOC entry 2865 (class 2606 OID 53238)
-- Dependencies: 271 271
-- Name: motivo_salida_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY motivo_salida
    ADD CONSTRAINT motivo_salida_pkey PRIMARY KEY (idmotivo);


--
-- TOC entry 2855 (class 2606 OID 53240)
-- Dependencies: 261 261
-- Name: motivoentrada_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY motivo_entrada
    ADD CONSTRAINT motivoentrada_pkey PRIMARY KEY (idmotivo);


--
-- TOC entry 2935 (class 2606 OID 54542)
-- Dependencies: 321 321
-- Name: movimiento_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY movimiento
    ADD CONSTRAINT movimiento_pkey PRIMARY KEY (idmovimiento);


--
-- TOC entry 2867 (class 2606 OID 57537)
-- Dependencies: 273 273 273
-- Name: notabo_cliente_cserie_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_cserie_key UNIQUE (cserie, cnumero);


--
-- TOC entry 2869 (class 2606 OID 53242)
-- Dependencies: 273 273
-- Name: notabo_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_pkey PRIMARY KEY (idnotabo);


--
-- TOC entry 2871 (class 2606 OID 57539)
-- Dependencies: 275 275 275 275
-- Name: notabo_proveedor_idproveedor_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idproveedor_key UNIQUE (idproveedor, cserie, cnumero);


--
-- TOC entry 2873 (class 2606 OID 53244)
-- Dependencies: 275 275
-- Name: notabo_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_pkey PRIMARY KEY (idnotabo);


--
-- TOC entry 2875 (class 2606 OID 57541)
-- Dependencies: 277 277 277
-- Name: notcar_cliente_cserie_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_cserie_key UNIQUE (cserie, cnumero);


--
-- TOC entry 2877 (class 2606 OID 53246)
-- Dependencies: 277 277
-- Name: notcar_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_pkey PRIMARY KEY (idnotcar);


--
-- TOC entry 2879 (class 2606 OID 57543)
-- Dependencies: 279 279 279 279
-- Name: notcar_proveedor_idproveedor_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idproveedor_key UNIQUE (idproveedor, cserie, cnumero);


--
-- TOC entry 2881 (class 2606 OID 53248)
-- Dependencies: 279 279
-- Name: notcar_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_pkey PRIMARY KEY (idnotcar);


--
-- TOC entry 2939 (class 2606 OID 57492)
-- Dependencies: 324 324
-- Name: orden_linea_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY orden_linea
    ADD CONSTRAINT orden_linea_pkey PRIMARY KEY (idorden);


--
-- TOC entry 2883 (class 2606 OID 57545)
-- Dependencies: 281 281 281
-- Name: periodo_nano_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY periodo
    ADD CONSTRAINT periodo_nano_key UNIQUE (nano, nmes);


--
-- TOC entry 2885 (class 2606 OID 53250)
-- Dependencies: 281 281
-- Name: periodo_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY periodo
    ADD CONSTRAINT periodo_pkey PRIMARY KEY (idperiodo);


--
-- TOC entry 2887 (class 2606 OID 53252)
-- Dependencies: 283 283
-- Name: presentacion_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY presentacion
    ADD CONSTRAINT presentacion_pkey PRIMARY KEY (idpresentacion);


--
-- TOC entry 2889 (class 2606 OID 53254)
-- Dependencies: 284 284
-- Name: producto_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (idproducto);


--
-- TOC entry 2891 (class 2606 OID 53256)
-- Dependencies: 286 286
-- Name: proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (idproveedor);


--
-- TOC entry 2893 (class 2606 OID 57418)
-- Dependencies: 288 288 288 288 288
-- Name: registro_entrada_idproveedor_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_idproveedor_key UNIQUE (idproveedor, iddocumento, cserie, cnumero);


--
-- TOC entry 2895 (class 2606 OID 53258)
-- Dependencies: 288 288
-- Name: registro_entrada_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_pkey PRIMARY KEY (idregentrada);


--
-- TOC entry 2897 (class 2606 OID 53260)
-- Dependencies: 290 290
-- Name: registro_salida_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_pkey PRIMARY KEY (idregsalida);


--
-- TOC entry 2899 (class 2606 OID 53262)
-- Dependencies: 292 292
-- Name: rol_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (idrol);


--
-- TOC entry 2937 (class 2606 OID 57458)
-- Dependencies: 323 323
-- Name: situacion_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY situacion_pedido
    ADD CONSTRAINT situacion_pedido_pkey PRIMARY KEY (idsituacion);


--
-- TOC entry 2901 (class 2606 OID 53264)
-- Dependencies: 301 301
-- Name: sublinea_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY sublinea
    ADD CONSTRAINT sublinea_pkey PRIMARY KEY (idsublinea);


--
-- TOC entry 2903 (class 2606 OID 53266)
-- Dependencies: 302 302
-- Name: tipo_cuenta_bancaria_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY tipo_cuenta_bancaria
    ADD CONSTRAINT tipo_cuenta_bancaria_pkey PRIMARY KEY (idtipo);


--
-- TOC entry 2905 (class 2606 OID 57549)
-- Dependencies: 303 303
-- Name: tipo_pago_ccodigosunat_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY tipo_pago
    ADD CONSTRAINT tipo_pago_ccodigosunat_key UNIQUE (ccodigosunat);


--
-- TOC entry 2907 (class 2606 OID 53268)
-- Dependencies: 303 303
-- Name: tipo_pago_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY tipo_pago
    ADD CONSTRAINT tipo_pago_cliente_pkey PRIMARY KEY (idtipo);


--
-- TOC entry 2909 (class 2606 OID 57523)
-- Dependencies: 304 304
-- Name: tipo_persona_ccodigosunat_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY tipo_persona
    ADD CONSTRAINT tipo_persona_ccodigosunat_key UNIQUE (ccodigosunat);


--
-- TOC entry 2911 (class 2606 OID 53270)
-- Dependencies: 304 304
-- Name: tipo_persona_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY tipo_persona
    ADD CONSTRAINT tipo_persona_pkey PRIMARY KEY (idtipo);


--
-- TOC entry 2913 (class 2606 OID 53272)
-- Dependencies: 305 305
-- Name: ubigeo_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY ubigeo
    ADD CONSTRAINT ubigeo_pkey PRIMARY KEY (idubigeo);


--
-- TOC entry 2915 (class 2606 OID 53274)
-- Dependencies: 306 306
-- Name: unidad_negocio_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY unidad_negocio
    ADD CONSTRAINT unidad_negocio_pkey PRIMARY KEY (idunidad);


--
-- TOC entry 2917 (class 2606 OID 57547)
-- Dependencies: 307 307
-- Name: usuario_clogin_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_clogin_key UNIQUE (clogin);


--
-- TOC entry 2919 (class 2606 OID 53276)
-- Dependencies: 307 307
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (idusuario);


--
-- TOC entry 2921 (class 2606 OID 53278)
-- Dependencies: 308 308
-- Name: vendedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY vendedor
    ADD CONSTRAINT vendedor_pkey PRIMARY KEY (idvendedor);


SET search_path = log, pg_catalog;

--
-- TOC entry 2946 (class 2606 OID 53279)
-- Dependencies: 216 2794 142
-- Name: log_almacen_idalmacen_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_almacen
    ADD CONSTRAINT log_almacen_idalmacen_fkey FOREIGN KEY (idalmacen) REFERENCES public.almacen(idalmacen);


--
-- TOC entry 2947 (class 2606 OID 53284)
-- Dependencies: 142 2918 307
-- Name: log_almacen_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_almacen
    ADD CONSTRAINT log_almacen_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2948 (class 2606 OID 53289)
-- Dependencies: 144 2800 222
-- Name: log_autorizacion_idautorizacion_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_autorizacion
    ADD CONSTRAINT log_autorizacion_idautorizacion_fkey FOREIGN KEY (idautorizacion) REFERENCES public.autorizacion(idautorizacion);


--
-- TOC entry 2949 (class 2606 OID 53294)
-- Dependencies: 2918 144 307
-- Name: log_autorizacion_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_autorizacion
    ADD CONSTRAINT log_autorizacion_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2950 (class 2606 OID 53299)
-- Dependencies: 146 224 2802
-- Name: log_aval_idaval_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_aval
    ADD CONSTRAINT log_aval_idaval_fkey FOREIGN KEY (idaval) REFERENCES public.aval(idaval);


--
-- TOC entry 2951 (class 2606 OID 53304)
-- Dependencies: 2918 146 307
-- Name: log_aval_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_aval
    ADD CONSTRAINT log_aval_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2952 (class 2606 OID 53309)
-- Dependencies: 226 2806 148
-- Name: log_banco_idbanco_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_banco
    ADD CONSTRAINT log_banco_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES public.banco(idbanco);


--
-- TOC entry 2953 (class 2606 OID 53314)
-- Dependencies: 2918 148 307
-- Name: log_banco_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_banco
    ADD CONSTRAINT log_banco_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2954 (class 2606 OID 53319)
-- Dependencies: 2808 228 150
-- Name: log_cheque_cliente_idcheque_cliente_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_cheque_cliente
    ADD CONSTRAINT log_cheque_cliente_idcheque_cliente_fkey FOREIGN KEY (idcheque) REFERENCES public.cheque_cliente(idcheque);


--
-- TOC entry 2955 (class 2606 OID 53324)
-- Dependencies: 307 150 2918
-- Name: log_cheque_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_cheque_cliente
    ADD CONSTRAINT log_cheque_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 3191 (class 2606 OID 57618)
-- Dependencies: 329 2942 327
-- Name: log_cheque_proveedor_idcheque_proveedor_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_cheque_proveedor
    ADD CONSTRAINT log_cheque_proveedor_idcheque_proveedor_fkey FOREIGN KEY (idcheque) REFERENCES public.cheque_proveedor(idcheque);


--
-- TOC entry 3192 (class 2606 OID 57623)
-- Dependencies: 307 329 2918
-- Name: log_cheque_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_cheque_proveedor
    ADD CONSTRAINT log_cheque_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2956 (class 2606 OID 53329)
-- Dependencies: 152 230 2810
-- Name: log_cliente_idcliente_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_cliente
    ADD CONSTRAINT log_cliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);


--
-- TOC entry 2957 (class 2606 OID 53334)
-- Dependencies: 307 152 2918
-- Name: log_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_cliente
    ADD CONSTRAINT log_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2958 (class 2606 OID 53339)
-- Dependencies: 154 2814 232
-- Name: log_comprobante_emitido_idcomprobante_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_comprobante_emitido
    ADD CONSTRAINT log_comprobante_emitido_idcomprobante_fkey FOREIGN KEY (idcomprobante) REFERENCES public.comprobante_emitido(idcomprobante);


--
-- TOC entry 2959 (class 2606 OID 53344)
-- Dependencies: 154 307 2918
-- Name: log_comprobante_emitido_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_comprobante_emitido
    ADD CONSTRAINT log_comprobante_emitido_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2960 (class 2606 OID 53349)
-- Dependencies: 156 2816 234
-- Name: log_condicion_venta_idcondicion_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_condicion_venta
    ADD CONSTRAINT log_condicion_venta_idcondicion_fkey FOREIGN KEY (idcondicion) REFERENCES public.condicion_venta(idcondicion);


--
-- TOC entry 2961 (class 2606 OID 53354)
-- Dependencies: 2918 307 156
-- Name: log_condicion_venta_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_condicion_venta
    ADD CONSTRAINT log_condicion_venta_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2962 (class 2606 OID 53359)
-- Dependencies: 158 236 2820
-- Name: log_cuenta_bancaria_idcuenta_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_cuenta_bancaria
    ADD CONSTRAINT log_cuenta_bancaria_idcuenta_fkey FOREIGN KEY (idcuenta) REFERENCES public.cuenta_bancaria(idcuenta);


--
-- TOC entry 2963 (class 2606 OID 53364)
-- Dependencies: 158 307 2918
-- Name: log_cuenta_bancaria_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_cuenta_bancaria
    ADD CONSTRAINT log_cuenta_bancaria_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2964 (class 2606 OID 53369)
-- Dependencies: 2824 238 160
-- Name: log_cuenta_pagar_idcuenta_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_cuenta_pagar
    ADD CONSTRAINT log_cuenta_pagar_idcuenta_fkey FOREIGN KEY (idcuenta) REFERENCES public.cuenta_pagar(idcuenta);


--
-- TOC entry 2965 (class 2606 OID 53374)
-- Dependencies: 307 2918 160
-- Name: log_cuenta_pagar_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_cuenta_pagar
    ADD CONSTRAINT log_cuenta_pagar_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2966 (class 2606 OID 53379)
-- Dependencies: 162 2828 240
-- Name: log_deposito_cliente_iddeposito_cliente_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_deposito_cliente
    ADD CONSTRAINT log_deposito_cliente_iddeposito_cliente_fkey FOREIGN KEY (iddeposito) REFERENCES public.deposito_cliente(iddeposito);


--
-- TOC entry 2967 (class 2606 OID 53384)
-- Dependencies: 307 162 2918
-- Name: log_deposito_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_deposito_cliente
    ADD CONSTRAINT log_deposito_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2968 (class 2606 OID 53389)
-- Dependencies: 242 2830 164
-- Name: log_detalle_autorizacion_iddetalle_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_detalle_autorizacion
    ADD CONSTRAINT log_detalle_autorizacion_iddetalle_fkey FOREIGN KEY (iddetalle) REFERENCES public.detalle_autorizacion(iddetalle);


--
-- TOC entry 2969 (class 2606 OID 53394)
-- Dependencies: 307 2918 164
-- Name: log_detalle_autorizacion_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_detalle_autorizacion
    ADD CONSTRAINT log_detalle_autorizacion_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2970 (class 2606 OID 53399)
-- Dependencies: 2834 166 244
-- Name: log_documento_iddocumento_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_documento
    ADD CONSTRAINT log_documento_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES public.documento(iddocumento);


--
-- TOC entry 2971 (class 2606 OID 53404)
-- Dependencies: 2918 166 307
-- Name: log_documento_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_documento
    ADD CONSTRAINT log_documento_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2972 (class 2606 OID 53409)
-- Dependencies: 168 2836 246
-- Name: log_empresa_idempresa_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_empresa
    ADD CONSTRAINT log_empresa_idempresa_fkey FOREIGN KEY (idempresa) REFERENCES public.empresa(idempresa);


--
-- TOC entry 2973 (class 2606 OID 53414)
-- Dependencies: 2918 168 307
-- Name: log_empresa_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_empresa
    ADD CONSTRAINT log_empresa_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2974 (class 2606 OID 53419)
-- Dependencies: 247 170 170 247 2838
-- Name: log_existencia_idalmacen_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_existencia
    ADD CONSTRAINT log_existencia_idalmacen_fkey FOREIGN KEY (idalmacen, idproducto) REFERENCES public.existencia(idalmacen, idproducto);


--
-- TOC entry 2975 (class 2606 OID 53424)
-- Dependencies: 2918 307 170
-- Name: log_existencia_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_existencia
    ADD CONSTRAINT log_existencia_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2976 (class 2606 OID 53429)
-- Dependencies: 172 249 2840
-- Name: log_familia_idfamilia_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_familia
    ADD CONSTRAINT log_familia_idfamilia_fkey FOREIGN KEY (idfamilia) REFERENCES public.familia(idfamilia);


--
-- TOC entry 2977 (class 2606 OID 53434)
-- Dependencies: 2918 307 172
-- Name: log_familia_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_familia
    ADD CONSTRAINT log_familia_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2978 (class 2606 OID 53439)
-- Dependencies: 174 253 2846
-- Name: log_letra_proveedor_idletra_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_letra_proveedor
    ADD CONSTRAINT log_letra_proveedor_idletra_fkey FOREIGN KEY (idletra) REFERENCES public.letra_proveedor(idletra);


--
-- TOC entry 2979 (class 2606 OID 53444)
-- Dependencies: 174 307 2918
-- Name: log_letra_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_letra_proveedor
    ADD CONSTRAINT log_letra_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2980 (class 2606 OID 53449)
-- Dependencies: 2848 255 176
-- Name: log_linea_idlinea_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_linea
    ADD CONSTRAINT log_linea_idlinea_fkey FOREIGN KEY (idlinea) REFERENCES public.linea(idlinea);


--
-- TOC entry 2981 (class 2606 OID 53454)
-- Dependencies: 2918 176 307
-- Name: log_linea_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_linea
    ADD CONSTRAINT log_linea_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2982 (class 2606 OID 53459)
-- Dependencies: 2850 178 257
-- Name: log_lote_idlote_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_lote
    ADD CONSTRAINT log_lote_idlote_fkey FOREIGN KEY (idlote) REFERENCES public.lote(idlote);


--
-- TOC entry 2983 (class 2606 OID 53464)
-- Dependencies: 307 2918 178
-- Name: log_lote_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_lote
    ADD CONSTRAINT log_lote_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 3177 (class 2606 OID 54525)
-- Dependencies: 320 2924 311
-- Name: log_menu_idmenu_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_menu
    ADD CONSTRAINT log_menu_idmenu_fkey FOREIGN KEY (idmenu) REFERENCES public.menu(idmenu);


--
-- TOC entry 3178 (class 2606 OID 54530)
-- Dependencies: 307 320 2918
-- Name: log_menu_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_menu
    ADD CONSTRAINT log_menu_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 3175 (class 2606 OID 54498)
-- Dependencies: 2922 318 310
-- Name: log_modulo_idmodulo_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_modulo
    ADD CONSTRAINT log_modulo_idmodulo_fkey FOREIGN KEY (idmodulo) REFERENCES public.modulo(idmodulo);


--
-- TOC entry 3176 (class 2606 OID 54503)
-- Dependencies: 2918 307 318
-- Name: log_modulo_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_modulo
    ADD CONSTRAINT log_modulo_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2984 (class 2606 OID 53469)
-- Dependencies: 259 180 2852
-- Name: log_moneda_idmoneda_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_moneda
    ADD CONSTRAINT log_moneda_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES public.moneda(idmoneda);


--
-- TOC entry 2985 (class 2606 OID 53474)
-- Dependencies: 307 180 2918
-- Name: log_moneda_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_moneda
    ADD CONSTRAINT log_moneda_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2986 (class 2606 OID 53479)
-- Dependencies: 182 261 2854
-- Name: log_motivo_entrada_idmotivo_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_entrada
    ADD CONSTRAINT log_motivo_entrada_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES public.motivo_entrada(idmotivo);


--
-- TOC entry 2987 (class 2606 OID 53484)
-- Dependencies: 2918 307 182
-- Name: log_motivo_entrada_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_entrada
    ADD CONSTRAINT log_motivo_entrada_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2988 (class 2606 OID 53489)
-- Dependencies: 184 263 2856
-- Name: log_motivo_notabo_cliente_idmotivo_notabo_cliente_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_notabo_cliente
    ADD CONSTRAINT log_motivo_notabo_cliente_idmotivo_notabo_cliente_fkey FOREIGN KEY (idmotivo) REFERENCES public.motivo_notabo_cliente(idmotivo);


--
-- TOC entry 2989 (class 2606 OID 53494)
-- Dependencies: 184 2918 307
-- Name: log_motivo_notabo_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_notabo_cliente
    ADD CONSTRAINT log_motivo_notabo_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2990 (class 2606 OID 53499)
-- Dependencies: 186 265 2858
-- Name: log_motivo_notabo_proveedor_idmotivo_notabo_proveedor_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_notabo_proveedor
    ADD CONSTRAINT log_motivo_notabo_proveedor_idmotivo_notabo_proveedor_fkey FOREIGN KEY (idmotivo) REFERENCES public.motivo_notabo_proveedor(idmotivo);


--
-- TOC entry 2991 (class 2606 OID 53504)
-- Dependencies: 186 307 2918
-- Name: log_motivo_notabo_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_notabo_proveedor
    ADD CONSTRAINT log_motivo_notabo_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2992 (class 2606 OID 53509)
-- Dependencies: 188 267 2860
-- Name: log_motivo_notcar_cliente_idmotivo_notcar_cliente_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_notcar_cliente
    ADD CONSTRAINT log_motivo_notcar_cliente_idmotivo_notcar_cliente_fkey FOREIGN KEY (idmotivo) REFERENCES public.motivo_notcar_cliente(idmotivo);


--
-- TOC entry 2993 (class 2606 OID 53514)
-- Dependencies: 188 307 2918
-- Name: log_motivo_notcar_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_notcar_cliente
    ADD CONSTRAINT log_motivo_notcar_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2994 (class 2606 OID 53519)
-- Dependencies: 190 269 2862
-- Name: log_motivo_notcar_proveedor_idmotivo_notcar_proveedor_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_notcar_proveedor
    ADD CONSTRAINT log_motivo_notcar_proveedor_idmotivo_notcar_proveedor_fkey FOREIGN KEY (idmotivo) REFERENCES public.motivo_notcar_proveedor(idmotivo);


--
-- TOC entry 2995 (class 2606 OID 53524)
-- Dependencies: 190 307 2918
-- Name: log_motivo_notcar_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_notcar_proveedor
    ADD CONSTRAINT log_motivo_notcar_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2996 (class 2606 OID 53529)
-- Dependencies: 192 271 2864
-- Name: log_motivo_salida_idmotivo_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_salida
    ADD CONSTRAINT log_motivo_salida_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES public.motivo_salida(idmotivo);


--
-- TOC entry 2997 (class 2606 OID 53534)
-- Dependencies: 192 307 2918
-- Name: log_motivo_salida_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_salida
    ADD CONSTRAINT log_motivo_salida_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2998 (class 2606 OID 53539)
-- Dependencies: 194 281 2884
-- Name: log_periodo_idperiodo_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_periodo
    ADD CONSTRAINT log_periodo_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES public.periodo(idperiodo);


--
-- TOC entry 2999 (class 2606 OID 53544)
-- Dependencies: 194 307 2918
-- Name: log_periodo_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_periodo
    ADD CONSTRAINT log_periodo_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 3000 (class 2606 OID 53549)
-- Dependencies: 196 283 2886
-- Name: log_presentacion_idpresentacion_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_presentacion
    ADD CONSTRAINT log_presentacion_idpresentacion_fkey FOREIGN KEY (idpresentacion) REFERENCES public.presentacion(idpresentacion);


--
-- TOC entry 3001 (class 2606 OID 53554)
-- Dependencies: 196 307 2918
-- Name: log_presentacion_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_presentacion
    ADD CONSTRAINT log_presentacion_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 3002 (class 2606 OID 53559)
-- Dependencies: 198 284 2888
-- Name: log_producto_idproducto_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_producto
    ADD CONSTRAINT log_producto_idproducto_fkey FOREIGN KEY (idproducto) REFERENCES public.producto(idproducto);


--
-- TOC entry 3003 (class 2606 OID 53564)
-- Dependencies: 198 307 2918
-- Name: log_producto_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_producto
    ADD CONSTRAINT log_producto_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 3004 (class 2606 OID 53569)
-- Dependencies: 200 286 2890
-- Name: log_proveedor_idproveedor_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_proveedor
    ADD CONSTRAINT log_proveedor_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES public.proveedor(idproveedor);


--
-- TOC entry 3005 (class 2606 OID 53574)
-- Dependencies: 200 307 2918
-- Name: log_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_proveedor
    ADD CONSTRAINT log_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 3006 (class 2606 OID 53579)
-- Dependencies: 202 292 2898
-- Name: log_rol_idrol_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_rol
    ADD CONSTRAINT log_rol_idrol_fkey FOREIGN KEY (idrol) REFERENCES public.rol(idrol);


--
-- TOC entry 3007 (class 2606 OID 53584)
-- Dependencies: 202 307 2918
-- Name: log_rol_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_rol
    ADD CONSTRAINT log_rol_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 3008 (class 2606 OID 53589)
-- Dependencies: 204 301 2900
-- Name: log_sublinea_idsublinea_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_sublinea
    ADD CONSTRAINT log_sublinea_idsublinea_fkey FOREIGN KEY (idsublinea) REFERENCES public.sublinea(idsublinea);


--
-- TOC entry 3009 (class 2606 OID 53594)
-- Dependencies: 204 307 2918
-- Name: log_sublinea_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_sublinea
    ADD CONSTRAINT log_sublinea_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 3010 (class 2606 OID 53599)
-- Dependencies: 206 302 2902
-- Name: log_tipo_cuenta_bancaria_idtipo_cuenta_bancaria_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_tipo_cuenta_bancaria
    ADD CONSTRAINT log_tipo_cuenta_bancaria_idtipo_cuenta_bancaria_fkey FOREIGN KEY (idtipo) REFERENCES public.tipo_cuenta_bancaria(idtipo);


--
-- TOC entry 3011 (class 2606 OID 53604)
-- Dependencies: 206 307 2918
-- Name: log_tipo_cuenta_bancaria_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_tipo_cuenta_bancaria
    ADD CONSTRAINT log_tipo_cuenta_bancaria_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 3012 (class 2606 OID 53609)
-- Dependencies: 208 303 2906
-- Name: log_tipo_pago_idtipo_pago_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_tipo_pago
    ADD CONSTRAINT log_tipo_pago_idtipo_pago_fkey FOREIGN KEY (idtipo) REFERENCES public.tipo_pago(idtipo);


--
-- TOC entry 3013 (class 2606 OID 53614)
-- Dependencies: 208 307 2918
-- Name: log_tipo_pago_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_tipo_pago
    ADD CONSTRAINT log_tipo_pago_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 3014 (class 2606 OID 53619)
-- Dependencies: 210 304 2910
-- Name: log_tipo_persona_idtipo_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_tipo_persona
    ADD CONSTRAINT log_tipo_persona_idtipo_fkey FOREIGN KEY (idtipo) REFERENCES public.tipo_persona(idtipo);


--
-- TOC entry 3015 (class 2606 OID 53624)
-- Dependencies: 210 307 2918
-- Name: log_tipo_persona_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_tipo_persona
    ADD CONSTRAINT log_tipo_persona_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 3016 (class 2606 OID 53629)
-- Dependencies: 212 306 2914
-- Name: log_unidad_negocio_idunidad_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_unidad_negocio
    ADD CONSTRAINT log_unidad_negocio_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES public.unidad_negocio(idunidad);


--
-- TOC entry 3017 (class 2606 OID 53634)
-- Dependencies: 212 307 2918
-- Name: log_unidad_negocio_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_unidad_negocio
    ADD CONSTRAINT log_unidad_negocio_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 3018 (class 2606 OID 53639)
-- Dependencies: 214 307 2918
-- Name: log_vendedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_vendedor
    ADD CONSTRAINT log_vendedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 3019 (class 2606 OID 53644)
-- Dependencies: 214 308 2920
-- Name: log_vendedor_idvendedor_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_vendedor
    ADD CONSTRAINT log_vendedor_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES public.vendedor(idvendedor);


SET search_path = public, pg_catalog;

--
-- TOC entry 3174 (class 2606 OID 54481)
-- Dependencies: 2794 216 315
-- Name: acceso_idalmacen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY acceso
    ADD CONSTRAINT acceso_idalmacen_fkey FOREIGN KEY (idalmacen) REFERENCES almacen(idalmacen);


--
-- TOC entry 3173 (class 2606 OID 54476)
-- Dependencies: 315 307 2918
-- Name: acceso_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY acceso
    ADD CONSTRAINT acceso_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3020 (class 2606 OID 53649)
-- Dependencies: 216 305 2912
-- Name: almacen_idubigeo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY almacen
    ADD CONSTRAINT almacen_idubigeo_fkey FOREIGN KEY (idubigeo) REFERENCES ubigeo(idubigeo);


--
-- TOC entry 3021 (class 2606 OID 53654)
-- Dependencies: 216 306 2914
-- Name: almacen_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY almacen
    ADD CONSTRAINT almacen_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 3022 (class 2606 OID 53659)
-- Dependencies: 216 307 2918
-- Name: almacen_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY almacen
    ADD CONSTRAINT almacen_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3023 (class 2606 OID 53664)
-- Dependencies: 218 232 2814
-- Name: amortizacion_cliente_idcomprobante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idcomprobante_fkey FOREIGN KEY (idcomprobante) REFERENCES comprobante_emitido(idcomprobante);


--
-- TOC entry 3024 (class 2606 OID 53669)
-- Dependencies: 218 244 2834
-- Name: amortizacion_cliente_iddocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES documento(iddocumento);


--
-- TOC entry 3025 (class 2606 OID 53674)
-- Dependencies: 218 251 2844
-- Name: amortizacion_cliente_idletra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idletra_fkey FOREIGN KEY (idletra) REFERENCES letra_cliente(idletra);


--
-- TOC entry 3026 (class 2606 OID 53679)
-- Dependencies: 218 259 2852
-- Name: amortizacion_cliente_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 3027 (class 2606 OID 53684)
-- Dependencies: 218 273 2868
-- Name: amortizacion_cliente_idnotabo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idnotabo_fkey FOREIGN KEY (idnotabo) REFERENCES notabo_cliente(idnotabo);


--
-- TOC entry 3028 (class 2606 OID 53689)
-- Dependencies: 218 277 2876
-- Name: amortizacion_cliente_idnotcar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idnotcar_fkey FOREIGN KEY (idnotcar) REFERENCES notcar_cliente(idnotcar);


--
-- TOC entry 3032 (class 2606 OID 57639)
-- Dependencies: 281 2884 218
-- Name: amortizacion_cliente_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 3029 (class 2606 OID 53694)
-- Dependencies: 218 303 2906
-- Name: amortizacion_cliente_idtipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idtipo_fkey FOREIGN KEY (idtipo) REFERENCES tipo_pago(idtipo);


--
-- TOC entry 3030 (class 2606 OID 53699)
-- Dependencies: 218 307 2918
-- Name: amortizacion_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3031 (class 2606 OID 53704)
-- Dependencies: 218 308 2920
-- Name: amortizacion_cliente_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor);


--
-- TOC entry 3033 (class 2606 OID 53709)
-- Dependencies: 220 226 2806
-- Name: amortizacion_proveedor_idbanco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES banco(idbanco);


--
-- TOC entry 3042 (class 2606 OID 57629)
-- Dependencies: 327 220 2942
-- Name: amortizacion_proveedor_idcheque_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idcheque_fkey FOREIGN KEY (idcheque) REFERENCES cheque_proveedor(idcheque);


--
-- TOC entry 3034 (class 2606 OID 53714)
-- Dependencies: 220 238 2824
-- Name: amortizacion_proveedor_idcuenta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idcuenta_fkey FOREIGN KEY (idcuenta) REFERENCES cuenta_pagar(idcuenta);


--
-- TOC entry 3035 (class 2606 OID 53719)
-- Dependencies: 220 244 2834
-- Name: amortizacion_proveedor_iddocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES documento(iddocumento);


--
-- TOC entry 3036 (class 2606 OID 53724)
-- Dependencies: 220 253 2846
-- Name: amortizacion_proveedor_idletra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idletra_fkey FOREIGN KEY (idletra) REFERENCES letra_proveedor(idletra);


--
-- TOC entry 3037 (class 2606 OID 53729)
-- Dependencies: 220 259 2852
-- Name: amortizacion_proveedor_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 3038 (class 2606 OID 53734)
-- Dependencies: 220 275 2872
-- Name: amortizacion_proveedor_idnotabo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idnotabo_fkey FOREIGN KEY (idnotabo) REFERENCES notabo_proveedor(idnotabo);


--
-- TOC entry 3039 (class 2606 OID 53739)
-- Dependencies: 220 279 2880
-- Name: amortizacion_proveedor_idnotcar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idnotcar_fkey FOREIGN KEY (idnotcar) REFERENCES notcar_proveedor(idnotcar);


--
-- TOC entry 3043 (class 2606 OID 57634)
-- Dependencies: 281 2884 220
-- Name: amortizacion_proveedor_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 3040 (class 2606 OID 53744)
-- Dependencies: 220 303 2906
-- Name: amortizacion_proveedor_idtipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idtipo_fkey FOREIGN KEY (idtipo) REFERENCES tipo_pago(idtipo);


--
-- TOC entry 3041 (class 2606 OID 53749)
-- Dependencies: 220 307 2918
-- Name: amortizacion_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3045 (class 2606 OID 53754)
-- Dependencies: 224 230 2810
-- Name: aval_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY aval
    ADD CONSTRAINT aval_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 3046 (class 2606 OID 53759)
-- Dependencies: 224 307 2918
-- Name: aval_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY aval
    ADD CONSTRAINT aval_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3047 (class 2606 OID 53764)
-- Dependencies: 226 259 2852
-- Name: banco_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY banco
    ADD CONSTRAINT banco_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 3048 (class 2606 OID 53769)
-- Dependencies: 226 307 2918
-- Name: banco_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY banco
    ADD CONSTRAINT banco_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3049 (class 2606 OID 53774)
-- Dependencies: 228 226 2806
-- Name: cheque_cliente_idbanco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES banco(idbanco);


--
-- TOC entry 3050 (class 2606 OID 53779)
-- Dependencies: 228 230 2810
-- Name: cheque_cliente_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 3054 (class 2606 OID 57649)
-- Dependencies: 259 2852 228
-- Name: cheque_cliente_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 3051 (class 2606 OID 53784)
-- Dependencies: 228 281 2884
-- Name: cheque_cliente_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 3052 (class 2606 OID 53789)
-- Dependencies: 228 306 2914
-- Name: cheque_cliente_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 3053 (class 2606 OID 53794)
-- Dependencies: 228 307 2918
-- Name: cheque_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3185 (class 2606 OID 57579)
-- Dependencies: 226 2806 327
-- Name: cheque_proveedor_idbanco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_proveedor
    ADD CONSTRAINT cheque_proveedor_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES banco(idbanco);


--
-- TOC entry 3190 (class 2606 OID 57644)
-- Dependencies: 2852 327 259
-- Name: cheque_proveedor_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_proveedor
    ADD CONSTRAINT cheque_proveedor_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 3187 (class 2606 OID 57589)
-- Dependencies: 281 2884 327
-- Name: cheque_proveedor_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_proveedor
    ADD CONSTRAINT cheque_proveedor_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 3186 (class 2606 OID 57584)
-- Dependencies: 286 327 2890
-- Name: cheque_proveedor_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_proveedor
    ADD CONSTRAINT cheque_proveedor_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 3188 (class 2606 OID 57594)
-- Dependencies: 327 306 2914
-- Name: cheque_proveedor_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_proveedor
    ADD CONSTRAINT cheque_proveedor_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 3189 (class 2606 OID 57599)
-- Dependencies: 327 2918 307
-- Name: cheque_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_proveedor
    ADD CONSTRAINT cheque_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3055 (class 2606 OID 53799)
-- Dependencies: 230 304 2910
-- Name: cliente_idtipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_idtipo_fkey FOREIGN KEY (idtipo) REFERENCES tipo_persona(idtipo);


--
-- TOC entry 3056 (class 2606 OID 53804)
-- Dependencies: 230 305 2912
-- Name: cliente_idubigeo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_idubigeo_fkey FOREIGN KEY (idubigeo) REFERENCES ubigeo(idubigeo);


--
-- TOC entry 3057 (class 2606 OID 53809)
-- Dependencies: 230 306 2914
-- Name: cliente_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 3058 (class 2606 OID 53814)
-- Dependencies: 230 307 2918
-- Name: cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3059 (class 2606 OID 53819)
-- Dependencies: 232 230 2810
-- Name: comprobante_emitido_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 3060 (class 2606 OID 53824)
-- Dependencies: 232 234 2816
-- Name: comprobante_emitido_idcondicion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idcondicion_fkey FOREIGN KEY (idcondicion) REFERENCES condicion_venta(idcondicion);


--
-- TOC entry 3061 (class 2606 OID 53829)
-- Dependencies: 232 244 2834
-- Name: comprobante_emitido_iddocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES documento(iddocumento);


--
-- TOC entry 3062 (class 2606 OID 53834)
-- Dependencies: 232 290 2896
-- Name: comprobante_emitido_idregsalida_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idregsalida_fkey FOREIGN KEY (idregsalida) REFERENCES registro_salida(idregsalida);


--
-- TOC entry 3063 (class 2606 OID 53839)
-- Dependencies: 232 306 2914
-- Name: comprobante_emitido_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 3064 (class 2606 OID 53844)
-- Dependencies: 232 307 2918
-- Name: comprobante_emitido_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3065 (class 2606 OID 53849)
-- Dependencies: 232 308 2920
-- Name: comprobante_emitido_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor);


--
-- TOC entry 3066 (class 2606 OID 53854)
-- Dependencies: 234 307 2918
-- Name: condicion_venta_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY condicion_venta
    ADD CONSTRAINT condicion_venta_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3067 (class 2606 OID 53859)
-- Dependencies: 236 226 2806
-- Name: cuenta_bancaria_idbanco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES banco(idbanco);


--
-- TOC entry 3068 (class 2606 OID 53864)
-- Dependencies: 236 286 2890
-- Name: cuenta_bancaria_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 3069 (class 2606 OID 53869)
-- Dependencies: 236 302 2902
-- Name: cuenta_bancaria_idtipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_idtipo_fkey FOREIGN KEY (idtipo) REFERENCES tipo_cuenta_bancaria(idtipo);


--
-- TOC entry 3070 (class 2606 OID 53874)
-- Dependencies: 236 307 2918
-- Name: cuenta_bancaria_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3071 (class 2606 OID 53879)
-- Dependencies: 238 244 2834
-- Name: cuenta_pagar_iddocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES documento(iddocumento);


--
-- TOC entry 3072 (class 2606 OID 53884)
-- Dependencies: 238 259 2852
-- Name: cuenta_pagar_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 3073 (class 2606 OID 53889)
-- Dependencies: 238 281 2884
-- Name: cuenta_pagar_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 3074 (class 2606 OID 53894)
-- Dependencies: 238 286 2890
-- Name: cuenta_pagar_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 3075 (class 2606 OID 53899)
-- Dependencies: 238 288 2894
-- Name: cuenta_pagar_idregentrada_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idregentrada_fkey FOREIGN KEY (idregentrada) REFERENCES registro_entrada(idregentrada);


--
-- TOC entry 3076 (class 2606 OID 53904)
-- Dependencies: 238 306 2914
-- Name: cuenta_pagar_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 3077 (class 2606 OID 53909)
-- Dependencies: 238 307 2918
-- Name: cuenta_pagar_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3078 (class 2606 OID 53914)
-- Dependencies: 240 226 2806
-- Name: deposito_cliente_idbanco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES banco(idbanco);


--
-- TOC entry 3079 (class 2606 OID 53919)
-- Dependencies: 240 230 2810
-- Name: deposito_cliente_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 3080 (class 2606 OID 53924)
-- Dependencies: 240 281 2884
-- Name: deposito_cliente_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 3081 (class 2606 OID 53929)
-- Dependencies: 240 306 2914
-- Name: deposito_cliente_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 3082 (class 2606 OID 53934)
-- Dependencies: 240 307 2918
-- Name: deposito_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3083 (class 2606 OID 53939)
-- Dependencies: 222 2800 242
-- Name: detalle_autorizacion_idautorizacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY detalle_autorizacion
    ADD CONSTRAINT detalle_autorizacion_idautorizacion_fkey FOREIGN KEY (idautorizacion) REFERENCES autorizacion(idautorizacion);


--
-- TOC entry 3084 (class 2606 OID 53944)
-- Dependencies: 2918 244 307
-- Name: documento_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY documento
    ADD CONSTRAINT documento_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3085 (class 2606 OID 53949)
-- Dependencies: 305 246 2912
-- Name: empresa_idubigeo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_idubigeo_fkey FOREIGN KEY (idubigeo) REFERENCES ubigeo(idubigeo);


--
-- TOC entry 3086 (class 2606 OID 53954)
-- Dependencies: 307 246 2918
-- Name: empresa_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3087 (class 2606 OID 53959)
-- Dependencies: 307 247 2918
-- Name: existencia_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY existencia
    ADD CONSTRAINT existencia_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3088 (class 2606 OID 53964)
-- Dependencies: 307 249 2918
-- Name: familia_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY familia
    ADD CONSTRAINT familia_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3089 (class 2606 OID 53969)
-- Dependencies: 224 251 2802
-- Name: letra_cliente_idaval_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idaval_fkey FOREIGN KEY (idaval) REFERENCES aval(idaval);


--
-- TOC entry 3090 (class 2606 OID 53974)
-- Dependencies: 226 251 2806
-- Name: letra_cliente_idbanco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES banco(idbanco);


--
-- TOC entry 3091 (class 2606 OID 53979)
-- Dependencies: 230 251 2810
-- Name: letra_cliente_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 3092 (class 2606 OID 53984)
-- Dependencies: 281 251 2884
-- Name: letra_cliente_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 3093 (class 2606 OID 53989)
-- Dependencies: 251 306 2914
-- Name: letra_cliente_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 3094 (class 2606 OID 53994)
-- Dependencies: 251 307 2918
-- Name: letra_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3095 (class 2606 OID 53999)
-- Dependencies: 2920 251 308
-- Name: letra_cliente_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor);


--
-- TOC entry 3096 (class 2606 OID 54004)
-- Dependencies: 259 253 2852
-- Name: letra_proveedor_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_proveedor
    ADD CONSTRAINT letra_proveedor_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 3097 (class 2606 OID 54009)
-- Dependencies: 281 253 2884
-- Name: letra_proveedor_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_proveedor
    ADD CONSTRAINT letra_proveedor_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 3098 (class 2606 OID 54014)
-- Dependencies: 286 253 2890
-- Name: letra_proveedor_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_proveedor
    ADD CONSTRAINT letra_proveedor_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 3099 (class 2606 OID 54019)
-- Dependencies: 306 253 2914
-- Name: letra_proveedor_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_proveedor
    ADD CONSTRAINT letra_proveedor_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 3100 (class 2606 OID 54024)
-- Dependencies: 307 253 2918
-- Name: letra_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_proveedor
    ADD CONSTRAINT letra_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3101 (class 2606 OID 54029)
-- Dependencies: 307 255 2918
-- Name: linea_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY linea
    ADD CONSTRAINT linea_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3102 (class 2606 OID 54034)
-- Dependencies: 247 257 257 2838 247
-- Name: lote_idalmacen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY lote
    ADD CONSTRAINT lote_idalmacen_fkey FOREIGN KEY (idalmacen, idproducto) REFERENCES existencia(idalmacen, idproducto);


--
-- TOC entry 3103 (class 2606 OID 54039)
-- Dependencies: 257 261 2854
-- Name: lote_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY lote
    ADD CONSTRAINT lote_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_entrada(idmotivo);


--
-- TOC entry 3104 (class 2606 OID 54044)
-- Dependencies: 307 257 2918
-- Name: lote_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY lote
    ADD CONSTRAINT lote_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3171 (class 2606 OID 54451)
-- Dependencies: 2924 311 313
-- Name: mapa_idmenu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_idmenu_fkey FOREIGN KEY (idmenu) REFERENCES menu(idmenu);


--
-- TOC entry 3170 (class 2606 OID 54446)
-- Dependencies: 292 313 2898
-- Name: mapa_idrol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_idrol_fkey FOREIGN KEY (idrol) REFERENCES rol(idrol);


--
-- TOC entry 3172 (class 2606 OID 54456)
-- Dependencies: 2918 313 307
-- Name: mapa_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3168 (class 2606 OID 54421)
-- Dependencies: 2922 311 310
-- Name: menu_idmodulo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_idmodulo_fkey FOREIGN KEY (idmodulo) REFERENCES modulo(idmodulo);


--
-- TOC entry 3169 (class 2606 OID 54426)
-- Dependencies: 307 311 2918
-- Name: menu_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3167 (class 2606 OID 54373)
-- Dependencies: 307 310 2918
-- Name: modulo_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT modulo_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3105 (class 2606 OID 54049)
-- Dependencies: 259 2918 307
-- Name: moneda_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY moneda
    ADD CONSTRAINT moneda_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3107 (class 2606 OID 54054)
-- Dependencies: 263 2918 307
-- Name: motivo_notabo_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY motivo_notabo_cliente
    ADD CONSTRAINT motivo_notabo_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3108 (class 2606 OID 54059)
-- Dependencies: 2918 265 307
-- Name: motivo_notabo_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY motivo_notabo_proveedor
    ADD CONSTRAINT motivo_notabo_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3109 (class 2606 OID 54064)
-- Dependencies: 267 2918 307
-- Name: motivo_notcar_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY motivo_notcar_cliente
    ADD CONSTRAINT motivo_notcar_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3110 (class 2606 OID 54069)
-- Dependencies: 269 307 2918
-- Name: motivo_notcar_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY motivo_notcar_proveedor
    ADD CONSTRAINT motivo_notcar_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3111 (class 2606 OID 54074)
-- Dependencies: 2918 271 307
-- Name: motivo_salida_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY motivo_salida
    ADD CONSTRAINT motivo_salida_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3106 (class 2606 OID 54079)
-- Dependencies: 261 2918 307
-- Name: motivoentrada_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY motivo_entrada
    ADD CONSTRAINT motivoentrada_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3179 (class 2606 OID 54543)
-- Dependencies: 321 2838 247 247 321
-- Name: movimiento_idalmacen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY movimiento
    ADD CONSTRAINT movimiento_idalmacen_fkey FOREIGN KEY (idalmacen, idproducto) REFERENCES existencia(idalmacen, idproducto);


--
-- TOC entry 3180 (class 2606 OID 54593)
-- Dependencies: 2894 321 288
-- Name: movimiento_idregentrada_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY movimiento
    ADD CONSTRAINT movimiento_idregentrada_fkey FOREIGN KEY (idregentrada) REFERENCES registro_entrada(idregentrada);


--
-- TOC entry 3181 (class 2606 OID 54598)
-- Dependencies: 290 2896 321
-- Name: movimiento_idregsalida_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY movimiento
    ADD CONSTRAINT movimiento_idregsalida_fkey FOREIGN KEY (idregsalida) REFERENCES registro_salida(idregsalida);


--
-- TOC entry 3112 (class 2606 OID 54084)
-- Dependencies: 273 2810 230
-- Name: notabo_cliente_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 3113 (class 2606 OID 54089)
-- Dependencies: 2856 273 263
-- Name: notabo_cliente_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_notabo_cliente(idmotivo);


--
-- TOC entry 3114 (class 2606 OID 54094)
-- Dependencies: 281 2884 273
-- Name: notabo_cliente_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 3115 (class 2606 OID 54099)
-- Dependencies: 273 306 2914
-- Name: notabo_cliente_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 3116 (class 2606 OID 54104)
-- Dependencies: 307 273 2918
-- Name: notabo_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3117 (class 2606 OID 54109)
-- Dependencies: 273 308 2920
-- Name: notabo_cliente_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor);


--
-- TOC entry 3118 (class 2606 OID 54114)
-- Dependencies: 2852 275 259
-- Name: notabo_proveedor_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 3119 (class 2606 OID 54119)
-- Dependencies: 2858 275 265
-- Name: notabo_proveedor_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_notabo_proveedor(idmotivo);


--
-- TOC entry 3120 (class 2606 OID 54124)
-- Dependencies: 275 281 2884
-- Name: notabo_proveedor_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 3121 (class 2606 OID 54129)
-- Dependencies: 275 2890 286
-- Name: notabo_proveedor_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 3122 (class 2606 OID 54134)
-- Dependencies: 2914 275 306
-- Name: notabo_proveedor_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 3123 (class 2606 OID 54139)
-- Dependencies: 2918 307 275
-- Name: notabo_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3124 (class 2606 OID 54144)
-- Dependencies: 230 2810 277
-- Name: notcar_cliente_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 3125 (class 2606 OID 54149)
-- Dependencies: 2860 277 267
-- Name: notcar_cliente_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_notcar_cliente(idmotivo);


--
-- TOC entry 3126 (class 2606 OID 54154)
-- Dependencies: 277 2884 281
-- Name: notcar_cliente_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 3127 (class 2606 OID 54159)
-- Dependencies: 2914 277 306
-- Name: notcar_cliente_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 3128 (class 2606 OID 54164)
-- Dependencies: 2918 277 307
-- Name: notcar_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3129 (class 2606 OID 54169)
-- Dependencies: 2920 308 277
-- Name: notcar_cliente_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor);


--
-- TOC entry 3130 (class 2606 OID 54174)
-- Dependencies: 2852 279 259
-- Name: notcar_proveedor_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 3131 (class 2606 OID 54179)
-- Dependencies: 279 2862 269
-- Name: notcar_proveedor_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_notcar_proveedor(idmotivo);


--
-- TOC entry 3132 (class 2606 OID 54184)
-- Dependencies: 279 281 2884
-- Name: notcar_proveedor_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 3133 (class 2606 OID 54189)
-- Dependencies: 286 279 2890
-- Name: notcar_proveedor_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 3134 (class 2606 OID 54194)
-- Dependencies: 2914 279 306
-- Name: notcar_proveedor_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 3135 (class 2606 OID 54199)
-- Dependencies: 2918 279 307
-- Name: notcar_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3183 (class 2606 OID 57503)
-- Dependencies: 255 324 2848
-- Name: orden_linea_idlinea_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY orden_linea
    ADD CONSTRAINT orden_linea_idlinea_fkey FOREIGN KEY (idlinea) REFERENCES linea(idlinea);


--
-- TOC entry 3182 (class 2606 OID 57498)
-- Dependencies: 324 2914 306
-- Name: orden_linea_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY orden_linea
    ADD CONSTRAINT orden_linea_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 3184 (class 2606 OID 57513)
-- Dependencies: 2918 324 307
-- Name: orden_linea_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY orden_linea
    ADD CONSTRAINT orden_linea_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3136 (class 2606 OID 54204)
-- Dependencies: 281 2918 307
-- Name: periodo_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY periodo
    ADD CONSTRAINT periodo_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3044 (class 2606 OID 54209)
-- Dependencies: 222 307 2918
-- Name: permiso_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY autorizacion
    ADD CONSTRAINT permiso_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3137 (class 2606 OID 54214)
-- Dependencies: 307 2918 283
-- Name: presentacion_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY presentacion
    ADD CONSTRAINT presentacion_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3138 (class 2606 OID 54219)
-- Dependencies: 2840 284 249
-- Name: producto_idfamilia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_idfamilia_fkey FOREIGN KEY (idfamilia) REFERENCES familia(idfamilia);


--
-- TOC entry 3139 (class 2606 OID 54224)
-- Dependencies: 2886 284 283
-- Name: producto_idpresentacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_idpresentacion_fkey FOREIGN KEY (idpresentacion) REFERENCES presentacion(idpresentacion);


--
-- TOC entry 3140 (class 2606 OID 54229)
-- Dependencies: 284 2900 301
-- Name: producto_idsublinea_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_idsublinea_fkey FOREIGN KEY (idsublinea) REFERENCES sublinea(idsublinea);


--
-- TOC entry 3141 (class 2606 OID 54234)
-- Dependencies: 2918 284 307
-- Name: producto_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3142 (class 2606 OID 54239)
-- Dependencies: 305 286 2912
-- Name: proveedor_idubigeo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY proveedor
    ADD CONSTRAINT proveedor_idubigeo_fkey FOREIGN KEY (idubigeo) REFERENCES ubigeo(idubigeo);


--
-- TOC entry 3143 (class 2606 OID 54244)
-- Dependencies: 307 2918 286
-- Name: proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY proveedor
    ADD CONSTRAINT proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3144 (class 2606 OID 54249)
-- Dependencies: 2794 216 288
-- Name: registro_entrada_idalmacen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_idalmacen_fkey FOREIGN KEY (idalmacen) REFERENCES almacen(idalmacen);


--
-- TOC entry 3145 (class 2606 OID 54254)
-- Dependencies: 244 288 2834
-- Name: registro_entrada_iddocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES documento(iddocumento);


--
-- TOC entry 3146 (class 2606 OID 54259)
-- Dependencies: 2854 288 261
-- Name: registro_entrada_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_entrada(idmotivo);


--
-- TOC entry 3147 (class 2606 OID 54264)
-- Dependencies: 2884 288 281
-- Name: registro_entrada_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 3148 (class 2606 OID 54269)
-- Dependencies: 288 2890 286
-- Name: registro_entrada_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 3149 (class 2606 OID 54274)
-- Dependencies: 288 2918 307
-- Name: registro_entrada_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3150 (class 2606 OID 54279)
-- Dependencies: 2816 234 290
-- Name: registro_salida_idcondicion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_idcondicion_fkey FOREIGN KEY (idcondicion) REFERENCES condicion_venta(idcondicion);


--
-- TOC entry 3151 (class 2606 OID 54284)
-- Dependencies: 2834 290 244
-- Name: registro_salida_iddocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES documento(iddocumento);


--
-- TOC entry 3152 (class 2606 OID 54289)
-- Dependencies: 290 271 2864
-- Name: registro_salida_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_salida(idmotivo);


--
-- TOC entry 3153 (class 2606 OID 54294)
-- Dependencies: 290 2884 281
-- Name: registro_salida_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 3156 (class 2606 OID 57459)
-- Dependencies: 290 2936 323
-- Name: registro_salida_idsituacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_idsituacion_fkey FOREIGN KEY (idsituacion) REFERENCES situacion_pedido(idsituacion);


--
-- TOC entry 3154 (class 2606 OID 54299)
-- Dependencies: 290 2914 306
-- Name: registro_salida_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 3155 (class 2606 OID 54304)
-- Dependencies: 2920 308 290
-- Name: registro_salida_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor);


--
-- TOC entry 3157 (class 2606 OID 54309)
-- Dependencies: 255 2848 301
-- Name: sublinea_idlinea_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY sublinea
    ADD CONSTRAINT sublinea_idlinea_fkey FOREIGN KEY (idlinea) REFERENCES linea(idlinea);


--
-- TOC entry 3158 (class 2606 OID 54314)
-- Dependencies: 301 307 2918
-- Name: sublinea_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY sublinea
    ADD CONSTRAINT sublinea_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3159 (class 2606 OID 54319)
-- Dependencies: 302 307 2918
-- Name: tipo_cuenta_bancaria_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY tipo_cuenta_bancaria
    ADD CONSTRAINT tipo_cuenta_bancaria_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3160 (class 2606 OID 54324)
-- Dependencies: 303 307 2918
-- Name: tipo_pago_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY tipo_pago
    ADD CONSTRAINT tipo_pago_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3161 (class 2606 OID 54329)
-- Dependencies: 304 307 2918
-- Name: tipo_persona_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY tipo_persona
    ADD CONSTRAINT tipo_persona_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3162 (class 2606 OID 54334)
-- Dependencies: 246 2836 306
-- Name: unidad_negocio_idempresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY unidad_negocio
    ADD CONSTRAINT unidad_negocio_idempresa_fkey FOREIGN KEY (idempresa) REFERENCES empresa(idempresa);


--
-- TOC entry 3163 (class 2606 OID 54339)
-- Dependencies: 306 305 2912
-- Name: unidad_negocio_idubigeo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY unidad_negocio
    ADD CONSTRAINT unidad_negocio_idubigeo_fkey FOREIGN KEY (idubigeo) REFERENCES ubigeo(idubigeo);


--
-- TOC entry 3164 (class 2606 OID 54344)
-- Dependencies: 2918 306 307
-- Name: unidad_negocio_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY unidad_negocio
    ADD CONSTRAINT unidad_negocio_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3165 (class 2606 OID 54349)
-- Dependencies: 292 307 2898
-- Name: usuario_idrol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_idrol_fkey FOREIGN KEY (idrol) REFERENCES rol(idrol);


--
-- TOC entry 3166 (class 2606 OID 54354)
-- Dependencies: 307 308 2918
-- Name: vendedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY vendedor
    ADD CONSTRAINT vendedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3293 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 3336 (class 0 OID 0)
-- Dependencies: 216
-- Name: almacen; Type: ACL; Schema: public; Owner: agewunue_farmacia
--

REVOKE ALL ON TABLE almacen FROM PUBLIC;
REVOKE ALL ON TABLE almacen FROM agewunue_farmacia;
GRANT ALL ON TABLE almacen TO agewunue_farmacia;


--
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 218
-- Name: amortizacion_cliente; Type: ACL; Schema: public; Owner: agewunue_farmacia
--

REVOKE ALL ON TABLE amortizacion_cliente FROM PUBLIC;
REVOKE ALL ON TABLE amortizacion_cliente FROM agewunue_farmacia;
GRANT ALL ON TABLE amortizacion_cliente TO agewunue_farmacia;


-- Completed on 2013-08-04 12:27:28

--
-- PostgreSQL database dump complete
--

