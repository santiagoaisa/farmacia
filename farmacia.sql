--
-- PostgreSQL database dump
--

-- Started on 2013-08-01 18:35:36

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 6 (class 2615 OID 745634)
-- Name: log; Type: SCHEMA; Schema: -; Owner: agewunue_farmacia
--

CREATE SCHEMA log;


ALTER SCHEMA log OWNER TO agewunue_farmacia;

--
-- TOC entry 983 (class 2612 OID 16388)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--


SET search_path = public, pg_catalog;

--
-- TOC entry 314 (class 1255 OID 16384)
-- Dependencies: 7
-- Name: plpgsql_call_handler(); Type: FUNCTION; Schema: public; Owner: postgres
--





--
-- TOC entry 322 (class 1255 OID 16385)
-- Dependencies: 7
-- Name: plpgsql_validator(oid); Type: FUNCTION; Schema: public; Owner: postgres
--


SET search_path = log, pg_catalog;

--
-- TOC entry 141 (class 1259 OID 745635)
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
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 141
-- Name: seq_log_almacen; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_almacen', 1, false);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 142 (class 1259 OID 745637)
-- Dependencies: 2314 2315 6
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
-- TOC entry 305 (class 1259 OID 747766)
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
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 305
-- Name: seq_log_autorizacion; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_autorizacion', 1, false);


--
-- TOC entry 306 (class 1259 OID 747768)
-- Dependencies: 2600 2601 6
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
-- TOC entry 143 (class 1259 OID 745645)
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
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 143
-- Name: seq_log_aval; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_aval', 1, false);


--
-- TOC entry 144 (class 1259 OID 745647)
-- Dependencies: 2316 2317 6
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
-- TOC entry 145 (class 1259 OID 745655)
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
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 145
-- Name: seq_log_banco; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_banco', 1, false);


--
-- TOC entry 146 (class 1259 OID 745657)
-- Dependencies: 2318 2319 6
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
-- TOC entry 147 (class 1259 OID 745665)
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
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 147
-- Name: seq_log_cheque_cliente; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_cheque_cliente', 1, false);


--
-- TOC entry 148 (class 1259 OID 745667)
-- Dependencies: 2320 2321 6
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
-- TOC entry 149 (class 1259 OID 745675)
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
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 149
-- Name: seq_log_cliente; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_cliente', 1, false);


--
-- TOC entry 150 (class 1259 OID 745677)
-- Dependencies: 2322 2323 6
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
-- TOC entry 151 (class 1259 OID 745685)
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
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 151
-- Name: seq_log_comprobante_emitido; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_comprobante_emitido', 1, false);


--
-- TOC entry 152 (class 1259 OID 745687)
-- Dependencies: 2324 2325 6
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
-- TOC entry 153 (class 1259 OID 745695)
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
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 153
-- Name: seq_log_condicion_venta; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_condicion_venta', 1, false);


--
-- TOC entry 154 (class 1259 OID 745697)
-- Dependencies: 2326 2327 6
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
-- TOC entry 155 (class 1259 OID 745705)
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
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 155
-- Name: seq_log_cuenta_bancaria; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_cuenta_bancaria', 1, false);


--
-- TOC entry 156 (class 1259 OID 745707)
-- Dependencies: 2328 2329 6
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
-- TOC entry 157 (class 1259 OID 745715)
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
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 157
-- Name: seq_log_cuenta_pagar; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_cuenta_pagar', 1, false);


--
-- TOC entry 158 (class 1259 OID 745717)
-- Dependencies: 2330 2331 6
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
-- TOC entry 159 (class 1259 OID 745725)
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
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 159
-- Name: seq_log_deposito_cliente; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_deposito_cliente', 1, false);


--
-- TOC entry 160 (class 1259 OID 745727)
-- Dependencies: 2332 2333 6
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
-- TOC entry 307 (class 1259 OID 747788)
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
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 307
-- Name: seq_log_detalle_autorizacion; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_detalle_autorizacion', 1, false);


--
-- TOC entry 308 (class 1259 OID 747790)
-- Dependencies: 2602 2603 6
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
-- TOC entry 161 (class 1259 OID 745735)
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
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 161
-- Name: seq_log_documento; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_documento', 1, false);


--
-- TOC entry 162 (class 1259 OID 745737)
-- Dependencies: 2334 2335 6
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
-- TOC entry 163 (class 1259 OID 745745)
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
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 163
-- Name: seq_log_empresa; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_empresa', 9, true);


--
-- TOC entry 164 (class 1259 OID 745747)
-- Dependencies: 2336 2337 6
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
-- TOC entry 165 (class 1259 OID 745755)
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
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 165
-- Name: seq_log_existencia; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_existencia', 1, false);


--
-- TOC entry 166 (class 1259 OID 745757)
-- Dependencies: 2338 2339 6
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
-- TOC entry 167 (class 1259 OID 745765)
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
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 167
-- Name: seq_log_familia; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_familia', 1, false);


--
-- TOC entry 168 (class 1259 OID 745767)
-- Dependencies: 2340 2341 6
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
-- TOC entry 169 (class 1259 OID 745775)
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
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 169
-- Name: seq_log_letra_proveedor; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_letra_proveedor', 1, false);


--
-- TOC entry 170 (class 1259 OID 745777)
-- Dependencies: 2342 2343 6
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
-- TOC entry 171 (class 1259 OID 745785)
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
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 171
-- Name: seq_log_linea; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_linea', 1, true);


--
-- TOC entry 172 (class 1259 OID 745787)
-- Dependencies: 2344 2345 6
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
-- TOC entry 173 (class 1259 OID 745795)
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
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 173
-- Name: seq_log_lote; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_lote', 1, false);


--
-- TOC entry 174 (class 1259 OID 745797)
-- Dependencies: 2346 2347 6
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
-- TOC entry 175 (class 1259 OID 745805)
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
-- TOC entry 3099 (class 0 OID 0)
-- Dependencies: 175
-- Name: seq_log_moneda; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_moneda', 1, false);


--
-- TOC entry 176 (class 1259 OID 745807)
-- Dependencies: 2348 2349 6
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
-- TOC entry 177 (class 1259 OID 745815)
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
-- TOC entry 3100 (class 0 OID 0)
-- Dependencies: 177
-- Name: seq_log_motivo_entrada; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_motivo_entrada', 1, false);


--
-- TOC entry 178 (class 1259 OID 745817)
-- Dependencies: 2350 2351 6
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
-- TOC entry 179 (class 1259 OID 745825)
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
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 179
-- Name: seq_log_motivo_notabo_cliente; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_motivo_notabo_cliente', 1, false);


--
-- TOC entry 180 (class 1259 OID 745827)
-- Dependencies: 2352 2353 6
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
-- TOC entry 181 (class 1259 OID 745835)
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
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 181
-- Name: seq_log_motivo_notabo_proveedor; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_motivo_notabo_proveedor', 1, false);


--
-- TOC entry 182 (class 1259 OID 745837)
-- Dependencies: 2354 2355 6
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
-- TOC entry 183 (class 1259 OID 745845)
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
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 183
-- Name: seq_log_motivo_notcar_cliente; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_motivo_notcar_cliente', 1, false);


--
-- TOC entry 184 (class 1259 OID 745847)
-- Dependencies: 2356 2357 6
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
-- TOC entry 185 (class 1259 OID 745855)
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
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 185
-- Name: seq_log_motivo_notcar_proveedor; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_motivo_notcar_proveedor', 1, false);


--
-- TOC entry 186 (class 1259 OID 745857)
-- Dependencies: 2358 2359 6
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
-- TOC entry 187 (class 1259 OID 745865)
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
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 187
-- Name: seq_log_motivo_salida; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_motivo_salida', 1, false);


--
-- TOC entry 188 (class 1259 OID 745867)
-- Dependencies: 2360 2361 6
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
-- TOC entry 189 (class 1259 OID 745875)
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
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 189
-- Name: seq_log_periodo; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_periodo', 1, false);


--
-- TOC entry 190 (class 1259 OID 745877)
-- Dependencies: 2362 2363 6
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
-- TOC entry 191 (class 1259 OID 745885)
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
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 191
-- Name: seq_log_presentacion; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_presentacion', 1, false);


--
-- TOC entry 192 (class 1259 OID 745887)
-- Dependencies: 2364 2365 6
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
-- TOC entry 193 (class 1259 OID 745895)
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
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 193
-- Name: seq_log_producto; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_producto', 1, false);


--
-- TOC entry 194 (class 1259 OID 745897)
-- Dependencies: 2366 2367 6
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
-- TOC entry 195 (class 1259 OID 745905)
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
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 195
-- Name: seq_log_proveedor; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_proveedor', 1, false);


--
-- TOC entry 196 (class 1259 OID 745907)
-- Dependencies: 2368 2369 6
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
-- TOC entry 197 (class 1259 OID 745915)
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
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 197
-- Name: seq_log_rol; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_rol', 1, false);


--
-- TOC entry 198 (class 1259 OID 745917)
-- Dependencies: 2370 2371 6
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
-- TOC entry 199 (class 1259 OID 745925)
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
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 199
-- Name: seq_log_sublinea; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_sublinea', 1, false);


--
-- TOC entry 200 (class 1259 OID 745927)
-- Dependencies: 2372 2373 6
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
-- TOC entry 201 (class 1259 OID 745935)
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
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 201
-- Name: seq_log_tipo_cuenta_bancaria; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_tipo_cuenta_bancaria', 1, false);


--
-- TOC entry 202 (class 1259 OID 745937)
-- Dependencies: 2374 2375 6
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
-- TOC entry 203 (class 1259 OID 745945)
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
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 203
-- Name: seq_log_tipo_pago; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_tipo_pago', 1, false);


--
-- TOC entry 204 (class 1259 OID 745947)
-- Dependencies: 2376 2377 6
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
-- TOC entry 205 (class 1259 OID 745955)
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
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 205
-- Name: seq_log_tipo_persona; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_tipo_persona', 1, false);


--
-- TOC entry 206 (class 1259 OID 745957)
-- Dependencies: 2378 2379 6
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
-- TOC entry 207 (class 1259 OID 745965)
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
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 207
-- Name: seq_log_unidad_negocio; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_unidad_negocio', 1, false);


--
-- TOC entry 208 (class 1259 OID 745967)
-- Dependencies: 2380 2381 6
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
-- TOC entry 209 (class 1259 OID 745975)
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
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 209
-- Name: seq_log_vendedor; Type: SEQUENCE SET; Schema: log; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_log_vendedor', 1, false);


--
-- TOC entry 210 (class 1259 OID 745977)
-- Dependencies: 2382 2383 6
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
-- TOC entry 211 (class 1259 OID 745985)
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
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 211
-- Name: seq_almacen; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_almacen', 1, false);


--
-- TOC entry 212 (class 1259 OID 745987)
-- Dependencies: 2384 2385 2386 7
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
-- TOC entry 213 (class 1259 OID 745993)
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
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 213
-- Name: seq_amortizacion_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_amortizacion_cliente', 1, false);


--
-- TOC entry 214 (class 1259 OID 745995)
-- Dependencies: 2387 2388 2389 2390 2391 2392 7
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
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.amortizacion_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 215 (class 1259 OID 746004)
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
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 215
-- Name: seq_amortizacion_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_amortizacion_proveedor', 1, false);


--
-- TOC entry 216 (class 1259 OID 746006)
-- Dependencies: 2393 2394 2395 2396 2397 7
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
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.amortizacion_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 302 (class 1259 OID 747740)
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
-- TOC entry 3122 (class 0 OID 0)
-- Dependencies: 302
-- Name: seq_autorizacion; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_autorizacion', 1, false);


--
-- TOC entry 301 (class 1259 OID 747729)
-- Dependencies: 2596 2597 7
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
-- TOC entry 217 (class 1259 OID 746014)
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
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 217
-- Name: seq_aval; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_aval', 1, false);


--
-- TOC entry 218 (class 1259 OID 746016)
-- Dependencies: 2398 2399 7
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
-- TOC entry 219 (class 1259 OID 746021)
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
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 219
-- Name: seq_banco; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_banco', 1, false);


--
-- TOC entry 220 (class 1259 OID 746023)
-- Dependencies: 2400 2401 7
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
-- TOC entry 221 (class 1259 OID 746028)
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
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 221
-- Name: seq_cheque_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_cheque_cliente', 1, false);


--
-- TOC entry 222 (class 1259 OID 746030)
-- Dependencies: 2402 2403 2404 2405 2406 7
-- Name: cheque_cliente; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE cheque_cliente (
    idcheque integer DEFAULT nextval('seq_cheque_cliente'::regclass) NOT NULL,
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
    dfecreg timestamp without time zone DEFAULT now(),
    idperiodo integer
);


ALTER TABLE public.cheque_cliente OWNER TO agewunue_farmacia;

--
-- TOC entry 223 (class 1259 OID 746038)
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
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 223
-- Name: seq_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_cliente', 1, false);


--
-- TOC entry 224 (class 1259 OID 746040)
-- Dependencies: 2407 2408 2409 2410 7
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
-- TOC entry 225 (class 1259 OID 746047)
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
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 225
-- Name: seq_comprobante_emitido; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_comprobante_emitido', 1, false);


--
-- TOC entry 226 (class 1259 OID 746049)
-- Dependencies: 2411 2412 2413 2414 2415 2416 2417 2418 2419 2420 2421 2422 2423 7
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
    idunidad integer
);


ALTER TABLE public.comprobante_emitido OWNER TO agewunue_farmacia;

--
-- TOC entry 227 (class 1259 OID 746065)
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
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 227
-- Name: seq_condicion_venta; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_condicion_venta', 1, false);


--
-- TOC entry 228 (class 1259 OID 746067)
-- Dependencies: 2424 2425 2426 2427 2428 7
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
-- TOC entry 229 (class 1259 OID 746075)
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
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 229
-- Name: seq_cuenta_bancaria; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_cuenta_bancaria', 1, false);


--
-- TOC entry 230 (class 1259 OID 746077)
-- Dependencies: 2429 2430 7
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
-- TOC entry 231 (class 1259 OID 746082)
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
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 231
-- Name: seq_cuenta_pagar; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_cuenta_pagar', 1, false);


--
-- TOC entry 232 (class 1259 OID 746084)
-- Dependencies: 2431 2432 2433 2434 2435 2436 2437 2438 2439 2440 2441 2442 2443 7
-- Name: cuenta_pagar; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE cuenta_pagar (
    idcuenta integer DEFAULT nextval('seq_cuenta_pagar'::regclass) NOT NULL,
    idregentrada integer,
    idperiodo integer,
    dfecha date,
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
    dfecven timestamp without time zone,
    dfecpago timestamp without time zone,
    nnotabo numeric(10,2) DEFAULT 0,
    nnotcar numeric(10,2) DEFAULT 0,
    ningreso numeric(10,2) DEFAULT 0,
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    idunidad integer
);


ALTER TABLE public.cuenta_pagar OWNER TO agewunue_farmacia;

--
-- TOC entry 233 (class 1259 OID 746100)
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
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 233
-- Name: seq_deposito_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_deposito_cliente', 1, false);


--
-- TOC entry 234 (class 1259 OID 746102)
-- Dependencies: 2444 2445 2446 2447 7
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
-- TOC entry 303 (class 1259 OID 747745)
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
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 303
-- Name: seq_detalle_autorizacion; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_detalle_autorizacion', 1, false);


--
-- TOC entry 304 (class 1259 OID 747747)
-- Dependencies: 2598 2599 7
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
-- TOC entry 235 (class 1259 OID 746109)
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
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 235
-- Name: seq_documento; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_documento', 1, false);


--
-- TOC entry 236 (class 1259 OID 746111)
-- Dependencies: 2448 2449 2450 2451 2452 2453 7
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
-- TOC entry 237 (class 1259 OID 746120)
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
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 237
-- Name: seq_empresa; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_empresa', 7, true);


--
-- TOC entry 238 (class 1259 OID 746122)
-- Dependencies: 2454 2455 7
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
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN empresa.cruta; Type: COMMENT; Schema: public; Owner: agewunue_farmacia
--

COMMENT ON COLUMN empresa.cruta IS 'ruta del logo de la empresa';


--
-- TOC entry 239 (class 1259 OID 746127)
-- Dependencies: 2456 2457 2458 2459 2460 2461 2462 7
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
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.existencia OWNER TO agewunue_farmacia;

--
-- TOC entry 240 (class 1259 OID 746137)
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
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 240
-- Name: seq_familia; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_familia', 1, false);


--
-- TOC entry 241 (class 1259 OID 746139)
-- Dependencies: 2463 2464 2465 7
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
-- TOC entry 242 (class 1259 OID 746145)
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
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 242
-- Name: seq_letra_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_letra_cliente', 1, false);


--
-- TOC entry 243 (class 1259 OID 746147)
-- Dependencies: 2466 2467 2468 2469 2470 2471 2472 2473 2474 7
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
-- TOC entry 244 (class 1259 OID 746159)
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
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 244
-- Name: seq_letra_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_letra_proveedor', 1, false);


--
-- TOC entry 245 (class 1259 OID 746161)
-- Dependencies: 2475 2476 2477 2478 2479 2480 2481 2482 7
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
    idunidad integer
);


ALTER TABLE public.letra_proveedor OWNER TO agewunue_farmacia;

--
-- TOC entry 246 (class 1259 OID 746172)
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
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 246
-- Name: seq_linea; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_linea', 1, true);


--
-- TOC entry 247 (class 1259 OID 746174)
-- Dependencies: 2483 2484 2485 2486 7
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
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE linea; Type: COMMENT; Schema: public; Owner: agewunue_farmacia
--

COMMENT ON TABLE linea IS 'linea de productos marcas o laboratorios';


--
-- TOC entry 248 (class 1259 OID 746181)
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
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 248
-- Name: seq_lote; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_lote', 1, false);


--
-- TOC entry 249 (class 1259 OID 746183)
-- Dependencies: 2487 2488 2489 7
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
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.lote OWNER TO agewunue_farmacia;

--
-- TOC entry 250 (class 1259 OID 746189)
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
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 250
-- Name: seq_moneda; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_moneda', 1, false);


--
-- TOC entry 251 (class 1259 OID 746191)
-- Dependencies: 2490 2491 2492 7
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
-- TOC entry 252 (class 1259 OID 746197)
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
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 252
-- Name: seq_motivo_entrada; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_motivo_entrada', 1, false);


--
-- TOC entry 253 (class 1259 OID 746199)
-- Dependencies: 2493 2494 2495 7
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
-- TOC entry 254 (class 1259 OID 746205)
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
-- TOC entry 3144 (class 0 OID 0)
-- Dependencies: 254
-- Name: seq_motivo_notabo_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_motivo_notabo_cliente', 1, false);


--
-- TOC entry 255 (class 1259 OID 746207)
-- Dependencies: 2496 2497 2498 2499 7
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
-- TOC entry 256 (class 1259 OID 746214)
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
-- TOC entry 3145 (class 0 OID 0)
-- Dependencies: 256
-- Name: seq_motivo_notabo_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_motivo_notabo_proveedor', 1, false);


--
-- TOC entry 257 (class 1259 OID 746216)
-- Dependencies: 2500 2501 7
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
-- TOC entry 258 (class 1259 OID 746221)
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
-- TOC entry 3146 (class 0 OID 0)
-- Dependencies: 258
-- Name: seq_motivo_notcar_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_motivo_notcar_cliente', 1, false);


--
-- TOC entry 259 (class 1259 OID 746223)
-- Dependencies: 2502 2503 7
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
-- TOC entry 260 (class 1259 OID 746228)
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
-- TOC entry 3147 (class 0 OID 0)
-- Dependencies: 260
-- Name: seq_motivo_notcar_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_motivo_notcar_proveedor', 1, false);


--
-- TOC entry 261 (class 1259 OID 746230)
-- Dependencies: 2504 7
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
-- TOC entry 262 (class 1259 OID 746234)
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
-- TOC entry 3148 (class 0 OID 0)
-- Dependencies: 262
-- Name: seq_motivo_salida; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_motivo_salida', 1, false);


--
-- TOC entry 263 (class 1259 OID 746236)
-- Dependencies: 2505 2506 2507 7
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
-- TOC entry 264 (class 1259 OID 746242)
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
-- TOC entry 3149 (class 0 OID 0)
-- Dependencies: 264
-- Name: seq_notabo_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_notabo_cliente', 1, false);


--
-- TOC entry 265 (class 1259 OID 746244)
-- Dependencies: 2508 2509 2510 2511 2512 2513 2514 2515 2516 2517 7
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
-- TOC entry 266 (class 1259 OID 746257)
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
-- TOC entry 3150 (class 0 OID 0)
-- Dependencies: 266
-- Name: seq_notabo_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_notabo_proveedor', 1, false);


--
-- TOC entry 267 (class 1259 OID 746259)
-- Dependencies: 2518 2519 2520 2521 2522 2523 2524 2525 2526 7
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
-- TOC entry 268 (class 1259 OID 746271)
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
-- TOC entry 3151 (class 0 OID 0)
-- Dependencies: 268
-- Name: seq_notcar_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_notcar_cliente', 1, false);


--
-- TOC entry 269 (class 1259 OID 746273)
-- Dependencies: 2527 2528 2529 2530 2531 2532 2533 2534 2535 2536 7
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
-- TOC entry 270 (class 1259 OID 746286)
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
-- TOC entry 3152 (class 0 OID 0)
-- Dependencies: 270
-- Name: seq_notcar_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_notcar_proveedor', 1, false);


--
-- TOC entry 271 (class 1259 OID 746288)
-- Dependencies: 2537 2538 2539 2540 2541 2542 2543 2544 2545 7
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
-- TOC entry 272 (class 1259 OID 746300)
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
-- TOC entry 3153 (class 0 OID 0)
-- Dependencies: 272
-- Name: seq_periodo; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_periodo', 1, false);


--
-- TOC entry 273 (class 1259 OID 746302)
-- Dependencies: 2546 2547 2548 7
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
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.periodo OWNER TO agewunue_farmacia;

--
-- TOC entry 274 (class 1259 OID 746308)
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
-- TOC entry 3154 (class 0 OID 0)
-- Dependencies: 274
-- Name: seq_presentacion; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_presentacion', 1, false);


--
-- TOC entry 275 (class 1259 OID 746310)
-- Dependencies: 2549 2550 2551 7
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
-- TOC entry 276 (class 1259 OID 746316)
-- Dependencies: 2552 2553 7
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
-- TOC entry 277 (class 1259 OID 746321)
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
-- TOC entry 3155 (class 0 OID 0)
-- Dependencies: 277
-- Name: seq_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_proveedor', 1, false);


--
-- TOC entry 278 (class 1259 OID 746323)
-- Dependencies: 2554 2555 2556 7
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
-- TOC entry 279 (class 1259 OID 746332)
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
-- TOC entry 3156 (class 0 OID 0)
-- Dependencies: 279
-- Name: seq_registro_entrada; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_registro_entrada', 1, false);


--
-- TOC entry 280 (class 1259 OID 746334)
-- Dependencies: 2557 2558 2559 2560 2561 2562 7
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
-- TOC entry 281 (class 1259 OID 746343)
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
-- TOC entry 3157 (class 0 OID 0)
-- Dependencies: 281
-- Name: seq_registro_salida; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_registro_salida', 1, false);


--
-- TOC entry 282 (class 1259 OID 746345)
-- Dependencies: 2563 2564 2565 2566 2567 2568 2569 2570 2571 2572 2573 2574 7
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
    idunidad integer
);


ALTER TABLE public.registro_salida OWNER TO agewunue_farmacia;

--
-- TOC entry 283 (class 1259 OID 746363)
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
-- TOC entry 3158 (class 0 OID 0)
-- Dependencies: 283
-- Name: seq_rol; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_rol', 5, true);


--
-- TOC entry 284 (class 1259 OID 746365)
-- Dependencies: 2575 2576 7
-- Name: rol; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE rol (
    idrol integer DEFAULT nextval('seq_rol'::regclass) NOT NULL,
    cnomrol character varying(30),
    dfecreg timestamp without time zone DEFAULT now()
);


ALTER TABLE public.rol OWNER TO agewunue_farmacia;

--
-- TOC entry 285 (class 1259 OID 746370)
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
-- TOC entry 3159 (class 0 OID 0)
-- Dependencies: 285
-- Name: seq_sublinea; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_sublinea', 1, false);


--
-- TOC entry 286 (class 1259 OID 746372)
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
-- TOC entry 3160 (class 0 OID 0)
-- Dependencies: 286
-- Name: seq_tipo_cuenta_bancaria; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_tipo_cuenta_bancaria', 1, false);


--
-- TOC entry 287 (class 1259 OID 746374)
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
-- TOC entry 3161 (class 0 OID 0)
-- Dependencies: 287
-- Name: seq_tipo_pago; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_tipo_pago', 1, false);


--
-- TOC entry 288 (class 1259 OID 746376)
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
-- TOC entry 3162 (class 0 OID 0)
-- Dependencies: 288
-- Name: seq_tipo_pago_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_tipo_pago_cliente', 1, false);


--
-- TOC entry 289 (class 1259 OID 746378)
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
-- TOC entry 3163 (class 0 OID 0)
-- Dependencies: 289
-- Name: seq_tipo_persona; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_tipo_persona', 1, false);


--
-- TOC entry 290 (class 1259 OID 746380)
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
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 290
-- Name: seq_unidad_negocio; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_unidad_negocio', 1, false);


--
-- TOC entry 291 (class 1259 OID 746382)
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
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 291
-- Name: seq_usuario; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_usuario', 2, true);


--
-- TOC entry 292 (class 1259 OID 746384)
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
-- TOC entry 3166 (class 0 OID 0)
-- Dependencies: 292
-- Name: seq_vendedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_vendedor', 1, false);


--
-- TOC entry 293 (class 1259 OID 746386)
-- Dependencies: 2577 2578 7
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
-- TOC entry 294 (class 1259 OID 746391)
-- Dependencies: 2579 2580 7
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
-- TOC entry 295 (class 1259 OID 746396)
-- Dependencies: 2581 2582 2583 2584 7
-- Name: tipo_pago; Type: TABLE; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

CREATE TABLE tipo_pago (
    idtipo integer DEFAULT nextval('seq_tipo_pago'::regclass) NOT NULL,
    cnomtipo character varying(30),
    ccodigosunat character(2),
    idusuario integer,
    dfecreg timestamp without time zone DEFAULT now(),
    bcobro boolean DEFAULT false,
    bpago boolean DEFAULT false
);


ALTER TABLE public.tipo_pago OWNER TO agewunue_farmacia;

--
-- TOC entry 296 (class 1259 OID 746403)
-- Dependencies: 2585 2586 7
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
-- TOC entry 297 (class 1259 OID 746408)
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
-- TOC entry 298 (class 1259 OID 746411)
-- Dependencies: 2587 2588 7
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
-- TOC entry 299 (class 1259 OID 746416)
-- Dependencies: 2589 2590 2591 2592 7
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
-- TOC entry 300 (class 1259 OID 746423)
-- Dependencies: 2593 2594 2595 7
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
-- TOC entry 2990 (class 0 OID 745637)
-- Dependencies: 142
-- Data for Name: log_almacen; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3073 (class 0 OID 747768)
-- Dependencies: 306
-- Data for Name: log_autorizacion; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 2991 (class 0 OID 745647)
-- Dependencies: 144
-- Data for Name: log_aval; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 2992 (class 0 OID 745657)
-- Dependencies: 146
-- Data for Name: log_banco; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 2993 (class 0 OID 745667)
-- Dependencies: 148
-- Data for Name: log_cheque_cliente; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 2994 (class 0 OID 745677)
-- Dependencies: 150
-- Data for Name: log_cliente; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 2995 (class 0 OID 745687)
-- Dependencies: 152
-- Data for Name: log_comprobante_emitido; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 2996 (class 0 OID 745697)
-- Dependencies: 154
-- Data for Name: log_condicion_venta; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 2997 (class 0 OID 745707)
-- Dependencies: 156
-- Data for Name: log_cuenta_bancaria; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 2998 (class 0 OID 745717)
-- Dependencies: 158
-- Data for Name: log_cuenta_pagar; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 2999 (class 0 OID 745727)
-- Dependencies: 160
-- Data for Name: log_deposito_cliente; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3074 (class 0 OID 747790)
-- Dependencies: 308
-- Data for Name: log_detalle_autorizacion; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3000 (class 0 OID 745737)
-- Dependencies: 162
-- Data for Name: log_documento; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3001 (class 0 OID 745747)
-- Dependencies: 164
-- Data for Name: log_empresa; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

INSERT INTO log_empresa (idlog, idempresa, cmotivo, cobservacion, idusuario, dfecreg) VALUES (1, 3, 'REGISTRO', '', 2, '2013-07-30 08:16:31.39');
INSERT INTO log_empresa (idlog, idempresa, cmotivo, cobservacion, idusuario, dfecreg) VALUES (2, 4, 'REGISTRO', ']', 2, '2013-07-30 08:19:22.355');
INSERT INTO log_empresa (idlog, idempresa, cmotivo, cobservacion, idusuario, dfecreg) VALUES (3, 5, 'REGISTRO', '[]', 2, '2013-07-30 08:22:07.137');
INSERT INTO log_empresa (idlog, idempresa, cmotivo, cobservacion, idusuario, dfecreg) VALUES (4, 6, 'REGISTRO', '[]', 2, '2013-07-30 08:25:13.719');
INSERT INTO log_empresa (idlog, idempresa, cmotivo, cobservacion, idusuario, dfecreg) VALUES (5, 7, 'REGISTRO', '[]', 2, '2013-07-30 08:28:15.97');
INSERT INTO log_empresa (idlog, idempresa, cmotivo, cobservacion, idusuario, dfecreg) VALUES (6, 5, 'ACTUALIZACION', '[IDEMPRESA:5|CNOMEMPRESA:DIMEXA S.A.|CRUC:20100220700|CDIRECCION:URB SANTA MARIA B-12|DFECINI:null|CTELEFONO:463787    |CFAX:463786    |CMOVIL:958020402 |CRUTA:null|IDUBIGEO:CAYMA|]', 2, '2013-07-30 08:51:01.317');
INSERT INTO log_empresa (idlog, idempresa, cmotivo, cobservacion, idusuario, dfecreg) VALUES (7, 4, 'ACTUALIZACION', '[IDEMPRESA:4|CNOMEMPRESA:ZARCILLO ZOLUCIONES |CRUC:20324499921|CDIRECCION:AV AVIACION 1104 FCO BOLOGNESI|DFECINI:null|CTELEFONO:20304002  |CFAX:132312    |CMOVIL:12312     |CRUTA:null|IDUBIGEO:CAYMA|]', 2, '2013-07-30 09:15:07.027');
INSERT INTO log_empresa (idlog, idempresa, cmotivo, cobservacion, idusuario, dfecreg) VALUES (8, 5, 'ACTUALIZACION', '[IDEMPRESA:5|CNOMEMPRESA:DIMEXA S.A.|CRUC:20100220700|CDIRECCION:URB SANTA MARIA B-12|DFECINI:null|CTELEFONO:463787    |CFAX:463786    |CMOVIL:958020402 |CRUTA:null|IDUBIGEO:CAYMA|]', 2, '2013-07-30 10:32:28.787');
INSERT INTO log_empresa (idlog, idempresa, cmotivo, cobservacion, idusuario, dfecreg) VALUES (9, 6, 'ACTUALIZACION', '[IDEMPRESA:6|CNOMEMPRESA:ESTA ES UNA EMPRESA|CRUC:20100220899|CDIRECCION:UNA DIRECCION|DFECINI:null|CTELEFONO:456090    |CFAX:123123    |CMOVIL:958020402 |CRUTA:null|IDUBIGEO:CAYMA|]', 2, '2013-07-30 10:32:38.995');


--
-- TOC entry 3002 (class 0 OID 745757)
-- Dependencies: 166
-- Data for Name: log_existencia; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3003 (class 0 OID 745767)
-- Dependencies: 168
-- Data for Name: log_familia; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3004 (class 0 OID 745777)
-- Dependencies: 170
-- Data for Name: log_letra_proveedor; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3005 (class 0 OID 745787)
-- Dependencies: 172
-- Data for Name: log_linea; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--

INSERT INTO log_linea (idlog, idlinea, cmotivo, cobservacion, idusuario, dfecreg) VALUES (1, 1, 'REGISTRO', '[IDLINEA:1|CNOMLINEA:UNA LINEA|BACTIVO:true|NINCREMENTO:0|]', 2, '2013-07-30 13:09:04.836');


--
-- TOC entry 3006 (class 0 OID 745797)
-- Dependencies: 174
-- Data for Name: log_lote; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3007 (class 0 OID 745807)
-- Dependencies: 176
-- Data for Name: log_moneda; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3008 (class 0 OID 745817)
-- Dependencies: 178
-- Data for Name: log_motivo_entrada; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3009 (class 0 OID 745827)
-- Dependencies: 180
-- Data for Name: log_motivo_notabo_cliente; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3010 (class 0 OID 745837)
-- Dependencies: 182
-- Data for Name: log_motivo_notabo_proveedor; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3011 (class 0 OID 745847)
-- Dependencies: 184
-- Data for Name: log_motivo_notcar_cliente; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3012 (class 0 OID 745857)
-- Dependencies: 186
-- Data for Name: log_motivo_notcar_proveedor; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3013 (class 0 OID 745867)
-- Dependencies: 188
-- Data for Name: log_motivo_salida; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3014 (class 0 OID 745877)
-- Dependencies: 190
-- Data for Name: log_periodo; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3015 (class 0 OID 745887)
-- Dependencies: 192
-- Data for Name: log_presentacion; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3016 (class 0 OID 745897)
-- Dependencies: 194
-- Data for Name: log_producto; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3017 (class 0 OID 745907)
-- Dependencies: 196
-- Data for Name: log_proveedor; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3018 (class 0 OID 745917)
-- Dependencies: 198
-- Data for Name: log_rol; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3019 (class 0 OID 745927)
-- Dependencies: 200
-- Data for Name: log_sublinea; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3020 (class 0 OID 745937)
-- Dependencies: 202
-- Data for Name: log_tipo_cuenta_bancaria; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3021 (class 0 OID 745947)
-- Dependencies: 204
-- Data for Name: log_tipo_pago; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3022 (class 0 OID 745957)
-- Dependencies: 206
-- Data for Name: log_tipo_persona; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3023 (class 0 OID 745967)
-- Dependencies: 208
-- Data for Name: log_unidad_negocio; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



--
-- TOC entry 3024 (class 0 OID 745977)
-- Dependencies: 210
-- Data for Name: log_vendedor; Type: TABLE DATA; Schema: log; Owner: agewunue_farmacia
--



SET search_path = public, pg_catalog;

--
-- TOC entry 3025 (class 0 OID 745987)
-- Dependencies: 212
-- Data for Name: almacen; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3026 (class 0 OID 745995)
-- Dependencies: 214
-- Data for Name: amortizacion_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3027 (class 0 OID 746006)
-- Dependencies: 216
-- Data for Name: amortizacion_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3071 (class 0 OID 747729)
-- Dependencies: 301
-- Data for Name: autorizacion; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3028 (class 0 OID 746016)
-- Dependencies: 218
-- Data for Name: aval; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3029 (class 0 OID 746023)
-- Dependencies: 220
-- Data for Name: banco; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3030 (class 0 OID 746030)
-- Dependencies: 222
-- Data for Name: cheque_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3031 (class 0 OID 746040)
-- Dependencies: 224
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3032 (class 0 OID 746049)
-- Dependencies: 226
-- Data for Name: comprobante_emitido; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3033 (class 0 OID 746067)
-- Dependencies: 228
-- Data for Name: condicion_venta; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3034 (class 0 OID 746077)
-- Dependencies: 230
-- Data for Name: cuenta_bancaria; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3035 (class 0 OID 746084)
-- Dependencies: 232
-- Data for Name: cuenta_pagar; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3036 (class 0 OID 746102)
-- Dependencies: 234
-- Data for Name: deposito_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3072 (class 0 OID 747747)
-- Dependencies: 304
-- Data for Name: detalle_autorizacion; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3037 (class 0 OID 746111)
-- Dependencies: 236
-- Data for Name: documento; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3038 (class 0 OID 746122)
-- Dependencies: 238
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

INSERT INTO empresa (idempresa, cnomempresa, cruc, cdireccion, idubigeo, dfecini, ctelefono, cfax, cmovil, cruta, idusuario, dfecreg) VALUES (1, 'UNA EMPRESA', '20100220700', 'AVV', '040201', NULL, '          ', '          ', '          ', NULL, 2, '2013-07-29 08:36:43.033');
INSERT INTO empresa (idempresa, cnomempresa, cruc, cdireccion, idubigeo, dfecini, ctelefono, cfax, cmovil, cruta, idusuario, dfecreg) VALUES (3, 'UNA EMPRESA', '20100220700', 'UNA DIRECCION', '040103', NULL, '463787    ', '1234877   ', '958020402 ', NULL, 2, '2013-07-30 08:16:31.297');
INSERT INTO empresa (idempresa, cnomempresa, cruc, cdireccion, idubigeo, dfecini, ctelefono, cfax, cmovil, cruta, idusuario, dfecreg) VALUES (4, 'ZARCILLO ZOLUCIONES ', '20324499921', 'AV AVIACION 1104 FCO BOLOGNESI', '040103', NULL, '20304002  ', '132312    ', '12312     ', NULL, 2, '2013-07-30 08:19:22.26');
INSERT INTO empresa (idempresa, cnomempresa, cruc, cdireccion, idubigeo, dfecini, ctelefono, cfax, cmovil, cruta, idusuario, dfecreg) VALUES (5, 'DIMEXA S.A.', '20100220700', 'URB SANTA MARIA B-12', '040103', NULL, '463787    ', '463786    ', '958020402 ', NULL, 2, '2013-07-30 08:22:07.043');
INSERT INTO empresa (idempresa, cnomempresa, cruc, cdireccion, idubigeo, dfecini, ctelefono, cfax, cmovil, cruta, idusuario, dfecreg) VALUES (6, 'ESTA ES UNA EMPRESA', '20100220899', 'UNA DIRECCION', '040103', NULL, '456090    ', '123123    ', '958020402 ', NULL, 2, '2013-07-30 08:25:13.622');
INSERT INTO empresa (idempresa, cnomempresa, cruc, cdireccion, idubigeo, dfecini, ctelefono, cfax, cmovil, cruta, idusuario, dfecreg) VALUES (7, 'UNA EMPRESA', '20100220700', 'ESTA ES UNA DIRECCION', '040112', NULL, '9580200   ', '34342     ', '95802402  ', NULL, 2, '2013-07-30 08:28:15.875');


--
-- TOC entry 3039 (class 0 OID 746127)
-- Dependencies: 239
-- Data for Name: existencia; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3040 (class 0 OID 746139)
-- Dependencies: 241
-- Data for Name: familia; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3041 (class 0 OID 746147)
-- Dependencies: 243
-- Data for Name: letra_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3042 (class 0 OID 746161)
-- Dependencies: 245
-- Data for Name: letra_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3043 (class 0 OID 746174)
-- Dependencies: 247
-- Data for Name: linea; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

INSERT INTO linea (idlinea, cnomlinea, idusuario, dfecreg, bactivo, nincremento) VALUES (1, 'UNA LINEA', 2, '2013-07-30 13:09:04.745', true, 0.00);


--
-- TOC entry 3044 (class 0 OID 746183)
-- Dependencies: 249
-- Data for Name: lote; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3045 (class 0 OID 746191)
-- Dependencies: 251
-- Data for Name: moneda; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3046 (class 0 OID 746199)
-- Dependencies: 253
-- Data for Name: motivo_entrada; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3047 (class 0 OID 746207)
-- Dependencies: 255
-- Data for Name: motivo_notabo_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3048 (class 0 OID 746216)
-- Dependencies: 257
-- Data for Name: motivo_notabo_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3049 (class 0 OID 746223)
-- Dependencies: 259
-- Data for Name: motivo_notcar_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3050 (class 0 OID 746230)
-- Dependencies: 261
-- Data for Name: motivo_notcar_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3051 (class 0 OID 746236)
-- Dependencies: 263
-- Data for Name: motivo_salida; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3052 (class 0 OID 746244)
-- Dependencies: 265
-- Data for Name: notabo_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3053 (class 0 OID 746259)
-- Dependencies: 267
-- Data for Name: notabo_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3054 (class 0 OID 746273)
-- Dependencies: 269
-- Data for Name: notcar_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3055 (class 0 OID 746288)
-- Dependencies: 271
-- Data for Name: notcar_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3056 (class 0 OID 746302)
-- Dependencies: 273
-- Data for Name: periodo; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3057 (class 0 OID 746310)
-- Dependencies: 275
-- Data for Name: presentacion; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3058 (class 0 OID 746316)
-- Dependencies: 276
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3059 (class 0 OID 746323)
-- Dependencies: 278
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3060 (class 0 OID 746334)
-- Dependencies: 280
-- Data for Name: registro_entrada; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3061 (class 0 OID 746345)
-- Dependencies: 282
-- Data for Name: registro_salida; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3062 (class 0 OID 746365)
-- Dependencies: 284
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

INSERT INTO rol (idrol, cnomrol, dfecreg) VALUES (1, 'ADMINISTRADOR', NULL);
INSERT INTO rol (idrol, cnomrol, dfecreg) VALUES (2, 'VENDEDOR', NULL);
INSERT INTO rol (idrol, cnomrol, dfecreg) VALUES (3, 'rol de prueba', NULL);
INSERT INTO rol (idrol, cnomrol, dfecreg) VALUES (4, 'rol de prueba', NULL);
INSERT INTO rol (idrol, cnomrol, dfecreg) VALUES (5, 'CRUD ROL PRUEBA', '2013-07-26 15:33:44.722');


--
-- TOC entry 3063 (class 0 OID 746386)
-- Dependencies: 293
-- Data for Name: sublinea; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3064 (class 0 OID 746391)
-- Dependencies: 294
-- Data for Name: tipo_cuenta_bancaria; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3065 (class 0 OID 746396)
-- Dependencies: 295
-- Data for Name: tipo_pago; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3066 (class 0 OID 746403)
-- Dependencies: 296
-- Data for Name: tipo_persona; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3067 (class 0 OID 746408)
-- Dependencies: 297
-- Data for Name: ubigeo; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010106', 'CHUQUIBAMBA', '01', '01', '06', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010107', 'GRANADA', '01', '01', '07', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('170400', 'PUERTO MALDONADO', '17', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020609', 'SHILLA', '02', '06', '09', 'ANCASH                   ', 'CARHUAZ                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020610', 'TINCO', '02', '06', '10', 'ANCASH                   ', 'CARHUAZ                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030202', 'ANDARAPA', '03', '02', '02', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030203', 'CHIARA', '03', '02', '03', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040407', 'HUANCARQUI', '04', '04', '07', 'AREQUIPA                 ', 'CASTILLA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040409', 'ORCOPAMPA', '04', '04', '09', 'AREQUIPA                 ', 'CASTILLA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050808', 'SAN JAVIER DE ALPABAMBA', '05', '08', '08', 'AYACUCHO                 ', 'PAUCAR DEL SARA SARA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061002', 'CHANCAY', '06', '10', '02', 'CAJAMARCA                ', 'SAN MARCOS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061003', 'EDUARDO VILLANUEVA', '06', '10', '03', 'CAJAMARCA                ', 'SAN MARCOS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081106', 'KOS¥IPATA', '08', '11', '06', 'CUSCO                    ', 'PAUCARTAMBO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100204', 'CONCHAMARCA', '10', '02', '04', 'HUANUCO                  ', 'AMBO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100206', 'SAN FRANCISCO', '10', '02', '06', 'HUANUCO                  ', 'AMBO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120133', 'SAPALLANGA', '12', '01', '33', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120134', 'SICAYA', '12', '01', '34', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130403', 'PUEBLO NUEVO', '13', '04', '03', 'LA LIBERTAD              ', 'CHEPEN                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130501', 'JULCAN', '13', '05', '01', 'LA LIBERTAD              ', 'JULCAN                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150135', 'SAN MARTIN DE PORRES', '15', '01', '35', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151029', 'TAURIPAMPA', '15', '10', '29', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200208', 'SAPILLICA', '20', '02', '08', 'PIURA                    ', 'AYABACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200209', 'SICCHEZ', '20', '02', '09', 'PIURA                    ', 'AYABACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210902', 'CONIMA', '21', '09', '02', 'PUNO                     ', 'MOHO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210903', 'HUAYRAPATA', '21', '09', '03', 'PUNO                     ', 'MOHO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010104', 'CHETO', '01', '01', '04', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010109', 'LA JALCA', '01', '01', '09', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021904', 'CASHAPAMPA', '02', '19', '04', 'ANCASH                   ', 'SIHUAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021909', 'SAN JUAN', '02', '19', '09', 'ANCASH                   ', 'SIHUAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('022004', 'MATACOTO', '02', '20', '04', 'ANCASH                   ', 'YUNGAY                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021900', 'SIHUAS', '02', '19', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060108', 'LOS BA¥OS DEL INCA', '06', '01', '08', 'CAJAMARCA                ', 'CAJAMARCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060200', 'CAJABAMBA', '06', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090704', 'AHUAYCHA', '09', '07', '04', 'HUANCAVELICA             ', 'TAYACAJA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090709', 'HUARIBAMBA', '09', '07', '09', 'HUANCAVELICA             ', 'TAYACAJA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100100', 'HUANUCO', '10', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130809', 'PATAZ', '13', '08', '09', 'LA LIBERTAD              ', 'PATAZ                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130813', 'URPAY', '13', '08', '13', 'LA LIBERTAD              ', 'PATAZ                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130905', 'MARCABAL', '13', '09', '05', 'LA LIBERTAD              ', 'SANCHEZ CARRION          ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('170300', 'TAHUAMANU', '17', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180300', 'ILO', '18', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010108', 'HUANCAS', '01', '01', '08', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010117', 'QUINJALCA', '01', '01', '17', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040402', 'ANDAGUA', '04', '04', '02', 'AREQUIPA                 ', 'CASTILLA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040408', 'MACHAGUAY', '04', '04', '08', 'AREQUIPA                 ', 'CASTILLA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100323', 'YANAS', '10', '03', '23', 'HUANUCO                  ', 'DOS DE MAYO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100502', 'ARANCAY', '10', '05', '02', 'HUANUCO                  ', 'HUAMALIES                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010110', 'LEIMEBAMBA', '01', '01', '10', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010111', 'LEVANTO', '01', '01', '11', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080605', 'PITUMARCA', '08', '06', '05', 'CUSCO                    ', 'CANCHIS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150103', 'ATE', '15', '01', '03', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151001', 'YAUYOS', '15', '10', '01', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160109', 'PUTUMAYO', '16', '01', '09', 'LORETO                   ', 'MAYNAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190301', 'OXAPAMPA', '19', '03', '01', 'PASCO                    ', 'OXAPAMPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220906', 'EL PORVENIR', '22', '09', '06', 'SAN MARTIN               ', 'SAN MARTIN               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('170100', 'TAMBOPATA', '17', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210700', 'LAMPA', '21', '07', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010112', 'MAGDALENA', '01', '01', '12', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010115', 'MONTEVIDEO', '01', '01', '15', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010119', 'SAN ISIDRO DE MAINO', '01', '01', '19', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010121', 'SONCHE', '01', '01', '21', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010203', 'COPALLIN', '01', '02', '03', 'AMAZONAS                 ', 'BAGUA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010301', 'JUMBILLA', '01', '03', '01', 'AMAZONAS                 ', 'BONGARA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010304', 'COROSHA', '01', '03', '04', 'AMAZONAS                 ', 'BONGARA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010306', 'FLORIDA', '01', '03', '06', 'AMAZONAS                 ', 'BONGARA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010310', 'SHIPASBAMBA', '01', '03', '10', 'AMAZONAS                 ', 'BONGARA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010401', 'NIEVA', '01', '04', '01', 'AMAZONAS                 ', 'CONDORCANQUI             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010403', 'RIO SANTIAGO', '01', '04', '03', 'AMAZONAS                 ', 'CONDORCANQUI             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010504', 'COLCAMAR', '01', '05', '04', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010507', 'LONGUITA', '01', '05', '07', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010509', 'LUYA', '01', '05', '09', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010513', 'OCUMAL', '01', '05', '13', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010516', 'SAN CRISTOBAL', '01', '05', '16', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010518', 'SAN JERONIMO', '01', '05', '18', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010522', 'TINGO', '01', '05', '22', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010601', 'SAN NICOLAS', '01', '06', '01', 'AMAZONAS                 ', 'RODRIGUEZ DE MENDOZA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010604', 'HUAMBO', '01', '06', '04', 'AMAZONAS                 ', 'RODRIGUEZ DE MENDOZA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010608', 'MILPUC', '01', '06', '08', 'AMAZONAS                 ', 'RODRIGUEZ DE MENDOZA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010610', 'SANTA ROSA', '01', '06', '10', 'AMAZONAS                 ', 'RODRIGUEZ DE MENDOZA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010701', 'BAGUA GRANDE', '01', '07', '01', 'AMAZONAS                 ', 'UTCUBAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010705', 'JAMALCA', '01', '07', '05', 'AMAZONAS                 ', 'UTCUBAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010707', 'YAMON', '01', '07', '07', 'AMAZONAS                 ', 'UTCUBAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020103', 'COLCABAMBA', '02', '01', '03', 'ANCASH                   ', 'HUARAZ                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020106', 'JANGAS', '02', '01', '06', 'ANCASH                   ', 'HUARAZ                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020109', 'PAMPAS', '02', '01', '09', 'ANCASH                   ', 'HUARAZ                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020112', 'TARICA', '02', '01', '12', 'ANCASH                   ', 'HUARAZ                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020203', 'HUACLLAN', '02', '02', '03', 'ANCASH                   ', 'AIJA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020301', 'LLAMELLIN', '02', '03', '01', 'ANCASH                   ', 'ANTONIO RAYMONDI         ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020303', 'CHACCHO', '02', '03', '03', 'ANCASH                   ', 'ANTONIO RAYMONDI         ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020401', 'CHACAS', '02', '04', '01', 'ANCASH                   ', 'ASUNCION                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020502', 'ABELARDO PARDO LEZAMETA', '02', '05', '02', 'ANCASH                   ', 'BOLOGNESI                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020504', 'AQUIA', '02', '05', '04', 'ANCASH                   ', 'BOLOGNESI                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020508', 'HUALLANCA', '02', '05', '08', 'ANCASH                   ', 'BOLOGNESI                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020511', 'LA PRIMAVERA', '02', '05', '11', 'ANCASH                   ', 'BOLOGNESI                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020513', 'PACLLON', '02', '05', '13', 'ANCASH                   ', 'BOLOGNESI                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020602', 'ACOPAMPA', '02', '06', '02', 'ANCASH                   ', 'CARHUAZ                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020604', 'ANTA', '02', '06', '04', 'ANCASH                   ', 'CARHUAZ                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020703', 'YAUYA', '02', '07', '03', 'ANCASH                   ', 'CARLOS F. FITZCARRALD    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020802', 'BUENA VISTA ALTA', '02', '08', '02', 'ANCASH                   ', 'CASMA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020901', 'CORONGO', '02', '09', '01', 'ANCASH                   ', 'CORONGO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020905', 'LA PAMPA', '02', '09', '05', 'ANCASH                   ', 'CORONGO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020907', 'YUPAN', '02', '09', '07', 'ANCASH                   ', 'CORONGO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021003', 'CAJAY', '02', '10', '03', 'ANCASH                   ', 'HUARI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021006', 'HUACCHIS', '02', '10', '06', 'ANCASH                   ', 'HUARI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021009', 'MASIN', '02', '10', '09', 'ANCASH                   ', 'HUARI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021011', 'PONTO', '02', '10', '11', 'ANCASH                   ', 'HUARI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021101', 'HUARMEY', '02', '11', '01', 'ANCASH                   ', 'HUARMEY                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021102', 'COCHAPETI', '02', '11', '02', 'ANCASH                   ', 'HUARMEY                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021104', 'HUAYAN', '02', '11', '04', 'ANCASH                   ', 'HUARMEY                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021203', 'HUATA', '02', '12', '03', 'ANCASH                   ', 'HUAYLAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021206', 'PAMPAROMAS', '02', '12', '06', 'ANCASH                   ', 'HUAYLAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021208', 'SANTA CRUZ', '02', '12', '08', 'ANCASH                   ', 'HUAYLAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021302', 'CASCA', '02', '13', '02', 'ANCASH                   ', 'MARISCAL LUZURIAGA       ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021305', 'LLAMA', '02', '13', '05', 'ANCASH                   ', 'MARISCAL LUZURIAGA       ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021307', 'LUCMA', '02', '13', '07', 'ANCASH                   ', 'MARISCAL LUZURIAGA       ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021403', 'CAJAMARQUILLA', '02', '14', '03', 'ANCASH                   ', 'OCROS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021405', 'COCHAS', '02', '14', '05', 'ANCASH                   ', 'OCROS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021408', 'SAN CRISTOBAL DE RAJAN', '02', '14', '08', 'ANCASH                   ', 'OCROS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021502', 'BOLOGNESI', '02', '15', '02', 'ANCASH                   ', 'PALLASCA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021504', 'HUACASCHUQUE', '02', '15', '04', 'ANCASH                   ', 'PALLASCA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021507', 'LLAPO', '02', '15', '07', 'ANCASH                   ', 'PALLASCA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021511', 'TAUCA', '02', '15', '11', 'ANCASH                   ', 'PALLASCA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021602', 'HUAYLLAN', '02', '16', '02', 'ANCASH                   ', 'POMABAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021701', 'RECUAY', '02', '17', '01', 'ANCASH                   ', 'RECUAY                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021704', 'HUAYLLAPAMPA', '02', '17', '04', 'ANCASH                   ', 'RECUAY                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021706', 'MARCA', '02', '17', '06', 'ANCASH                   ', 'RECUAY                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021708', 'PARARIN', '02', '17', '08', 'ANCASH                   ', 'RECUAY                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021802', 'CACERES DEL PERU', '02', '18', '02', 'ANCASH                   ', 'DEL SANTA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021805', 'MORO', '02', '18', '05', 'ANCASH                   ', 'DEL SANTA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021807', 'SAMANCO', '02', '18', '07', 'ANCASH                   ', 'DEL SANTA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021902', 'ACOBAMBA', '02', '19', '02', 'ANCASH                   ', 'SIHUAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021905', 'CHINGALPO', '02', '19', '05', 'ANCASH                   ', 'SIHUAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021907', 'QUICHES', '02', '19', '07', 'ANCASH                   ', 'SIHUAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('022001', 'YUNGAY', '02', '20', '01', 'ANCASH                   ', 'YUNGAY                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('022003', 'MANCOS', '02', '20', '03', 'ANCASH                   ', 'YUNGAY                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('022006', 'RANRAHIRCA', '02', '20', '06', 'ANCASH                   ', 'YUNGAY                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030102', 'CHACOCHE', '03', '01', '02', 'APURIMAC                 ', 'ABANCAY                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030104', 'CURAHUASI', '03', '01', '04', 'APURIMAC                 ', 'ABANCAY                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030201', 'ANDAHUAYLAS', '03', '02', '01', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030207', 'KISHUARA', '03', '02', '07', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030209', 'PACUCHA', '03', '02', '09', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030212', 'SAN ANTONIO DE CACHI', '03', '02', '12', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030216', 'TALAVERA', '03', '02', '16', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030218', 'TURPO', '03', '02', '18', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030302', 'EL ORO', '03', '03', '02', 'APURIMAC                 ', 'ANTABAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030306', 'PACHACONAS', '03', '03', '06', 'APURIMAC                 ', 'ANTABAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030401', 'CHALHUANCA', '03', '04', '01', 'APURIMAC                 ', 'AYMARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030404', 'CHAPIMARCA', '03', '04', '04', 'APURIMAC                 ', 'AYMARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030408', 'JUSTO APU SAHUARAURA', '03', '04', '08', 'APURIMAC                 ', 'AYMARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030410', 'POCOHUANCA', '03', '04', '10', 'APURIMAC                 ', 'AYMARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030413', 'SORAYA', '03', '04', '13', 'APURIMAC                 ', 'AYMARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030416', 'TORAYA', '03', '04', '16', 'APURIMAC                 ', 'AYMARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030502', 'COTABAMBAS', '03', '05', '02', 'APURIMAC                 ', 'COTABAMBAS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030505', 'MARA', '03', '05', '05', 'APURIMAC                 ', 'COTABAMBAS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030602', 'ANCO_HUALLO', '03', '06', '02', 'APURIMAC                 ', 'CHINCHEROS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030605', 'OCOBAMBA', '03', '06', '05', 'APURIMAC                 ', 'CHINCHEROS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030607', 'URANMARCA', '03', '06', '07', 'APURIMAC                 ', 'CHINCHEROS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030703', 'GAMARRA', '03', '07', '03', 'APURIMAC                 ', 'GRAU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030706', 'MICAELA BASTIDAS', '03', '07', '06', 'APURIMAC                 ', 'GRAU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030708', 'PROGRESO', '03', '07', '08', 'APURIMAC                 ', 'GRAU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030712', 'VILCABAMBA', '03', '07', '12', 'APURIMAC                 ', 'GRAU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040101', 'AREQUIPA', '04', '01', '01', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040103', 'CAYMA', '04', '01', '03', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040105', 'CHARACATO', '04', '01', '05', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040109', 'MARIANO MELGAR', '04', '01', '09', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040112', 'PAUCARPATA', '04', '01', '12', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040114', 'POLOBAYA', '04', '01', '14', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040118', 'SAN JUAN DE SIGUAS', '04', '01', '18', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040121', 'SANTA RITA DE SIGUAS', '04', '01', '21', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040123', 'TIABAYA', '04', '01', '23', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040127', 'YARABAMBA', '04', '01', '27', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040129', 'JOSE LUIS BUSTAMANTE Y RIVERO', '04', '01', '29', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040203', 'MARIANO NICOLAS VALCARCEL', '04', '02', '03', 'AREQUIPA                 ', 'CAMANA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040207', 'QUILCA', '04', '02', '07', 'AREQUIPA                 ', 'CAMANA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040301', 'CARAVELI', '04', '03', '01', 'AREQUIPA                 ', 'CARAVELI                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040304', 'ATIQUIPA', '04', '03', '04', 'AREQUIPA                 ', 'CARAVELI                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040308', 'CHAPARRA', '04', '03', '08', 'AREQUIPA                 ', 'CARAVELI                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040310', 'JAQUI', '04', '03', '10', 'AREQUIPA                 ', 'CARAVELI                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040313', 'YAUCA', '04', '03', '13', 'AREQUIPA                 ', 'CARAVELI                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040410', 'PAMPACOLCA', '04', '04', '10', 'AREQUIPA                 ', 'CASTILLA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040413', 'URACA', '04', '04', '13', 'AREQUIPA                 ', 'CASTILLA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040502', 'ACHOMA', '04', '05', '02', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040505', 'CAYLLOMA', '04', '05', '05', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040508', 'HUANCA', '04', '05', '08', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040510', 'LARI', '04', '05', '10', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040514', 'SAN ANTONIO DE CHUCA', '04', '05', '14', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040517', 'TISCO', '04', '05', '17', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040519', 'YANQUE', '04', '05', '19', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040604', 'CHICHAS', '04', '06', '04', 'AREQUIPA                 ', 'CONDESUYOS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040607', 'SALAMANCA', '04', '06', '07', 'AREQUIPA                 ', 'CONDESUYOS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040701', 'MOLLENDO', '04', '07', '01', 'AREQUIPA                 ', 'ISLAY                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040705', 'MEJIA', '04', '07', '05', 'AREQUIPA                 ', 'ISLAY                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040801', 'COTAHUASI', '04', '08', '01', 'AREQUIPA                 ', 'LA UNION                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040804', 'HUAYNACOTAS', '04', '08', '04', 'AREQUIPA                 ', 'LA UNION                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040808', 'SAYLA', '04', '08', '08', 'AREQUIPA                 ', 'LA UNION                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040810', 'TOMEPAMPA', '04', '08', '10', 'AREQUIPA                 ', 'LA UNION                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050102', 'ACOCRO', '05', '01', '02', 'AYACUCHO                 ', 'HUAMANGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050106', 'OCROS', '05', '01', '06', 'AYACUCHO                 ', 'HUAMANGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050108', 'QUINUA', '05', '01', '08', 'AYACUCHO                 ', 'HUAMANGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050111', 'SANTIAGO DE PISCHA', '05', '01', '11', 'AYACUCHO                 ', 'HUAMANGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050201', 'CANGALLO', '05', '02', '01', 'AYACUCHO                 ', 'CANGALLO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050203', 'LOS MOROCHUCOS', '05', '02', '03', 'AYACUCHO                 ', 'CANGALLO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050206', 'TOTOS', '05', '02', '06', 'AYACUCHO                 ', 'CANGALLO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050303', 'SACSAMARCA', '05', '03', '03', 'AYACUCHO                 ', 'HUANCA SANCOS            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050402', 'AYAHUANCO', '05', '04', '02', 'AYACUCHO                 ', 'HUANTA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050404', 'IGUAIN', '05', '04', '04', 'AYACUCHO                 ', 'HUANTA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050501', 'SAN MIGUEL', '05', '05', '01', 'AYACUCHO                 ', 'LA MAR                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050504', 'CHILCAS', '05', '05', '04', 'AYACUCHO                 ', 'LA MAR                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050506', 'LUIS CARRANZA', '05', '05', '06', 'AYACUCHO                 ', 'LA MAR                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050602', 'AUCARA', '05', '06', '02', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050605', 'CHAVI¥A', '05', '06', '05', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050607', 'HUAC-HUAS', '05', '06', '07', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050611', 'LUCANAS', '05', '06', '11', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050614', 'SAISA', '05', '06', '14', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050616', 'SAN JUAN', '05', '06', '16', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050620', 'SANTA ANA DE HUAYCAHUACHO', '05', '06', '20', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050702', 'CHUMPI', '05', '07', '02', 'AYACUCHO                 ', 'PARINACOCHAS             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050704', 'PACAPAUSA', '05', '07', '04', 'AYACUCHO                 ', 'PARINACOCHAS             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050708', 'UPAHUACHO', '05', '07', '08', 'AYACUCHO                 ', 'PARINACOCHAS             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050802', 'COLTA', '05', '08', '02', 'AYACUCHO                 ', 'PAUCAR DEL SARA SARA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050901', 'QUEROBAMBA', '05', '09', '01', 'AYACUCHO                 ', 'SUCRE                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050904', 'CHILCAYOC', '05', '09', '04', 'AYACUCHO                 ', 'SUCRE                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050907', 'PAICO', '05', '09', '07', 'AYACUCHO                 ', 'SUCRE                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050910', 'SANTIAGO DE PAUCARAY', '05', '09', '10', 'AYACUCHO                 ', 'SUCRE                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051002', 'ALCAMENCA', '05', '10', '02', 'AYACUCHO                 ', 'VICTOR FAJARDO           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051004', 'ASQUIPATA', '05', '10', '04', 'AYACUCHO                 ', 'VICTOR FAJARDO           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051008', 'HUAMANQUIQUIA', '05', '10', '08', 'AYACUCHO                 ', 'VICTOR FAJARDO           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051011', 'SARHUA', '05', '10', '11', 'AYACUCHO                 ', 'VICTOR FAJARDO           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051101', 'VILCAS HUAMAN', '05', '11', '01', 'AYACUCHO                 ', 'VILCAS HUAMAN            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051105', 'HUAMBALPA', '05', '11', '05', 'AYACUCHO                 ', 'VILCAS HUAMAN            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051108', 'VISCHONGO', '05', '11', '08', 'AYACUCHO                 ', 'VILCAS HUAMAN            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060102', 'ASUNCION', '06', '01', '02', 'CAJAMARCA                ', 'CAJAMARCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060106', 'JESUS', '06', '01', '06', 'CAJAMARCA                ', 'CAJAMARCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060109', 'MAGDALENA', '06', '01', '09', 'CAJAMARCA                ', 'CAJAMARCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060111', 'NAMORA', '06', '01', '11', 'CAJAMARCA                ', 'CAJAMARCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060203', 'CONDEBAMBA', '06', '02', '03', 'CAJAMARCA                ', 'CAJABAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060301', 'CELENDIN', '06', '03', '01', 'CAJAMARCA                ', 'CELENDIN                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060304', 'HUASMIN', '06', '03', '04', 'CAJAMARCA                ', 'CELENDIN                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060308', 'OXAMARCA', '06', '03', '08', 'CAJAMARCA                ', 'CELENDIN                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060310', 'SUCRE', '06', '03', '10', 'CAJAMARCA                ', 'CELENDIN                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060401', 'CHOTA', '06', '04', '01', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060405', 'CHIMBAN', '06', '04', '05', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060407', 'COCHABAMBA', '06', '04', '07', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060410', 'LAJAS', '06', '04', '10', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060413', 'PACCHA', '06', '04', '13', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060416', 'SAN JUAN DE LICUPIS', '06', '04', '16', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060419', 'CHALAMARCA', '06', '04', '19', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060503', 'CUPISNIQUE', '06', '05', '03', 'CAJAMARCA                ', 'CONTUMAZA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060506', 'SANTA CRUZ DE TOLED', '06', '05', '06', 'CAJAMARCA                ', 'CONTUMAZA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060508', 'YONAN', '06', '05', '08', 'CAJAMARCA                ', 'CONTUMAZA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060604', 'CUJILLO', '06', '06', '04', 'CAJAMARCA                ', 'CUTERVO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060607', 'QUEROCOTILLO', '06', '06', '07', 'CAJAMARCA                ', 'CUTERVO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060609', 'SAN JUAN DE CUTERVO', '06', '06', '09', 'CAJAMARCA                ', 'CUTERVO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060613', 'SANTO TOMAS', '06', '06', '13', 'CAJAMARCA                ', 'CUTERVO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060701', 'BAMBAMARCA', '06', '07', '01', 'CAJAMARCA                ', 'HUALGAYOC                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060703', 'HUALGAYOC', '06', '07', '03', 'CAJAMARCA                ', 'HUALGAYOC                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060804', 'COLASAY', '06', '08', '04', 'CAJAMARCA                ', 'JAEN                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060806', 'LAS PIRIAS', '06', '08', '06', 'CAJAMARCA                ', 'JAEN                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060809', 'SALLIQUE', '06', '08', '09', 'CAJAMARCA                ', 'JAEN                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060901', 'SAN IGNACIO', '06', '09', '01', 'CAJAMARCA                ', 'SAN IGNACIO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060903', 'HUARANGO', '06', '09', '03', 'CAJAMARCA                ', 'SAN IGNACIO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060907', 'TABACONAS', '06', '09', '07', 'CAJAMARCA                ', 'SAN IGNACIO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061007', 'JOSE SABOGAL', '06', '10', '07', 'CAJAMARCA                ', 'SAN MARCOS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061102', 'BOLIVAR', '06', '11', '02', 'CAJAMARCA                ', 'SAN MIGUEL               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061105', 'EL PRADO', '06', '11', '05', 'CAJAMARCA                ', 'SAN MIGUEL               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061109', 'NIEPOS', '06', '11', '09', 'CAJAMARCA                ', 'SAN MIGUEL               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061111', 'SAN SILVESTRE DE COCHAN', '06', '11', '11', 'CAJAMARCA                ', 'SAN MIGUEL               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061201', 'SAN PABLO', '06', '12', '01', 'CAJAMARCA                ', 'SAN PABLO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061204', 'TUMBADEN', '06', '12', '04', 'CAJAMARCA                ', 'SAN PABLO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061303', 'CATACHE', '06', '13', '03', 'CAJAMARCA                ', 'SANTA CRUZ               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061306', 'NINABAMBA', '06', '13', '06', 'CAJAMARCA                ', 'SANTA CRUZ               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061309', 'SEXI', '06', '13', '09', 'CAJAMARCA                ', 'SANTA CRUZ               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('070101', 'CALLAO', '07', '01', '01', 'CALLAO                   ', 'CALLAO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('070103', 'CARMEN DE LA LEGUA REYNOSO', '07', '01', '03', 'CALLAO                   ', 'CALLAO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080101', 'CUSCO', '08', '01', '01', 'CUSCO                    ', 'CUSCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080104', 'SAN JERONIMO', '08', '01', '04', 'CUSCO                    ', 'CUSCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080106', 'SANTIAGO', '08', '01', '06', 'CUSCO                    ', 'CUSCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080202', 'ACOPIA', '08', '02', '02', 'CUSCO                    ', 'ACOMAYO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080205', 'POMACANCHI', '08', '02', '05', 'CUSCO                    ', 'ACOMAYO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080207', 'SANGARARA', '08', '02', '07', 'CUSCO                    ', 'ACOMAYO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080304', 'CHINCHAYPUJIO', '08', '03', '04', 'CUSCO                    ', 'ANTA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080306', 'LIMATAMBO', '08', '03', '06', 'CUSCO                    ', 'ANTA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080309', 'ZURITE', '08', '03', '09', 'CUSCO                    ', 'ANTA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080404', 'LARES', '08', '04', '04', 'CUSCO                    ', 'CALCA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080406', 'SAN SALVADOR', '08', '04', '06', 'CUSCO                    ', 'CALCA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080501', 'YANAOCA', '08', '05', '01', 'CUSCO                    ', 'CANAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080505', 'LAYO', '08', '05', '05', 'CUSCO                    ', 'CANAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080507', 'QUEHUE', '08', '05', '07', 'CUSCO                    ', 'CANAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080602', 'CHECACUPE', '08', '06', '02', 'CUSCO                    ', 'CANCHIS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080606', 'SAN PABLO', '08', '06', '06', 'CUSCO                    ', 'CANCHIS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080608', 'TINTA', '08', '06', '08', 'CUSCO                    ', 'CANCHIS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080703', 'CHAMACA', '08', '07', '03', 'CUSCO                    ', 'CHUMBIVILCAS             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080706', 'LLUSCO', '08', '07', '06', 'CUSCO                    ', 'CHUMBIVILCAS             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080801', 'ESPINAR', '08', '08', '01', 'CUSCO                    ', 'ESPINAR                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080803', 'COPORAQUE', '08', '08', '03', 'CUSCO                    ', 'ESPINAR                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080807', 'SUYCKUTAMBO', '08', '08', '07', 'CUSCO                    ', 'ESPINAR                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080902', 'ECHARATE', '08', '09', '02', 'CUSCO                    ', 'LA CONVENCION            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080904', 'MARANURA', '08', '09', '04', 'CUSCO                    ', 'LA CONVENCION            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080909', 'VILCABAMBA', '08', '09', '09', 'CUSCO                    ', 'LA CONVENCION            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081001', 'PARURO', '08', '10', '01', 'CUSCO                    ', 'PARURO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081003', 'CCAPI', '08', '10', '03', 'CUSCO                    ', 'PARURO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081008', 'PILLPINTO', '08', '10', '08', 'CUSCO                    ', 'PARURO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081201', 'URCOS', '08', '12', '01', 'CUSCO                    ', 'QUISPICANCHI             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081204', 'CCARHUAYO', '08', '12', '04', 'CUSCO                    ', 'QUISPICANCHI             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081208', 'LUCRE', '08', '12', '08', 'CUSCO                    ', 'QUISPICANCHI             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081211', 'OROPESA', '08', '12', '11', 'CUSCO                    ', 'QUISPICANCHI             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081302', 'CHINCHERO', '08', '13', '02', 'CUSCO                    ', 'URUBAMBA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081306', 'OLLANTAYTAMBO', '08', '13', '06', 'CUSCO                    ', 'URUBAMBA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081307', 'YUCAY', '08', '13', '07', 'CUSCO                    ', 'URUBAMBA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090102', 'ACOBAMBILLA', '09', '01', '02', 'HUANCAVELICA             ', 'HUANCAVELICA             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090108', 'IZCUCHACA', '09', '01', '08', 'HUANCAVELICA             ', 'HUANCAVELICA             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090109', 'LARIA', '09', '01', '09', 'HUANCAVELICA             ', 'HUANCAVELICA             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090113', 'NUEVO OCCORO', '09', '01', '13', 'HUANCAVELICA             ', 'HUANCAVELICA             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090115', 'PILCHACA', '09', '01', '15', 'HUANCAVELICA             ', 'HUANCAVELICA             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090202', 'ANDABAMBA', '09', '02', '02', 'HUANCAVELICA             ', 'ACOBAMBA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090203', 'ANTA', '09', '02', '03', 'HUANCAVELICA             ', 'ACOBAMBA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090208', 'ROSARIO', '09', '02', '08', 'HUANCAVELICA             ', 'ACOBAMBA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090303', 'CALLANMARCA', '09', '03', '03', 'HUANCAVELICA             ', 'ANGARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090305', 'CHINCHO', '09', '03', '05', 'HUANCAVELICA             ', 'ANGARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090309', 'JULCAMARCA', '09', '03', '09', 'HUANCAVELICA             ', 'ANGARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090312', 'SECCLLA', '09', '03', '12', 'HUANCAVELICA             ', 'ANGARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090401', 'CASTROVIRREYNA', '09', '04', '01', 'HUANCAVELICA             ', 'CASTROVIRREYNA           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090405', 'CHUPAMARCA', '09', '04', '05', 'HUANCAVELICA             ', 'CASTROVIRREYNA           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090407', 'HUACHOS', '09', '04', '07', 'HUANCAVELICA             ', 'CASTROVIRREYNA           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090410', 'SAN JUAN', '09', '04', '10', 'HUANCAVELICA             ', 'CASTROVIRREYNA           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090501', 'CHURCAMPA', '09', '05', '01', 'HUANCAVELICA             ', 'CHURCAMPA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090504', 'EL CARMEN', '09', '05', '04', 'HUANCAVELICA             ', 'CHURCAMPA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090507', 'PAUCARBAMBA', '09', '05', '07', 'HUANCAVELICA             ', 'CHURCAMPA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090602', 'AYAVI', '09', '06', '02', 'HUANCAVELICA             ', 'HUAYTARA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090604', 'HUAYACUNDO ARMA', '09', '06', '04', 'HUANCAVELICA             ', 'HUAYTARA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090607', 'PILPICHACA', '09', '06', '07', 'HUANCAVELICA             ', 'HUAYTARA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090611', 'SAN FRANCISCO DE SANGAYAICO', '09', '06', '11', 'HUANCAVELICA             ', 'HUAYTARA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090613', 'SANTIAGO DE CHOCORVOS', '09', '06', '13', 'HUANCAVELICA             ', 'HUAYTARA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090616', 'TAMBO', '09', '06', '16', 'HUANCAVELICA             ', 'HUAYTARA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090703', 'ACRAQUIA', '09', '07', '03', 'HUANCAVELICA             ', 'TAYACAJA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090706', 'DANIEL HERNANDEZ', '09', '07', '06', 'HUANCAVELICA             ', 'TAYACAJA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090708', 'HUANDO', '09', '07', '08', 'HUANCAVELICA             ', 'TAYACAJA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090712', 'PACHAMARCA', '09', '07', '12', 'HUANCAVELICA             ', 'TAYACAJA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090714', 'SALCABAMBA', '09', '07', '14', 'HUANCAVELICA             ', 'TAYACAJA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090717', 'SURCUBAMBA', '09', '07', '17', 'HUANCAVELICA             ', 'TAYACAJA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100101', 'HUANUCO', '10', '01', '01', 'HUANUCO                  ', 'HUANUCO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100104', 'CHURUBAMBA', '10', '01', '04', 'HUANUCO                  ', 'HUANUCO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100108', 'SAN PEDRO DE CHAULAN', '10', '01', '08', 'HUANUCO                  ', 'HUANUCO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100201', 'AMBO', '10', '02', '01', 'HUANUCO                  ', 'AMBO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100202', 'CAYNA', '10', '02', '02', 'HUANUCO                  ', 'AMBO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100301', 'LA UNION', '10', '03', '01', 'HUANUCO                  ', 'DOS DE MAYO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100311', 'MARIAS', '10', '03', '11', 'HUANUCO                  ', 'DOS DE MAYO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100321', 'SHUNQUI', '10', '03', '21', 'HUANUCO                  ', 'DOS DE MAYO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100401', 'HUACAYBAMBA', '10', '04', '01', 'HUANUCO                  ', 'HUACAYBAMBA              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100403', 'COCHABAMBA', '10', '04', '03', 'HUANUCO                  ', 'HUACAYBAMBA              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100503', 'CHAVIN DE PARIARCA', '10', '05', '03', 'HUANUCO                  ', 'HUAMALIES                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100505', 'JIRCAN', '10', '05', '05', 'HUANUCO                  ', 'HUAMALIES                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100508', 'PUNCHAO', '10', '05', '08', 'HUANUCO                  ', 'HUAMALIES                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100511', 'TANTAMAYO', '10', '05', '11', 'HUANUCO                  ', 'HUAMALIES                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100603', 'HERMILIO VALDIZAN', '10', '06', '03', 'HUANUCO                  ', 'LEONCIO PRADO            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100606', 'MARIANO DAMASO BERAUN', '10', '06', '06', 'HUANUCO                  ', 'LEONCIO PRADO            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100702', 'CHOLON', '10', '07', '02', 'HUANUCO                  ', 'MARA¾ON                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100803', 'MOLINO', '10', '08', '03', 'HUANUCO                  ', 'PACHITEA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100902', 'CODO DEL POZUZO', '10', '09', '02', 'HUANUCO                  ', 'PUERTO INCA              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100904', 'TOURNAVISTA', '10', '09', '04', 'HUANUCO                  ', 'PUERTO INCA              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('101003', 'JIVIA', '10', '10', '03', 'HUANUCO                  ', 'LAURICOCHA               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('101007', 'SAN MIGUEL DE CAURI', '10', '10', '07', 'HUANUCO                  ', 'LAURICOCHA               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('101101', 'CHAVINILLO', '10', '11', '01', 'HUANUCO                  ', 'YAROWILCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('101105', 'JACAS CHICO', '10', '11', '05', 'HUANUCO                  ', 'YAROWILCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110101', 'ICA', '11', '01', '01', 'ICA                      ', 'ICA                      ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110103', 'LOS AQUIJES', '11', '01', '03', 'ICA                      ', 'ICA                      ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110107', 'PUEBLO NUEVO', '11', '01', '07', 'ICA                      ', 'ICA                      ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110111', 'SANTIAGO', '11', '01', '11', 'ICA                      ', 'ICA                      ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110112', 'SUBTANJALLA', '11', '01', '12', 'ICA                      ', 'ICA                      ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110202', 'ALTO LARAN', '11', '02', '02', 'ICA                      ', 'CHINCHA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110204', 'CHINCHA BAJA', '11', '02', '04', 'ICA                      ', 'CHINCHA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110207', 'PUEBLO NUEVO', '11', '02', '07', 'ICA                      ', 'CHINCHA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110211', 'TAMBO DE MORA', '11', '02', '11', 'ICA                      ', 'CHINCHA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110302', 'CHANGUILLO', '11', '03', '02', 'ICA                      ', 'NAZCA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110305', 'VISTA ALEGRE', '11', '03', '05', 'ICA                      ', 'NAZCA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110404', 'SANTA CRUZ', '11', '04', '04', 'ICA                      ', 'PALPA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110501', 'PISCO', '11', '05', '01', 'ICA                      ', 'PISCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110504', 'INDEPENDENCIA', '11', '05', '04', 'ICA                      ', 'PISCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110507', 'SAN CLEMENTE', '11', '05', '07', 'ICA                      ', 'PISCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120104', 'CARHUACALLANGA', '12', '01', '04', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120106', 'CHICCHE', '12', '01', '06', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120112', 'COLCA', '12', '01', '12', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120116', 'HUACRAPUQUIO', '12', '01', '16', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120119', 'HUANCAN', '12', '01', '19', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120124', 'PARIAHUANCA', '12', '01', '24', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120135', 'SANTO DOMINGO DE ACOBAMBA', '12', '01', '35', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120203', 'ANDAMARCA', '12', '02', '03', 'JUNIN                    ', 'CONCEPCION               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120206', 'COMAS', '12', '02', '06', 'JUNIN                    ', 'CONCEPCION               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120208', 'MANZANARES', '12', '02', '08', 'JUNIN                    ', 'CONCEPCION               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120212', 'NUEVE DE JULIO', '12', '02', '12', 'JUNIN                    ', 'CONCEPCION               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120301', 'CHANCHAMAYO', '12', '03', '01', 'JUNIN                    ', 'CHANCHAMAYO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120302', 'PERENE', '12', '03', '02', 'JUNIN                    ', 'CHANCHAMAYO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120306', 'VITOC', '12', '03', '06', 'JUNIN                    ', 'CHANCHAMAYO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120137', 'LA MERCED', '12', '01', '37', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120403', 'APATA', '12', '04', '03', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120405', 'CANCHAYLLO', '12', '04', '05', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120409', 'HUARIPAMPA', '12', '04', '09', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120411', 'JANJAILLO', '12', '04', '11', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120414', 'LLOCLLAPAMPA', '12', '04', '14', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120418', 'MOLINOS', '12', '04', '18', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120420', 'MUQUI', '12', '04', '20', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120423', 'PACCHA', '12', '04', '23', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120427', 'RICRAN', '12', '04', '27', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120429', 'SAN PEDRO DE CHUNAN', '12', '04', '29', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120432', 'TUNAN MARCA', '12', '04', '32', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120502', 'CARHUAMAYO', '12', '05', '02', 'JUNIN                    ', 'JUNIN                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120504', 'ULCUMAYO', '12', '05', '04', 'JUNIN                    ', 'JUNIN                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120603', 'LLAYLLA', '12', '06', '03', 'JUNIN                    ', 'SATIPO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120606', 'PANGOA', '12', '06', '06', 'JUNIN                    ', 'SATIPO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120701', 'TARMA', '12', '07', '01', 'JUNIN                    ', 'TARMA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120703', 'HUARICOLCA', '12', '07', '03', 'JUNIN                    ', 'TARMA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120707', 'PALCAMAYO', '12', '07', '07', 'JUNIN                    ', 'TARMA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120801', 'LA OROYA', '12', '08', '01', 'JUNIN                    ', 'YAULI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120803', 'HUAY-HUAY', '12', '08', '03', 'JUNIN                    ', 'YAULI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120808', 'SANTA ROSA DE SACCO', '12', '08', '08', 'JUNIN                    ', 'YAULI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120810', 'YAULI', '12', '08', '10', 'JUNIN                    ', 'YAULI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120902', 'AHUAC', '12', '09', '02', 'JUNIN                    ', 'CHUPACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120906', 'SAN JUAN DE YSCOS', '12', '09', '06', 'JUNIN                    ', 'CHUPACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120909', 'YANACANCHA', '12', '09', '09', 'JUNIN                    ', 'CHUPACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130102', 'EL PORVENIR', '13', '01', '02', 'LA LIBERTAD              ', 'TRUJILLO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130106', 'LAREDO', '13', '01', '06', 'LA LIBERTAD              ', 'TRUJILLO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130108', 'POROTO', '13', '01', '08', 'LA LIBERTAD              ', 'TRUJILLO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130111', 'VICTOR LARCO HERRERA', '13', '01', '11', 'LA LIBERTAD              ', 'TRUJILLO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130204', 'MAGDALENA DE CAO', '13', '02', '04', 'LA LIBERTAD              ', 'ASCOPE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130206', 'RAZURI', '13', '02', '06', 'LA LIBERTAD              ', 'ASCOPE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130302', 'BAMBAMARCA', '13', '03', '02', 'LA LIBERTAD              ', 'BOLIVAR                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130503', 'CARABAMBA', '13', '05', '03', 'LA LIBERTAD              ', 'JULCAN                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130602', 'AGALLPAMPA', '13', '06', '02', 'LA LIBERTAD              ', 'OTUZCO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130605', 'HUARANCHAL', '13', '06', '05', 'LA LIBERTAD              ', 'OTUZCO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130611', 'SALPO', '13', '06', '11', 'LA LIBERTAD              ', 'OTUZCO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130702', 'GUADALUPE', '13', '07', '02', 'LA LIBERTAD              ', 'PACASMAYO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130703', 'JEQUETEPEQUE', '13', '07', '03', 'LA LIBERTAD              ', 'PACASMAYO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130802', 'BULDIBUYO', '13', '08', '02', 'LA LIBERTAD              ', 'PATAZ                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130805', 'HUAYLILLAS', '13', '08', '05', 'LA LIBERTAD              ', 'PATAZ                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130807', 'ONGON', '13', '08', '07', 'LA LIBERTAD              ', 'PATAZ                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130812', 'TAURIJA', '13', '08', '12', 'LA LIBERTAD              ', 'PATAZ                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130901', 'HUAMACHUCO', '13', '09', '01', 'LA LIBERTAD              ', 'SANCHEZ CARRION          ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130903', 'COCHORCO', '13', '09', '03', 'LA LIBERTAD              ', 'SANCHEZ CARRION          ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130907', 'SARIN', '13', '09', '07', 'LA LIBERTAD              ', 'SANCHEZ CARRION          ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('131003', 'CACHICADAN', '13', '10', '03', 'LA LIBERTAD              ', 'SANTIAGO DE CHUCO        ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('131004', 'MOLLEBAMBA', '13', '10', '04', 'LA LIBERTAD              ', 'SANTIAGO DE CHUCO        ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('131008', 'SITABAMBA', '13', '10', '08', 'LA LIBERTAD              ', 'SANTIAGO DE CHUCO        ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('131102', 'LUCMA', '13', '11', '02', 'LA LIBERTAD              ', 'GRAN CHIMU               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('131201', 'VIRU', '13', '12', '01', 'LA LIBERTAD              ', 'VIRU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140103', 'ETEN', '14', '01', '03', 'LAMBAYEQUE               ', 'CHICLAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140105', 'JOSE LEONARDO ORTIZ', '14', '01', '05', 'LAMBAYEQUE               ', 'CHICLAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140107', 'LAGUNAS', '14', '01', '07', 'LAMBAYEQUE               ', 'CHICLAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140112', 'PIMENTEL', '14', '01', '12', 'LAMBAYEQUE               ', 'CHICLAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140114', 'SANTA ROSA', '14', '01', '14', 'LAMBAYEQUE               ', 'CHICLAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140202', 'CA¥ARIS', '14', '02', '02', 'LAMBAYEQUE               ', 'FERRE¥AFE                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140206', 'PUEBLO NUEVO', '14', '02', '06', 'LAMBAYEQUE               ', 'FERRE¥AFE                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140301', 'LAMBAYEQUE', '14', '03', '01', 'LAMBAYEQUE               ', 'LAMBAYEQUE               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140304', 'JAYANCA', '14', '03', '04', 'LAMBAYEQUE               ', 'LAMBAYEQUE               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140307', 'MOTUPE', '14', '03', '07', 'LAMBAYEQUE               ', 'LAMBAYEQUE               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140311', 'SAN JOSE', '14', '03', '11', 'LAMBAYEQUE               ', 'LAMBAYEQUE               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150102', 'ANCON', '15', '01', '02', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150106', 'CARABAYLLO', '15', '01', '06', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150109', 'CIENEGUILLA', '15', '01', '09', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150111', 'EL AGUSTINO', '15', '01', '11', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150114', 'LA MOLINA', '15', '01', '14', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150128', 'RIMAC', '15', '01', '28', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150139', 'SANTA ROSA', '15', '01', '39', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150118', 'LURIGANCHO', '15', '01', '18', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150122', 'MIRAFLORES', '15', '01', '22', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150123', 'PACHACAMAC', '15', '01', '23', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150127', 'PUNTA NEGRA', '15', '01', '27', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150137', 'SANTA ANITA', '15', '01', '37', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150133', 'SAN JUAN DE MIRAFLORES', '15', '01', '33', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150201', 'BARRANCA', '15', '02', '01', 'LIMA                     ', 'BARRANCA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150203', 'PATIVILCA', '15', '02', '03', 'LIMA                     ', 'BARRANCA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150301', 'CAJATAMBO', '15', '03', '01', 'LIMA                     ', 'CAJATAMBO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150305', 'MANAS', '15', '03', '05', 'LIMA                     ', 'CAJATAMBO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150402', 'ARAHUAY', '15', '04', '02', 'LIMA                     ', 'CANTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150405', 'LACHAQUI', '15', '04', '05', 'LIMA                     ', 'CANTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150501', 'SAN VICENTE DE CA¥ETE', '15', '05', '01', 'LIMA                     ', 'CA¥ETE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150504', 'CERRO AZUL', '15', '05', '04', 'LIMA                     ', 'CA¥ETE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150507', 'IMPERIAL', '15', '05', '07', 'LIMA                     ', 'CA¥ETE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150510', 'NUEVO IMPERIAL', '15', '05', '10', 'LIMA                     ', 'CA¥ETE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150513', 'SAN ANTONIO', '15', '05', '13', 'LIMA                     ', 'CA¥ETE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150515', 'SANTA CRUZ DE FLORES', '15', '05', '15', 'LIMA                     ', 'CA¥ETE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150603', 'ATAVILLOS BAJO', '15', '06', '03', 'LIMA                     ', 'HUARAL                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150606', 'IHUARI', '15', '06', '06', 'LIMA                     ', 'HUARAL                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150608', 'PACARAOS', '15', '06', '08', 'LIMA                     ', 'HUARAL                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150701', 'MATUCANA', '15', '07', '01', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150703', 'CALLAHUANCA', '15', '07', '03', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150705', 'CHICLA', '15', '07', '05', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150709', 'HUAROCHIRI', '15', '07', '09', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150711', 'LANGA', '15', '07', '11', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150714', 'RICARDO PALMA', '15', '07', '14', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150718', 'SAN DAMIAN', '15', '07', '18', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150720', 'SAN JUAN DE TANTARANCHE', '15', '07', '20', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150723', 'SAN MATEO DE OTAO', '15', '07', '23', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150727', 'SANTA CRUZ DE COCACHACRA', '15', '07', '27', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150729', 'SANTIAGO DE ANCHUCAYA', '15', '07', '29', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150732', 'SURCO', '15', '07', '32', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150802', 'AMBAR', '15', '08', '02', 'LIMA                     ', 'HUAURA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150805', 'HUALMAY', '15', '08', '05', 'LIMA                     ', 'HUAURA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150809', 'SANTA LEONOR', '15', '08', '09', 'LIMA                     ', 'HUAURA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150811', 'SAYAN', '15', '08', '11', 'LIMA                     ', 'HUAURA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150902', 'ANDAJES', '15', '09', '02', 'LIMA                     ', 'OYON                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150905', 'NAVAN', '15', '09', '05', 'LIMA                     ', 'OYON                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151003', 'AYAUCA', '15', '10', '03', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151006', 'CACRA', '15', '10', '06', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151008', 'CATAHUASI', '15', '10', '08', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151012', 'HONGOS', '15', '10', '12', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151015', 'HUANGASCAR', '15', '10', '15', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151017', 'HUA¥EC', '15', '10', '17', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151021', 'MIRAFLORES', '15', '10', '21', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151030', 'TOMAS', '15', '10', '30', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160101', 'IQUITOS', '16', '01', '01', 'LORETO                   ', 'MAYNAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160103', 'FERNANDO LORES', '16', '01', '03', 'LORETO                   ', 'MAYNAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160106', 'MAZAN', '16', '01', '06', 'LORETO                   ', 'MAYNAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160110', 'TORRES CAUSANA', '16', '01', '10', 'LORETO                   ', 'MAYNAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160202', 'BALSAPUERTO', '16', '02', '02', 'LORETO                   ', 'ALTO AMAZONAS            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160210', 'SANTA CRUZ', '16', '02', '10', 'LORETO                   ', 'ALTO AMAZONAS            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160303', 'TIGRE', '16', '03', '03', 'LORETO                   ', 'LORETO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160305', 'URARINAS', '16', '03', '05', 'LORETO                   ', 'LORETO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160403', 'YAVARI', '16', '04', '03', 'LORETO                   ', 'MARISCAL RAMON CASTILLA  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160503', 'CAPELO', '16', '05', '03', 'LORETO                   ', 'REQUENA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160505', 'MAQUIA', '16', '05', '05', 'LORETO                   ', 'REQUENA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160508', 'SOPLIN', '16', '05', '08', 'LORETO                   ', 'REQUENA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160601', 'CONTAMANA', '16', '06', '01', 'LORETO                   ', 'UCAYALI                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160604', 'PAMPA HERMOSA', '16', '06', '04', 'LORETO                   ', 'UCAYALI                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160606', 'VARGAS GUERRA', '16', '06', '06', 'LORETO                   ', 'UCAYALI                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('170104', 'LABERINTO', '17', '01', '04', 'MADRE DE DIOS            ', 'TAMBOPATA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('170203', 'MADRE DE DIOS', '17', '02', '03', 'MADRE DE DIOS            ', 'MANU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('170302', 'IBERIA', '17', '03', '02', 'MADRE DE DIOS            ', 'TAHUAMANU                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160111', 'YAQUERANA', '16', '01', '11', 'LORETO                   ', 'MAYNAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160204', 'CHAMBARA', '16', '02', '04', 'LORETO                   ', 'ALTO AMAZONAS            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160208', 'MANZANARES', '16', '02', '08', 'LORETO                   ', 'ALTO AMAZONAS            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180101', 'MOQUEGUA', '18', '01', '01', 'MOQUEGUA                 ', 'MARISCAL NIETO           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180104', 'SAMEGUA', '18', '01', '04', 'MOQUEGUA                 ', 'MARISCAL NIETO           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180201', 'OMATE', '18', '02', '01', 'MOQUEGUA                 ', 'GENERAL SANCHEZ CERRO    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180204', 'ICHU¥A', '18', '02', '04', 'MOQUEGUA                 ', 'GENERAL SANCHEZ CERRO    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180207', 'MATALAQUE', '18', '02', '07', 'MOQUEGUA                 ', 'GENERAL SANCHEZ CERRO    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180210', 'UBINAS', '18', '02', '10', 'MOQUEGUA                 ', 'GENERAL SANCHEZ CERRO    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180301', 'ILO', '18', '03', '01', 'MOQUEGUA                 ', 'ILO                      ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190102', 'HUACHON', '19', '01', '02', 'PASCO                    ', 'PASCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190105', 'NINACACA', '19', '01', '05', 'PASCO                    ', 'PASCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190107', 'PAUCARTAMBO', '19', '01', '07', 'PASCO                    ', 'PASCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190111', 'TINYAHUARCO', '19', '01', '11', 'PASCO                    ', 'PASCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190201', 'YANAHUANCA', '19', '02', '01', 'PASCO                    ', 'DANIEL ALCIDES CARRION   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190203', 'GOYLLARISQUIZGA', '19', '02', '03', 'PASCO                    ', 'DANIEL ALCIDES CARRION   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190207', 'TAPUC', '19', '02', '07', 'PASCO                    ', 'DANIEL ALCIDES CARRION   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190302', 'CHONTABAMBA', '19', '03', '02', 'PASCO                    ', 'OXAPAMPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190304', 'PALCAZU', '19', '03', '04', 'PASCO                    ', 'OXAPAMPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200101', 'PIURA', '20', '01', '01', 'PIURA                    ', 'PIURA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200105', 'CATACAOS', '20', '01', '05', 'PIURA                    ', 'PIURA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200109', 'LA ARENA', '20', '01', '09', 'PIURA                    ', 'PIURA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200201', 'AYABACA', '20', '02', '01', 'PIURA                    ', 'AYABACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200203', 'JILILI', '20', '02', '03', 'PIURA                    ', 'AYABACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200206', 'PACAIPAMPA', '20', '02', '06', 'PIURA                    ', 'AYABACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200303', 'EL CARMEN DE LA FRONTERA', '20', '03', '03', 'PIURA                    ', 'HUANCABAMBA              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200305', 'LALAQUIZ', '20', '03', '05', 'PIURA                    ', 'HUANCABAMBA              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200308', 'SONDORILLO', '20', '03', '08', 'PIURA                    ', 'HUANCABAMBA              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200404', 'LA MATANZA', '20', '04', '04', 'PIURA                    ', 'MORROPON                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200406', 'SALITRAL', '20', '04', '06', 'PIURA                    ', 'MORROPON                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200409', 'SANTO DOMINGO', '20', '04', '09', 'PIURA                    ', 'MORROPON                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200502', 'AMOTAPE', '20', '05', '02', 'PIURA                    ', 'PAITA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200505', 'LA HUACA', '20', '05', '05', 'PIURA                    ', 'PAITA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200507', 'VICHAYAL', '20', '05', '07', 'PIURA                    ', 'PAITA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200604', 'LANCONES', '20', '06', '04', 'PIURA                    ', 'SULLANA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200607', 'QUERECOTILLO', '20', '06', '07', 'PIURA                    ', 'SULLANA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200701', 'PARI¥AS', '20', '07', '01', 'PIURA                    ', 'TALARA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200705', 'LOS ORGANOS', '20', '07', '05', 'PIURA                    ', 'TALARA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200802', 'BELLAVISTA DE LA UNION', '20', '08', '02', 'PIURA                    ', 'SECHURA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200804', 'CRISTO NOS VALGA', '20', '08', '04', 'PIURA                    ', 'SECHURA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210102', 'ACORA', '21', '01', '02', 'PUNO                     ', 'PUNO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210105', 'CAPACHICA', '21', '01', '05', 'PUNO                     ', 'PUNO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210107', 'COATA', '21', '01', '07', 'PUNO                     ', 'PUNO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210111', 'PICHACANI', '21', '01', '11', 'PUNO                     ', 'PUNO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210113', 'SAN ANTONIO', '21', '01', '13', 'PUNO                     ', 'PUNO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210201', 'AZANGARO', '21', '02', '01', 'PUNO                     ', 'AZANGARO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210205', 'CAMINACA', '21', '02', '05', 'PUNO                     ', 'AZANGARO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210207', 'JOSE DOMINGO CHOQUEHUANCA', '21', '02', '07', 'PUNO                     ', 'AZANGARO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210210', 'SAMAN', '21', '02', '10', 'PUNO                     ', 'AZANGARO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210214', 'SANTIAGO DE PUPUJA', '21', '02', '14', 'PUNO                     ', 'AZANGARO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210301', 'MACUSANI', '21', '03', '01', 'PUNO                     ', 'CARABAYA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210304', 'COASA', '21', '03', '04', 'PUNO                     ', 'CARABAYA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210308', 'OLLACHEA', '21', '03', '08', 'PUNO                     ', 'CARABAYA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210310', 'USICAYOS', '21', '03', '10', 'PUNO                     ', 'CARABAYA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210403', 'HUACULLANI', '21', '04', '03', 'PUNO                     ', 'CHUCUITO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210406', 'POMATA', '21', '04', '06', 'PUNO                     ', 'CHUCUITO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210502', 'CAPAZO', '21', '05', '02', 'PUNO                     ', 'EL COLLAO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210602', 'COJATA', '21', '06', '02', 'PUNO                     ', 'HUANCANE                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210605', 'PUSI', '21', '06', '05', 'PUNO                     ', 'HUANCANE                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210607', 'TARACO', '21', '06', '07', 'PUNO                     ', 'HUANCANE                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210703', 'CALAPUJA', '21', '07', '03', 'PUNO                     ', 'LAMPA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210704', 'NICASIO', '21', '07', '04', 'PUNO                     ', 'LAMPA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210708', 'PUCARA', '21', '07', '08', 'PUNO                     ', 'LAMPA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210802', 'ANTAUTA', '21', '08', '02', 'PUNO                     ', 'MELGAR                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210804', 'LLALLI', '21', '08', '04', 'PUNO                     ', 'MELGAR                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211003', 'PEDRO VILCA APAZA', '21', '10', '03', 'PUNO                     ', 'SAN ANTONIO DE PUTINA    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211005', 'SINA', '21', '10', '05', 'PUNO                     ', 'SAN ANTONIO DE PUTINA    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010200', 'BAGUA', '01', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010300', 'BONGARA', '01', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010400', 'CONDORCANQUI', '01', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010500', 'LUYA', '01', '05', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010600', 'RODRIGUEZ DE MENDOZA', '01', '06', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010700', 'UTCUBAMBA', '01', '07', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020000', 'ANCASH', '02', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020100', 'HUARAZ', '02', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020200', 'AIJA', '02', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020300', 'ANTONIO RAYMONDI', '02', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010000', 'AMAZONAS', '01', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020400', 'ASUNCION', '02', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020500', 'BOLOGNESI', '02', '05', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020600', 'CARHUAZ', '02', '06', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020700', 'CARLOS FERMIN FITZCARRALD', '02', '07', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010202', 'ARAMANGO', '01', '02', '02', 'AMAZONAS                 ', 'BAGUA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010307', 'JAZAN', '01', '03', '07', 'AMAZONAS                 ', 'BONGARA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010506', 'INGUILPATA', '01', '05', '06', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010520', 'SANTA CATALINA', '01', '05', '20', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010607', 'MARISCAL BENAVIDES', '01', '06', '07', 'AMAZONAS                 ', 'RODRIGUEZ DE MENDOZA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020107', 'LA LIBERTAD', '02', '01', '07', 'ANCASH                   ', 'HUARAZ                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020204', 'LA MERCED', '02', '02', '04', 'ANCASH                   ', 'AIJA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020505', 'CAJACAY', '02', '05', '05', 'ANCASH                   ', 'BOLOGNESI                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020605', 'ATAQUERO', '02', '06', '05', 'ANCASH                   ', 'CARHUAZ                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210808', 'SANTA ROSA', '21', '08', '08', 'PUNO                     ', 'MELGAR                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211103', 'CABANILLAS', '21', '11', '03', 'PUNO                     ', 'SAN ROMAN                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211203', 'LIMBANI', '21', '12', '03', 'PUNO                     ', 'SANDIA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211205', 'PHARA', '21', '12', '05', 'PUNO                     ', 'SANDIA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211208', 'YANAHUAYA', '21', '12', '08', 'PUNO                     ', 'SANDIA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211303', 'COPANI', '21', '13', '03', 'PUNO                     ', 'YUNGUYO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211305', 'OLLARAYA', '21', '13', '05', 'PUNO                     ', 'YUNGUYO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220101', 'MOYOBAMBA', '22', '01', '01', 'SAN MARTIN               ', 'MOYOBAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220105', 'SORITOR', '22', '01', '05', 'SAN MARTIN               ', 'MOYOBAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220201', 'BELLAVISTA', '22', '02', '01', 'SAN MARTIN               ', 'BELLAVISTA               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220204', 'HUALLAGA', '22', '02', '04', 'SAN MARTIN               ', 'BELLAVISTA               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220301', 'SAN JOSE DE SISA', '22', '03', '01', 'SAN MARTIN               ', 'EL DORADO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220304', 'SANTA ROSA', '22', '03', '04', 'SAN MARTIN               ', 'EL DORADO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220401', 'SAPOSOA', '22', '04', '01', 'SAN MARTIN               ', 'HUALLAGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220405', 'SACANCHE', '22', '04', '05', 'SAN MARTIN               ', 'HUALLAGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220503', 'BARRANQUITA', '22', '05', '03', 'SAN MARTIN               ', 'LAMAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220504', 'CAYNARACHI', '22', '05', '04', 'SAN MARTIN               ', 'LAMAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220509', 'SHANAO', '22', '05', '09', 'SAN MARTIN               ', 'LAMAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220511', 'ZAPATERO', '22', '05', '11', 'SAN MARTIN               ', 'LAMAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220602', 'CAMPANILLA', '22', '06', '02', 'SAN MARTIN               ', 'MARISCAL CACERES         ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220701', 'PICOTA', '22', '07', '01', 'SAN MARTIN               ', 'PICOTA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220704', 'PILLUANA', '22', '07', '04', 'SAN MARTIN               ', 'PICOTA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220706', 'SAN CRISTOBAL', '22', '07', '06', 'SAN MARTIN               ', 'PICOTA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220710', 'TRES UNIDOS', '22', '07', '10', 'SAN MARTIN               ', 'PICOTA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220802', 'AWAJUN', '22', '08', '02', 'SAN MARTIN               ', 'RIOJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220805', 'PARDO MIGUEL', '22', '08', '05', 'SAN MARTIN               ', 'RIOJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220809', 'YURACYACU', '22', '08', '09', 'SAN MARTIN               ', 'RIOJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220902', 'ALBERTO LEVEAU', '22', '09', '02', 'SAN MARTIN               ', 'SAN MARTIN               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220905', 'CHIPURANA', '22', '09', '05', 'SAN MARTIN               ', 'SAN MARTIN               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220909', 'LA BANDA DE SHILCAYO', '22', '09', '09', 'SAN MARTIN               ', 'SAN MARTIN               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220911', 'PAPAPLAYA', '22', '09', '11', 'SAN MARTIN               ', 'SAN MARTIN               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220914', 'SHAPAJA', '22', '09', '14', 'SAN MARTIN               ', 'SAN MARTIN               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('221003', 'POLVORA', '22', '10', '03', 'SAN MARTIN               ', 'TOCACHE                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230101', 'TACNA', '23', '01', '01', 'TACNA                    ', 'TACNA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230104', 'CIUDAD NUEVA', '23', '01', '04', 'TACNA                    ', 'TACNA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230107', 'PALCA', '23', '01', '07', 'TACNA                    ', 'TACNA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230201', 'CANDARAVE', '23', '02', '01', 'TACNA                    ', 'CANDARAVE                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230203', 'CAMILACA', '23', '02', '03', 'TACNA                    ', 'CANDARAVE                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230301', 'LOCUMBA', '23', '03', '01', 'TACNA                    ', 'JORGE BASADRE            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230404', 'ESTIQUE-PAMPA', '23', '04', '04', 'TACNA                    ', 'TARATA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230406', 'SUSAPAYA', '23', '04', '06', 'TACNA                    ', 'TARATA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('240102', 'CORRALES', '24', '01', '02', 'TUMBES                   ', 'TUMBES                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('240106', 'SAN JUAN DE LA VIRGEN', '24', '01', '06', 'TUMBES                   ', 'TUMBES                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('240201', 'ZORRITOS', '24', '02', '01', 'TUMBES                   ', 'CONTRALMIRANTE VILLAR    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('240303', 'MATAPALO', '24', '03', '03', 'TUMBES                   ', 'ZARUMILLA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250101', 'CALLERIA', '25', '01', '01', 'UCAYALI                  ', 'CORONEL PORTILLO         ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250104', 'MASISEA', '25', '01', '04', 'UCAYALI                  ', 'CORONEL PORTILLO         ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250202', 'SEPAHUA', '25', '02', '02', 'UCAYALI                  ', 'ATALAYA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250204', 'YURUA', '25', '02', '04', 'UCAYALI                  ', 'ATALAYA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250303', 'CURIMANA', '25', '03', '03', 'UCAYALI                  ', 'PADRE ABAD               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020800', 'CASMA', '02', '08', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020900', 'CORONGO', '02', '09', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021100', 'HUARMEY', '02', '11', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021200', 'HUAYLAS', '02', '12', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021300', 'MARISCAL LUZURIAGA', '02', '13', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021400', 'OCROS', '02', '14', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021500', 'PALLASCA', '02', '15', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021600', 'POMABAMBA', '02', '16', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021700', 'RECUAY', '02', '17', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030000', 'APURIMAC', '03', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030100', 'ABANCAY', '03', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030200', 'ANDAHUAYLAS', '03', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030300', 'ANTABAMBA', '03', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030400', 'AYMARAES', '03', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030500', 'COTABAMBAS', '03', '05', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030700', 'GRAU', '03', '07', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040000', 'AREQUIPA', '04', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040100', 'AREQUIPA', '04', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040200', 'CAMANA', '04', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040300', 'CARAVELI', '04', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040500', 'CAYLLOMA', '04', '05', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040600', 'CONDESUYOS', '04', '06', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040700', 'ISLAY', '04', '07', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040800', 'LA UNION', '04', '08', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050000', 'AYACUCHO', '05', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050100', 'HUAMANGA', '05', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230206', 'QUILAHUANI', '23', '02', '06', 'TACNA                    ', 'CANDARAVE                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050200', 'CANGALLO', '05', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050300', 'HUANCA SANCOS', '05', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050400', 'HUANTA', '05', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050408', 'LLOCHEGUA', '05', '04', '08', 'AYACUCHO', 'HUANTA');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050500', 'LA MAR', '05', '05', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050600', 'LUCANAS', '05', '06', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050700', 'PARINACOCHAS', '05', '07', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050800', 'PAUCAR DEL SARA SARA', '05', '08', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050900', 'SUCRE', '05', '09', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051000', 'VICTOR FAJARDO', '05', '10', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051100', 'VILCAS HUAMAN', '05', '11', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060400', 'CHOTA', '06', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060500', 'CONTUMAZA', '06', '05', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060700', 'HUALGAYOC', '06', '07', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060900', 'SAN IGNACIO', '06', '09', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061000', 'SAN MARCOS', '06', '10', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061100', 'SAN MIGUEL', '06', '11', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061200', 'SAN PABLO', '06', '12', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061300', 'SANTA CRUZ', '06', '13', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021002', 'ANRA', '02', '10', '02', 'ANCASH                   ', 'HUARI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021012', 'RAHUAPAMPA', '02', '10', '12', 'ANCASH                   ', 'HUARI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021205', 'MATO', '02', '12', '05', 'ANCASH                   ', 'HUAYLAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021401', 'OCROS', '02', '14', '01', 'ANCASH                   ', 'OCROS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021501', 'CABANA', '02', '15', '01', 'ANCASH                   ', 'PALLASCA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021604', 'QUINUABAMBA', '02', '16', '04', 'ANCASH                   ', 'POMABAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030101', 'ABANCAY', '03', '01', '01', 'APURIMAC                 ', 'ABANCAY                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030106', 'LAMBRAMA', '03', '01', '06', 'APURIMAC                 ', 'ABANCAY                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030205', 'HUANCARAY', '03', '02', '05', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030219', 'KAQUIABAMBA', '03', '02', '19', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030407', 'HUAYLLO', '03', '04', '07', 'APURIMAC                 ', 'AYMARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030417', 'YANACA', '03', '04', '17', 'APURIMAC                 ', 'AYMARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030608', 'RANRACANCHA', '03', '06', '08', 'APURIMAC                 ', 'CHINCHEROS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030705', 'MAMARA', '03', '07', '05', 'APURIMAC                 ', 'GRAU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040115', 'QUEQUE¥A', '04', '01', '15', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040125', 'VITOR', '04', '01', '25', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040201', 'CAMANA', '04', '02', '01', 'AREQUIPA                 ', 'CAMANA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040307', 'CHALA', '04', '03', '07', 'AREQUIPA                 ', 'CARAVELI                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040403', 'AYO', '04', '04', '03', 'AREQUIPA                 ', 'CASTILLA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040501', 'CHIVAY', '04', '05', '01', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040516', 'TAPAY', '04', '05', '16', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040703', 'DEAN VALDIVIA', '04', '07', '03', 'AREQUIPA                 ', 'ISLAY                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040811', 'TORO', '04', '08', '11', 'AREQUIPA                 ', 'LA UNION                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050114', 'VINCHOS', '05', '01', '14', 'AYACUCHO                 ', 'HUAMANGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050405', 'LURICOCHA', '05', '04', '05', 'AYACUCHO                 ', 'HUANTA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050604', 'CARMEN SALCEDO', '05', '06', '04', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050613', 'OTOCA', '05', '06', '13', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050706', 'PUYUSCA', '05', '07', '06', 'AYACUCHO                 ', 'PARINACOCHAS             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050807', 'PARARCA', '05', '08', '07', 'AYACUCHO                 ', 'PAUCAR DEL SARA SARA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050906', 'MORCOLLA', '05', '09', '06', 'AYACUCHO                 ', 'SUCRE                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051010', 'HUAYA', '05', '10', '10', 'AYACUCHO                 ', 'VICTOR FAJARDO           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060302', 'CHUMUCH', '06', '03', '02', 'CAJAMARCA                ', 'CELENDIN                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060311', 'UTCO', '06', '03', '11', 'CAJAMARCA                ', 'CELENDIN                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060414', 'PION', '06', '04', '14', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060504', 'GUZMANGO', '06', '05', '04', 'CAJAMARCA                ', 'CONTUMAZA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060606', 'PIMPINGOS', '06', '06', '06', 'CAJAMARCA                ', 'CUTERVO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060615', 'TORIBIO CASANOVA', '06', '06', '15', 'CAJAMARCA                ', 'CUTERVO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060807', 'POMAHUACA', '06', '08', '07', 'CAJAMARCA                ', 'JAEN                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060905', 'NAMBALLE', '06', '09', '05', 'CAJAMARCA                ', 'SAN IGNACIO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061006', 'JOSE MANUEL QUIROZ', '06', '10', '06', 'CAJAMARCA                ', 'SAN MARCOS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061113', 'UNION AGUA BLANCA', '06', '11', '13', 'CAJAMARCA                ', 'SAN MIGUEL               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061310', 'UTICYACU', '06', '13', '10', 'CAJAMARCA                ', 'SANTA CRUZ               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230401', 'TARATA', '23', '04', '01', 'TACNA                    ', 'TARATA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('170401', 'PTO.MALDONADO', '17', '04', '01', 'MADRE DE DIOS            ', 'PTO.MALDONADO            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040520', 'MAJES', '04', '05', '20', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('070000', 'CALLAO', '07', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('070100', 'CALLAO', '07', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080100', 'CUSCO', '08', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080200', 'ACOMAYO', '08', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080300', 'ANTA', '08', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080400', 'CALCA', '08', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080500', 'CANAS', '08', '05', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080600', 'CANCHIS', '08', '06', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080700', 'CHUMBIVILCAS', '08', '07', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080800', 'ESPINAR', '08', '08', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080900', 'LA CONVENCION', '08', '09', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081000', 'PARURO', '08', '10', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081100', 'PAUCARTAMBO', '08', '11', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081200', 'QUISPICANCHI', '08', '12', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081300', 'URUBAMBA', '08', '13', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090100', 'HUANCAVELICA', '09', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090119', 'HUANDO', '09', '01', '19', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090200', 'ACOBAMBA', '09', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090300', 'ANGARAES', '09', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090400', 'CASTROVIRREYNA', '09', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090500', 'CHURCAMPA', '09', '05', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090600', 'HUAYTARA', '09', '06', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060100', 'CAJAMARCA', '06', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100111', 'PILLCO MARCA', '10', '01', '11', 'HUANUCO', 'HUANUCO');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100300', 'DOS DE MAYO', '10', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100400', 'HUACAYBAMBA', '10', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100500', 'HUAMALIES', '10', '05', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100700', 'MARA¥ON', '10', '07', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100800', 'PACHITEA', '10', '08', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('101000', 'LAURICOCHA', '10', '10', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('101100', 'YAROWILCA', '10', '11', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('101108', 'CHORAS', '10', '11', '08', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110000', 'ICA', '11', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110100', 'ICA', '11', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110200', 'CHINCHA', '11', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110400', 'PALPA', '11', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110500', 'PISCO', '11', '05', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120000', 'JUNIN', '12', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120100', 'HUANCAYO', '12', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120300', 'CHANCHAMAYO', '12', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120500', 'JUNIN', '12', '05', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120600', 'SATIPO', '12', '06', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120700', 'TARMA', '12', '07', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120900', 'CHUPACA', '12', '09', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130100', 'TRUJILLO', '13', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130200', 'ASCOPE', '13', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130208', 'CASA GRANDE', '13', '02', '08', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130300', 'BOLIVAR', '13', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130400', 'CHEPEN', '13', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130500', 'JULCAN', '13', '05', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130600', 'OTUZCO', '13', '06', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090700', 'TAYACAJA', '09', '07', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080103', 'POROY', '08', '01', '03', 'CUSCO                    ', 'CUSCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080302', 'ANCAHUASI', '08', '03', '02', 'CUSCO                    ', 'ANTA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080402', 'COYA', '08', '04', '02', 'CUSCO                    ', 'CALCA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080601', 'SICUANI', '08', '06', '01', 'CUSCO                    ', 'CANCHIS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080707', 'QUI¥OTA', '08', '07', '07', 'CUSCO                    ', 'CHUMBIVILCAS             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080905', 'OCOBAMBA', '08', '09', '05', 'CUSCO                    ', 'LA CONVENCION            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081009', 'YAURISQUE', '08', '10', '09', 'CUSCO                    ', 'PARURO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081104', 'COLQUEPATA', '08', '11', '04', 'CUSCO                    ', 'PAUCARTAMBO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081212', 'QUIQUIJANA', '08', '12', '12', 'CUSCO                    ', 'QUISPICANCHI             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090103', 'ACORIA', '09', '01', '03', 'HUANCAVELICA             ', 'HUANCAVELICA             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090112', 'MOYA', '09', '01', '12', 'HUANCAVELICA             ', 'HUANCAVELICA             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090205', 'MARCAS', '09', '02', '05', 'HUANCAVELICA             ', 'ACOBAMBA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090404', 'CAPILLAS', '09', '04', '04', 'HUANCAVELICA             ', 'CASTROVIRREYNA           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090408', 'HUAMATAMBO', '09', '04', '08', 'HUANCAVELICA             ', 'CASTROVIRREYNA           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090715', 'SALCAHUASI', '09', '07', '15', 'HUANCAVELICA             ', 'TAYACAJA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100102', 'AMARILIS', '10', '01', '02', 'HUANUCO                  ', 'HUANUCO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100110', 'YARUMAYO', '10', '01', '10', 'HUANUCO                  ', 'HUANUCO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100208', 'TOMAY KICHWA', '10', '02', '08', 'HUANUCO                  ', 'AMBO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100501', 'LLATA', '10', '05', '01', 'HUANUCO                  ', 'HUAMALIES                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100510', 'SINGA', '10', '05', '10', 'HUANUCO                  ', 'HUAMALIES                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100703', 'SAN BUENAVENTURA', '10', '07', '03', 'HUANUCO                  ', 'MARA¾ON                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100905', 'YUYAPICHIS', '10', '09', '05', 'HUANUCO                  ', 'PUERTO INCA              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('101107', 'PAMPAMARCA', '10', '11', '07', 'HUANUCO                  ', 'YAROWILCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110114', 'YAUCA DEL ROSARIO', '11', '01', '14', 'ICA                      ', 'ICA                      ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110210', 'SUNAMPE', '11', '02', '10', 'ICA                      ', 'CHINCHA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110403', 'RIO GRANDE', '11', '04', '03', 'ICA                      ', 'PALPA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120107', 'CHILCA', '12', '01', '07', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120126', 'PUCARA', '12', '01', '26', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120130', 'SAN JERONIMO DE TUNAN', '12', '01', '30', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120204', 'CHAMBARA', '12', '02', '04', 'JUNIN                    ', 'CONCEPCION               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120214', 'SAN JOSE DE QUERO', '12', '02', '14', 'JUNIN                    ', 'CONCEPCION               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120402', 'ACOLLA', '12', '04', '02', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120412', 'JULCAN', '12', '04', '12', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120426', 'POMACANCHA', '12', '04', '26', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120501', 'JUNIN', '12', '05', '01', 'JUNIN                    ', 'JUNIN                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120704', 'HUASAHUASI', '12', '07', '04', 'JUNIN                    ', 'TARMA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120804', 'MARCAPOMACOCHA', '12', '08', '04', 'JUNIN                    ', 'YAULI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120904', 'HUACHAC', '12', '09', '04', 'JUNIN                    ', 'CHUPACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130104', 'HUANCHACO', '13', '01', '04', 'LA LIBERTAD              ', 'TRUJILLO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130109', 'SALAVERRY', '13', '01', '09', 'LA LIBERTAD              ', 'TRUJILLO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130305', 'UCHUMARCA', '13', '03', '05', 'LA LIBERTAD              ', 'BOLIVAR                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130606', 'LA CUESTA', '13', '06', '06', 'LA LIBERTAD              ', 'OTUZCO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('131000', 'SANTIAGO DE CHUCO', '13', '10', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('131200', 'VIRU', '13', '12', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140000', 'LAMBAYEQUE', '14', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140100', 'CHICLAYO', '14', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140116', 'CAYALTI', '14', '01', '16', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140117', 'PATAPO', '14', '01', '17', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140119', 'PUCALA', '14', '01', '19', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140120', 'TUMAN', '14', '01', '20', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140200', 'FERRE¥AFE', '14', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140300', 'LAMBAYEQUE', '14', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150000', 'LIMA', '15', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150100', 'LIMA', '15', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150200', 'BARRANCA', '15', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150400', 'CANTA', '15', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150500', 'CA¥ETE', '15', '05', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150600', 'HUARAL', '15', '06', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150700', 'HUAROCHIRI', '15', '07', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150800', 'HUAURA', '15', '08', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150900', 'OYON', '15', '09', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151000', 'YAUYOS', '15', '10', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160000', 'LORETO', '16', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160100', 'MAYNAS', '16', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160113', 'SAN JUAN BAUTISTA', '16', '01', '13', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160114', 'TENIENTE MANUEL CLAVERO', '16', '01', '14', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160200', 'ALTO AMAZONAS', '16', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160300', 'LORETO', '16', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160400', 'MARISCAL RAMON CASTILLA', '16', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160500', 'REQUENA', '16', '05', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160511', 'YAQUERANA', '16', '05', '11', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160600', 'UCAYALI', '16', '06', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160700', 'DATEM DEL MARA¥ON', '16', '07', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160701', 'BARRANCA', '16', '07', '01', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160703', 'MANSERICHE', '16', '07', '03', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160704', 'MORONA', '16', '07', '04', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160705', 'PASTAZA', '16', '07', '05', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160706', 'ANDOAS', '16', '07', '06', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130800', 'PATAZ', '13', '08', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180000', 'MOQUEGUA', '18', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180100', 'MARISCAL NIETO', '18', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180200', 'GENERAL SANCHEZ CERRO', '18', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190000', 'PASCO', '19', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190100', 'PASCO', '19', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190200', 'DANIEL ALCIDES CARRION', '19', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190300', 'OXAPAMPA', '19', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200000', 'PIURA', '20', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200100', 'PIURA', '20', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200200', 'AYABACA', '20', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200300', 'HUANCABAMBA', '20', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200400', 'MORROPON', '20', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200500', 'PAITA', '20', '05', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200600', 'SULLANA', '20', '06', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200700', 'TALARA', '20', '07', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210000', 'PUNO', '21', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210100', 'PUNO', '21', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210200', 'AZANGARO', '21', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210300', 'CARABAYA', '21', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210400', 'CHUCUITO', '21', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210500', 'EL COLLAO', '21', '05', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210600', 'HUANCANE', '21', '06', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210800', 'MELGAR', '21', '08', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('131007', 'SANTA CRUZ DE CHUCA', '13', '10', '07', 'LA LIBERTAD              ', 'SANTIAGO DE CHUCO        ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140101', 'CHICLAYO', '14', '01', '01', 'LAMBAYEQUE               ', 'CHICLAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140115', 'SA¥A', '14', '01', '15', 'LAMBAYEQUE               ', 'CHICLAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140308', 'OLMOS', '14', '03', '08', 'LAMBAYEQUE               ', 'LAMBAYEQUE               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150120', 'MAGDALENA DEL MAR', '15', '01', '20', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150141', 'SURQUILLO', '15', '01', '41', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150143', 'VILLA MARIA DEL TRIUNFO', '15', '01', '43', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150205', 'SUPE PUERTO', '15', '02', '05', 'LIMA                     ', 'BARRANCA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150404', 'HUAROS', '15', '04', '04', 'LIMA                     ', 'CANTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150511', 'PACARAN', '15', '05', '11', 'LIMA                     ', 'CA¥ETE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150605', 'CHANCAY', '15', '06', '05', 'LIMA                     ', 'HUARAL                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150707', 'HUACHUPAMPA', '15', '07', '07', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150716', 'SAN ANTONIO', '15', '07', '16', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150803', 'CALETA DE CARQUIN', '15', '08', '03', 'LIMA                     ', 'HUAURA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150901', 'OYON', '15', '09', '01', 'LIMA                     ', 'OYON                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151004', 'AYAVIRI', '15', '10', '04', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151018', 'LARAOS', '15', '10', '18', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151024', 'QUINCHES', '15', '10', '24', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160104', 'INDIANA', '16', '01', '04', 'LORETO                   ', 'MAYNAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160205', 'JEBEROS', '16', '02', '05', 'LORETO                   ', 'ALTO AMAZONAS            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160502', 'ALTO TAPICHE', '16', '05', '02', 'LORETO                   ', 'REQUENA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180105', 'SAN CRISTOBAL', '18', '01', '05', 'MOQUEGUA                 ', 'MARISCAL NIETO           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180302', 'EL ALGARROBAL', '18', '03', '02', 'MOQUEGUA                 ', 'ILO                      ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190113', 'YANACANCHA', '19', '01', '13', 'PASCO                    ', 'PASCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190306', 'PUERTO BERMUDEZ', '19', '03', '06', 'PASCO                    ', 'OXAPAMPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200204', 'LAGUNAS', '20', '02', '04', 'PIURA                    ', 'AYABACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200302', 'CANCHAQUE', '20', '03', '02', 'PIURA                    ', 'HUANCABAMBA              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200408', 'SANTA CATALINA DE MOSSA', '20', '04', '08', 'PIURA                    ', 'MORROPON                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200605', 'MARCAVELICA', '20', '06', '05', 'PIURA                    ', 'SULLANA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200801', 'SECHURA', '20', '08', '01', 'PIURA                    ', 'SECHURA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210109', 'MA¥AZO', '21', '01', '09', 'PUNO                     ', 'PUNO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210203', 'ARAPA', '21', '02', '03', 'PUNO                     ', 'AZANGARO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210303', 'AYAPATA', '21', '03', '03', 'PUNO                     ', 'CARABAYA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210402', 'DESAGUADERO', '21', '04', '02', 'PUNO                     ', 'CHUCUITO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210604', 'INCHUPALLA', '21', '06', '04', 'PUNO                     ', 'HUANCANE                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210706', 'PALCA', '21', '07', '06', 'PUNO                     ', 'LAMPA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210805', 'MACARI', '21', '08', '05', 'PUNO                     ', 'MELGAR                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210900', 'MOHO', '21', '09', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211000', 'SAN ANTONIO DE PUTINA', '21', '10', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211100', 'SAN ROMAN', '21', '11', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211200', 'SANDIA', '21', '12', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211210', 'SAN PEDRO DE PUTINA PUNCO', '21', '12', '10', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220000', 'SAN MARTIN', '22', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220100', 'MOYOBAMBA', '22', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220300', 'EL DORADO', '22', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220400', 'HUALLAGA', '22', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220500', 'LAMAS', '22', '05', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220600', 'MARISCAL CACERES', '22', '06', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220700', 'PICOTA', '22', '07', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220800', 'RIOJA', '22', '08', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('170200', 'MANU', '17', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('221000', 'TOCACHE', '22', '10', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230100', 'TACNA', '23', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230200', 'CANDARAVE', '23', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230300', 'JORGE BASADRE', '23', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230400', 'TARATA', '23', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('240000', 'TUMBES', '24', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('240200', 'CONTRALMIRANTE VILLAR', '24', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('240203', 'CANOAS DE PUNTA SAL', '24', '02', '03', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('240300', 'ZARUMILLA', '24', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250000', 'UCAYALI', '25', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250100', 'CORONEL PORTILLO', '25', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250200', 'ATALAYA', '25', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250400', 'PURUS', '25', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010100', 'CHACHAPOYAS', '01', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021000', 'HUARI', '02', '10', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021800', 'SANTA', '02', '18', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('022000', 'YUNGAY', '02', '20', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030600', 'CHINCHEROS', '03', '06', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010205', 'IMAZA', '01', '02', '05', 'AMAZONAS                 ', 'BAGUA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010311', 'VALERA', '01', '03', '11', 'AMAZONAS                 ', 'BONGARA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010511', 'MARIA', '01', '05', '11', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010521', 'SANTO TOMAS', '01', '05', '21', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010611', 'TOTORA', '01', '06', '11', 'AMAZONAS                 ', 'RODRIGUEZ DE MENDOZA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020202', 'CORIS', '02', '02', '02', 'ANCASH                   ', 'AIJA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020304', 'CHINGAS', '02', '03', '04', 'ANCASH                   ', 'ANTONIO RAYMONDI         ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020507', 'COLQUIOC', '02', '05', '07', 'ANCASH                   ', 'BOLOGNESI                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020601', 'CARHUAZ', '02', '06', '01', 'ANCASH                   ', 'CARHUAZ                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020702', 'SAN NICOLAS', '02', '07', '02', 'ANCASH                   ', 'CARLOS F. FITZCARRALD    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021013', 'RAPAYAN', '02', '10', '13', 'ANCASH                   ', 'HUARI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021105', 'MALVAS', '02', '11', '05', 'ANCASH                   ', 'HUARMEY                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021209', 'SANTO TORIBIO', '02', '12', '09', 'ANCASH                   ', 'HUAYLAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021308', 'MUSGA', '02', '13', '08', 'ANCASH                   ', 'MARISCAL LUZURIAGA       ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021505', 'HUANDOVAL', '02', '15', '05', 'ANCASH                   ', 'PALLASCA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021705', 'LLACLLIN', '02', '17', '05', 'ANCASH                   ', 'RECUAY                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021901', 'SIHUAS', '02', '19', '01', 'ANCASH                   ', 'SIHUAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('022008', 'YANAMA', '02', '20', '08', 'ANCASH                   ', 'YUNGAY                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030107', 'PICHIRHUA', '03', '01', '07', 'APURIMAC                 ', 'ABANCAY                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030214', 'SAN MIGUEL DE CHACCRAMPA', '03', '02', '14', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030304', 'JUAN ESPINOZA MEDRANO', '03', '03', '04', 'APURIMAC                 ', 'ANTABAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030406', 'COTARUSE', '03', '04', '06', 'APURIMAC                 ', 'AYMARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030601', 'CHINCHEROS', '03', '06', '01', 'APURIMAC                 ', 'CHINCHEROS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030709', 'SAN ANTONIO', '03', '07', '09', 'APURIMAC                 ', 'GRAU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040111', 'MOLLEBAYA', '04', '01', '11', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040124', 'UCHUMAYO', '04', '01', '24', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040503', 'CABANACONDE', '04', '05', '03', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040512', 'MACA', '04', '05', '12', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040602', 'ANDARAY', '04', '06', '02', 'AREQUIPA                 ', 'CONDESUYOS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040805', 'PAMPAMARCA', '04', '08', '05', 'AREQUIPA                 ', 'LA UNION                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050103', 'ACOS VINCHOS', '05', '01', '03', 'AYACUCHO                 ', 'HUAMANGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050112', 'SOCOS', '05', '01', '12', 'AYACUCHO                 ', 'HUAMANGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050304', 'SANTIAGO DE LUCANAMARCA', '05', '03', '04', 'AYACUCHO                 ', 'HUANCA SANCOS            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050508', 'TAMBO', '05', '05', '08', 'AYACUCHO                 ', 'LA MAR                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050618', 'SAN PEDRO DE PALCO', '05', '06', '18', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050707', 'SAN FRANCISCO DE RAVACAYCO', '05', '07', '07', 'AYACUCHO                 ', 'PARINACOCHAS             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050810', 'SARA SARA', '05', '08', '10', 'AYACUCHO                 ', 'PAUCAR DEL SARA SARA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('170201', 'MANU', '17', '02', '01', 'MADRE DE DIOS            ', 'MANU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211001', 'PUTINA', '21', '10', '01', 'PUNO                     ', 'SAN ANTONIO DE PUTINA    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211206', 'QUIACA', '21', '12', '06', 'PUNO                     ', 'SANDIA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211307', 'UNICACHI', '21', '13', '07', 'PUNO                     ', 'YUNGUYO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220203', 'BAJO BIAVO', '22', '02', '03', 'SAN MARTIN               ', 'BELLAVISTA               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220406', 'TINGO DE SAPOSOA', '22', '04', '06', 'SAN MARTIN               ', 'HUALLAGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220510', 'TABALOSOS', '22', '05', '10', 'SAN MARTIN               ', 'LAMAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220708', 'SHAMBOYACU', '22', '07', '08', 'SAN MARTIN               ', 'PICOTA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220903', 'CACATACHI', '22', '09', '03', 'SAN MARTIN               ', 'SAN MARTIN               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220913', 'SAUCE', '22', '09', '13', 'SAN MARTIN               ', 'SAN MARTIN               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230103', 'CALANA', '23', '01', '03', 'TACNA                    ', 'TACNA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230403', 'ESTIQUE', '23', '04', '03', 'TACNA                    ', 'TARATA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('240105', 'SAN JACINTO', '24', '01', '05', 'TUMBES                   ', 'TUMBES                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250201', 'RAYMONDI', '25', '02', '01', 'UCAYALI                  ', 'ATALAYA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060000', 'CAJAMARCA', '06', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060300', 'CELENDIN', '06', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060800', 'JAEN', '06', '08', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080000', 'CUSCO', '08', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090000', 'HUANCAVELICA', '09', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100000', 'HUANUCO', '10', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040400', 'CASTILLA', '04', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100600', 'LEONCIO PRADO', '10', '06', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100900', 'PUERTO INCA', '10', '09', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110300', 'NAZCA', '11', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120200', 'CONCEPCION', '12', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120400', 'JAUJA', '12', '04', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120800', 'YAULI', '12', '08', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130000', 'LA LIBERTAD', '13', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130700', 'PACASMAYO', '13', '07', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130900', 'SANCHEZ CARRION', '13', '09', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('131100', 'GRAN CHIMU', '13', '11', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140118', 'POMALCA', '14', '01', '18', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150300', 'CAJATAMBO', '15', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050911', 'SORAS', '05', '09', '11', 'AYACUCHO                 ', 'SUCRE                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051104', 'CONCEPCION', '05', '11', '04', 'AYACUCHO                 ', 'VILCAS HUAMAN            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060202', 'CACHACHI', '06', '02', '02', 'CAJAMARCA                ', 'CAJABAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060403', 'CHADIN', '06', '04', '03', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060412', 'MIRACOSTA', '06', '04', '12', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060603', 'CHOROS', '06', '06', '03', 'CAJAMARCA                ', 'CUTERVO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060803', 'CHONTALI', '06', '08', '03', 'CAJAMARCA                ', 'JAEN                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060812', 'SANTA ROSA', '06', '08', '12', 'CAJAMARCA                ', 'JAEN                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061104', 'CATILLUC', '06', '11', '04', 'CAJAMARCA                ', 'SAN MIGUEL               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061106', 'LA FLORIDA', '06', '11', '06', 'CAJAMARCA                ', 'SAN MIGUEL               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061301', 'SANTA CRUZ', '06', '13', '01', 'CAJAMARCA                ', 'SANTA CRUZ               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('070105', 'LA PUNTA', '07', '01', '05', 'CALLAO                   ', 'CALLAO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080301', 'ANTA', '08', '03', '01', 'CUSCO                    ', 'ANTA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080401', 'CALCA', '08', '04', '01', 'CUSCO                    ', 'CALCA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080502', 'CHECCA', '08', '05', '02', 'CUSCO                    ', 'CANAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080704', 'COLQUEMARCA', '08', '07', '04', 'CUSCO                    ', 'CHUMBIVILCAS             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080906', 'QUELLOUNO', '08', '09', '06', 'CUSCO                    ', 'LA CONVENCION            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081004', 'COLCHA', '08', '10', '04', 'CUSCO                    ', 'PARURO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081102', 'CAICAY', '08', '11', '02', 'CUSCO                    ', 'PAUCARTAMBO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081206', 'CUSIPATA', '08', '12', '06', 'CUSCO                    ', 'QUISPICANCHI             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090105', 'CUENCA', '09', '01', '05', 'HUANCAVELICA             ', 'HUANCAVELICA             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090206', 'PAUCARA', '09', '02', '06', 'HUANCAVELICA             ', 'ACOBAMBA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090403', 'AURAHUA', '09', '04', '03', 'HUANCAVELICA             ', 'CASTROVIRREYNA           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090412', 'TANTARA', '09', '04', '12', 'HUANCAVELICA             ', 'CASTROVIRREYNA           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090608', 'QUERCO', '09', '06', '08', 'HUANCAVELICA             ', 'HUAYTARA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090701', 'PAMPAS', '09', '07', '01', 'HUANCAVELICA             ', 'TAYACAJA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090711', 'PAZOS', '09', '07', '11', 'HUANCAVELICA             ', 'TAYACAJA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100601', 'RUPA-RUPA', '10', '06', '01', 'HUANUCO                  ', 'LEONCIO PRADO            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('101001', 'JESUS', '10', '10', '01', 'HUANUCO                  ', 'LAURICOCHA               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('101103', 'CHACABAMBA', '10', '11', '03', 'HUANUCO                  ', 'YAROWILCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110105', 'PACHACUTEC', '11', '01', '05', 'ICA                      ', 'ICA                      ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110208', 'SAN JUAN DE YANAC', '11', '02', '08', 'ICA                      ', 'CHINCHA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110503', 'HUMAY', '11', '05', '03', 'ICA                      ', 'PISCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120120', 'HUASICANCHA', '12', '01', '20', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120128', 'QUILCAS', '12', '01', '28', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120210', 'MATAHUASI', '12', '02', '10', 'JUNIN                    ', 'CONCEPCION               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120406', 'CURICACA', '12', '04', '06', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120421', 'MUQUIYAUYO', '12', '04', '21', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120434', 'YAUYOS', '12', '04', '34', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120605', 'PAMPA HERMOSA', '12', '06', '05', 'JUNIN                    ', 'SATIPO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120806', 'PACCHA', '12', '08', '06', 'JUNIN                    ', 'YAULI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130202', 'CHICAMA', '13', '02', '02', 'LA LIBERTAD              ', 'ASCOPE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130304', 'LONGOTEA', '13', '03', '04', 'LA LIBERTAD              ', 'BOLIVAR                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130502', 'CALAMARCA', '13', '05', '02', 'LA LIBERTAD              ', 'JULCAN                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130613', 'SINSICAP', '13', '06', '13', 'LA LIBERTAD              ', 'OTUZCO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130810', 'PIAS', '13', '08', '10', 'LA LIBERTAD              ', 'PATAZ                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('131006', 'QUIRUVILCA', '13', '10', '06', 'LA LIBERTAD              ', 'SANTIAGO DE CHUCO        ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140106', 'LA VICTORIA', '14', '01', '06', 'LAMBAYEQUE               ', 'CHICLAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140203', 'INCAHUASI', '14', '02', '03', 'LAMBAYEQUE               ', 'FERRE¥AFE                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140306', 'MORROPE', '14', '03', '06', 'LAMBAYEQUE               ', 'LAMBAYEQUE               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230302', 'ILABAYA', '23', '03', '02', 'TACNA                    ', 'JORGE BASADRE            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150130', 'SAN BORJA', '15', '01', '30', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150302', 'COPA', '15', '03', '02', 'LIMA                     ', 'CAJATAMBO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150406', 'SAN BUENAVENTURA', '15', '04', '06', 'LIMA                     ', 'CANTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150508', 'LUNAHUANA', '15', '05', '08', 'LIMA                     ', 'CA¥ETE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150610', 'SANTA CRUZ DE ANDAMARCA', '15', '06', '10', 'LIMA                     ', 'HUARAL                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150706', 'CUENCA', '15', '07', '06', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150721', 'SAN LORENZO DE QUINTI', '15', '07', '21', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160702', 'CAHUAPANAS', '16', '07', '02', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('170000', 'MADRE DE DIOS', '17', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200800', 'SECHURA', '20', '08', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211300', 'YUNGUYO', '21', '13', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220200', 'BELLAVISTA', '22', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220900', 'SAN MARTIN', '22', '09', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230000', 'TACNA', '23', '00', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('240100', 'TUMBES', '24', '01', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250300', 'PADRE ABAD', '25', '03', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060600', 'CUTERVO', '06', '06', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100200', 'AMBO', '10', '02', '00', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160112', 'BELEN', '16', '01', '12', NULL, NULL);
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010101', 'CHACHAPOYAS', '01', '01', '01', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010102', 'ASUNCION', '01', '01', '02', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010103', 'BALSAS', '01', '01', '03', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010105', 'CHILIQUIN', '01', '01', '05', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010113', 'MARISCAL CASTILLA', '01', '01', '13', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010114', 'MOLINOPAMPA', '01', '01', '14', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010116', 'OLLEROS', '01', '01', '16', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010118', 'SAN FRANCISCO DE DAGUAS', '01', '01', '18', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010120', 'SOLOCO', '01', '01', '20', 'AMAZONAS                 ', 'CHACHAPOYAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010201', 'LA PECA', '01', '02', '01', 'AMAZONAS                 ', 'BAGUA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010204', 'EL PARCO', '01', '02', '04', 'AMAZONAS                 ', 'BAGUA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010302', 'CHISQUILLA', '01', '03', '02', 'AMAZONAS                 ', 'BONGARA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010303', 'CHURUJA', '01', '03', '03', 'AMAZONAS                 ', 'BONGARA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010305', 'CUISPES', '01', '03', '05', 'AMAZONAS                 ', 'BONGARA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010308', 'RECTA', '01', '03', '08', 'AMAZONAS                 ', 'BONGARA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010309', 'SAN CARLOS', '01', '03', '09', 'AMAZONAS                 ', 'BONGARA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010312', 'YAMBRASBAMBA', '01', '03', '12', 'AMAZONAS                 ', 'BONGARA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010402', 'EL CENEPA', '01', '04', '02', 'AMAZONAS                 ', 'CONDORCANQUI             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010501', 'LAMUD', '01', '05', '01', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010502', 'CAMPORREDONDO', '01', '05', '02', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021709', 'TAPACOCHA', '02', '17', '09', 'ANCASH                   ', 'RECUAY                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040205', 'NICOLAS DE PIEROLA', '04', '02', '05', 'AREQUIPA                 ', 'CAMANA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051107', 'SAURAMA', '05', '11', '07', 'AYACUCHO                 ', 'VILCAS HUAMAN            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090605', 'LARAMARCA', '09', '06', '05', 'HUANCAVELICA             ', 'HUAYTARA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100317', 'RIPAN', '10', '03', '17', 'HUANUCO                  ', 'DOS DE MAYO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130105', 'LA ESPERANZA', '13', '01', '05', 'LA LIBERTAD              ', 'TRUJILLO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150724', 'SAN PEDRO DE CASTA', '15', '07', '24', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150808', 'PACCHO', '15', '08', '08', 'LIMA                     ', 'HUAURA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151009', 'CHOCOS', '15', '10', '09', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151019', 'LINCHA', '15', '10', '19', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151027', 'SAN PEDRO DE PILAS', '15', '10', '27', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160301', 'NAUTA', '16', '03', '01', 'LORETO                   ', 'LORETO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160501', 'REQUENA', '16', '05', '01', 'LORETO                   ', 'REQUENA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160510', 'JENARO HERRERA', '16', '05', '10', 'LORETO                   ', 'REQUENA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('170103', 'LAS PIEDRAS', '17', '01', '03', 'MADRE DE DIOS            ', 'TAMBOPATA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180103', 'CUCHUMBAYA', '18', '01', '03', 'MOQUEGUA                 ', 'MARISCAL NIETO           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180208', 'PUQUINA', '18', '02', '08', 'MOQUEGUA                 ', 'GENERAL SANCHEZ CERRO    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190103', 'HUARIACA', '19', '01', '03', 'PASCO                    ', 'PASCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190206', 'SANTA ANA DE TUSI', '19', '02', '06', 'PASCO                    ', 'DANIEL ALCIDES CARRION   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200111', 'LAS LOMAS', '20', '01', '11', 'PIURA                    ', 'PIURA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200210', 'SUYO', '20', '02', '10', 'PIURA                    ', 'AYABACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200401', 'CHULUCANAS', '20', '04', '01', 'PIURA                    ', 'MORROPON                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200503', 'ARENAL', '20', '05', '03', 'PIURA                    ', 'PAITA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200703', 'LA BREA', '20', '07', '03', 'PIURA                    ', 'TALARA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210104', 'ATUNCOLLA', '21', '01', '04', 'PUNO                     ', 'PUNO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210202', 'ACHAYA', '21', '02', '02', 'PUNO                     ', 'AZANGARO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210213', 'SAN JUAN DE SALINAS', '21', '02', '13', 'PUNO                     ', 'AZANGARO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210404', 'KELLUYO', '21', '04', '04', 'PUNO                     ', 'CHUCUITO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210601', 'HUANCANE', '21', '06', '01', 'PUNO                     ', 'HUANCANE                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210710', 'VILAVILA', '21', '07', '10', 'PUNO                     ', 'LAMPA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210807', 'ORURILLO', '21', '08', '07', 'PUNO                     ', 'MELGAR                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211101', 'JULIACA', '21', '11', '01', 'PUNO                     ', 'SAN ROMAN                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220102', 'CALZADA', '22', '01', '02', 'SAN MARTIN               ', 'MOYOBAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220205', 'SAN PABLO', '22', '02', '05', 'SAN MARTIN               ', 'BELLAVISTA               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220403', 'EL ESLABON', '22', '04', '03', 'SAN MARTIN               ', 'HUALLAGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220603', 'HUICUNGO', '22', '06', '03', 'SAN MARTIN               ', 'MARISCAL CACERES         ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220707', 'SAN HILARION', '22', '07', '07', 'SAN MARTIN               ', 'PICOTA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220806', 'POSIC', '22', '08', '06', 'SAN MARTIN               ', 'RIOJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230105', 'INCLAN', '23', '01', '05', 'TACNA                    ', 'TACNA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230205', 'HUANUARA', '23', '02', '05', 'TACNA                    ', 'CANDARAVE                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('240202', 'CASITAS', '24', '02', '02', 'TUMBES                   ', 'CONTRALMIRANTE VILLAR    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250105', 'YARINACOCHA', '25', '01', '05', 'UCAYALI                  ', 'CORONEL PORTILLO         ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010503', 'COCABAMBA', '01', '05', '03', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010505', 'CONILA', '01', '05', '05', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010508', 'LONYA CHICO', '01', '05', '08', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010510', 'LUYA VIEJO', '01', '05', '10', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010512', 'OCALLI', '01', '05', '12', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010514', 'PISUQUIA', '01', '05', '14', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010515', 'PROVIDENCIA', '01', '05', '15', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010517', 'SAN FRANCISCO DEL YESO', '01', '05', '17', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010519', 'SAN JUAN DE LOPECANCHA', '01', '05', '19', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010523', 'TRITA', '01', '05', '23', 'AMAZONAS                 ', 'LUYA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010602', 'CHIRIMOTO', '01', '06', '02', 'AMAZONAS                 ', 'RODRIGUEZ DE MENDOZA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010603', 'COCHAMAL', '01', '06', '03', 'AMAZONAS                 ', 'RODRIGUEZ DE MENDOZA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010605', 'LIMABAMBA', '01', '06', '05', 'AMAZONAS                 ', 'RODRIGUEZ DE MENDOZA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010606', 'LONGAR', '01', '06', '06', 'AMAZONAS                 ', 'RODRIGUEZ DE MENDOZA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010609', 'OMIA', '01', '06', '09', 'AMAZONAS                 ', 'RODRIGUEZ DE MENDOZA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010612', 'VISTA ALEGRE', '01', '06', '12', 'AMAZONAS                 ', 'RODRIGUEZ DE MENDOZA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010702', 'CAJARURO', '01', '07', '02', 'AMAZONAS                 ', 'UTCUBAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010703', 'CUMBA', '01', '07', '03', 'AMAZONAS                 ', 'UTCUBAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010704', 'EL MILAGRO', '01', '07', '04', 'AMAZONAS                 ', 'UTCUBAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('010706', 'LONYA GRANDE', '01', '07', '06', 'AMAZONAS                 ', 'UTCUBAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020101', 'HUARAZ', '02', '01', '01', 'ANCASH                   ', 'HUARAZ                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020102', 'COCHABAMBA', '02', '01', '02', 'ANCASH                   ', 'HUARAZ                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020104', 'HUANCHAY', '02', '01', '04', 'ANCASH                   ', 'HUARAZ                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020105', 'INDEPENDENCIA', '02', '01', '05', 'ANCASH                   ', 'HUARAZ                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020108', 'OLLEROS', '02', '01', '08', 'ANCASH                   ', 'HUARAZ                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020110', 'PARIACOTO', '02', '01', '10', 'ANCASH                   ', 'HUARAZ                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020111', 'PIRA', '02', '01', '11', 'ANCASH                   ', 'HUARAZ                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020201', 'AIJA', '02', '02', '01', 'ANCASH                   ', 'AIJA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020205', 'SUCCHA', '02', '02', '05', 'ANCASH                   ', 'AIJA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020302', 'ACZO', '02', '03', '02', 'ANCASH                   ', 'ANTONIO RAYMONDI         ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020305', 'MIRGAS', '02', '03', '05', 'ANCASH                   ', 'ANTONIO RAYMONDI         ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020306', 'SAN JUAN DE RONTOY', '02', '03', '06', 'ANCASH                   ', 'ANTONIO RAYMONDI         ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020402', 'ACOCHACA', '02', '04', '02', 'ANCASH                   ', 'ASUNCION                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020501', 'CHIQUIAN', '02', '05', '01', 'ANCASH                   ', 'BOLOGNESI                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020503', 'ANTONIO RAYMONDI', '02', '05', '03', 'ANCASH                   ', 'BOLOGNESI                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020506', 'CANIS', '02', '05', '06', 'ANCASH                   ', 'BOLOGNESI                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020509', 'HUASTA', '02', '05', '09', 'ANCASH                   ', 'BOLOGNESI                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020510', 'HUAYLLACAYAN', '02', '05', '10', 'ANCASH                   ', 'BOLOGNESI                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020512', 'MANGAS', '02', '05', '12', 'ANCASH                   ', 'BOLOGNESI                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020514', 'SAN MIGUEL DE CORPANQUI', '02', '05', '14', 'ANCASH                   ', 'BOLOGNESI                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020515', 'TICLLOS', '02', '05', '15', 'ANCASH                   ', 'BOLOGNESI                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020603', 'AMASHCA', '02', '06', '03', 'ANCASH                   ', 'CARHUAZ                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020606', 'MARCARA', '02', '06', '06', 'ANCASH                   ', 'CARHUAZ                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020607', 'PARIAHUANCA', '02', '06', '07', 'ANCASH                   ', 'CARHUAZ                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020608', 'SAN MIGUEL DE ACO', '02', '06', '08', 'ANCASH                   ', 'CARHUAZ                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020611', 'YUNGAR', '02', '06', '11', 'ANCASH                   ', 'CARHUAZ                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020701', 'SAN LUIS', '02', '07', '01', 'ANCASH                   ', 'CARLOS F. FITZCARRALD    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020801', 'CASMA', '02', '08', '01', 'ANCASH                   ', 'CASMA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020803', 'COMANDANTE NOEL', '02', '08', '03', 'ANCASH                   ', 'CASMA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020804', 'YAUTAN', '02', '08', '04', 'ANCASH                   ', 'CASMA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020902', 'ACO', '02', '09', '02', 'ANCASH                   ', 'CORONGO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020903', 'BAMBAS', '02', '09', '03', 'ANCASH                   ', 'CORONGO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020904', 'CUSCA', '02', '09', '04', 'ANCASH                   ', 'CORONGO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('020906', 'YANAC', '02', '09', '06', 'ANCASH                   ', 'CORONGO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021001', 'HUARI', '02', '10', '01', 'ANCASH                   ', 'HUARI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021004', 'CHAVIN DE HUANTAR', '02', '10', '04', 'ANCASH                   ', 'HUARI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021005', 'HUACACHI', '02', '10', '05', 'ANCASH                   ', 'HUARI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021007', 'HUACHIS', '02', '10', '07', 'ANCASH                   ', 'HUARI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021008', 'HUANTAR', '02', '10', '08', 'ANCASH                   ', 'HUARI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021010', 'PAUCAS', '02', '10', '10', 'ANCASH                   ', 'HUARI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021014', 'SAN MARCOS', '02', '10', '14', 'ANCASH                   ', 'HUARI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021015', 'SAN PEDRO DE CHANA', '02', '10', '15', 'ANCASH                   ', 'HUARI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021016', 'UCO', '02', '10', '16', 'ANCASH                   ', 'HUARI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021103', 'CULEBRAS', '02', '11', '03', 'ANCASH                   ', 'HUARMEY                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021201', 'CARAZ', '02', '12', '01', 'ANCASH                   ', 'HUAYLAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021202', 'HUALLANCA', '02', '12', '02', 'ANCASH                   ', 'HUAYLAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021204', 'HUAYLAS', '02', '12', '04', 'ANCASH                   ', 'HUAYLAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021207', 'PUEBLO LIBRE', '02', '12', '07', 'ANCASH                   ', 'HUAYLAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021210', 'YURACMARCA', '02', '12', '10', 'ANCASH                   ', 'HUAYLAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021301', 'PISCOBAMBA', '02', '13', '01', 'ANCASH                   ', 'MARISCAL LUZURIAGA       ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021303', 'ELEAZAR GUZMAN BARRON', '02', '13', '03', 'ANCASH                   ', 'MARISCAL LUZURIAGA       ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021304', 'FIDEL OLIVAS ESCUDERO', '02', '13', '04', 'ANCASH                   ', 'MARISCAL LUZURIAGA       ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021306', 'LLUMPA', '02', '13', '06', 'ANCASH                   ', 'MARISCAL LUZURIAGA       ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021402', 'ACAS', '02', '14', '02', 'ANCASH                   ', 'OCROS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021404', 'CARHUAPAMPA', '02', '14', '04', 'ANCASH                   ', 'OCROS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021406', 'CONGAS', '02', '14', '06', 'ANCASH                   ', 'OCROS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021407', 'LLIPA', '02', '14', '07', 'ANCASH                   ', 'OCROS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021409', 'SAN PEDRO', '02', '14', '09', 'ANCASH                   ', 'OCROS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021410', 'SANTIAGO DE CHILCAS', '02', '14', '10', 'ANCASH                   ', 'OCROS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021503', 'CONCHUCOS', '02', '15', '03', 'ANCASH                   ', 'PALLASCA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021506', 'LACABAMBA', '02', '15', '06', 'ANCASH                   ', 'PALLASCA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021508', 'PALLASCA', '02', '15', '08', 'ANCASH                   ', 'PALLASCA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021509', 'PAMPAS', '02', '15', '09', 'ANCASH                   ', 'PALLASCA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021510', 'SANTA ROSA', '02', '15', '10', 'ANCASH                   ', 'PALLASCA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021601', 'POMABAMBA', '02', '16', '01', 'ANCASH                   ', 'POMABAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021603', 'PAROBAMBA', '02', '16', '03', 'ANCASH                   ', 'POMABAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021702', 'CATAC', '02', '17', '02', 'ANCASH                   ', 'RECUAY                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021703', 'COTAPARACO', '02', '17', '03', 'ANCASH                   ', 'RECUAY                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021707', 'PAMPAS CHICO', '02', '17', '07', 'ANCASH                   ', 'RECUAY                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021710', 'TICAPAMPA', '02', '17', '10', 'ANCASH                   ', 'RECUAY                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021801', 'CHIMBOTE', '02', '18', '01', 'ANCASH                   ', 'DEL SANTA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021803', 'COISHCO', '02', '18', '03', 'ANCASH                   ', 'DEL SANTA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021804', 'MACATE', '02', '18', '04', 'ANCASH                   ', 'DEL SANTA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021806', 'NEPE¥A', '02', '18', '06', 'ANCASH                   ', 'DEL SANTA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021808', 'SANTA', '02', '18', '08', 'ANCASH                   ', 'DEL SANTA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021809', 'NUEVO CHIMBOTE', '02', '18', '09', 'ANCASH                   ', 'DEL SANTA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021903', 'ALFONSO UGARTE', '02', '19', '03', 'ANCASH                   ', 'SIHUAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021906', 'HUAYLLABAMBA', '02', '19', '06', 'ANCASH                   ', 'SIHUAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021908', 'RAGASH', '02', '19', '08', 'ANCASH                   ', 'SIHUAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('021910', 'SICSIBAMBA', '02', '19', '10', 'ANCASH                   ', 'SIHUAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('022002', 'CASCAPARA', '02', '20', '02', 'ANCASH                   ', 'YUNGAY                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('022005', 'QUILLO', '02', '20', '05', 'ANCASH                   ', 'YUNGAY                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('022007', 'SHUPLUY', '02', '20', '07', 'ANCASH                   ', 'YUNGAY                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030103', 'CIRCA', '03', '01', '03', 'APURIMAC                 ', 'ABANCAY                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030105', 'HUANIPACA', '03', '01', '05', 'APURIMAC                 ', 'ABANCAY                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030108', 'SAN PEDRO DE CACHORA', '03', '01', '08', 'APURIMAC                 ', 'ABANCAY                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030109', 'TAMBURCO', '03', '01', '09', 'APURIMAC                 ', 'ABANCAY                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030204', 'HUANCARAMA', '03', '02', '04', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030206', 'HUAYANA', '03', '02', '06', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030208', 'PACOBAMBA', '03', '02', '08', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030210', 'PAMPACHIRI', '03', '02', '10', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030211', 'POMACOCHA', '03', '02', '11', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030213', 'SAN JERONIMO', '03', '02', '13', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030215', 'SANTA MARIA DE CHICMO', '03', '02', '15', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030217', 'TUMAY HUARACA', '03', '02', '17', 'APURIMAC                 ', 'ANDAHUAYLAS              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030301', 'ANTABAMBA', '03', '03', '01', 'APURIMAC                 ', 'ANTABAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030303', 'HUAQUIRCA', '03', '03', '03', 'APURIMAC                 ', 'ANTABAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030305', 'OROPESA', '03', '03', '05', 'APURIMAC                 ', 'ANTABAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030307', 'SABAINO', '03', '03', '07', 'APURIMAC                 ', 'ANTABAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030402', 'CAPAYA', '03', '04', '02', 'APURIMAC                 ', 'AYMARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030403', 'CARAYBAMBA', '03', '04', '03', 'APURIMAC                 ', 'AYMARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030405', 'COLCABAMBA', '03', '04', '05', 'APURIMAC                 ', 'AYMARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030409', 'LUCRE', '03', '04', '09', 'APURIMAC                 ', 'AYMARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030411', 'SAN JUAN DE CHAC¥A', '03', '04', '11', 'APURIMAC                 ', 'AYMARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030412', 'SA¥AYCA', '03', '04', '12', 'APURIMAC                 ', 'AYMARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030414', 'TAPAIRIHUA', '03', '04', '14', 'APURIMAC                 ', 'AYMARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030415', 'TINTAY', '03', '04', '15', 'APURIMAC                 ', 'AYMARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030501', 'TAMBOBAMBA', '03', '05', '01', 'APURIMAC                 ', 'COTABAMBAS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030503', 'COYLLURQUI', '03', '05', '03', 'APURIMAC                 ', 'COTABAMBAS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030504', 'HAQUIRA', '03', '05', '04', 'APURIMAC                 ', 'COTABAMBAS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030506', 'CHALLHUAHUACHO', '03', '05', '06', 'APURIMAC                 ', 'COTABAMBAS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030603', 'COCHARCAS', '03', '06', '03', 'APURIMAC                 ', 'CHINCHEROS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030604', 'HUACCANA', '03', '06', '04', 'APURIMAC                 ', 'CHINCHEROS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030606', 'ONGOY', '03', '06', '06', 'APURIMAC                 ', 'CHINCHEROS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030701', 'CHUQUIBAMBILLA', '03', '07', '01', 'APURIMAC                 ', 'GRAU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030702', 'CURPAHUASI', '03', '07', '02', 'APURIMAC                 ', 'GRAU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030704', 'HUAYLLATI', '03', '07', '04', 'APURIMAC                 ', 'GRAU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030707', 'PATAYPAMPA', '03', '07', '07', 'APURIMAC                 ', 'GRAU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030710', 'SANTA ROSA', '03', '07', '10', 'APURIMAC                 ', 'GRAU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030711', 'TURPAY', '03', '07', '11', 'APURIMAC                 ', 'GRAU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030713', 'VIRUNDO', '03', '07', '13', 'APURIMAC                 ', 'GRAU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('030714', 'CURASCO', '03', '07', '14', 'APURIMAC                 ', 'GRAU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040102', 'ALTO SELVA ALEGRE', '04', '01', '02', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040104', 'CERRO COLORADO', '04', '01', '04', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040106', 'CHIGUATA', '04', '01', '06', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040107', 'JACOBO HUNTER', '04', '01', '07', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040108', 'LA JOYA', '04', '01', '08', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040110', 'MIRAFLORES', '04', '01', '10', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040113', 'POCSI', '04', '01', '13', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040116', 'SABANDIA', '04', '01', '16', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040117', 'SACHACA', '04', '01', '17', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040119', 'SAN JUAN DE TARUCANI', '04', '01', '19', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040120', 'SANTA ISABEL DE SIGUAS', '04', '01', '20', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040122', 'SOCABAYA', '04', '01', '22', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040126', 'YANAHUARA', '04', '01', '26', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040128', 'YURA', '04', '01', '28', 'AREQUIPA                 ', 'AREQUIPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040202', 'JOSE MARIA QUIMPER', '04', '02', '02', 'AREQUIPA                 ', 'CAMANA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040204', 'MARISCAL CACERES', '04', '02', '04', 'AREQUIPA                 ', 'CAMANA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040206', 'OCO¥A', '04', '02', '06', 'AREQUIPA                 ', 'CAMANA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040208', 'SAMUEL PASTOR', '04', '02', '08', 'AREQUIPA                 ', 'CAMANA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040302', 'ACARI', '04', '03', '02', 'AREQUIPA                 ', 'CARAVELI                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040303', 'ATICO', '04', '03', '03', 'AREQUIPA                 ', 'CARAVELI                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040305', 'BELLA UNION', '04', '03', '05', 'AREQUIPA                 ', 'CARAVELI                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040306', 'CAHUACHO', '04', '03', '06', 'AREQUIPA                 ', 'CARAVELI                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040309', 'HUANUHUANU', '04', '03', '09', 'AREQUIPA                 ', 'CARAVELI                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040311', 'LOMAS', '04', '03', '11', 'AREQUIPA                 ', 'CARAVELI                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040312', 'QUICACHA', '04', '03', '12', 'AREQUIPA                 ', 'CARAVELI                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040401', 'APLAO', '04', '04', '01', 'AREQUIPA                 ', 'CASTILLA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040404', 'CHACHAS', '04', '04', '04', 'AREQUIPA                 ', 'CASTILLA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040405', 'CHILCAYMARCA', '04', '04', '05', 'AREQUIPA                 ', 'CASTILLA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040406', 'CHOCO', '04', '04', '06', 'AREQUIPA                 ', 'CASTILLA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040411', 'TIPAN', '04', '04', '11', 'AREQUIPA                 ', 'CASTILLA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040412', 'U¥ON', '04', '04', '12', 'AREQUIPA                 ', 'CASTILLA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040414', 'VIRACO', '04', '04', '14', 'AREQUIPA                 ', 'CASTILLA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040504', 'CALLALLI', '04', '05', '04', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040506', 'COPORAQUE', '04', '05', '06', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040507', 'HUAMBO', '04', '05', '07', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040509', 'ICHUPAMPA', '04', '05', '09', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040511', 'LLUTA', '04', '05', '11', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040513', 'MADRIGAL', '04', '05', '13', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040515', 'SIBAYO', '04', '05', '15', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040518', 'TUTI', '04', '05', '18', 'AREQUIPA                 ', 'CAYLLOMA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040601', 'CHUQUIBAMBA', '04', '06', '01', 'AREQUIPA                 ', 'CONDESUYOS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040603', 'CAYARANI', '04', '06', '03', 'AREQUIPA                 ', 'CONDESUYOS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040605', 'IRAY', '04', '06', '05', 'AREQUIPA                 ', 'CONDESUYOS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040606', 'RIO GRANDE', '04', '06', '06', 'AREQUIPA                 ', 'CONDESUYOS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040608', 'YANAQUIHUA', '04', '06', '08', 'AREQUIPA                 ', 'CONDESUYOS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040702', 'COCACHACRA', '04', '07', '02', 'AREQUIPA                 ', 'ISLAY                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040704', 'ISLAY', '04', '07', '04', 'AREQUIPA                 ', 'ISLAY                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040706', 'PUNTA DE BOMBON', '04', '07', '06', 'AREQUIPA                 ', 'ISLAY                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040802', 'ALCA', '04', '08', '02', 'AREQUIPA                 ', 'LA UNION                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040803', 'CHARCANA', '04', '08', '03', 'AREQUIPA                 ', 'LA UNION                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040806', 'PUYCA', '04', '08', '06', 'AREQUIPA                 ', 'LA UNION                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040807', 'QUECHUALLA', '04', '08', '07', 'AREQUIPA                 ', 'LA UNION                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('040809', 'TAURIA', '04', '08', '09', 'AREQUIPA                 ', 'LA UNION                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050101', 'AYACUCHO', '05', '01', '01', 'AYACUCHO                 ', 'HUAMANGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050104', 'CARMEN ALTO', '05', '01', '04', 'AYACUCHO                 ', 'HUAMANGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050105', 'CHIARA', '05', '01', '05', 'AYACUCHO                 ', 'HUAMANGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050107', 'PACAYCASA', '05', '01', '07', 'AYACUCHO                 ', 'HUAMANGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050109', 'SAN JOSE DE TICLLAS', '05', '01', '09', 'AYACUCHO                 ', 'HUAMANGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050110', 'SAN JUAN BAUTISTA', '05', '01', '10', 'AYACUCHO                 ', 'HUAMANGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050113', 'TAMBILLO', '05', '01', '13', 'AYACUCHO                 ', 'HUAMANGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050202', 'CHUSCHI', '05', '02', '02', 'AYACUCHO                 ', 'CANGALLO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050204', 'MARIA PARADO DE BELLIDO', '05', '02', '04', 'AYACUCHO                 ', 'CANGALLO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050205', 'PARAS', '05', '02', '05', 'AYACUCHO                 ', 'CANGALLO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050301', 'SANCOS', '05', '03', '01', 'AYACUCHO                 ', 'HUANCA SANCOS            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050302', 'CARAPO', '05', '03', '02', 'AYACUCHO                 ', 'HUANCA SANCOS            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050401', 'HUANTA', '05', '04', '01', 'AYACUCHO                 ', 'HUANTA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050403', 'HUAMANGUILLA', '05', '04', '03', 'AYACUCHO                 ', 'HUANTA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050406', 'SANTILLANA', '05', '04', '06', 'AYACUCHO                 ', 'HUANTA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050407', 'SIVIA', '05', '04', '07', 'AYACUCHO                 ', 'HUANTA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050502', 'ANCO', '05', '05', '02', 'AYACUCHO                 ', 'LA MAR                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050503', 'AYNA', '05', '05', '03', 'AYACUCHO                 ', 'LA MAR                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050505', 'CHUNGUI', '05', '05', '05', 'AYACUCHO                 ', 'LA MAR                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050507', 'SANTA ROSA', '05', '05', '07', 'AYACUCHO                 ', 'LA MAR                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050601', 'PUQUIO', '05', '06', '01', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050603', 'CABANA', '05', '06', '03', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050606', 'CHIPAO', '05', '06', '06', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050608', 'LARAMATE', '05', '06', '08', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050609', 'LEONCIO PRADO', '05', '06', '09', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050610', 'LLAUTA', '05', '06', '10', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050612', 'OCA¥A', '05', '06', '12', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050615', 'SAN CRISTOBAL', '05', '06', '15', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050617', 'SAN PEDRO', '05', '06', '17', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050619', 'SANCOS', '05', '06', '19', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050621', 'SANTA LUCIA', '05', '06', '21', 'AYACUCHO                 ', 'LUCANAS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050701', 'CORACORA', '05', '07', '01', 'AYACUCHO                 ', 'PARINACOCHAS             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050703', 'CORONEL CASTA¥EDA', '05', '07', '03', 'AYACUCHO                 ', 'PARINACOCHAS             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050705', 'PULLO', '05', '07', '05', 'AYACUCHO                 ', 'PARINACOCHAS             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050801', 'PAUSA', '05', '08', '01', 'AYACUCHO                 ', 'PAUCAR DEL SARA SARA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050803', 'CORCULLA', '05', '08', '03', 'AYACUCHO                 ', 'PAUCAR DEL SARA SARA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050804', 'LAMPA', '05', '08', '04', 'AYACUCHO                 ', 'PAUCAR DEL SARA SARA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050805', 'MARCABAMBA', '05', '08', '05', 'AYACUCHO                 ', 'PAUCAR DEL SARA SARA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050806', 'OYOLO', '05', '08', '06', 'AYACUCHO                 ', 'PAUCAR DEL SARA SARA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050809', 'SAN JOSE DE USHUA', '05', '08', '09', 'AYACUCHO                 ', 'PAUCAR DEL SARA SARA     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050902', 'BELEN', '05', '09', '02', 'AYACUCHO                 ', 'SUCRE                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050903', 'CHALCOS', '05', '09', '03', 'AYACUCHO                 ', 'SUCRE                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050905', 'HUACA¥A', '05', '09', '05', 'AYACUCHO                 ', 'SUCRE                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050908', 'SAN PEDRO DE LARCAY', '05', '09', '08', 'AYACUCHO                 ', 'SUCRE                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050909', 'SAN SALVADOR DE QUIJE', '05', '09', '09', 'AYACUCHO                 ', 'SUCRE                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051001', 'HUANCAPI', '05', '10', '01', 'AYACUCHO                 ', 'VICTOR FAJARDO           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051003', 'APONGO', '05', '10', '03', 'AYACUCHO                 ', 'VICTOR FAJARDO           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051005', 'CANARIA', '05', '10', '05', 'AYACUCHO                 ', 'VICTOR FAJARDO           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051006', 'CAYARA', '05', '10', '06', 'AYACUCHO                 ', 'VICTOR FAJARDO           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051007', 'COLCA', '05', '10', '07', 'AYACUCHO                 ', 'VICTOR FAJARDO           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051009', 'HUANCARAYLLA', '05', '10', '09', 'AYACUCHO                 ', 'VICTOR FAJARDO           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051012', 'VILCANCHOS', '05', '10', '12', 'AYACUCHO                 ', 'VICTOR FAJARDO           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051102', 'ACCOMARCA', '05', '11', '02', 'AYACUCHO                 ', 'VILCAS HUAMAN            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051103', 'CARHUANCA', '05', '11', '03', 'AYACUCHO                 ', 'VILCAS HUAMAN            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('051106', 'INDEPENDENCIA', '05', '11', '06', 'AYACUCHO                 ', 'VILCAS HUAMAN            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060101', 'CAJAMARCA', '06', '01', '01', 'CAJAMARCA                ', 'CAJAMARCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060103', 'CHETILLA', '06', '01', '03', 'CAJAMARCA                ', 'CAJAMARCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060104', 'COSPAN', '06', '01', '04', 'CAJAMARCA                ', 'CAJAMARCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060105', 'ENCA¥ADA', '06', '01', '05', 'CAJAMARCA                ', 'CAJAMARCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060107', 'LLACANORA', '06', '01', '07', 'CAJAMARCA                ', 'CAJAMARCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060110', 'MATARA', '06', '01', '10', 'CAJAMARCA                ', 'CAJAMARCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060112', 'SAN JUAN', '06', '01', '12', 'CAJAMARCA                ', 'CAJAMARCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060201', 'CAJABAMBA', '06', '02', '01', 'CAJAMARCA                ', 'CAJABAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060204', 'SITACOCHA', '06', '02', '04', 'CAJAMARCA                ', 'CAJABAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060303', 'CORTEGANA', '06', '03', '03', 'CAJAMARCA                ', 'CELENDIN                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060305', 'JORGE CHAVEZ', '06', '03', '05', 'CAJAMARCA                ', 'CELENDIN                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060306', 'JOSE GALVEZ', '06', '03', '06', 'CAJAMARCA                ', 'CELENDIN                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060307', 'MIGUEL IGLESIAS', '06', '03', '07', 'CAJAMARCA                ', 'CELENDIN                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060309', 'SOROCHUCO', '06', '03', '09', 'CAJAMARCA                ', 'CELENDIN                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060312', 'LA LIBERTAD DE PALLAN', '06', '03', '12', 'CAJAMARCA                ', 'CELENDIN                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060402', 'ANGUIA', '06', '04', '02', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060404', 'CHIGUIRIP', '06', '04', '04', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060406', 'CHOROPAMPA', '06', '04', '06', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060408', 'CONCHAN', '06', '04', '08', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060409', 'HUAMBOS', '06', '04', '09', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060411', 'LLAMA', '06', '04', '11', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060415', 'QUEROCOTO', '06', '04', '15', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060417', 'TACABAMBA', '06', '04', '17', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060418', 'TOCMOCHE', '06', '04', '18', 'CAJAMARCA                ', 'CHOTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060501', 'CONTUMAZA', '06', '05', '01', 'CAJAMARCA                ', 'CONTUMAZA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060502', 'CHILETE', '06', '05', '02', 'CAJAMARCA                ', 'CONTUMAZA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060505', 'SAN BENITO', '06', '05', '05', 'CAJAMARCA                ', 'CONTUMAZA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060507', 'TANTARICA', '06', '05', '07', 'CAJAMARCA                ', 'CONTUMAZA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060601', 'CUTERVO', '06', '06', '01', 'CAJAMARCA                ', 'CUTERVO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060602', 'CALLAYUC', '06', '06', '02', 'CAJAMARCA                ', 'CUTERVO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060605', 'LA RAMADA', '06', '06', '05', 'CAJAMARCA                ', 'CUTERVO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060608', 'SAN ANDRES DE CUTERVO', '06', '06', '08', 'CAJAMARCA                ', 'CUTERVO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060610', 'SAN LUIS DE LUCMA', '06', '06', '10', 'CAJAMARCA                ', 'CUTERVO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060611', 'SANTA CRUZ', '06', '06', '11', 'CAJAMARCA                ', 'CUTERVO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060612', 'SANTO DOMINGO DE LA CAPILLA', '06', '06', '12', 'CAJAMARCA                ', 'CUTERVO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060614', 'SOCOTA', '06', '06', '14', 'CAJAMARCA                ', 'CUTERVO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060702', 'CHUGUR', '06', '07', '02', 'CAJAMARCA                ', 'HUALGAYOC                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060801', 'JAEN', '06', '08', '01', 'CAJAMARCA                ', 'JAEN                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060802', 'BELLAVISTA', '06', '08', '02', 'CAJAMARCA                ', 'JAEN                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060805', 'HUABAL', '06', '08', '05', 'CAJAMARCA                ', 'JAEN                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060808', 'PUCARA', '06', '08', '08', 'CAJAMARCA                ', 'JAEN                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060810', 'SAN FELIPE', '06', '08', '10', 'CAJAMARCA                ', 'JAEN                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060811', 'SAN JOSE DEL ALTO', '06', '08', '11', 'CAJAMARCA                ', 'JAEN                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060902', 'CHIRINOS', '06', '09', '02', 'CAJAMARCA                ', 'SAN IGNACIO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060904', 'LA COIPA', '06', '09', '04', 'CAJAMARCA                ', 'SAN IGNACIO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('060906', 'SAN JOSE DE LOURDES', '06', '09', '06', 'CAJAMARCA                ', 'SAN IGNACIO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061001', 'PEDRO GALVEZ', '06', '10', '01', 'CAJAMARCA                ', 'SAN MARCOS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061004', 'GREGORIO PITA', '06', '10', '04', 'CAJAMARCA                ', 'SAN MARCOS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061005', 'ICHOCAN', '06', '10', '05', 'CAJAMARCA                ', 'SAN MARCOS               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061101', 'SAN MIGUEL', '06', '11', '01', 'CAJAMARCA                ', 'SAN MIGUEL               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061103', 'CALQUIS', '06', '11', '03', 'CAJAMARCA                ', 'SAN MIGUEL               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061107', 'LLAPA', '06', '11', '07', 'CAJAMARCA                ', 'SAN MIGUEL               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061108', 'NANCHOC', '06', '11', '08', 'CAJAMARCA                ', 'SAN MIGUEL               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061110', 'SAN GREGORIO', '06', '11', '10', 'CAJAMARCA                ', 'SAN MIGUEL               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061112', 'TONGOD', '06', '11', '12', 'CAJAMARCA                ', 'SAN MIGUEL               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061202', 'SAN BERNARDINO', '06', '12', '02', 'CAJAMARCA                ', 'SAN PABLO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061203', 'SAN LUIS', '06', '12', '03', 'CAJAMARCA                ', 'SAN PABLO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061302', 'ANDABAMBA', '06', '13', '02', 'CAJAMARCA                ', 'SANTA CRUZ               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061304', 'CHANCAYBA¥OS', '06', '13', '04', 'CAJAMARCA                ', 'SANTA CRUZ               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061305', 'LA ESPERANZA', '06', '13', '05', 'CAJAMARCA                ', 'SANTA CRUZ               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061307', 'PULAN', '06', '13', '07', 'CAJAMARCA                ', 'SANTA CRUZ               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061308', 'SAUCEPAMPA', '06', '13', '08', 'CAJAMARCA                ', 'SANTA CRUZ               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('061311', 'YAUYUCAN', '06', '13', '11', 'CAJAMARCA                ', 'SANTA CRUZ               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('070102', 'BELLAVISTA', '07', '01', '02', 'CALLAO                   ', 'CALLAO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('070104', 'LA PERLA', '07', '01', '04', 'CALLAO                   ', 'CALLAO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('070106', 'VENTANILLA', '07', '01', '06', 'CALLAO                   ', 'CALLAO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080102', 'CCORCA', '08', '01', '02', 'CUSCO                    ', 'CUSCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080105', 'SAN SEBASTIAN', '08', '01', '05', 'CUSCO                    ', 'CUSCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080107', 'SAYLLA', '08', '01', '07', 'CUSCO                    ', 'CUSCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080108', 'WANCHAQ', '08', '01', '08', 'CUSCO                    ', 'CUSCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080201', 'ACOMAYO', '08', '02', '01', 'CUSCO                    ', 'ACOMAYO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080203', 'ACOS', '08', '02', '03', 'CUSCO                    ', 'ACOMAYO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080204', 'MOSOC LLACTA', '08', '02', '04', 'CUSCO                    ', 'ACOMAYO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080206', 'RONDOCAN', '08', '02', '06', 'CUSCO                    ', 'ACOMAYO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080303', 'CACHIMAYO', '08', '03', '03', 'CUSCO                    ', 'ANTA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080305', 'HUAROCONDO', '08', '03', '05', 'CUSCO                    ', 'ANTA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080307', 'MOLLEPATA', '08', '03', '07', 'CUSCO                    ', 'ANTA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080308', 'PUCYURA', '08', '03', '08', 'CUSCO                    ', 'ANTA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080403', 'LAMAY', '08', '04', '03', 'CUSCO                    ', 'CALCA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080405', 'PISAC', '08', '04', '05', 'CUSCO                    ', 'CALCA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080407', 'TARAY', '08', '04', '07', 'CUSCO                    ', 'CALCA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080408', 'YANATILE', '08', '04', '08', 'CUSCO                    ', 'CALCA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080503', 'KUNTURKANKI', '08', '05', '03', 'CUSCO                    ', 'CANAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080504', 'LANGUI', '08', '05', '04', 'CUSCO                    ', 'CANAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080506', 'PAMPAMARCA', '08', '05', '06', 'CUSCO                    ', 'CANAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080508', 'TUPAC AMARU', '08', '05', '08', 'CUSCO                    ', 'CANAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080603', 'COMBAPATA', '08', '06', '03', 'CUSCO                    ', 'CANCHIS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080604', 'MARANGANI', '08', '06', '04', 'CUSCO                    ', 'CANCHIS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080607', 'SAN PEDRO', '08', '06', '07', 'CUSCO                    ', 'CANCHIS                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080701', 'SANTO TOMAS', '08', '07', '01', 'CUSCO                    ', 'CHUMBIVILCAS             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080702', 'CAPACMARCA', '08', '07', '02', 'CUSCO                    ', 'CHUMBIVILCAS             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080705', 'LIVITACA', '08', '07', '05', 'CUSCO                    ', 'CHUMBIVILCAS             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080708', 'VELILLE', '08', '07', '08', 'CUSCO                    ', 'CHUMBIVILCAS             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080802', 'CONDOROMA', '08', '08', '02', 'CUSCO                    ', 'ESPINAR                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080804', 'OCORURO', '08', '08', '04', 'CUSCO                    ', 'ESPINAR                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080805', 'PALLPATA', '08', '08', '05', 'CUSCO                    ', 'ESPINAR                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080806', 'PICHIGUA', '08', '08', '06', 'CUSCO                    ', 'ESPINAR                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080808', 'ALTO PICHIGUA', '08', '08', '08', 'CUSCO                    ', 'ESPINAR                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080901', 'SANTA ANA', '08', '09', '01', 'CUSCO                    ', 'LA CONVENCION            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080903', 'HUAYOPATA', '08', '09', '03', 'CUSCO                    ', 'LA CONVENCION            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080907', 'KIMBIRI', '08', '09', '07', 'CUSCO                    ', 'LA CONVENCION            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080908', 'SANTA TERESA', '08', '09', '08', 'CUSCO                    ', 'LA CONVENCION            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080910', 'PICHARI', '08', '09', '10', 'CUSCO                    ', 'LA CONVENCION            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081002', 'ACCHA', '08', '10', '02', 'CUSCO                    ', 'PARURO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081005', 'HUANOQUITE', '08', '10', '05', 'CUSCO                    ', 'PARURO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081006', 'OMACHA', '08', '10', '06', 'CUSCO                    ', 'PARURO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081007', 'PACCARITAMBO', '08', '10', '07', 'CUSCO                    ', 'PARURO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081101', 'PAUCARTAMBO', '08', '11', '01', 'CUSCO                    ', 'PAUCARTAMBO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081103', 'CHALLABAMBA', '08', '11', '03', 'CUSCO                    ', 'PAUCARTAMBO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081105', 'HUANCARANI', '08', '11', '05', 'CUSCO                    ', 'PAUCARTAMBO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081202', 'ANDAHUAYLILLAS', '08', '12', '02', 'CUSCO                    ', 'QUISPICANCHI             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081203', 'CAMANTI', '08', '12', '03', 'CUSCO                    ', 'QUISPICANCHI             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081205', 'CCATCA', '08', '12', '05', 'CUSCO                    ', 'QUISPICANCHI             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081207', 'HUARO', '08', '12', '07', 'CUSCO                    ', 'QUISPICANCHI             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081209', 'MARCAPATA', '08', '12', '09', 'CUSCO                    ', 'QUISPICANCHI             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081210', 'OCONGATE', '08', '12', '10', 'CUSCO                    ', 'QUISPICANCHI             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081301', 'URUBAMBA', '08', '13', '01', 'CUSCO                    ', 'URUBAMBA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081303', 'HUAYLLABAMBA', '08', '13', '03', 'CUSCO                    ', 'URUBAMBA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081304', 'MACHUPICCHU', '08', '13', '04', 'CUSCO                    ', 'URUBAMBA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('081305', 'MARAS', '08', '13', '05', 'CUSCO                    ', 'URUBAMBA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090101', 'HUANCAVELICA', '09', '01', '01', 'HUANCAVELICA             ', 'HUANCAVELICA             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090104', 'CONAYCA', '09', '01', '04', 'HUANCAVELICA             ', 'HUANCAVELICA             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090106', 'HUACHOCOLPA', '09', '01', '06', 'HUANCAVELICA             ', 'HUANCAVELICA             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090107', 'HUAYLLAHUARA', '09', '01', '07', 'HUANCAVELICA             ', 'HUANCAVELICA             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090110', 'MANTA', '09', '01', '10', 'HUANCAVELICA             ', 'HUANCAVELICA             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090111', 'MARISCAL CACERES', '09', '01', '11', 'HUANCAVELICA             ', 'HUANCAVELICA             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090114', 'PALCA', '09', '01', '14', 'HUANCAVELICA             ', 'HUANCAVELICA             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090116', 'VILCA', '09', '01', '16', 'HUANCAVELICA             ', 'HUANCAVELICA             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090117', 'YAULI', '09', '01', '17', 'HUANCAVELICA             ', 'HUANCAVELICA             ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090201', 'ACOBAMBA', '09', '02', '01', 'HUANCAVELICA             ', 'ACOBAMBA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090204', 'CAJA', '09', '02', '04', 'HUANCAVELICA             ', 'ACOBAMBA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090207', 'POMACOCHA', '09', '02', '07', 'HUANCAVELICA             ', 'ACOBAMBA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090301', 'LIRCAY', '09', '03', '01', 'HUANCAVELICA             ', 'ANGARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090302', 'ANCHONGA', '09', '03', '02', 'HUANCAVELICA             ', 'ANGARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090304', 'CCOCHACCASA', '09', '03', '04', 'HUANCAVELICA             ', 'ANGARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090306', 'CONGALLA', '09', '03', '06', 'HUANCAVELICA             ', 'ANGARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090307', 'HUANCA-HUANCA', '09', '03', '07', 'HUANCAVELICA             ', 'ANGARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090308', 'HUAYLLAY GRANDE', '09', '03', '08', 'HUANCAVELICA             ', 'ANGARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090310', 'SAN ANTONIO DE ANTAPARCO', '09', '03', '10', 'HUANCAVELICA             ', 'ANGARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090311', 'SANTO TOMAS DE PATA', '09', '03', '11', 'HUANCAVELICA             ', 'ANGARAES                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090402', 'ARMA', '09', '04', '02', 'HUANCAVELICA             ', 'CASTROVIRREYNA           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090406', 'COCAS', '09', '04', '06', 'HUANCAVELICA             ', 'CASTROVIRREYNA           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090409', 'MOLLEPAMPA', '09', '04', '09', 'HUANCAVELICA             ', 'CASTROVIRREYNA           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090411', 'SANTA ANA', '09', '04', '11', 'HUANCAVELICA             ', 'CASTROVIRREYNA           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090413', 'TICRAPO', '09', '04', '13', 'HUANCAVELICA             ', 'CASTROVIRREYNA           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090502', 'ANCO', '09', '05', '02', 'HUANCAVELICA             ', 'CHURCAMPA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090503', 'CHINCHIHUASI', '09', '05', '03', 'HUANCAVELICA             ', 'CHURCAMPA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090505', 'LA MERCED', '09', '05', '05', 'HUANCAVELICA             ', 'CHURCAMPA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090506', 'LOCROJA', '09', '05', '06', 'HUANCAVELICA             ', 'CHURCAMPA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090508', 'SAN MIGUEL DE MAYOCC', '09', '05', '08', 'HUANCAVELICA             ', 'CHURCAMPA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090509', 'SAN PEDRO DE CORIS', '09', '05', '09', 'HUANCAVELICA             ', 'CHURCAMPA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090601', 'HUAYTARA', '09', '06', '01', 'HUANCAVELICA             ', 'HUAYTARA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090603', 'CORDOVA', '09', '06', '03', 'HUANCAVELICA             ', 'HUAYTARA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090606', 'OCOYO', '09', '06', '06', 'HUANCAVELICA             ', 'HUAYTARA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090609', 'QUITO-ARMA', '09', '06', '09', 'HUANCAVELICA             ', 'HUAYTARA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090610', 'SAN ANTONIO DE CUSICANCHA', '09', '06', '10', 'HUANCAVELICA             ', 'HUAYTARA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090612', 'SAN ISIDRO', '09', '06', '12', 'HUANCAVELICA             ', 'HUAYTARA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090614', 'SANTIAGO DE QUIRAHUARA', '09', '06', '14', 'HUANCAVELICA             ', 'HUAYTARA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090615', 'SANTO DOMINGO DE CAPILLAS', '09', '06', '15', 'HUANCAVELICA             ', 'HUAYTARA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090702', 'ACOSTAMBO', '09', '07', '02', 'HUANCAVELICA             ', 'TAYACAJA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090705', 'COLCABAMBA', '09', '07', '05', 'HUANCAVELICA             ', 'TAYACAJA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230303', 'ITE', '23', '03', '03', 'TACNA                    ', 'JORGE BASADRE            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090707', 'HUACHOCOLPA', '09', '07', '07', 'HUANCAVELICA             ', 'TAYACAJA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090710', '¥AHUIMPUQUIO', '09', '07', '10', 'HUANCAVELICA             ', 'TAYACAJA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090713', 'QUISHUAR', '09', '07', '13', 'HUANCAVELICA             ', 'TAYACAJA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090716', 'SAN MARCOS DE ROCCHAC', '09', '07', '16', 'HUANCAVELICA             ', 'TAYACAJA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090718', 'TINTAY PUNCU', '09', '07', '18', 'HUANCAVELICA             ', 'TAYACAJA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100103', 'CHINCHAO', '10', '01', '03', 'HUANUCO                  ', 'HUANUCO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100105', 'MARGOS', '10', '01', '05', 'HUANUCO                  ', 'HUANUCO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100106', 'QUISQUI', '10', '01', '06', 'HUANUCO                  ', 'HUANUCO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100107', 'SAN FRANCISCO DE CAYRAN', '10', '01', '07', 'HUANUCO                  ', 'HUANUCO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100109', 'SANTA MARIA DEL VALLE', '10', '01', '09', 'HUANUCO                  ', 'HUANUCO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100203', 'COLPAS', '10', '02', '03', 'HUANUCO                  ', 'AMBO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100205', 'HUACAR', '10', '02', '05', 'HUANUCO                  ', 'AMBO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100207', 'SAN RAFAEL', '10', '02', '07', 'HUANUCO                  ', 'AMBO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100307', 'CHUQUIS', '10', '03', '07', 'HUANUCO                  ', 'DOS DE MAYO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100313', 'PACHAS', '10', '03', '13', 'HUANUCO                  ', 'DOS DE MAYO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100316', 'QUIVILLA', '10', '03', '16', 'HUANUCO                  ', 'DOS DE MAYO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100322', 'SILLAPATA', '10', '03', '22', 'HUANUCO                  ', 'DOS DE MAYO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100402', 'CANCHABAMBA', '10', '04', '02', 'HUANUCO                  ', 'HUACAYBAMBA              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100404', 'PINRA', '10', '04', '04', 'HUANUCO                  ', 'HUACAYBAMBA              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100504', 'JACAS GRANDE', '10', '05', '04', 'HUANUCO                  ', 'HUAMALIES                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100506', 'MIRAFLORES', '10', '05', '06', 'HUANUCO                  ', 'HUAMALIES                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100507', 'MONZON', '10', '05', '07', 'HUANUCO                  ', 'HUAMALIES                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100509', 'PU¥OS', '10', '05', '09', 'HUANUCO                  ', 'HUAMALIES                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100602', 'DANIEL ALOMIAS ROBLES', '10', '06', '02', 'HUANUCO                  ', 'LEONCIO PRADO            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100604', 'JOSE CRESPO Y CASTILLO', '10', '06', '04', 'HUANUCO                  ', 'LEONCIO PRADO            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100605', 'LUYANDO', '10', '06', '05', 'HUANUCO                  ', 'LEONCIO PRADO            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100701', 'HUACRACHUCO', '10', '07', '01', 'HUANUCO                  ', 'MARA¾ON                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100801', 'PANAO', '10', '08', '01', 'HUANUCO                  ', 'PACHITEA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100802', 'CHAGLLA', '10', '08', '02', 'HUANUCO                  ', 'PACHITEA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100804', 'UMARI', '10', '08', '04', 'HUANUCO                  ', 'PACHITEA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100901', 'PUERTO INCA', '10', '09', '01', 'HUANUCO                  ', 'PUERTO INCA              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('100903', 'HONORIA', '10', '09', '03', 'HUANUCO                  ', 'PUERTO INCA              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('101002', 'BA¥OS', '10', '10', '02', 'HUANUCO                  ', 'LAURICOCHA               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('101004', 'QUEROPALCA', '10', '10', '04', 'HUANUCO                  ', 'LAURICOCHA               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('101005', 'RONDOS', '10', '10', '05', 'HUANUCO                  ', 'LAURICOCHA               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('101006', 'SAN FRANCISCO DE ASIS', '10', '10', '06', 'HUANUCO                  ', 'LAURICOCHA               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('101102', 'CAHUAC', '10', '11', '02', 'HUANUCO                  ', 'YAROWILCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('101104', 'APARICIO POMARES', '10', '11', '04', 'HUANUCO                  ', 'YAROWILCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('101106', 'OBAS', '10', '11', '06', 'HUANUCO                  ', 'YAROWILCA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110102', 'LA TINGUI¥A', '11', '01', '02', 'ICA                      ', 'ICA                      ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110104', 'OCUCAJE', '11', '01', '04', 'ICA                      ', 'ICA                      ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110106', 'PARCONA', '11', '01', '06', 'ICA                      ', 'ICA                      ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110108', 'SALAS', '11', '01', '08', 'ICA                      ', 'ICA                      ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110109', 'SAN JOSE DE LOS MOLINOS', '11', '01', '09', 'ICA                      ', 'ICA                      ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110110', 'SAN JUAN BAUTISTA', '11', '01', '10', 'ICA                      ', 'ICA                      ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110113', 'TATE', '11', '01', '13', 'ICA                      ', 'ICA                      ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110201', 'CHINCHA ALTA', '11', '02', '01', 'ICA                      ', 'CHINCHA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110203', 'CHAVIN', '11', '02', '03', 'ICA                      ', 'CHINCHA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110205', 'EL CARMEN', '11', '02', '05', 'ICA                      ', 'CHINCHA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110206', 'GROCIO PRADO', '11', '02', '06', 'ICA                      ', 'CHINCHA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110209', 'SAN PEDRO DE HUACARPANA', '11', '02', '09', 'ICA                      ', 'CHINCHA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110301', 'NAZCA', '11', '03', '01', 'ICA                      ', 'NAZCA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110303', 'EL INGENIO', '11', '03', '03', 'ICA                      ', 'NAZCA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110304', 'MARCONA', '11', '03', '04', 'ICA                      ', 'NAZCA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110401', 'PALPA', '11', '04', '01', 'ICA                      ', 'PALPA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110402', 'LLIPATA', '11', '04', '02', 'ICA                      ', 'PALPA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110405', 'TIBILLO', '11', '04', '05', 'ICA                      ', 'PALPA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110502', 'HUANCANO', '11', '05', '02', 'ICA                      ', 'PISCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110505', 'PARACAS', '11', '05', '05', 'ICA                      ', 'PISCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110506', 'SAN ANDRES', '11', '05', '06', 'ICA                      ', 'PISCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('110508', 'TUPAC AMARU INCA', '11', '05', '08', 'ICA                      ', 'PISCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120101', 'HUANCAYO', '12', '01', '01', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120105', 'CHACAPAMPA', '12', '01', '05', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120108', 'CHONGOS ALTO', '12', '01', '08', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120111', 'CHUPURO', '12', '01', '11', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120113', 'CULLHUAS', '12', '01', '13', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120114', 'EL TAMBO', '12', '01', '14', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120117', 'HUALHUAS', '12', '01', '17', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120121', 'HUAYUCACHI', '12', '01', '21', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120122', 'INGENIO', '12', '01', '22', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120125', 'PILCOMAYO', '12', '01', '25', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120127', 'QUICHUAY', '12', '01', '27', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120129', 'SAN AGUSTIN', '12', '01', '29', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120132', 'SA¥O', '12', '01', '32', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120136', 'VIQUES', '12', '01', '36', 'JUNIN                    ', 'HUANCAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120201', 'CONCEPCION', '12', '02', '01', 'JUNIN                    ', 'CONCEPCION               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120202', 'ACO', '12', '02', '02', 'JUNIN                    ', 'CONCEPCION               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120205', 'COCHAS', '12', '02', '05', 'JUNIN                    ', 'CONCEPCION               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120207', 'HEROINAS TOLEDO', '12', '02', '07', 'JUNIN                    ', 'CONCEPCION               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120209', 'MARISCAL CASTILLA', '12', '02', '09', 'JUNIN                    ', 'CONCEPCION               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120211', 'MITO', '12', '02', '11', 'JUNIN                    ', 'CONCEPCION               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120213', 'ORCOTUNA', '12', '02', '13', 'JUNIN                    ', 'CONCEPCION               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120215', 'SANTA ROSA DE OCOPA', '12', '02', '15', 'JUNIN                    ', 'CONCEPCION               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120303', 'PICHANAQUI', '12', '03', '03', 'JUNIN                    ', 'CHANCHAMAYO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120304', 'SAN LUIS DE SHUARO', '12', '03', '04', 'JUNIN                    ', 'CHANCHAMAYO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120305', 'SAN RAMON', '12', '03', '05', 'JUNIN                    ', 'CHANCHAMAYO              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120401', 'JAUJA', '12', '04', '01', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120404', 'ATAURA', '12', '04', '04', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120407', 'EL MANTARO', '12', '04', '07', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120408', 'HUAMALI', '12', '04', '08', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120410', 'HUERTAS', '12', '04', '10', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120413', 'LEONOR ORDO¥EZ', '12', '04', '13', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120415', 'MARCO', '12', '04', '15', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120416', 'MASMA', '12', '04', '16', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120417', 'MASMA CHICCHE', '12', '04', '17', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120419', 'MONOBAMBA', '12', '04', '19', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120422', 'PACA', '12', '04', '22', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120424', 'PANCAN', '12', '04', '24', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120425', 'PARCO', '12', '04', '25', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120428', 'SAN LORENZO', '12', '04', '28', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120430', 'SAUSA', '12', '04', '30', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120431', 'SINCOS', '12', '04', '31', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120433', 'YAULI', '12', '04', '33', 'JUNIN                    ', 'JAUJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120503', 'ONDORES', '12', '05', '03', 'JUNIN                    ', 'JUNIN                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120601', 'SATIPO', '12', '06', '01', 'JUNIN                    ', 'SATIPO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120602', 'COVIRIALI', '12', '06', '02', 'JUNIN                    ', 'SATIPO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120604', 'MAZAMARI', '12', '06', '04', 'JUNIN                    ', 'SATIPO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120607', 'RIO NEGRO', '12', '06', '07', 'JUNIN                    ', 'SATIPO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120608', 'RIO TAMBO', '12', '06', '08', 'JUNIN                    ', 'SATIPO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120702', 'ACOBAMBA', '12', '07', '02', 'JUNIN                    ', 'TARMA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120705', 'LA UNION', '12', '07', '05', 'JUNIN                    ', 'TARMA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120706', 'PALCA', '12', '07', '06', 'JUNIN                    ', 'TARMA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120708', 'SAN PEDRO DE CAJAS', '12', '07', '08', 'JUNIN                    ', 'TARMA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120709', 'TAPO', '12', '07', '09', 'JUNIN                    ', 'TARMA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120802', 'CHACAPALPA', '12', '08', '02', 'JUNIN                    ', 'YAULI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120805', 'MOROCOCHA', '12', '08', '05', 'JUNIN                    ', 'YAULI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120807', 'SANTA BARBARA DE CARHUACAYAN', '12', '08', '07', 'JUNIN                    ', 'YAULI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120809', 'SUITUCANCHA', '12', '08', '09', 'JUNIN                    ', 'YAULI                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120901', 'CHUPACA', '12', '09', '01', 'JUNIN                    ', 'CHUPACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120903', 'CHONGOS BAJO', '12', '09', '03', 'JUNIN                    ', 'CHUPACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120905', 'HUAMANCACA CHICO', '12', '09', '05', 'JUNIN                    ', 'CHUPACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120907', 'SAN JUAN DE JARPA', '12', '09', '07', 'JUNIN                    ', 'CHUPACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('120908', 'TRES DE DICIEMBRE', '12', '09', '08', 'JUNIN                    ', 'CHUPACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130101', 'TRUJILLO', '13', '01', '01', 'LA LIBERTAD              ', 'TRUJILLO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130103', 'FLORENCIA DE MORA', '13', '01', '03', 'LA LIBERTAD              ', 'TRUJILLO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130107', 'MOCHE', '13', '01', '07', 'LA LIBERTAD              ', 'TRUJILLO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130110', 'SIMBAL', '13', '01', '10', 'LA LIBERTAD              ', 'TRUJILLO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130201', 'ASCOPE', '13', '02', '01', 'LA LIBERTAD              ', 'ASCOPE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130203', 'CHOCOPE', '13', '02', '03', 'LA LIBERTAD              ', 'ASCOPE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130205', 'PAIJAN', '13', '02', '05', 'LA LIBERTAD              ', 'ASCOPE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130207', 'SANTIAGO DE CAO', '13', '02', '07', 'LA LIBERTAD              ', 'ASCOPE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130301', 'BOLIVAR', '13', '03', '01', 'LA LIBERTAD              ', 'BOLIVAR                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130303', 'CONDORMARCA', '13', '03', '03', 'LA LIBERTAD              ', 'BOLIVAR                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130306', 'UCUNCHA', '13', '03', '06', 'LA LIBERTAD              ', 'BOLIVAR                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130401', 'CHEPEN', '13', '04', '01', 'LA LIBERTAD              ', 'CHEPEN                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130402', 'PACANGA', '13', '04', '02', 'LA LIBERTAD              ', 'CHEPEN                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130504', 'HUASO', '13', '05', '04', 'LA LIBERTAD              ', 'JULCAN                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130601', 'OTUZCO', '13', '06', '01', 'LA LIBERTAD              ', 'OTUZCO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130604', 'CHARAT', '13', '06', '04', 'LA LIBERTAD              ', 'OTUZCO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130608', 'MACHE', '13', '06', '08', 'LA LIBERTAD              ', 'OTUZCO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130610', 'PARANDAY', '13', '06', '10', 'LA LIBERTAD              ', 'OTUZCO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130614', 'USQUIL', '13', '06', '14', 'LA LIBERTAD              ', 'OTUZCO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130701', 'SAN PEDRO DE LLOC', '13', '07', '01', 'LA LIBERTAD              ', 'PACASMAYO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130704', 'PACASMAYO', '13', '07', '04', 'LA LIBERTAD              ', 'PACASMAYO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130705', 'SAN JOSE', '13', '07', '05', 'LA LIBERTAD              ', 'PACASMAYO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130801', 'TAYABAMBA', '13', '08', '01', 'LA LIBERTAD              ', 'PATAZ                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130803', 'CHILLIA', '13', '08', '03', 'LA LIBERTAD              ', 'PATAZ                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130804', 'HUANCASPATA', '13', '08', '04', 'LA LIBERTAD              ', 'PATAZ                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130806', 'HUAYO', '13', '08', '06', 'LA LIBERTAD              ', 'PATAZ                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130808', 'PARCOY', '13', '08', '08', 'LA LIBERTAD              ', 'PATAZ                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130811', 'SANTIAGO DE CHALLAS', '13', '08', '11', 'LA LIBERTAD              ', 'PATAZ                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130902', 'CHUGAY', '13', '09', '02', 'LA LIBERTAD              ', 'SANCHEZ CARRION          ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130904', 'CURGOS', '13', '09', '04', 'LA LIBERTAD              ', 'SANCHEZ CARRION          ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130906', 'SANAGORAN', '13', '09', '06', 'LA LIBERTAD              ', 'SANCHEZ CARRION          ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('130908', 'SARTIMBAMBA', '13', '09', '08', 'LA LIBERTAD              ', 'SANCHEZ CARRION          ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('131001', 'SANTIAGO DE CHUCO', '13', '10', '01', 'LA LIBERTAD              ', 'SANTIAGO DE CHUCO        ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('131002', 'ANGASMARCA', '13', '10', '02', 'LA LIBERTAD              ', 'SANTIAGO DE CHUCO        ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('131005', 'MOLLEPATA', '13', '10', '05', 'LA LIBERTAD              ', 'SANTIAGO DE CHUCO        ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('131101', 'CASCAS', '13', '11', '01', 'LA LIBERTAD              ', 'GRAN CHIMU               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('131103', 'COMPIN', '13', '11', '03', 'LA LIBERTAD              ', 'GRAN CHIMU               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('131104', 'SAYAPULLO', '13', '11', '04', 'LA LIBERTAD              ', 'GRAN CHIMU               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('131202', 'CHAO', '13', '12', '02', 'LA LIBERTAD              ', 'VIRU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('131203', 'GUADALUPITO', '13', '12', '03', 'LA LIBERTAD              ', 'VIRU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140102', 'CHONGOYAPE', '14', '01', '02', 'LAMBAYEQUE               ', 'CHICLAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140104', 'ETEN PUERTO', '14', '01', '04', 'LAMBAYEQUE               ', 'CHICLAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140108', 'MONSEFU', '14', '01', '08', 'LAMBAYEQUE               ', 'CHICLAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140109', 'NUEVA ARICA', '14', '01', '09', 'LAMBAYEQUE               ', 'CHICLAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140110', 'OYOTUN', '14', '01', '10', 'LAMBAYEQUE               ', 'CHICLAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140111', 'PICSI', '14', '01', '11', 'LAMBAYEQUE               ', 'CHICLAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140113', 'REQUE', '14', '01', '13', 'LAMBAYEQUE               ', 'CHICLAYO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140201', 'FERRE¥AFE', '14', '02', '01', 'LAMBAYEQUE               ', 'FERRE¥AFE                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140204', 'MANUEL ANTONIO MESONES MURO', '14', '02', '04', 'LAMBAYEQUE               ', 'FERRE¥AFE                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140205', 'PITIPO', '14', '02', '05', 'LAMBAYEQUE               ', 'FERRE¥AFE                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140302', 'CHOCHOPE', '14', '03', '02', 'LAMBAYEQUE               ', 'LAMBAYEQUE               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140303', 'ILLIMO', '14', '03', '03', 'LAMBAYEQUE               ', 'LAMBAYEQUE               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140305', 'MOCHUMI', '14', '03', '05', 'LAMBAYEQUE               ', 'LAMBAYEQUE               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140309', 'PACORA', '14', '03', '09', 'LAMBAYEQUE               ', 'LAMBAYEQUE               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140310', 'SALAS', '14', '03', '10', 'LAMBAYEQUE               ', 'LAMBAYEQUE               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('140312', 'TUCUME', '14', '03', '12', 'LAMBAYEQUE               ', 'LAMBAYEQUE               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150101', 'LIMA', '15', '01', '01', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150104', 'BARRANCO', '15', '01', '04', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150108', 'CHORRILLOS', '15', '01', '08', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150140', 'SANTIAGO DE SURCO', '15', '01', '40', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150107', 'CHACLACAYO', '15', '01', '07', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150110', 'COMAS', '15', '01', '10', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150112', 'INDEPENDENCIA', '15', '01', '12', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150113', 'JESUS MARIA', '15', '01', '13', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150115', 'LA VICTORIA', '15', '01', '15', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150116', 'LINCE', '15', '01', '16', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150117', 'LOS OLIVOS', '15', '01', '17', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150119', 'LURIN', '15', '01', '19', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150124', 'PUCUSANA', '15', '01', '24', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150125', 'PUENTE PIEDRA', '15', '01', '25', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150126', 'PUNTA HERMOSA', '15', '01', '26', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150136', 'SAN MIGUEL', '15', '01', '36', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150129', 'SAN BARTOLO', '15', '01', '29', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150131', 'SAN ISIDRO', '15', '01', '31', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150132', 'SAN JUAN DE LURIGANCHO', '15', '01', '32', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150138', 'SANTA MARIA DEL MAR', '15', '01', '38', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150134', 'SAN LUIS', '15', '01', '34', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150142', 'VILLA EL SALVADOR', '15', '01', '42', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150202', 'PARAMONGA', '15', '02', '02', 'LIMA                     ', 'BARRANCA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150204', 'SUPE', '15', '02', '04', 'LIMA                     ', 'BARRANCA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150303', 'GORGOR', '15', '03', '03', 'LIMA                     ', 'CAJATAMBO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150304', 'HUANCAPON', '15', '03', '04', 'LIMA                     ', 'CAJATAMBO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150401', 'CANTA', '15', '04', '01', 'LIMA                     ', 'CANTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150403', 'HUAMANTANGA', '15', '04', '03', 'LIMA                     ', 'CANTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150407', 'SANTA ROSA DE QUIVES', '15', '04', '07', 'LIMA                     ', 'CANTA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150502', 'ASIA', '15', '05', '02', 'LIMA                     ', 'CA¥ETE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150503', 'CALANGO', '15', '05', '03', 'LIMA                     ', 'CA¥ETE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150505', 'CHILCA', '15', '05', '05', 'LIMA                     ', 'CA¥ETE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150506', 'COAYLLO', '15', '05', '06', 'LIMA                     ', 'CA¥ETE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150509', 'MALA', '15', '05', '09', 'LIMA                     ', 'CA¥ETE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150512', 'QUILMANA', '15', '05', '12', 'LIMA                     ', 'CA¥ETE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150514', 'SAN LUIS', '15', '05', '14', 'LIMA                     ', 'CA¥ETE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150516', 'ZU¥IGA', '15', '05', '16', 'LIMA                     ', 'CA¥ETE                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150601', 'HUARAL', '15', '06', '01', 'LIMA                     ', 'HUARAL                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150602', 'ATAVILLOS ALTO', '15', '06', '02', 'LIMA                     ', 'HUARAL                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150604', 'AUCALLAMA', '15', '06', '04', 'LIMA                     ', 'HUARAL                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150607', 'LAMPIAN', '15', '06', '07', 'LIMA                     ', 'HUARAL                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150609', 'SAN MIGUEL DE ACOS', '15', '06', '09', 'LIMA                     ', 'HUARAL                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150611', 'SUMBILCA', '15', '06', '11', 'LIMA                     ', 'HUARAL                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150612', 'VEINTISIETE DE NOVIEMBRE', '15', '06', '12', 'LIMA                     ', 'HUARAL                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150702', 'ANTIOQUIA', '15', '07', '02', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150704', 'CARAMPOMA', '15', '07', '04', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150708', 'HUANZA', '15', '07', '08', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150710', 'LAHUAYTAMBO', '15', '07', '10', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150712', 'LARAOS', '15', '07', '12', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150713', 'MARIATANA', '15', '07', '13', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150715', 'SAN ANDRES DE TUPICOCHA', '15', '07', '15', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150717', 'SAN BARTOLOME', '15', '07', '17', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150719', 'SAN JUAN DE IRIS', '15', '07', '19', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150722', 'SAN MATEO', '15', '07', '22', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150725', 'SAN PEDRO DE HUANCAYRE', '15', '07', '25', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150726', 'SANGALLAYA', '15', '07', '26', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150728', 'SANTA EULALIA', '15', '07', '28', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150730', 'SANTIAGO DE TUNA', '15', '07', '30', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150731', 'SANTO DOMINGO DE LOS OLLEROS', '15', '07', '31', 'LIMA                     ', 'HUAROCHIRI               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150801', 'HUACHO', '15', '08', '01', 'LIMA                     ', 'HUAURA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150804', 'CHECRAS', '15', '08', '04', 'LIMA                     ', 'HUAURA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150806', 'HUAURA', '15', '08', '06', 'LIMA                     ', 'HUAURA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150807', 'LEONCIO PRADO', '15', '08', '07', 'LIMA                     ', 'HUAURA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150810', 'SANTA MARIA', '15', '08', '10', 'LIMA                     ', 'HUAURA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150812', 'VEGUETA', '15', '08', '12', 'LIMA                     ', 'HUAURA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150903', 'CAUJUL', '15', '09', '03', 'LIMA                     ', 'OYON                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150904', 'COCHAMARCA', '15', '09', '04', 'LIMA                     ', 'OYON                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150906', 'PACHANGARA', '15', '09', '06', 'LIMA                     ', 'OYON                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151002', 'ALIS', '15', '10', '02', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151005', 'AZANGARO', '15', '10', '05', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151007', 'CARANIA', '15', '10', '07', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151010', 'COCHAS', '15', '10', '10', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151011', 'COLONIA', '15', '10', '11', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151013', 'HUAMPARA', '15', '10', '13', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151014', 'HUANCAYA', '15', '10', '14', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151016', 'HUANTAN', '15', '10', '16', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151020', 'MADEAN', '15', '10', '20', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151022', 'OMAS', '15', '10', '22', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151023', 'PUTINZA', '15', '10', '23', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151025', 'QUINOCAY', '15', '10', '25', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151026', 'SAN JOAQUIN', '15', '10', '26', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151028', 'TANTA', '15', '10', '28', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151031', 'TUPE', '15', '10', '31', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151032', 'VI¥AC', '15', '10', '32', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('151033', 'VITIS', '15', '10', '33', 'LIMA                     ', 'YAUYOS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160102', 'ALTO NANAY', '16', '01', '02', 'LORETO                   ', 'MAYNAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160105', 'LAS AMAZONAS', '16', '01', '05', 'LORETO                   ', 'MAYNAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160107', 'NAPO', '16', '01', '07', 'LORETO                   ', 'MAYNAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160108', 'PUNCHANA', '16', '01', '08', 'LORETO                   ', 'MAYNAS                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160201', 'YURIMAGUAS', '16', '02', '01', 'LORETO                   ', 'ALTO AMAZONAS            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160203', 'ANDAMARCA', '12', '01', '03', 'LORETO                   ', 'ALTO AMAZONAS            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160206', 'LAGUNAS', '16', '02', '06', 'LORETO                   ', 'ALTO AMAZONAS            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160207', 'MANSERICHE', '16', '02', '07', 'LORETO                   ', 'ALTO AMAZONAS            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160209', 'MARISCAL CASTILLA', '16', '02', '09', 'LORETO                   ', 'ALTO AMAZONAS            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160211', 'TENIENTE CESAR LOPEZ ROJAS', '16', '02', '11', 'LORETO                   ', 'ALTO AMAZONAS            ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160302', 'PARINARI', '16', '03', '02', 'LORETO                   ', 'LORETO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160304', 'TROMPETEROS', '16', '03', '04', 'LORETO                   ', 'LORETO                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160401', 'RAMON CASTILLA', '16', '04', '01', 'LORETO                   ', 'MARISCAL RAMON CASTILLA  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160402', 'PEBAS', '16', '04', '02', 'LORETO                   ', 'MARISCAL RAMON CASTILLA  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160404', 'SAN PABLO', '16', '04', '04', 'LORETO                   ', 'MARISCAL RAMON CASTILLA  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160504', 'EMILIO SAN MARTIN', '16', '05', '04', 'LORETO                   ', 'REQUENA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160506', 'PUINAHUA', '16', '05', '06', 'LORETO                   ', 'REQUENA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160507', 'SAQUENA', '16', '05', '07', 'LORETO                   ', 'REQUENA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160509', 'TAPICHE', '16', '05', '09', 'LORETO                   ', 'REQUENA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160602', 'INAHUAYA', '16', '06', '02', 'LORETO                   ', 'UCAYALI                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160603', 'PADRE MARQUEZ', '16', '06', '03', 'LORETO                   ', 'UCAYALI                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('160605', 'SARAYACU', '16', '06', '05', 'LORETO                   ', 'UCAYALI                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('170101', 'TAMBOPATA', '17', '01', '01', 'MADRE DE DIOS            ', 'TAMBOPATA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('170102', 'INAMBARI', '17', '01', '02', 'MADRE DE DIOS            ', 'TAMBOPATA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('170202', 'FITZCARRALD', '17', '02', '02', 'MADRE DE DIOS            ', 'MANU                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('170301', 'I¥APARI', '17', '03', '01', 'MADRE DE DIOS            ', 'TAHUAMANU                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('170303', 'TAHUAMANU', '17', '03', '03', 'MADRE DE DIOS            ', 'TAHUAMANU                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180102', 'CARUMAS', '18', '01', '02', 'MOQUEGUA                 ', 'MARISCAL NIETO           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180106', 'TORATA', '18', '01', '06', 'MOQUEGUA                 ', 'MARISCAL NIETO           ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180202', 'CHOJATA', '18', '02', '02', 'MOQUEGUA                 ', 'GENERAL SANCHEZ CERRO    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180203', 'COALAQUE', '18', '02', '03', 'MOQUEGUA                 ', 'GENERAL SANCHEZ CERRO    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180205', 'LA CAPILLA', '18', '02', '05', 'MOQUEGUA                 ', 'GENERAL SANCHEZ CERRO    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180206', 'LLOQUE', '18', '02', '06', 'MOQUEGUA                 ', 'GENERAL SANCHEZ CERRO    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180209', 'QUINISTAQUILLAS', '18', '02', '09', 'MOQUEGUA                 ', 'GENERAL SANCHEZ CERRO    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180211', 'YUNGA', '18', '02', '11', 'MOQUEGUA                 ', 'GENERAL SANCHEZ CERRO    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('180303', 'PACOCHA', '18', '03', '03', 'MOQUEGUA                 ', 'ILO                      ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190101', 'CHAUPIMARCA', '19', '01', '01', 'PASCO                    ', 'PASCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190104', 'HUAYLLAY', '19', '01', '04', 'PASCO                    ', 'PASCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190106', 'PALLANCHACRA', '19', '01', '06', 'PASCO                    ', 'PASCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190108', 'SAN FRANCISCO DE ASIS DE YARUSYACAN', '19', '01', '08', 'PASCO                    ', 'PASCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190109', 'SIMON BOLIVAR', '19', '01', '09', 'PASCO                    ', 'PASCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190110', 'TICLACAYAN', '19', '01', '10', 'PASCO                    ', 'PASCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190112', 'VICCO', '19', '01', '12', 'PASCO                    ', 'PASCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190202', 'CHACAYAN', '19', '02', '02', 'PASCO                    ', 'DANIEL ALCIDES CARRION   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190204', 'PAUCAR', '19', '02', '04', 'PASCO                    ', 'DANIEL ALCIDES CARRION   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190205', 'SAN PEDRO DE PILLAO', '19', '02', '05', 'PASCO                    ', 'DANIEL ALCIDES CARRION   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190208', 'VILCABAMBA', '19', '02', '08', 'PASCO                    ', 'DANIEL ALCIDES CARRION   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190303', 'HUANCABAMBA', '19', '03', '03', 'PASCO                    ', 'OXAPAMPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190305', 'POZUZO', '19', '03', '05', 'PASCO                    ', 'OXAPAMPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('190307', 'VILLA RICA', '19', '03', '07', 'PASCO                    ', 'OXAPAMPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200104', 'CASTILLA', '20', '01', '04', 'PIURA                    ', 'PIURA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200107', 'CURA MORI', '20', '01', '07', 'PIURA                    ', 'PIURA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200108', 'EL TALLAN', '20', '01', '08', 'PIURA                    ', 'PIURA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200110', 'LA UNION', '20', '01', '10', 'PIURA                    ', 'PIURA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200114', 'TAMBO GRANDE', '20', '01', '14', 'PIURA                    ', 'PIURA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200202', 'FRIAS', '20', '02', '02', 'PIURA                    ', 'AYABACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200205', 'MONTERO', '20', '02', '05', 'PIURA                    ', 'AYABACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200207', 'PAIMAS', '20', '02', '07', 'PIURA                    ', 'AYABACA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200301', 'HUANCABAMBA', '20', '03', '01', 'PIURA                    ', 'HUANCABAMBA              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200304', 'HUARMACA', '20', '03', '04', 'PIURA                    ', 'HUANCABAMBA              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200306', 'SAN MIGUEL DE EL FAIQUE', '20', '03', '06', 'PIURA                    ', 'HUANCABAMBA              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200307', 'SONDOR', '20', '03', '07', 'PIURA                    ', 'HUANCABAMBA              ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200402', 'BUENOS AIRES', '20', '04', '02', 'PIURA                    ', 'MORROPON                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200403', 'CHALACO', '20', '04', '03', 'PIURA                    ', 'MORROPON                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200405', 'MORROPON', '20', '04', '05', 'PIURA                    ', 'MORROPON                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200407', 'SAN JUAN DE BIGOTE', '20', '04', '07', 'PIURA                    ', 'MORROPON                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200410', 'YAMANGO', '20', '04', '10', 'PIURA                    ', 'MORROPON                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200501', 'PAITA', '20', '05', '01', 'PIURA                    ', 'PAITA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200504', 'COLAN', '20', '05', '04', 'PIURA                    ', 'PAITA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200506', 'TAMARINDO', '20', '05', '06', 'PIURA                    ', 'PAITA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200601', 'SULLANA', '20', '06', '01', 'PIURA                    ', 'SULLANA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200602', 'BELLAVISTA', '20', '06', '02', 'PIURA                    ', 'SULLANA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200603', 'IGNACIO ESCUDERO', '20', '06', '03', 'PIURA                    ', 'SULLANA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200606', 'MIGUEL CHECA', '20', '06', '06', 'PIURA                    ', 'SULLANA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200608', 'SALITRAL', '20', '06', '08', 'PIURA                    ', 'SULLANA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200702', 'EL ALTO', '20', '07', '02', 'PIURA                    ', 'TALARA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200704', 'LOBITOS', '20', '07', '04', 'PIURA                    ', 'TALARA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200706', 'MANCORA', '20', '07', '06', 'PIURA                    ', 'TALARA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200803', 'BERNAL', '20', '08', '03', 'PIURA                    ', 'SECHURA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200805', 'VICE', '20', '08', '05', 'PIURA                    ', 'SECHURA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('200806', 'RINCONADA LLICUAR', '20', '08', '06', 'PIURA                    ', 'SECHURA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210101', 'PUNO', '21', '01', '01', 'PUNO                     ', 'PUNO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210103', 'AMANTANI', '21', '01', '03', 'PUNO                     ', 'PUNO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210106', 'CHUCUITO', '21', '01', '06', 'PUNO                     ', 'PUNO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210108', 'HUATA', '21', '01', '08', 'PUNO                     ', 'PUNO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210110', 'PAUCARCOLLA', '21', '01', '10', 'PUNO                     ', 'PUNO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210112', 'PLATERIA', '21', '01', '12', 'PUNO                     ', 'PUNO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210114', 'TIQUILLACA', '21', '01', '14', 'PUNO                     ', 'PUNO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210115', 'VILQUE', '21', '01', '15', 'PUNO                     ', 'PUNO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210204', 'ASILLO', '21', '02', '04', 'PUNO                     ', 'AZANGARO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210206', 'CHUPA', '21', '02', '06', 'PUNO                     ', 'AZANGARO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210208', 'MU¥ANI', '21', '02', '08', 'PUNO                     ', 'AZANGARO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210209', 'POTONI', '21', '02', '09', 'PUNO                     ', 'AZANGARO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210211', 'SAN ANTON', '21', '02', '11', 'PUNO                     ', 'AZANGARO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210212', 'SAN JOSE', '21', '02', '12', 'PUNO                     ', 'AZANGARO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210215', 'TIRAPATA', '21', '02', '15', 'PUNO                     ', 'AZANGARO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210302', 'AJOYANI', '21', '03', '02', 'PUNO                     ', 'CARABAYA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210305', 'CORANI', '21', '03', '05', 'PUNO                     ', 'CARABAYA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210306', 'CRUCERO', '21', '03', '06', 'PUNO                     ', 'CARABAYA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210307', 'ITUATA', '21', '03', '07', 'PUNO                     ', 'CARABAYA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210309', 'SAN GABAN', '21', '03', '09', 'PUNO                     ', 'CARABAYA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210401', 'JULI', '21', '04', '01', 'PUNO                     ', 'CHUCUITO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210405', 'PISACOMA', '21', '04', '05', 'PUNO                     ', 'CHUCUITO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210407', 'ZEPITA', '21', '04', '07', 'PUNO                     ', 'CHUCUITO                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210501', 'ILAVE', '21', '05', '01', 'PUNO                     ', 'EL COLLAO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210503', 'PILCUYO', '21', '05', '03', 'PUNO                     ', 'EL COLLAO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210504', 'SANTA ROSA', '21', '05', '04', 'PUNO                     ', 'EL COLLAO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210505', 'CONDURIRI', '21', '05', '05', 'PUNO                     ', 'EL COLLAO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210603', 'HUATASANI', '21', '06', '03', 'PUNO                     ', 'HUANCANE                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210606', 'ROSASPATA', '21', '06', '06', 'PUNO                     ', 'HUANCANE                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210608', 'VILQUE CHICO', '21', '06', '08', 'PUNO                     ', 'HUANCANE                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210701', 'LAMPA', '21', '07', '01', 'PUNO                     ', 'LAMPA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210702', 'CABANILLA', '21', '07', '02', 'PUNO                     ', 'LAMPA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210705', 'OCUVIRI', '21', '07', '05', 'PUNO                     ', 'LAMPA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210707', 'PARATIA', '21', '07', '07', 'PUNO                     ', 'LAMPA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210709', 'SANTA LUCIA', '21', '07', '09', 'PUNO                     ', 'LAMPA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210801', 'AYAVIRI', '21', '08', '01', 'PUNO                     ', 'MELGAR                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210803', 'CUPI', '21', '08', '03', 'PUNO                     ', 'MELGAR                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210806', 'NU¥OA', '21', '08', '06', 'PUNO                     ', 'MELGAR                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210809', 'UMACHIRI', '21', '08', '09', 'PUNO                     ', 'MELGAR                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210901', 'MOHO', '21', '09', '01', 'PUNO                     ', 'MOHO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('210904', 'TILALI', '21', '09', '04', 'PUNO                     ', 'MOHO                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211002', 'ANANEA', '21', '10', '02', 'PUNO                     ', 'SAN ANTONIO DE PUTINA    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211004', 'QUILCAPUNCU', '21', '10', '04', 'PUNO                     ', 'SAN ANTONIO DE PUTINA    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211102', 'CABANA', '21', '11', '02', 'PUNO                     ', 'SAN ROMAN                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211104', 'CARACOTO', '21', '11', '04', 'PUNO                     ', 'SAN ROMAN                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211201', 'SANDIA', '21', '12', '01', 'PUNO                     ', 'SANDIA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211202', 'CUYOCUYO', '21', '12', '02', 'PUNO                     ', 'SANDIA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211204', 'PATAMBUCO', '21', '12', '04', 'PUNO                     ', 'SANDIA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211207', 'SAN JUAN DEL ORO', '21', '12', '07', 'PUNO                     ', 'SANDIA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211209', 'ALTO INAMBARI', '21', '12', '09', 'PUNO                     ', 'SANDIA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211301', 'YUNGUYO', '21', '13', '01', 'PUNO                     ', 'YUNGUYO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211302', 'ANAPIA', '21', '13', '02', 'PUNO                     ', 'YUNGUYO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211304', 'CUTURAPI', '21', '13', '04', 'PUNO                     ', 'YUNGUYO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('211306', 'TINICACHI', '21', '13', '06', 'PUNO                     ', 'YUNGUYO                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220103', 'HABANA', '22', '01', '03', 'SAN MARTIN               ', 'MOYOBAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220104', 'JEPELACIO', '22', '01', '04', 'SAN MARTIN               ', 'MOYOBAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220106', 'YANTALO', '22', '01', '06', 'SAN MARTIN               ', 'MOYOBAMBA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220202', 'ALTO BIAVO', '22', '02', '02', 'SAN MARTIN               ', 'BELLAVISTA               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220206', 'SAN RAFAEL', '22', '02', '06', 'SAN MARTIN               ', 'BELLAVISTA               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220302', 'AGUA BLANCA', '22', '03', '02', 'SAN MARTIN               ', 'EL DORADO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220303', 'SAN MARTIN', '22', '03', '03', 'SAN MARTIN               ', 'EL DORADO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220305', 'SHATOJA', '22', '03', '05', 'SAN MARTIN               ', 'EL DORADO                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220402', 'ALTO SAPOSOA', '22', '04', '02', 'SAN MARTIN               ', 'HUALLAGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220404', 'PISCOYACU', '22', '04', '04', 'SAN MARTIN               ', 'HUALLAGA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220501', 'LAMAS', '22', '05', '01', 'SAN MARTIN               ', 'LAMAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220502', 'ALONSO DE ALVARADO', '22', '05', '02', 'SAN MARTIN               ', 'LAMAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220505', 'CU¥UMBUQUI', '22', '05', '05', 'SAN MARTIN               ', 'LAMAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220506', 'PINTO RECODO', '22', '05', '06', 'SAN MARTIN               ', 'LAMAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220507', 'RUMISAPA', '22', '05', '07', 'SAN MARTIN               ', 'LAMAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220508', 'SAN ROQUE DE CUMBAZA', '22', '05', '08', 'SAN MARTIN               ', 'LAMAS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220601', 'JUANJUI', '22', '06', '01', 'SAN MARTIN               ', 'MARISCAL CACERES         ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220604', 'PACHIZA', '22', '06', '04', 'SAN MARTIN               ', 'MARISCAL CACERES         ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220605', 'PAJARILLO', '22', '06', '05', 'SAN MARTIN               ', 'MARISCAL CACERES         ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220702', 'BUENOS AIRES', '22', '07', '02', 'SAN MARTIN               ', 'PICOTA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220703', 'CASPISAPA', '22', '07', '03', 'SAN MARTIN               ', 'PICOTA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220705', 'PUCACACA', '22', '07', '05', 'SAN MARTIN               ', 'PICOTA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220709', 'TINGO DE PONASA', '22', '07', '09', 'SAN MARTIN               ', 'PICOTA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220801', 'RIOJA', '22', '08', '01', 'SAN MARTIN               ', 'RIOJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220803', 'ELIAS SOPLIN VARGAS', '22', '08', '03', 'SAN MARTIN               ', 'RIOJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220804', 'NUEVA CAJAMARCA', '22', '08', '04', 'SAN MARTIN               ', 'RIOJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220807', 'SAN FERNANDO', '22', '08', '07', 'SAN MARTIN               ', 'RIOJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220808', 'YORONGOS', '22', '08', '08', 'SAN MARTIN               ', 'RIOJA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220901', 'TARAPOTO', '22', '09', '01', 'SAN MARTIN               ', 'SAN MARTIN               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220904', 'CHAZUTA', '22', '09', '04', 'SAN MARTIN               ', 'SAN MARTIN               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220907', 'HUIMBAYOC', '22', '09', '07', 'SAN MARTIN               ', 'SAN MARTIN               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220908', 'JUAN GUERRA', '22', '09', '08', 'SAN MARTIN               ', 'SAN MARTIN               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220910', 'MORALES', '22', '09', '10', 'SAN MARTIN               ', 'SAN MARTIN               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('220912', 'SAN ANTONIO', '22', '09', '12', 'SAN MARTIN               ', 'SAN MARTIN               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('221001', 'TOCACHE', '22', '10', '01', 'SAN MARTIN               ', 'TOCACHE                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('221002', 'NUEVO PROGRESO', '22', '10', '02', 'SAN MARTIN               ', 'TOCACHE                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('221004', 'SHUNTE', '22', '10', '04', 'SAN MARTIN               ', 'TOCACHE                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('221005', 'UCHIZA', '22', '10', '05', 'SAN MARTIN               ', 'TOCACHE                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230102', 'ALTO DE LA ALIANZA', '23', '01', '02', 'TACNA                    ', 'TACNA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230106', 'PACHIA', '23', '01', '06', 'TACNA                    ', 'TACNA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230108', 'POCOLLAY', '23', '01', '08', 'TACNA                    ', 'TACNA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230109', 'SAMA', '23', '01', '09', 'TACNA                    ', 'TACNA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230202', 'CAIRANI', '23', '02', '02', 'TACNA                    ', 'CANDARAVE                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230204', 'CURIBAYA', '23', '02', '04', 'TACNA                    ', 'CANDARAVE                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230402', 'HEROES ALBARRACIN', '23', '04', '02', 'TACNA                    ', 'TARATA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230405', 'SITAJARA', '23', '04', '05', 'TACNA                    ', 'TARATA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230407', 'TARUCACHI', '23', '04', '07', 'TACNA                    ', 'TARATA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230408', 'TICACO', '23', '04', '08', 'TACNA                    ', 'TARATA                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('240101', 'TUMBES', '24', '01', '01', 'TUMBES                   ', 'TUMBES                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('240103', 'LA CRUZ', '24', '01', '03', 'TUMBES                   ', 'TUMBES                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('240104', 'PAMPAS DE HOSPITAL', '24', '01', '04', 'TUMBES                   ', 'TUMBES                   ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('240301', 'ZARUMILLA', '24', '03', '01', 'TUMBES                   ', 'ZARUMILLA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('240302', 'AGUAS VERDES', '24', '03', '02', 'TUMBES                   ', 'ZARUMILLA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('240304', 'PAPAYAL', '24', '03', '04', 'TUMBES                   ', 'ZARUMILLA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250102', 'CAMPOVERDE', '25', '01', '02', 'UCAYALI                  ', 'CORONEL PORTILLO         ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250103', 'IPARIA', '25', '01', '03', 'UCAYALI                  ', 'CORONEL PORTILLO         ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250106', 'NUEVA REQUENA', '25', '01', '06', 'UCAYALI                  ', 'CORONEL PORTILLO         ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250203', 'TAHUANIA', '25', '02', '03', 'UCAYALI                  ', 'ATALAYA                  ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250301', 'PADRE ABAD', '25', '03', '01', 'UCAYALI                  ', 'PADRE ABAD               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250302', 'IRAZOLA', '25', '03', '02', 'UCAYALI                  ', 'PADRE ABAD               ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250401', 'PURUS', '25', '04', '01', 'UCAYALI                  ', 'PURUS                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('080109', 'IZCUCHACA', '08', '01', '09', 'CUSCO                    ', 'CUSCO                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250501', 'UCAYALI', '25', '05', '01', 'UCAYALI                  ', 'PUCALLPA                 ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('230110', 'CORONEL GREGORIO ALBARRACIN LANCHIPA', '23', '01', '10', 'TACNA                    ', 'TACNA                    ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150121', 'PUEBLO LIBRE', '15', '01', '21', 'LIMA                     ', 'LIMA                     ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('170204', 'HUEPETUHE', '17', '02', '04', 'MADRE DE DIOS', 'MANU');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('050115', 'JESUS NAZARENO', '05', '01', '15', 'AYACUCHO', 'HUAMANGA');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('250107', 'MANANTAY', '25', '01', '07', 'UCAYALI', 'CORONEL PORTILLO');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090118', 'ASCENSION', '09', '01', '18', 'HUANCAVELICA', 'HUANCAVELICA');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('090510', 'PACHAMARCA', '09', '05', '10', 'HUANCAVELICA             ', 'CHURCAMPA                ');
INSERT INTO ubigeo (idubigeo, cubigeo, cdepartamento, cprovincia, cdistrito, cnomdepartamento, cnomprovincia) VALUES ('150105', 'BREÑA', '15', '01', '05', 'LIMA                     ', 'LIMA                     ');


--
-- TOC entry 3068 (class 0 OID 746411)
-- Dependencies: 298
-- Data for Name: unidad_negocio; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 3069 (class 0 OID 746416)
-- Dependencies: 299
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

INSERT INTO usuario (idusuario, cnomusuario, bactivo, idrol, clogin, cclave, dfecreg, dfecmod) VALUES (2, 'USUARIO DEMO', true, 1, 'zarcillo', '89fda8694151031cfefdab162332feaf6bdfba92a604fc5c48d9bb146b74d7f1', '2013-07-24 09:12:59.218738', '2013-07-24 09:12:59.218738');


--
-- TOC entry 3070 (class 0 OID 746423)
-- Dependencies: 300
-- Data for Name: vendedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



SET search_path = log, pg_catalog;

--
-- TOC entry 2605 (class 2606 OID 746430)
-- Dependencies: 142 142
-- Name: log_almacen_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_almacen
    ADD CONSTRAINT log_almacen_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2771 (class 2606 OID 747777)
-- Dependencies: 306 306
-- Name: log_autorizacion_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_autorizacion
    ADD CONSTRAINT log_autorizacion_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2607 (class 2606 OID 746432)
-- Dependencies: 144 144
-- Name: log_aval_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_aval
    ADD CONSTRAINT log_aval_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2609 (class 2606 OID 746434)
-- Dependencies: 146 146
-- Name: log_banco_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_banco
    ADD CONSTRAINT log_banco_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2611 (class 2606 OID 746436)
-- Dependencies: 148 148
-- Name: log_cheque_cliente_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_cheque_cliente
    ADD CONSTRAINT log_cheque_cliente_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2613 (class 2606 OID 746438)
-- Dependencies: 150 150
-- Name: log_cliente_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_cliente
    ADD CONSTRAINT log_cliente_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2615 (class 2606 OID 746440)
-- Dependencies: 152 152
-- Name: log_comprobante_emitido_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_comprobante_emitido
    ADD CONSTRAINT log_comprobante_emitido_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2617 (class 2606 OID 746442)
-- Dependencies: 154 154
-- Name: log_condicion_venta_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_condicion_venta
    ADD CONSTRAINT log_condicion_venta_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2619 (class 2606 OID 746444)
-- Dependencies: 156 156
-- Name: log_cuenta_bancaria_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_cuenta_bancaria
    ADD CONSTRAINT log_cuenta_bancaria_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2621 (class 2606 OID 746446)
-- Dependencies: 158 158
-- Name: log_cuenta_pagar_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_cuenta_pagar
    ADD CONSTRAINT log_cuenta_pagar_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2623 (class 2606 OID 746448)
-- Dependencies: 160 160
-- Name: log_deposito_cliente_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_deposito_cliente
    ADD CONSTRAINT log_deposito_cliente_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2773 (class 2606 OID 747799)
-- Dependencies: 308 308
-- Name: log_detalle_autorizacion_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_detalle_autorizacion
    ADD CONSTRAINT log_detalle_autorizacion_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2625 (class 2606 OID 746450)
-- Dependencies: 162 162
-- Name: log_documento_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_documento
    ADD CONSTRAINT log_documento_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2627 (class 2606 OID 746452)
-- Dependencies: 164 164
-- Name: log_empresa_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_empresa
    ADD CONSTRAINT log_empresa_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2629 (class 2606 OID 746454)
-- Dependencies: 166 166
-- Name: log_existencia_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_existencia
    ADD CONSTRAINT log_existencia_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2631 (class 2606 OID 746456)
-- Dependencies: 168 168
-- Name: log_familia_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_familia
    ADD CONSTRAINT log_familia_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2633 (class 2606 OID 746458)
-- Dependencies: 170 170
-- Name: log_letra_proveedor_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_letra_proveedor
    ADD CONSTRAINT log_letra_proveedor_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2635 (class 2606 OID 746460)
-- Dependencies: 172 172
-- Name: log_linea_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_linea
    ADD CONSTRAINT log_linea_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2637 (class 2606 OID 746462)
-- Dependencies: 174 174
-- Name: log_lote_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_lote
    ADD CONSTRAINT log_lote_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2639 (class 2606 OID 746464)
-- Dependencies: 176 176
-- Name: log_moneda_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_moneda
    ADD CONSTRAINT log_moneda_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2641 (class 2606 OID 746466)
-- Dependencies: 178 178
-- Name: log_motivo_entrada_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_motivo_entrada
    ADD CONSTRAINT log_motivo_entrada_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2643 (class 2606 OID 746468)
-- Dependencies: 180 180
-- Name: log_motivo_notabo_cliente_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_motivo_notabo_cliente
    ADD CONSTRAINT log_motivo_notabo_cliente_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2645 (class 2606 OID 746470)
-- Dependencies: 182 182
-- Name: log_motivo_notabo_proveedor_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_motivo_notabo_proveedor
    ADD CONSTRAINT log_motivo_notabo_proveedor_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2647 (class 2606 OID 746472)
-- Dependencies: 184 184
-- Name: log_motivo_notcar_cliente_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_motivo_notcar_cliente
    ADD CONSTRAINT log_motivo_notcar_cliente_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2649 (class 2606 OID 746474)
-- Dependencies: 186 186
-- Name: log_motivo_notcar_proveedor_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_motivo_notcar_proveedor
    ADD CONSTRAINT log_motivo_notcar_proveedor_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2651 (class 2606 OID 746476)
-- Dependencies: 188 188
-- Name: log_motivo_salida_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_motivo_salida
    ADD CONSTRAINT log_motivo_salida_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2653 (class 2606 OID 746478)
-- Dependencies: 190 190
-- Name: log_periodo_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_periodo
    ADD CONSTRAINT log_periodo_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2655 (class 2606 OID 746480)
-- Dependencies: 192 192
-- Name: log_presentacion_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_presentacion
    ADD CONSTRAINT log_presentacion_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2657 (class 2606 OID 746482)
-- Dependencies: 194 194
-- Name: log_producto_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_producto
    ADD CONSTRAINT log_producto_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2659 (class 2606 OID 746484)
-- Dependencies: 196 196
-- Name: log_proveedor_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_proveedor
    ADD CONSTRAINT log_proveedor_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2661 (class 2606 OID 746486)
-- Dependencies: 198 198
-- Name: log_rol_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_rol
    ADD CONSTRAINT log_rol_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2663 (class 2606 OID 746488)
-- Dependencies: 200 200
-- Name: log_sublinea_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_sublinea
    ADD CONSTRAINT log_sublinea_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2665 (class 2606 OID 746490)
-- Dependencies: 202 202
-- Name: log_tipo_cuenta_bancaria_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_tipo_cuenta_bancaria
    ADD CONSTRAINT log_tipo_cuenta_bancaria_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2667 (class 2606 OID 746492)
-- Dependencies: 204 204
-- Name: log_tipo_pago_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_tipo_pago
    ADD CONSTRAINT log_tipo_pago_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2669 (class 2606 OID 746494)
-- Dependencies: 206 206
-- Name: log_tipo_persona_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_tipo_persona
    ADD CONSTRAINT log_tipo_persona_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2671 (class 2606 OID 746496)
-- Dependencies: 208 208
-- Name: log_unidad_negocio_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_unidad_negocio
    ADD CONSTRAINT log_unidad_negocio_pkey PRIMARY KEY (idlog);


--
-- TOC entry 2673 (class 2606 OID 746498)
-- Dependencies: 210 210
-- Name: log_vendedor_pkey; Type: CONSTRAINT; Schema: log; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY log_vendedor
    ADD CONSTRAINT log_vendedor_pkey PRIMARY KEY (idlog);


SET search_path = public, pg_catalog;

--
-- TOC entry 2675 (class 2606 OID 746500)
-- Dependencies: 212 212
-- Name: almacen_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY almacen
    ADD CONSTRAINT almacen_pkey PRIMARY KEY (idalmacen);


--
-- TOC entry 2677 (class 2606 OID 746502)
-- Dependencies: 214 214
-- Name: amortizacion_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_pkey PRIMARY KEY (idamortizacion);


--
-- TOC entry 2679 (class 2606 OID 746504)
-- Dependencies: 216 216
-- Name: amortizacion_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_pkey PRIMARY KEY (idamortizacion);


--
-- TOC entry 2767 (class 2606 OID 747744)
-- Dependencies: 301 301
-- Name: autorizacion_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY autorizacion
    ADD CONSTRAINT autorizacion_pkey PRIMARY KEY (idautorizacion);


--
-- TOC entry 2681 (class 2606 OID 746506)
-- Dependencies: 218 218
-- Name: aval_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY aval
    ADD CONSTRAINT aval_pkey PRIMARY KEY (idaval);


--
-- TOC entry 2683 (class 2606 OID 746508)
-- Dependencies: 220 220
-- Name: banco_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY banco
    ADD CONSTRAINT banco_pkey PRIMARY KEY (idbanco);


--
-- TOC entry 2685 (class 2606 OID 746510)
-- Dependencies: 222 222
-- Name: cheque_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_pkey PRIMARY KEY (idcheque);


--
-- TOC entry 2687 (class 2606 OID 746512)
-- Dependencies: 224 224
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);


--
-- TOC entry 2689 (class 2606 OID 746514)
-- Dependencies: 226 226
-- Name: comprobante_emitido_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_pkey PRIMARY KEY (idcomprobante);


--
-- TOC entry 2691 (class 2606 OID 746516)
-- Dependencies: 228 228
-- Name: condicion_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY condicion_venta
    ADD CONSTRAINT condicion_venta_pkey PRIMARY KEY (idcondicion);


--
-- TOC entry 2693 (class 2606 OID 746518)
-- Dependencies: 230 230
-- Name: cuenta_bancaria_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_pkey PRIMARY KEY (idcuenta);


--
-- TOC entry 2695 (class 2606 OID 746520)
-- Dependencies: 232 232
-- Name: cuenta_pagar_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_pkey PRIMARY KEY (idcuenta);


--
-- TOC entry 2697 (class 2606 OID 746522)
-- Dependencies: 234 234
-- Name: deposito_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_pkey PRIMARY KEY (iddeposito);


--
-- TOC entry 2769 (class 2606 OID 747755)
-- Dependencies: 304 304
-- Name: detalle_autorizacion_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY detalle_autorizacion
    ADD CONSTRAINT detalle_autorizacion_pkey PRIMARY KEY (iddetalle);


--
-- TOC entry 2699 (class 2606 OID 746524)
-- Dependencies: 236 236
-- Name: documento_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY documento
    ADD CONSTRAINT documento_pkey PRIMARY KEY (iddocumento);


--
-- TOC entry 2701 (class 2606 OID 746526)
-- Dependencies: 238 238
-- Name: empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (idempresa);


--
-- TOC entry 2703 (class 2606 OID 746528)
-- Dependencies: 239 239 239
-- Name: existencia_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY existencia
    ADD CONSTRAINT existencia_pkey PRIMARY KEY (idalmacen, idproducto);


--
-- TOC entry 2705 (class 2606 OID 746530)
-- Dependencies: 241 241
-- Name: familia_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY familia
    ADD CONSTRAINT familia_pkey PRIMARY KEY (idfamilia);


--
-- TOC entry 2707 (class 2606 OID 746532)
-- Dependencies: 243 243
-- Name: letra_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_pkey PRIMARY KEY (idletra);


--
-- TOC entry 2709 (class 2606 OID 746534)
-- Dependencies: 245 245
-- Name: letra_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY letra_proveedor
    ADD CONSTRAINT letra_proveedor_pkey PRIMARY KEY (idletra);


--
-- TOC entry 2711 (class 2606 OID 746536)
-- Dependencies: 247 247
-- Name: linea_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY linea
    ADD CONSTRAINT linea_pkey PRIMARY KEY (idlinea);


--
-- TOC entry 2713 (class 2606 OID 746538)
-- Dependencies: 249 249
-- Name: lote_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY lote
    ADD CONSTRAINT lote_pkey PRIMARY KEY (idlote);


--
-- TOC entry 2715 (class 2606 OID 746540)
-- Dependencies: 251 251
-- Name: moneda_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY moneda
    ADD CONSTRAINT moneda_pkey PRIMARY KEY (idmoneda);


--
-- TOC entry 2719 (class 2606 OID 746542)
-- Dependencies: 255 255
-- Name: motivo_notabo_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY motivo_notabo_cliente
    ADD CONSTRAINT motivo_notabo_pkey PRIMARY KEY (idmotivo);


--
-- TOC entry 2721 (class 2606 OID 746544)
-- Dependencies: 257 257
-- Name: motivo_notabo_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY motivo_notabo_proveedor
    ADD CONSTRAINT motivo_notabo_proveedor_pkey PRIMARY KEY (idmotivo);


--
-- TOC entry 2723 (class 2606 OID 746546)
-- Dependencies: 259 259
-- Name: motivo_notcar_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY motivo_notcar_cliente
    ADD CONSTRAINT motivo_notcar_pkey PRIMARY KEY (idmotivo);


--
-- TOC entry 2725 (class 2606 OID 746548)
-- Dependencies: 261 261
-- Name: motivo_notcar_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY motivo_notcar_proveedor
    ADD CONSTRAINT motivo_notcar_proveedor_pkey PRIMARY KEY (idmotivo);


--
-- TOC entry 2727 (class 2606 OID 746550)
-- Dependencies: 263 263
-- Name: motivo_salida_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY motivo_salida
    ADD CONSTRAINT motivo_salida_pkey PRIMARY KEY (idmotivo);


--
-- TOC entry 2717 (class 2606 OID 746552)
-- Dependencies: 253 253
-- Name: motivoentrada_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY motivo_entrada
    ADD CONSTRAINT motivoentrada_pkey PRIMARY KEY (idmotivo);


--
-- TOC entry 2729 (class 2606 OID 746554)
-- Dependencies: 265 265
-- Name: notabo_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_pkey PRIMARY KEY (idnotabo);


--
-- TOC entry 2731 (class 2606 OID 746556)
-- Dependencies: 267 267
-- Name: notabo_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_pkey PRIMARY KEY (idnotabo);


--
-- TOC entry 2733 (class 2606 OID 746558)
-- Dependencies: 269 269
-- Name: notcar_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_pkey PRIMARY KEY (idnotcar);


--
-- TOC entry 2735 (class 2606 OID 746560)
-- Dependencies: 271 271
-- Name: notcar_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_pkey PRIMARY KEY (idnotcar);


--
-- TOC entry 2737 (class 2606 OID 746562)
-- Dependencies: 273 273
-- Name: periodo_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY periodo
    ADD CONSTRAINT periodo_pkey PRIMARY KEY (idperiodo);


--
-- TOC entry 2739 (class 2606 OID 746564)
-- Dependencies: 275 275
-- Name: presentacion_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY presentacion
    ADD CONSTRAINT presentacion_pkey PRIMARY KEY (idpresentacion);


--
-- TOC entry 2741 (class 2606 OID 746566)
-- Dependencies: 276 276
-- Name: producto_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (idproducto);


--
-- TOC entry 2743 (class 2606 OID 746568)
-- Dependencies: 278 278
-- Name: proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (idproveedor);


--
-- TOC entry 2745 (class 2606 OID 746570)
-- Dependencies: 280 280
-- Name: registro_entrada_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_pkey PRIMARY KEY (idregentrada);


--
-- TOC entry 2747 (class 2606 OID 746572)
-- Dependencies: 282 282
-- Name: registro_salida_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_pkey PRIMARY KEY (idregsalida);


--
-- TOC entry 2749 (class 2606 OID 746574)
-- Dependencies: 284 284
-- Name: rol_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (idrol);


--
-- TOC entry 2751 (class 2606 OID 746576)
-- Dependencies: 293 293
-- Name: sublinea_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY sublinea
    ADD CONSTRAINT sublinea_pkey PRIMARY KEY (idsublinea);


--
-- TOC entry 2753 (class 2606 OID 746578)
-- Dependencies: 294 294
-- Name: tipo_cuenta_bancaria_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY tipo_cuenta_bancaria
    ADD CONSTRAINT tipo_cuenta_bancaria_pkey PRIMARY KEY (idtipo);


--
-- TOC entry 2755 (class 2606 OID 746580)
-- Dependencies: 295 295
-- Name: tipo_pago_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY tipo_pago
    ADD CONSTRAINT tipo_pago_cliente_pkey PRIMARY KEY (idtipo);


--
-- TOC entry 2757 (class 2606 OID 746582)
-- Dependencies: 296 296
-- Name: tipo_persona_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY tipo_persona
    ADD CONSTRAINT tipo_persona_pkey PRIMARY KEY (idtipo);


--
-- TOC entry 2759 (class 2606 OID 746584)
-- Dependencies: 297 297
-- Name: ubigeo_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY ubigeo
    ADD CONSTRAINT ubigeo_pkey PRIMARY KEY (idubigeo);


--
-- TOC entry 2761 (class 2606 OID 746586)
-- Dependencies: 298 298
-- Name: unidad_negocio_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY unidad_negocio
    ADD CONSTRAINT unidad_negocio_pkey PRIMARY KEY (idunidad);


--
-- TOC entry 2763 (class 2606 OID 746588)
-- Dependencies: 299 299
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (idusuario);


--
-- TOC entry 2765 (class 2606 OID 746590)
-- Dependencies: 300 300
-- Name: vendedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY vendedor
    ADD CONSTRAINT vendedor_pkey PRIMARY KEY (idvendedor);


SET search_path = log, pg_catalog;

--
-- TOC entry 2774 (class 2606 OID 746591)
-- Dependencies: 2674 212 142
-- Name: log_almacen_idalmacen_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_almacen
    ADD CONSTRAINT log_almacen_idalmacen_fkey FOREIGN KEY (idalmacen) REFERENCES public.almacen(idalmacen);


--
-- TOC entry 2775 (class 2606 OID 746596)
-- Dependencies: 2762 299 142
-- Name: log_almacen_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_almacen
    ADD CONSTRAINT log_almacen_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2986 (class 2606 OID 747778)
-- Dependencies: 2766 306 301
-- Name: log_autorizacion_idautorizacion_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_autorizacion
    ADD CONSTRAINT log_autorizacion_idautorizacion_fkey FOREIGN KEY (idautorizacion) REFERENCES public.autorizacion(idautorizacion);


--
-- TOC entry 2987 (class 2606 OID 747783)
-- Dependencies: 306 299 2762
-- Name: log_autorizacion_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_autorizacion
    ADD CONSTRAINT log_autorizacion_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2776 (class 2606 OID 746601)
-- Dependencies: 218 144 2680
-- Name: log_aval_idaval_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_aval
    ADD CONSTRAINT log_aval_idaval_fkey FOREIGN KEY (idaval) REFERENCES public.aval(idaval);


--
-- TOC entry 2777 (class 2606 OID 746606)
-- Dependencies: 2762 144 299
-- Name: log_aval_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_aval
    ADD CONSTRAINT log_aval_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2778 (class 2606 OID 746611)
-- Dependencies: 2682 146 220
-- Name: log_banco_idbanco_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_banco
    ADD CONSTRAINT log_banco_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES public.banco(idbanco);


--
-- TOC entry 2779 (class 2606 OID 746616)
-- Dependencies: 146 2762 299
-- Name: log_banco_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_banco
    ADD CONSTRAINT log_banco_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2780 (class 2606 OID 746621)
-- Dependencies: 222 148 2684
-- Name: log_cheque_cliente_idcheque_cliente_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_cheque_cliente
    ADD CONSTRAINT log_cheque_cliente_idcheque_cliente_fkey FOREIGN KEY (idcheque) REFERENCES public.cheque_cliente(idcheque);


--
-- TOC entry 2781 (class 2606 OID 746626)
-- Dependencies: 299 148 2762
-- Name: log_cheque_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_cheque_cliente
    ADD CONSTRAINT log_cheque_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2782 (class 2606 OID 746631)
-- Dependencies: 224 2686 150
-- Name: log_cliente_idcliente_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_cliente
    ADD CONSTRAINT log_cliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);


--
-- TOC entry 2783 (class 2606 OID 746636)
-- Dependencies: 150 299 2762
-- Name: log_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_cliente
    ADD CONSTRAINT log_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2784 (class 2606 OID 746641)
-- Dependencies: 226 152 2688
-- Name: log_comprobante_emitido_idcomprobante_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_comprobante_emitido
    ADD CONSTRAINT log_comprobante_emitido_idcomprobante_fkey FOREIGN KEY (idcomprobante) REFERENCES public.comprobante_emitido(idcomprobante);


--
-- TOC entry 2785 (class 2606 OID 746646)
-- Dependencies: 152 2762 299
-- Name: log_comprobante_emitido_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_comprobante_emitido
    ADD CONSTRAINT log_comprobante_emitido_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2786 (class 2606 OID 746651)
-- Dependencies: 228 154 2690
-- Name: log_condicion_venta_idcondicion_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_condicion_venta
    ADD CONSTRAINT log_condicion_venta_idcondicion_fkey FOREIGN KEY (idcondicion) REFERENCES public.condicion_venta(idcondicion);


--
-- TOC entry 2787 (class 2606 OID 746656)
-- Dependencies: 2762 154 299
-- Name: log_condicion_venta_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_condicion_venta
    ADD CONSTRAINT log_condicion_venta_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2788 (class 2606 OID 746661)
-- Dependencies: 156 230 2692
-- Name: log_cuenta_bancaria_idcuenta_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_cuenta_bancaria
    ADD CONSTRAINT log_cuenta_bancaria_idcuenta_fkey FOREIGN KEY (idcuenta) REFERENCES public.cuenta_bancaria(idcuenta);


--
-- TOC entry 2789 (class 2606 OID 746666)
-- Dependencies: 2762 299 156
-- Name: log_cuenta_bancaria_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_cuenta_bancaria
    ADD CONSTRAINT log_cuenta_bancaria_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2790 (class 2606 OID 746671)
-- Dependencies: 158 2694 232
-- Name: log_cuenta_pagar_idcuenta_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_cuenta_pagar
    ADD CONSTRAINT log_cuenta_pagar_idcuenta_fkey FOREIGN KEY (idcuenta) REFERENCES public.cuenta_pagar(idcuenta);


--
-- TOC entry 2791 (class 2606 OID 746676)
-- Dependencies: 299 158 2762
-- Name: log_cuenta_pagar_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_cuenta_pagar
    ADD CONSTRAINT log_cuenta_pagar_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2792 (class 2606 OID 746681)
-- Dependencies: 160 2696 234
-- Name: log_deposito_cliente_iddeposito_cliente_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_deposito_cliente
    ADD CONSTRAINT log_deposito_cliente_iddeposito_cliente_fkey FOREIGN KEY (iddeposito) REFERENCES public.deposito_cliente(iddeposito);


--
-- TOC entry 2793 (class 2606 OID 746686)
-- Dependencies: 2762 299 160
-- Name: log_deposito_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_deposito_cliente
    ADD CONSTRAINT log_deposito_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2988 (class 2606 OID 747800)
-- Dependencies: 2768 304 308
-- Name: log_detalle_autorizacion_iddetalle_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_detalle_autorizacion
    ADD CONSTRAINT log_detalle_autorizacion_iddetalle_fkey FOREIGN KEY (iddetalle) REFERENCES public.detalle_autorizacion(iddetalle);


--
-- TOC entry 2989 (class 2606 OID 747805)
-- Dependencies: 308 299 2762
-- Name: log_detalle_autorizacion_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_detalle_autorizacion
    ADD CONSTRAINT log_detalle_autorizacion_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2794 (class 2606 OID 746691)
-- Dependencies: 162 2698 236
-- Name: log_documento_iddocumento_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_documento
    ADD CONSTRAINT log_documento_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES public.documento(iddocumento);


--
-- TOC entry 2795 (class 2606 OID 746696)
-- Dependencies: 299 2762 162
-- Name: log_documento_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_documento
    ADD CONSTRAINT log_documento_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2796 (class 2606 OID 746701)
-- Dependencies: 164 2700 238
-- Name: log_empresa_idempresa_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_empresa
    ADD CONSTRAINT log_empresa_idempresa_fkey FOREIGN KEY (idempresa) REFERENCES public.empresa(idempresa);


--
-- TOC entry 2797 (class 2606 OID 746706)
-- Dependencies: 2762 299 164
-- Name: log_empresa_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_empresa
    ADD CONSTRAINT log_empresa_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2798 (class 2606 OID 746711)
-- Dependencies: 239 2702 239 166 166
-- Name: log_existencia_idalmacen_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_existencia
    ADD CONSTRAINT log_existencia_idalmacen_fkey FOREIGN KEY (idalmacen, idproducto) REFERENCES public.existencia(idalmacen, idproducto);


--
-- TOC entry 2799 (class 2606 OID 746716)
-- Dependencies: 299 166 2762
-- Name: log_existencia_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_existencia
    ADD CONSTRAINT log_existencia_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2800 (class 2606 OID 746721)
-- Dependencies: 168 241 2704
-- Name: log_familia_idfamilia_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_familia
    ADD CONSTRAINT log_familia_idfamilia_fkey FOREIGN KEY (idfamilia) REFERENCES public.familia(idfamilia);


--
-- TOC entry 2801 (class 2606 OID 746726)
-- Dependencies: 168 2762 299
-- Name: log_familia_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_familia
    ADD CONSTRAINT log_familia_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2802 (class 2606 OID 746731)
-- Dependencies: 245 2708 170
-- Name: log_letra_proveedor_idletra_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_letra_proveedor
    ADD CONSTRAINT log_letra_proveedor_idletra_fkey FOREIGN KEY (idletra) REFERENCES public.letra_proveedor(idletra);


--
-- TOC entry 2803 (class 2606 OID 746736)
-- Dependencies: 2762 170 299
-- Name: log_letra_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_letra_proveedor
    ADD CONSTRAINT log_letra_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2804 (class 2606 OID 746741)
-- Dependencies: 2710 247 172
-- Name: log_linea_idlinea_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_linea
    ADD CONSTRAINT log_linea_idlinea_fkey FOREIGN KEY (idlinea) REFERENCES public.linea(idlinea);


--
-- TOC entry 2805 (class 2606 OID 746746)
-- Dependencies: 172 299 2762
-- Name: log_linea_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_linea
    ADD CONSTRAINT log_linea_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2806 (class 2606 OID 746751)
-- Dependencies: 249 174 2712
-- Name: log_lote_idlote_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_lote
    ADD CONSTRAINT log_lote_idlote_fkey FOREIGN KEY (idlote) REFERENCES public.lote(idlote);


--
-- TOC entry 2807 (class 2606 OID 746756)
-- Dependencies: 299 174 2762
-- Name: log_lote_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_lote
    ADD CONSTRAINT log_lote_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2808 (class 2606 OID 746761)
-- Dependencies: 251 176 2714
-- Name: log_moneda_idmoneda_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_moneda
    ADD CONSTRAINT log_moneda_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES public.moneda(idmoneda);


--
-- TOC entry 2809 (class 2606 OID 746766)
-- Dependencies: 2762 299 176
-- Name: log_moneda_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_moneda
    ADD CONSTRAINT log_moneda_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2810 (class 2606 OID 746771)
-- Dependencies: 2716 178 253
-- Name: log_motivo_entrada_idmotivo_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_entrada
    ADD CONSTRAINT log_motivo_entrada_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES public.motivo_entrada(idmotivo);


--
-- TOC entry 2811 (class 2606 OID 746776)
-- Dependencies: 299 2762 178
-- Name: log_motivo_entrada_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_entrada
    ADD CONSTRAINT log_motivo_entrada_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2812 (class 2606 OID 746781)
-- Dependencies: 255 2718 180
-- Name: log_motivo_notabo_cliente_idmotivo_notabo_cliente_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_notabo_cliente
    ADD CONSTRAINT log_motivo_notabo_cliente_idmotivo_notabo_cliente_fkey FOREIGN KEY (idmotivo) REFERENCES public.motivo_notabo_cliente(idmotivo);


--
-- TOC entry 2813 (class 2606 OID 746786)
-- Dependencies: 299 180 2762
-- Name: log_motivo_notabo_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_notabo_cliente
    ADD CONSTRAINT log_motivo_notabo_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2814 (class 2606 OID 746791)
-- Dependencies: 257 2720 182
-- Name: log_motivo_notabo_proveedor_idmotivo_notabo_proveedor_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_notabo_proveedor
    ADD CONSTRAINT log_motivo_notabo_proveedor_idmotivo_notabo_proveedor_fkey FOREIGN KEY (idmotivo) REFERENCES public.motivo_notabo_proveedor(idmotivo);


--
-- TOC entry 2815 (class 2606 OID 746796)
-- Dependencies: 2762 182 299
-- Name: log_motivo_notabo_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_notabo_proveedor
    ADD CONSTRAINT log_motivo_notabo_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2816 (class 2606 OID 746801)
-- Dependencies: 2722 184 259
-- Name: log_motivo_notcar_cliente_idmotivo_notcar_cliente_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_notcar_cliente
    ADD CONSTRAINT log_motivo_notcar_cliente_idmotivo_notcar_cliente_fkey FOREIGN KEY (idmotivo) REFERENCES public.motivo_notcar_cliente(idmotivo);


--
-- TOC entry 2817 (class 2606 OID 746806)
-- Dependencies: 2762 184 299
-- Name: log_motivo_notcar_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_notcar_cliente
    ADD CONSTRAINT log_motivo_notcar_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2818 (class 2606 OID 746811)
-- Dependencies: 186 261 2724
-- Name: log_motivo_notcar_proveedor_idmotivo_notcar_proveedor_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_notcar_proveedor
    ADD CONSTRAINT log_motivo_notcar_proveedor_idmotivo_notcar_proveedor_fkey FOREIGN KEY (idmotivo) REFERENCES public.motivo_notcar_proveedor(idmotivo);


--
-- TOC entry 2819 (class 2606 OID 746816)
-- Dependencies: 2762 186 299
-- Name: log_motivo_notcar_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_notcar_proveedor
    ADD CONSTRAINT log_motivo_notcar_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2820 (class 2606 OID 746821)
-- Dependencies: 2726 188 263
-- Name: log_motivo_salida_idmotivo_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_salida
    ADD CONSTRAINT log_motivo_salida_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES public.motivo_salida(idmotivo);


--
-- TOC entry 2821 (class 2606 OID 746826)
-- Dependencies: 2762 188 299
-- Name: log_motivo_salida_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_motivo_salida
    ADD CONSTRAINT log_motivo_salida_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2822 (class 2606 OID 746831)
-- Dependencies: 2736 190 273
-- Name: log_periodo_idperiodo_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_periodo
    ADD CONSTRAINT log_periodo_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES public.periodo(idperiodo);


--
-- TOC entry 2823 (class 2606 OID 746836)
-- Dependencies: 299 190 2762
-- Name: log_periodo_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_periodo
    ADD CONSTRAINT log_periodo_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2824 (class 2606 OID 746841)
-- Dependencies: 275 2738 192
-- Name: log_presentacion_idpresentacion_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_presentacion
    ADD CONSTRAINT log_presentacion_idpresentacion_fkey FOREIGN KEY (idpresentacion) REFERENCES public.presentacion(idpresentacion);


--
-- TOC entry 2825 (class 2606 OID 746846)
-- Dependencies: 192 299 2762
-- Name: log_presentacion_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_presentacion
    ADD CONSTRAINT log_presentacion_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2826 (class 2606 OID 746851)
-- Dependencies: 194 276 2740
-- Name: log_producto_idproducto_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_producto
    ADD CONSTRAINT log_producto_idproducto_fkey FOREIGN KEY (idproducto) REFERENCES public.producto(idproducto);


--
-- TOC entry 2827 (class 2606 OID 746856)
-- Dependencies: 299 194 2762
-- Name: log_producto_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_producto
    ADD CONSTRAINT log_producto_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2828 (class 2606 OID 746861)
-- Dependencies: 278 196 2742
-- Name: log_proveedor_idproveedor_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_proveedor
    ADD CONSTRAINT log_proveedor_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES public.proveedor(idproveedor);


--
-- TOC entry 2829 (class 2606 OID 746866)
-- Dependencies: 2762 196 299
-- Name: log_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_proveedor
    ADD CONSTRAINT log_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2830 (class 2606 OID 746871)
-- Dependencies: 2748 198 284
-- Name: log_rol_idrol_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_rol
    ADD CONSTRAINT log_rol_idrol_fkey FOREIGN KEY (idrol) REFERENCES public.rol(idrol);


--
-- TOC entry 2831 (class 2606 OID 746876)
-- Dependencies: 198 299 2762
-- Name: log_rol_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_rol
    ADD CONSTRAINT log_rol_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2832 (class 2606 OID 746881)
-- Dependencies: 2750 293 200
-- Name: log_sublinea_idsublinea_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_sublinea
    ADD CONSTRAINT log_sublinea_idsublinea_fkey FOREIGN KEY (idsublinea) REFERENCES public.sublinea(idsublinea);


--
-- TOC entry 2833 (class 2606 OID 746886)
-- Dependencies: 200 2762 299
-- Name: log_sublinea_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_sublinea
    ADD CONSTRAINT log_sublinea_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2834 (class 2606 OID 746891)
-- Dependencies: 2752 294 202
-- Name: log_tipo_cuenta_bancaria_idtipo_cuenta_bancaria_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_tipo_cuenta_bancaria
    ADD CONSTRAINT log_tipo_cuenta_bancaria_idtipo_cuenta_bancaria_fkey FOREIGN KEY (idtipo) REFERENCES public.tipo_cuenta_bancaria(idtipo);


--
-- TOC entry 2835 (class 2606 OID 746896)
-- Dependencies: 2762 202 299
-- Name: log_tipo_cuenta_bancaria_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_tipo_cuenta_bancaria
    ADD CONSTRAINT log_tipo_cuenta_bancaria_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2836 (class 2606 OID 746901)
-- Dependencies: 295 2754 204
-- Name: log_tipo_pago_idtipo_pago_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_tipo_pago
    ADD CONSTRAINT log_tipo_pago_idtipo_pago_fkey FOREIGN KEY (idtipo) REFERENCES public.tipo_pago(idtipo);


--
-- TOC entry 2837 (class 2606 OID 746906)
-- Dependencies: 2762 204 299
-- Name: log_tipo_pago_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_tipo_pago
    ADD CONSTRAINT log_tipo_pago_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2838 (class 2606 OID 746911)
-- Dependencies: 2756 206 296
-- Name: log_tipo_persona_idtipo_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_tipo_persona
    ADD CONSTRAINT log_tipo_persona_idtipo_fkey FOREIGN KEY (idtipo) REFERENCES public.tipo_persona(idtipo);


--
-- TOC entry 2839 (class 2606 OID 746916)
-- Dependencies: 206 299 2762
-- Name: log_tipo_persona_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_tipo_persona
    ADD CONSTRAINT log_tipo_persona_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2840 (class 2606 OID 746921)
-- Dependencies: 208 298 2760
-- Name: log_unidad_negocio_idunidad_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_unidad_negocio
    ADD CONSTRAINT log_unidad_negocio_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES public.unidad_negocio(idunidad);


--
-- TOC entry 2841 (class 2606 OID 746926)
-- Dependencies: 208 2762 299
-- Name: log_unidad_negocio_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_unidad_negocio
    ADD CONSTRAINT log_unidad_negocio_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2842 (class 2606 OID 746931)
-- Dependencies: 2762 299 210
-- Name: log_vendedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_vendedor
    ADD CONSTRAINT log_vendedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);


--
-- TOC entry 2843 (class 2606 OID 746936)
-- Dependencies: 2764 210 300
-- Name: log_vendedor_idvendedor_fkey; Type: FK CONSTRAINT; Schema: log; Owner: agewunue_farmacia
--

ALTER TABLE ONLY log_vendedor
    ADD CONSTRAINT log_vendedor_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES public.vendedor(idvendedor);


SET search_path = public, pg_catalog;

--
-- TOC entry 2844 (class 2606 OID 746941)
-- Dependencies: 212 2758 297
-- Name: almacen_idubigeo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY almacen
    ADD CONSTRAINT almacen_idubigeo_fkey FOREIGN KEY (idubigeo) REFERENCES ubigeo(idubigeo);


--
-- TOC entry 2845 (class 2606 OID 746946)
-- Dependencies: 2760 212 298
-- Name: almacen_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY almacen
    ADD CONSTRAINT almacen_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2846 (class 2606 OID 746951)
-- Dependencies: 2762 299 212
-- Name: almacen_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY almacen
    ADD CONSTRAINT almacen_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2847 (class 2606 OID 746956)
-- Dependencies: 214 226 2688
-- Name: amortizacion_cliente_idcomprobante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idcomprobante_fkey FOREIGN KEY (idcomprobante) REFERENCES comprobante_emitido(idcomprobante);


--
-- TOC entry 2848 (class 2606 OID 746961)
-- Dependencies: 214 236 2698
-- Name: amortizacion_cliente_iddocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES documento(iddocumento);


--
-- TOC entry 2849 (class 2606 OID 746966)
-- Dependencies: 243 214 2706
-- Name: amortizacion_cliente_idletra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idletra_fkey FOREIGN KEY (idletra) REFERENCES letra_cliente(idletra);


--
-- TOC entry 2850 (class 2606 OID 746971)
-- Dependencies: 2714 251 214
-- Name: amortizacion_cliente_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 2851 (class 2606 OID 746976)
-- Dependencies: 265 2728 214
-- Name: amortizacion_cliente_idnotabo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idnotabo_fkey FOREIGN KEY (idnotabo) REFERENCES notabo_cliente(idnotabo);


--
-- TOC entry 2852 (class 2606 OID 746981)
-- Dependencies: 269 2732 214
-- Name: amortizacion_cliente_idnotcar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idnotcar_fkey FOREIGN KEY (idnotcar) REFERENCES notcar_cliente(idnotcar);


--
-- TOC entry 2853 (class 2606 OID 746986)
-- Dependencies: 295 2754 214
-- Name: amortizacion_cliente_idtipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idtipo_fkey FOREIGN KEY (idtipo) REFERENCES tipo_pago(idtipo);


--
-- TOC entry 2854 (class 2606 OID 746991)
-- Dependencies: 214 2762 299
-- Name: amortizacion_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2855 (class 2606 OID 746996)
-- Dependencies: 2764 300 214
-- Name: amortizacion_cliente_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor);


--
-- TOC entry 2856 (class 2606 OID 747001)
-- Dependencies: 2682 216 220
-- Name: amortizacion_proveedor_idbanco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES banco(idbanco);


--
-- TOC entry 2857 (class 2606 OID 747006)
-- Dependencies: 2694 232 216
-- Name: amortizacion_proveedor_idcuenta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idcuenta_fkey FOREIGN KEY (idcuenta) REFERENCES cuenta_pagar(idcuenta);


--
-- TOC entry 2858 (class 2606 OID 747011)
-- Dependencies: 236 216 2698
-- Name: amortizacion_proveedor_iddocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES documento(iddocumento);


--
-- TOC entry 2859 (class 2606 OID 747016)
-- Dependencies: 2708 216 245
-- Name: amortizacion_proveedor_idletra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idletra_fkey FOREIGN KEY (idletra) REFERENCES letra_proveedor(idletra);


--
-- TOC entry 2860 (class 2606 OID 747021)
-- Dependencies: 251 216 2714
-- Name: amortizacion_proveedor_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 2861 (class 2606 OID 747026)
-- Dependencies: 267 2730 216
-- Name: amortizacion_proveedor_idnotabo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idnotabo_fkey FOREIGN KEY (idnotabo) REFERENCES notabo_proveedor(idnotabo);


--
-- TOC entry 2862 (class 2606 OID 747031)
-- Dependencies: 271 216 2734
-- Name: amortizacion_proveedor_idnotcar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idnotcar_fkey FOREIGN KEY (idnotcar) REFERENCES notcar_proveedor(idnotcar);


--
-- TOC entry 2863 (class 2606 OID 747036)
-- Dependencies: 216 2754 295
-- Name: amortizacion_proveedor_idtipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idtipo_fkey FOREIGN KEY (idtipo) REFERENCES tipo_pago(idtipo);


--
-- TOC entry 2864 (class 2606 OID 747041)
-- Dependencies: 216 299 2762
-- Name: amortizacion_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2865 (class 2606 OID 747046)
-- Dependencies: 2686 218 224
-- Name: aval_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY aval
    ADD CONSTRAINT aval_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2866 (class 2606 OID 747051)
-- Dependencies: 218 2762 299
-- Name: aval_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY aval
    ADD CONSTRAINT aval_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2867 (class 2606 OID 747056)
-- Dependencies: 2714 251 220
-- Name: banco_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY banco
    ADD CONSTRAINT banco_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 2868 (class 2606 OID 747061)
-- Dependencies: 220 2762 299
-- Name: banco_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY banco
    ADD CONSTRAINT banco_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2869 (class 2606 OID 747066)
-- Dependencies: 2682 222 220
-- Name: cheque_cliente_idbanco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES banco(idbanco);


--
-- TOC entry 2870 (class 2606 OID 747071)
-- Dependencies: 222 2686 224
-- Name: cheque_cliente_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2871 (class 2606 OID 747076)
-- Dependencies: 2736 273 222
-- Name: cheque_cliente_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2872 (class 2606 OID 747081)
-- Dependencies: 222 2760 298
-- Name: cheque_cliente_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2873 (class 2606 OID 747086)
-- Dependencies: 299 2762 222
-- Name: cheque_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2874 (class 2606 OID 747091)
-- Dependencies: 2756 224 296
-- Name: cliente_idtipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_idtipo_fkey FOREIGN KEY (idtipo) REFERENCES tipo_persona(idtipo);


--
-- TOC entry 2875 (class 2606 OID 747096)
-- Dependencies: 297 224 2758
-- Name: cliente_idubigeo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_idubigeo_fkey FOREIGN KEY (idubigeo) REFERENCES ubigeo(idubigeo);


--
-- TOC entry 2876 (class 2606 OID 747101)
-- Dependencies: 2760 224 298
-- Name: cliente_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2877 (class 2606 OID 747106)
-- Dependencies: 2762 224 299
-- Name: cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2878 (class 2606 OID 747111)
-- Dependencies: 2686 226 224
-- Name: comprobante_emitido_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2879 (class 2606 OID 747116)
-- Dependencies: 2690 226 228
-- Name: comprobante_emitido_idcondicion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idcondicion_fkey FOREIGN KEY (idcondicion) REFERENCES condicion_venta(idcondicion);


--
-- TOC entry 2880 (class 2606 OID 747121)
-- Dependencies: 226 236 2698
-- Name: comprobante_emitido_iddocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES documento(iddocumento);


--
-- TOC entry 2881 (class 2606 OID 747126)
-- Dependencies: 226 2746 282
-- Name: comprobante_emitido_idregsalida_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idregsalida_fkey FOREIGN KEY (idregsalida) REFERENCES registro_salida(idregsalida);


--
-- TOC entry 2882 (class 2606 OID 747131)
-- Dependencies: 2760 298 226
-- Name: comprobante_emitido_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2883 (class 2606 OID 747136)
-- Dependencies: 299 2762 226
-- Name: comprobante_emitido_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2884 (class 2606 OID 747141)
-- Dependencies: 300 2764 226
-- Name: comprobante_emitido_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor);


--
-- TOC entry 2885 (class 2606 OID 747146)
-- Dependencies: 228 299 2762
-- Name: condicion_venta_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY condicion_venta
    ADD CONSTRAINT condicion_venta_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2886 (class 2606 OID 747151)
-- Dependencies: 230 2682 220
-- Name: cuenta_bancaria_idbanco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES banco(idbanco);


--
-- TOC entry 2887 (class 2606 OID 747156)
-- Dependencies: 230 278 2742
-- Name: cuenta_bancaria_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 2888 (class 2606 OID 747161)
-- Dependencies: 2752 230 294
-- Name: cuenta_bancaria_idtipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_idtipo_fkey FOREIGN KEY (idtipo) REFERENCES tipo_cuenta_bancaria(idtipo);


--
-- TOC entry 2889 (class 2606 OID 747166)
-- Dependencies: 2762 230 299
-- Name: cuenta_bancaria_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2890 (class 2606 OID 747171)
-- Dependencies: 2698 232 236
-- Name: cuenta_pagar_iddocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES documento(iddocumento);


--
-- TOC entry 2891 (class 2606 OID 747176)
-- Dependencies: 2714 251 232
-- Name: cuenta_pagar_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 2892 (class 2606 OID 747181)
-- Dependencies: 273 232 2736
-- Name: cuenta_pagar_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2893 (class 2606 OID 747186)
-- Dependencies: 232 278 2742
-- Name: cuenta_pagar_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 2894 (class 2606 OID 747191)
-- Dependencies: 2744 280 232
-- Name: cuenta_pagar_idregentrada_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idregentrada_fkey FOREIGN KEY (idregentrada) REFERENCES registro_entrada(idregentrada);


--
-- TOC entry 2895 (class 2606 OID 747196)
-- Dependencies: 2760 298 232
-- Name: cuenta_pagar_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2896 (class 2606 OID 747201)
-- Dependencies: 232 299 2762
-- Name: cuenta_pagar_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2897 (class 2606 OID 747206)
-- Dependencies: 2682 220 234
-- Name: deposito_cliente_idbanco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES banco(idbanco);


--
-- TOC entry 2898 (class 2606 OID 747211)
-- Dependencies: 224 234 2686
-- Name: deposito_cliente_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2899 (class 2606 OID 747216)
-- Dependencies: 2736 273 234
-- Name: deposito_cliente_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2900 (class 2606 OID 747221)
-- Dependencies: 234 2760 298
-- Name: deposito_cliente_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2901 (class 2606 OID 747226)
-- Dependencies: 234 2762 299
-- Name: deposito_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2985 (class 2606 OID 747756)
-- Dependencies: 2766 301 304
-- Name: detalle_autorizacion_idautorizacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY detalle_autorizacion
    ADD CONSTRAINT detalle_autorizacion_idautorizacion_fkey FOREIGN KEY (idautorizacion) REFERENCES autorizacion(idautorizacion);


--
-- TOC entry 2902 (class 2606 OID 747231)
-- Dependencies: 299 2762 236
-- Name: documento_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY documento
    ADD CONSTRAINT documento_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2903 (class 2606 OID 747236)
-- Dependencies: 297 238 2758
-- Name: empresa_idubigeo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_idubigeo_fkey FOREIGN KEY (idubigeo) REFERENCES ubigeo(idubigeo);


--
-- TOC entry 2904 (class 2606 OID 747241)
-- Dependencies: 238 299 2762
-- Name: empresa_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2905 (class 2606 OID 747246)
-- Dependencies: 239 299 2762
-- Name: existencia_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY existencia
    ADD CONSTRAINT existencia_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2906 (class 2606 OID 747251)
-- Dependencies: 2762 299 241
-- Name: familia_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY familia
    ADD CONSTRAINT familia_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2907 (class 2606 OID 747256)
-- Dependencies: 2680 218 243
-- Name: letra_cliente_idaval_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idaval_fkey FOREIGN KEY (idaval) REFERENCES aval(idaval);


--
-- TOC entry 2908 (class 2606 OID 747261)
-- Dependencies: 243 220 2682
-- Name: letra_cliente_idbanco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES banco(idbanco);


--
-- TOC entry 2909 (class 2606 OID 747266)
-- Dependencies: 2686 243 224
-- Name: letra_cliente_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2910 (class 2606 OID 747271)
-- Dependencies: 273 243 2736
-- Name: letra_cliente_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2911 (class 2606 OID 747276)
-- Dependencies: 243 298 2760
-- Name: letra_cliente_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2912 (class 2606 OID 747281)
-- Dependencies: 243 2762 299
-- Name: letra_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2913 (class 2606 OID 747286)
-- Dependencies: 300 243 2764
-- Name: letra_cliente_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor);


--
-- TOC entry 2914 (class 2606 OID 747291)
-- Dependencies: 251 2714 245
-- Name: letra_proveedor_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_proveedor
    ADD CONSTRAINT letra_proveedor_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 2915 (class 2606 OID 747296)
-- Dependencies: 273 2736 245
-- Name: letra_proveedor_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_proveedor
    ADD CONSTRAINT letra_proveedor_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2916 (class 2606 OID 747301)
-- Dependencies: 278 245 2742
-- Name: letra_proveedor_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_proveedor
    ADD CONSTRAINT letra_proveedor_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 2917 (class 2606 OID 747306)
-- Dependencies: 2760 245 298
-- Name: letra_proveedor_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_proveedor
    ADD CONSTRAINT letra_proveedor_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2918 (class 2606 OID 747311)
-- Dependencies: 299 245 2762
-- Name: letra_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_proveedor
    ADD CONSTRAINT letra_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2919 (class 2606 OID 747316)
-- Dependencies: 299 2762 247
-- Name: linea_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY linea
    ADD CONSTRAINT linea_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2920 (class 2606 OID 747321)
-- Dependencies: 249 239 239 2702 249
-- Name: lote_idalmacen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY lote
    ADD CONSTRAINT lote_idalmacen_fkey FOREIGN KEY (idalmacen, idproducto) REFERENCES existencia(idalmacen, idproducto);


--
-- TOC entry 2921 (class 2606 OID 747326)
-- Dependencies: 253 249 2716
-- Name: lote_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY lote
    ADD CONSTRAINT lote_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_entrada(idmotivo);


--
-- TOC entry 2922 (class 2606 OID 747331)
-- Dependencies: 249 2762 299
-- Name: lote_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY lote
    ADD CONSTRAINT lote_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2923 (class 2606 OID 747336)
-- Dependencies: 251 2762 299
-- Name: moneda_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY moneda
    ADD CONSTRAINT moneda_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2925 (class 2606 OID 747341)
-- Dependencies: 2762 299 255
-- Name: motivo_notabo_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY motivo_notabo_cliente
    ADD CONSTRAINT motivo_notabo_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2926 (class 2606 OID 747346)
-- Dependencies: 299 257 2762
-- Name: motivo_notabo_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY motivo_notabo_proveedor
    ADD CONSTRAINT motivo_notabo_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2927 (class 2606 OID 747351)
-- Dependencies: 259 299 2762
-- Name: motivo_notcar_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY motivo_notcar_cliente
    ADD CONSTRAINT motivo_notcar_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2928 (class 2606 OID 747356)
-- Dependencies: 2762 261 299
-- Name: motivo_notcar_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY motivo_notcar_proveedor
    ADD CONSTRAINT motivo_notcar_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2929 (class 2606 OID 747361)
-- Dependencies: 299 263 2762
-- Name: motivo_salida_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY motivo_salida
    ADD CONSTRAINT motivo_salida_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2924 (class 2606 OID 747366)
-- Dependencies: 299 2762 253
-- Name: motivoentrada_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY motivo_entrada
    ADD CONSTRAINT motivoentrada_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2930 (class 2606 OID 747371)
-- Dependencies: 2686 265 224
-- Name: notabo_cliente_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2931 (class 2606 OID 747376)
-- Dependencies: 2718 255 265
-- Name: notabo_cliente_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_notabo_cliente(idmotivo);


--
-- TOC entry 2932 (class 2606 OID 747381)
-- Dependencies: 273 2736 265
-- Name: notabo_cliente_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2933 (class 2606 OID 747386)
-- Dependencies: 2760 298 265
-- Name: notabo_cliente_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2934 (class 2606 OID 747391)
-- Dependencies: 299 2762 265
-- Name: notabo_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2935 (class 2606 OID 747396)
-- Dependencies: 2764 300 265
-- Name: notabo_cliente_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor);


--
-- TOC entry 2936 (class 2606 OID 747401)
-- Dependencies: 251 2714 267
-- Name: notabo_proveedor_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 2937 (class 2606 OID 747406)
-- Dependencies: 257 267 2720
-- Name: notabo_proveedor_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_notabo_proveedor(idmotivo);


--
-- TOC entry 2938 (class 2606 OID 747411)
-- Dependencies: 267 273 2736
-- Name: notabo_proveedor_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2939 (class 2606 OID 747416)
-- Dependencies: 278 2742 267
-- Name: notabo_proveedor_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 2940 (class 2606 OID 747421)
-- Dependencies: 298 267 2760
-- Name: notabo_proveedor_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2941 (class 2606 OID 747426)
-- Dependencies: 2762 267 299
-- Name: notabo_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2942 (class 2606 OID 747431)
-- Dependencies: 2686 269 224
-- Name: notcar_cliente_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2943 (class 2606 OID 747436)
-- Dependencies: 269 2722 259
-- Name: notcar_cliente_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_notcar_cliente(idmotivo);


--
-- TOC entry 2944 (class 2606 OID 747441)
-- Dependencies: 2736 273 269
-- Name: notcar_cliente_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2945 (class 2606 OID 747446)
-- Dependencies: 269 2760 298
-- Name: notcar_cliente_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2946 (class 2606 OID 747451)
-- Dependencies: 299 2762 269
-- Name: notcar_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2947 (class 2606 OID 747456)
-- Dependencies: 300 269 2764
-- Name: notcar_cliente_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor);


--
-- TOC entry 2948 (class 2606 OID 747461)
-- Dependencies: 271 2714 251
-- Name: notcar_proveedor_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 2949 (class 2606 OID 747466)
-- Dependencies: 261 2724 271
-- Name: notcar_proveedor_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_notcar_proveedor(idmotivo);


--
-- TOC entry 2950 (class 2606 OID 747471)
-- Dependencies: 273 2736 271
-- Name: notcar_proveedor_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2951 (class 2606 OID 747476)
-- Dependencies: 2742 278 271
-- Name: notcar_proveedor_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 2952 (class 2606 OID 747481)
-- Dependencies: 2760 298 271
-- Name: notcar_proveedor_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2953 (class 2606 OID 747486)
-- Dependencies: 2762 299 271
-- Name: notcar_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2954 (class 2606 OID 747491)
-- Dependencies: 273 299 2762
-- Name: periodo_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY periodo
    ADD CONSTRAINT periodo_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2984 (class 2606 OID 747735)
-- Dependencies: 301 2762 299
-- Name: permiso_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY autorizacion
    ADD CONSTRAINT permiso_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2955 (class 2606 OID 747496)
-- Dependencies: 299 2762 275
-- Name: presentacion_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY presentacion
    ADD CONSTRAINT presentacion_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2956 (class 2606 OID 747501)
-- Dependencies: 276 2704 241
-- Name: producto_idfamilia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_idfamilia_fkey FOREIGN KEY (idfamilia) REFERENCES familia(idfamilia);


--
-- TOC entry 2957 (class 2606 OID 747506)
-- Dependencies: 275 2738 276
-- Name: producto_idpresentacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_idpresentacion_fkey FOREIGN KEY (idpresentacion) REFERENCES presentacion(idpresentacion);


--
-- TOC entry 2958 (class 2606 OID 747511)
-- Dependencies: 293 276 2750
-- Name: producto_idsublinea_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_idsublinea_fkey FOREIGN KEY (idsublinea) REFERENCES sublinea(idsublinea);


--
-- TOC entry 2959 (class 2606 OID 747516)
-- Dependencies: 2762 299 276
-- Name: producto_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2960 (class 2606 OID 747521)
-- Dependencies: 278 2758 297
-- Name: proveedor_idubigeo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY proveedor
    ADD CONSTRAINT proveedor_idubigeo_fkey FOREIGN KEY (idubigeo) REFERENCES ubigeo(idubigeo);


--
-- TOC entry 2961 (class 2606 OID 747526)
-- Dependencies: 299 278 2762
-- Name: proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY proveedor
    ADD CONSTRAINT proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2962 (class 2606 OID 747531)
-- Dependencies: 280 212 2674
-- Name: registro_entrada_idalmacen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_idalmacen_fkey FOREIGN KEY (idalmacen) REFERENCES almacen(idalmacen);


--
-- TOC entry 2963 (class 2606 OID 747536)
-- Dependencies: 280 236 2698
-- Name: registro_entrada_iddocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES documento(iddocumento);


--
-- TOC entry 2964 (class 2606 OID 747541)
-- Dependencies: 253 280 2716
-- Name: registro_entrada_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_entrada(idmotivo);


--
-- TOC entry 2965 (class 2606 OID 747546)
-- Dependencies: 273 2736 280
-- Name: registro_entrada_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2966 (class 2606 OID 747551)
-- Dependencies: 278 280 2742
-- Name: registro_entrada_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 2967 (class 2606 OID 747556)
-- Dependencies: 280 2762 299
-- Name: registro_entrada_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2968 (class 2606 OID 747561)
-- Dependencies: 282 228 2690
-- Name: registro_salida_idcondicion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_idcondicion_fkey FOREIGN KEY (idcondicion) REFERENCES condicion_venta(idcondicion);


--
-- TOC entry 2969 (class 2606 OID 747566)
-- Dependencies: 2698 236 282
-- Name: registro_salida_iddocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES documento(iddocumento);


--
-- TOC entry 2970 (class 2606 OID 747571)
-- Dependencies: 263 282 2726
-- Name: registro_salida_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_salida(idmotivo);


--
-- TOC entry 2971 (class 2606 OID 747576)
-- Dependencies: 282 2736 273
-- Name: registro_salida_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2972 (class 2606 OID 747581)
-- Dependencies: 2760 298 282
-- Name: registro_salida_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2973 (class 2606 OID 747586)
-- Dependencies: 300 282 2764
-- Name: registro_salida_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor);


--
-- TOC entry 2974 (class 2606 OID 747591)
-- Dependencies: 247 2710 293
-- Name: sublinea_idlinea_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY sublinea
    ADD CONSTRAINT sublinea_idlinea_fkey FOREIGN KEY (idlinea) REFERENCES linea(idlinea);


--
-- TOC entry 2975 (class 2606 OID 747596)
-- Dependencies: 2762 293 299
-- Name: sublinea_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY sublinea
    ADD CONSTRAINT sublinea_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2976 (class 2606 OID 747601)
-- Dependencies: 2762 299 294
-- Name: tipo_cuenta_bancaria_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY tipo_cuenta_bancaria
    ADD CONSTRAINT tipo_cuenta_bancaria_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2977 (class 2606 OID 747606)
-- Dependencies: 299 2762 295
-- Name: tipo_pago_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY tipo_pago
    ADD CONSTRAINT tipo_pago_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2978 (class 2606 OID 747611)
-- Dependencies: 296 2762 299
-- Name: tipo_persona_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY tipo_persona
    ADD CONSTRAINT tipo_persona_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2979 (class 2606 OID 747616)
-- Dependencies: 298 2700 238
-- Name: unidad_negocio_idempresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY unidad_negocio
    ADD CONSTRAINT unidad_negocio_idempresa_fkey FOREIGN KEY (idempresa) REFERENCES empresa(idempresa);


--
-- TOC entry 2980 (class 2606 OID 747621)
-- Dependencies: 298 297 2758
-- Name: unidad_negocio_idubigeo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY unidad_negocio
    ADD CONSTRAINT unidad_negocio_idubigeo_fkey FOREIGN KEY (idubigeo) REFERENCES ubigeo(idubigeo);


--
-- TOC entry 2981 (class 2606 OID 747626)
-- Dependencies: 2762 299 298
-- Name: unidad_negocio_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY unidad_negocio
    ADD CONSTRAINT unidad_negocio_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2982 (class 2606 OID 747631)
-- Dependencies: 284 299 2748
-- Name: usuario_idrol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_idrol_fkey FOREIGN KEY (idrol) REFERENCES rol(idrol);


--
-- TOC entry 2983 (class 2606 OID 747636)
-- Dependencies: 2762 299 300
-- Name: vendedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY vendedor
    ADD CONSTRAINT vendedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 212
-- Name: almacen; Type: ACL; Schema: public; Owner: agewunue_farmacia
--

REVOKE ALL ON TABLE almacen FROM PUBLIC;
REVOKE ALL ON TABLE almacen FROM agewunue_farmacia;
GRANT ALL ON TABLE almacen TO agewunue_farmacia;


--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 214
-- Name: amortizacion_cliente; Type: ACL; Schema: public; Owner: agewunue_farmacia
--

REVOKE ALL ON TABLE amortizacion_cliente FROM PUBLIC;
REVOKE ALL ON TABLE amortizacion_cliente FROM agewunue_farmacia;
GRANT ALL ON TABLE amortizacion_cliente TO agewunue_farmacia;


-- Completed on 2013-08-01 18:40:11

--
-- PostgreSQL database dump complete
--

