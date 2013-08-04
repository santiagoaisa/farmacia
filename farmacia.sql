--
-- PostgreSQL database dump
--

-- Started on 2013-08-04 09:14:42

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

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
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 316
-- Name: seq_acceso; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_acceso', 1, false);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 315 (class 1259 OID 54461)
-- Dependencies: 2564 2565 7
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
-- TOC entry 2912 (class 0 OID 0)
-- Dependencies: 215
-- Name: seq_almacen; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_almacen', 1, false);


--
-- TOC entry 216 (class 1259 OID 52653)
-- Dependencies: 2327 2328 2329 7
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
-- TOC entry 2914 (class 0 OID 0)
-- Dependencies: 217
-- Name: seq_amortizacion_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_amortizacion_cliente', 1, false);


--
-- TOC entry 218 (class 1259 OID 52661)
-- Dependencies: 2330 2331 2332 2333 2334 2335 7
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
-- TOC entry 2916 (class 0 OID 0)
-- Dependencies: 219
-- Name: seq_amortizacion_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_amortizacion_proveedor', 1, false);


--
-- TOC entry 220 (class 1259 OID 52672)
-- Dependencies: 2336 2337 2338 2339 2340 7
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
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 221
-- Name: seq_autorizacion; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_autorizacion', 1, false);


--
-- TOC entry 222 (class 1259 OID 52682)
-- Dependencies: 2341 2342 7
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
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 223
-- Name: seq_aval; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_aval', 1, false);


--
-- TOC entry 224 (class 1259 OID 52689)
-- Dependencies: 2343 2344 7
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
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 225
-- Name: seq_banco; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_banco', 1, false);


--
-- TOC entry 226 (class 1259 OID 52696)
-- Dependencies: 2345 2346 7
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
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 227
-- Name: seq_cheque_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_cheque_cliente', 1, false);


--
-- TOC entry 228 (class 1259 OID 52703)
-- Dependencies: 2347 2348 2349 2350 2351 7
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
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 229
-- Name: seq_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_cliente', 1, false);


--
-- TOC entry 230 (class 1259 OID 52713)
-- Dependencies: 2352 2353 2354 2355 7
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
-- TOC entry 2922 (class 0 OID 0)
-- Dependencies: 231
-- Name: seq_comprobante_emitido; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_comprobante_emitido', 1, false);


--
-- TOC entry 232 (class 1259 OID 52722)
-- Dependencies: 2356 2357 2358 2359 2360 2361 2362 2363 2364 2365 2366 2367 2368 2369 7
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
-- TOC entry 2923 (class 0 OID 0)
-- Dependencies: 233
-- Name: seq_condicion_venta; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_condicion_venta', 1, false);


--
-- TOC entry 234 (class 1259 OID 52740)
-- Dependencies: 2370 2371 2372 2373 2374 7
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
-- TOC entry 2924 (class 0 OID 0)
-- Dependencies: 235
-- Name: seq_cuenta_bancaria; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_cuenta_bancaria', 1, false);


--
-- TOC entry 236 (class 1259 OID 52750)
-- Dependencies: 2375 2376 7
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
-- TOC entry 2925 (class 0 OID 0)
-- Dependencies: 237
-- Name: seq_cuenta_pagar; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_cuenta_pagar', 1, false);


--
-- TOC entry 238 (class 1259 OID 52757)
-- Dependencies: 2377 2378 2379 2380 2381 2382 2383 2384 2385 2386 2387 2388 2389 2390 2391 2392 2393 7
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
    dfecven timestamp without time zone,
    dfecpago timestamp without time zone,
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
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 239
-- Name: seq_deposito_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_deposito_cliente', 1, false);


--
-- TOC entry 240 (class 1259 OID 52775)
-- Dependencies: 2394 2395 2396 2397 7
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
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 241
-- Name: seq_detalle_autorizacion; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_detalle_autorizacion', 1, false);


--
-- TOC entry 242 (class 1259 OID 52784)
-- Dependencies: 2398 2399 7
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
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 243
-- Name: seq_documento; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_documento', 1, false);


--
-- TOC entry 244 (class 1259 OID 52791)
-- Dependencies: 2400 2401 2402 2403 2404 2405 7
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
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 245
-- Name: seq_empresa; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_empresa', 7, true);


--
-- TOC entry 246 (class 1259 OID 52802)
-- Dependencies: 2406 2407 7
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
-- TOC entry 2930 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN empresa.cruta; Type: COMMENT; Schema: public; Owner: agewunue_farmacia
--

COMMENT ON COLUMN empresa.cruta IS 'ruta del logo de la empresa';


--
-- TOC entry 247 (class 1259 OID 52807)
-- Dependencies: 2408 2409 2410 2411 2412 2413 2414 2415 7
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
-- TOC entry 2931 (class 0 OID 0)
-- Dependencies: 248
-- Name: seq_familia; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_familia', 1, false);


--
-- TOC entry 249 (class 1259 OID 52819)
-- Dependencies: 2416 2417 2418 7
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
-- TOC entry 2932 (class 0 OID 0)
-- Dependencies: 250
-- Name: seq_letra_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_letra_cliente', 1, false);


--
-- TOC entry 251 (class 1259 OID 52827)
-- Dependencies: 2419 2420 2421 2422 2423 2424 2425 2426 2427 7
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
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 252
-- Name: seq_letra_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_letra_proveedor', 1, false);


--
-- TOC entry 253 (class 1259 OID 52841)
-- Dependencies: 2428 2429 2430 2431 2432 2433 2434 2435 7
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
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 254
-- Name: seq_linea; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_linea', 1, true);


--
-- TOC entry 255 (class 1259 OID 52854)
-- Dependencies: 2436 2437 2438 2439 7
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
-- TOC entry 2935 (class 0 OID 0)
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
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 256
-- Name: seq_lote; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_lote', 1, false);


--
-- TOC entry 257 (class 1259 OID 52863)
-- Dependencies: 2440 2441 2442 2443 7
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
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 314
-- Name: seq_mapa; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_mapa', 5, true);


--
-- TOC entry 313 (class 1259 OID 54431)
-- Dependencies: 2562 2563 7
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
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 312
-- Name: seq_menu; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_menu', 6, true);


--
-- TOC entry 311 (class 1259 OID 54378)
-- Dependencies: 2554 2555 2556 2557 2558 2559 2560 2561 7
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
-- TOC entry 2939 (class 0 OID 0)
-- Dependencies: 309
-- Name: seq_modulo; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_modulo', 4, true);


--
-- TOC entry 310 (class 1259 OID 54365)
-- Dependencies: 2551 2552 2553 7
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
-- TOC entry 2940 (class 0 OID 0)
-- Dependencies: 258
-- Name: seq_moneda; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_moneda', 1, false);


--
-- TOC entry 259 (class 1259 OID 52871)
-- Dependencies: 2444 2445 2446 7
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
-- TOC entry 2941 (class 0 OID 0)
-- Dependencies: 260
-- Name: seq_motivo_entrada; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_motivo_entrada', 1, false);


--
-- TOC entry 261 (class 1259 OID 52879)
-- Dependencies: 2447 2448 2449 7
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
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 262
-- Name: seq_motivo_notabo_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_motivo_notabo_cliente', 1, false);


--
-- TOC entry 263 (class 1259 OID 52887)
-- Dependencies: 2450 2451 2452 2453 7
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
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 264
-- Name: seq_motivo_notabo_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_motivo_notabo_proveedor', 1, false);


--
-- TOC entry 265 (class 1259 OID 52896)
-- Dependencies: 2454 2455 7
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
-- TOC entry 2944 (class 0 OID 0)
-- Dependencies: 266
-- Name: seq_motivo_notcar_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_motivo_notcar_cliente', 1, false);


--
-- TOC entry 267 (class 1259 OID 52903)
-- Dependencies: 2456 2457 7
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
-- TOC entry 2945 (class 0 OID 0)
-- Dependencies: 268
-- Name: seq_motivo_notcar_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_motivo_notcar_proveedor', 1, false);


--
-- TOC entry 269 (class 1259 OID 52910)
-- Dependencies: 2458 7
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
-- TOC entry 2946 (class 0 OID 0)
-- Dependencies: 270
-- Name: seq_motivo_salida; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_motivo_salida', 1, false);


--
-- TOC entry 271 (class 1259 OID 52916)
-- Dependencies: 2459 2460 2461 7
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
-- TOC entry 2947 (class 0 OID 0)
-- Dependencies: 322
-- Name: seq_movimiento; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_movimiento', 1, false);


--
-- TOC entry 321 (class 1259 OID 54535)
-- Dependencies: 2566 2567 2568 2569 2570 2571 2572 2573 2574 2575 2576 7
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
-- TOC entry 2948 (class 0 OID 0)
-- Dependencies: 272
-- Name: seq_notabo_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_notabo_cliente', 1, false);


--
-- TOC entry 273 (class 1259 OID 52924)
-- Dependencies: 2462 2463 2464 2465 2466 2467 2468 2469 2470 2471 7
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
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 274
-- Name: seq_notabo_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_notabo_proveedor', 1, false);


--
-- TOC entry 275 (class 1259 OID 52939)
-- Dependencies: 2472 2473 2474 2475 2476 2477 2478 2479 2480 7
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
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 276
-- Name: seq_notcar_cliente; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_notcar_cliente', 1, false);


--
-- TOC entry 277 (class 1259 OID 52953)
-- Dependencies: 2481 2482 2483 2484 2485 2486 2487 2488 2489 2490 7
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
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 278
-- Name: seq_notcar_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_notcar_proveedor', 1, false);


--
-- TOC entry 279 (class 1259 OID 52968)
-- Dependencies: 2491 2492 2493 2494 2495 2496 2497 2498 2499 7
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
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 325
-- Name: seq_orden_linea; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_orden_linea', 1, false);


--
-- TOC entry 324 (class 1259 OID 57482)
-- Dependencies: 2578 2579 2580 7
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
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 280
-- Name: seq_periodo; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_periodo', 1, false);


--
-- TOC entry 281 (class 1259 OID 52982)
-- Dependencies: 2500 2501 2502 7
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
-- TOC entry 2954 (class 0 OID 0)
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
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 282
-- Name: seq_presentacion; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_presentacion', 1, false);


--
-- TOC entry 283 (class 1259 OID 52990)
-- Dependencies: 2503 2504 2505 7
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
-- Dependencies: 2506 2507 7
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
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 285
-- Name: seq_proveedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_proveedor', 1, false);


--
-- TOC entry 286 (class 1259 OID 53003)
-- Dependencies: 2508 2509 2510 7
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
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 287
-- Name: seq_registro_entrada; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_registro_entrada', 1, false);


--
-- TOC entry 288 (class 1259 OID 53014)
-- Dependencies: 2511 2512 2513 2514 2515 2516 7
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
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 289
-- Name: seq_registro_salida; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_registro_salida', 1, false);


--
-- TOC entry 290 (class 1259 OID 53025)
-- Dependencies: 2517 2518 2519 2520 2521 2522 2523 2524 2525 2526 2527 2528 2529 7
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
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 291
-- Name: seq_rol; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_rol', 1, true);


--
-- TOC entry 292 (class 1259 OID 53045)
-- Dependencies: 2530 2531 7
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
-- TOC entry 2960 (class 0 OID 0)
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
-- TOC entry 2961 (class 0 OID 0)
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
-- TOC entry 2962 (class 0 OID 0)
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
-- TOC entry 2963 (class 0 OID 0)
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
-- TOC entry 2964 (class 0 OID 0)
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
-- TOC entry 2965 (class 0 OID 0)
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
-- TOC entry 2966 (class 0 OID 0)
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
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 300
-- Name: seq_vendedor; Type: SEQUENCE SET; Schema: public; Owner: agewunue_farmacia
--

SELECT pg_catalog.setval('seq_vendedor', 1, false);


--
-- TOC entry 323 (class 1259 OID 57450)
-- Dependencies: 2577 7
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
-- Dependencies: 2532 2533 7
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
-- Dependencies: 2534 2535 7
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
-- Dependencies: 2536 2537 2538 2539 7
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
-- TOC entry 304 (class 1259 OID 53083)
-- Dependencies: 2540 2541 7
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
-- Dependencies: 2542 2543 7
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
-- Dependencies: 2544 2545 2546 2547 7
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
-- Dependencies: 2548 2549 2550 7
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

--
-- TOC entry 2903 (class 0 OID 54461)
-- Dependencies: 315
-- Data for Name: acceso; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2852 (class 0 OID 52653)
-- Dependencies: 216
-- Data for Name: almacen; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2853 (class 0 OID 52661)
-- Dependencies: 218
-- Data for Name: amortizacion_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2854 (class 0 OID 52672)
-- Dependencies: 220
-- Data for Name: amortizacion_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2855 (class 0 OID 52682)
-- Dependencies: 222
-- Data for Name: autorizacion; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2856 (class 0 OID 52689)
-- Dependencies: 224
-- Data for Name: aval; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2857 (class 0 OID 52696)
-- Dependencies: 226
-- Data for Name: banco; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2858 (class 0 OID 52703)
-- Dependencies: 228
-- Data for Name: cheque_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2859 (class 0 OID 52713)
-- Dependencies: 230
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2860 (class 0 OID 52722)
-- Dependencies: 232
-- Data for Name: comprobante_emitido; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2861 (class 0 OID 52740)
-- Dependencies: 234
-- Data for Name: condicion_venta; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2862 (class 0 OID 52750)
-- Dependencies: 236
-- Data for Name: cuenta_bancaria; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2863 (class 0 OID 52757)
-- Dependencies: 238
-- Data for Name: cuenta_pagar; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2864 (class 0 OID 52775)
-- Dependencies: 240
-- Data for Name: deposito_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2865 (class 0 OID 52784)
-- Dependencies: 242
-- Data for Name: detalle_autorizacion; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2866 (class 0 OID 52791)
-- Dependencies: 244
-- Data for Name: documento; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2867 (class 0 OID 52802)
-- Dependencies: 246
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

INSERT INTO empresa (idempresa, cnomempresa, cruc, cdireccion, idubigeo, dfecini, ctelefono, cfax, cmovil, cruta, idusuario, dfecreg) VALUES (1, 'UNA EMPRESA', '20100220700', 'AVV', '040201', NULL, '          ', '          ', '          ', NULL, 2, '2013-07-29 08:36:43.033');
INSERT INTO empresa (idempresa, cnomempresa, cruc, cdireccion, idubigeo, dfecini, ctelefono, cfax, cmovil, cruta, idusuario, dfecreg) VALUES (3, 'UNA EMPRESA', '20100220700', 'UNA DIRECCION', '040103', NULL, '463787    ', '1234877   ', '958020402 ', NULL, 2, '2013-07-30 08:16:31.297');
INSERT INTO empresa (idempresa, cnomempresa, cruc, cdireccion, idubigeo, dfecini, ctelefono, cfax, cmovil, cruta, idusuario, dfecreg) VALUES (4, 'ZARCILLO ZOLUCIONES ', '20324499921', 'AV AVIACION 1104 FCO BOLOGNESI', '040103', NULL, '20304002  ', '132312    ', '12312     ', NULL, 2, '2013-07-30 08:19:22.26');
INSERT INTO empresa (idempresa, cnomempresa, cruc, cdireccion, idubigeo, dfecini, ctelefono, cfax, cmovil, cruta, idusuario, dfecreg) VALUES (5, 'DIMEXA S.A.', '20100220700', 'URB SANTA MARIA B-12', '040103', NULL, '463787    ', '463786    ', '958020402 ', NULL, 2, '2013-07-30 08:22:07.043');
INSERT INTO empresa (idempresa, cnomempresa, cruc, cdireccion, idubigeo, dfecini, ctelefono, cfax, cmovil, cruta, idusuario, dfecreg) VALUES (6, 'ESTA ES UNA EMPRESA', '20100220899', 'UNA DIRECCION', '040103', NULL, '456090    ', '123123    ', '958020402 ', NULL, 2, '2013-07-30 08:25:13.622');
INSERT INTO empresa (idempresa, cnomempresa, cruc, cdireccion, idubigeo, dfecini, ctelefono, cfax, cmovil, cruta, idusuario, dfecreg) VALUES (7, 'UNA EMPRESA', '20100220700', 'ESTA ES UNA DIRECCION', '040112', NULL, '9580200   ', '34342     ', '95802402  ', NULL, 2, '2013-07-30 08:28:15.875');


--
-- TOC entry 2868 (class 0 OID 52807)
-- Dependencies: 247
-- Data for Name: existencia; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2869 (class 0 OID 52819)
-- Dependencies: 249
-- Data for Name: familia; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2870 (class 0 OID 52827)
-- Dependencies: 251
-- Data for Name: letra_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2871 (class 0 OID 52841)
-- Dependencies: 253
-- Data for Name: letra_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2872 (class 0 OID 52854)
-- Dependencies: 255
-- Data for Name: linea; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

INSERT INTO linea (idlinea, cnomlinea, idusuario, dfecreg, bactivo, nincremento) VALUES (1, 'UNA LINEA', 2, '2013-07-30 13:09:04.745', true, 0.00);


--
-- TOC entry 2873 (class 0 OID 52863)
-- Dependencies: 257
-- Data for Name: lote; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2902 (class 0 OID 54431)
-- Dependencies: 313
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

INSERT INTO mapa (idmapa, idrol, idmenu, idusuario, dfecreg) VALUES (1, 1, 3, 2, '2013-08-03 09:54:29.195');
INSERT INTO mapa (idmapa, idrol, idmenu, idusuario, dfecreg) VALUES (2, 1, 4, 2, '2013-08-03 09:54:37.08');
INSERT INTO mapa (idmapa, idrol, idmenu, idusuario, dfecreg) VALUES (3, 1, 5, 2, '2013-08-03 09:54:42.103');
INSERT INTO mapa (idmapa, idrol, idmenu, idusuario, dfecreg) VALUES (5, 1, 6, 2, '2013-08-03 09:54:50.177');


--
-- TOC entry 2901 (class 0 OID 54378)
-- Dependencies: 311
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

INSERT INTO menu (idmenu, cnommenu, cruta, nnivel1, nnivel2, nnivel3, norden, bmodal, idmodulo, idusuario, dfecreg) VALUES (3, 'ARCHIVO', NULL, 1, 0, 0, 1, false, 2, 2, '2013-08-03 09:52:50.369');
INSERT INTO menu (idmenu, cnommenu, cruta, nnivel1, nnivel2, nnivel3, norden, bmodal, idmodulo, idusuario, dfecreg) VALUES (4, 'PROCESO', NULL, 2, 0, 0, 2, false, 2, 2, '2013-08-03 09:53:06.031');
INSERT INTO menu (idmenu, cnommenu, cruta, nnivel1, nnivel2, nnivel3, norden, bmodal, idmodulo, idusuario, dfecreg) VALUES (5, 'CONSULTA', NULL, 3, 0, 0, 3, false, 2, 2, '2013-08-03 09:53:20.026');
INSERT INTO menu (idmenu, cnommenu, cruta, nnivel1, nnivel2, nnivel3, norden, bmodal, idmodulo, idusuario, dfecreg) VALUES (6, 'HERRAMIENTA', NULL, 4, 0, 0, 4, false, 2, 2, '2013-08-03 09:53:32.448');


--
-- TOC entry 2900 (class 0 OID 54365)
-- Dependencies: 310
-- Data for Name: modulo; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

INSERT INTO modulo (idmodulo, cnommodulo, cimagen, norden, idusuario, dfecreg) VALUES (2, 'ALMACEN', '/img/almacen.png', 1, 2, '2013-08-03 09:51:06.186');
INSERT INTO modulo (idmodulo, cnommodulo, cimagen, norden, idusuario, dfecreg) VALUES (3, 'VENTAS', '/img/ventas.png', 2, 2, '2013-08-03 09:51:53.679');
INSERT INTO modulo (idmodulo, cnommodulo, cimagen, norden, idusuario, dfecreg) VALUES (4, 'CAJA', '/img/caja.png', 3, 2, '2013-08-03 09:51:59.951');


--
-- TOC entry 2874 (class 0 OID 52871)
-- Dependencies: 259
-- Data for Name: moneda; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2875 (class 0 OID 52879)
-- Dependencies: 261
-- Data for Name: motivo_entrada; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2876 (class 0 OID 52887)
-- Dependencies: 263
-- Data for Name: motivo_notabo_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2877 (class 0 OID 52896)
-- Dependencies: 265
-- Data for Name: motivo_notabo_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2878 (class 0 OID 52903)
-- Dependencies: 267
-- Data for Name: motivo_notcar_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2879 (class 0 OID 52910)
-- Dependencies: 269
-- Data for Name: motivo_notcar_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2880 (class 0 OID 52916)
-- Dependencies: 271
-- Data for Name: motivo_salida; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2904 (class 0 OID 54535)
-- Dependencies: 321
-- Data for Name: movimiento; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2881 (class 0 OID 52924)
-- Dependencies: 273
-- Data for Name: notabo_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2882 (class 0 OID 52939)
-- Dependencies: 275
-- Data for Name: notabo_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2883 (class 0 OID 52953)
-- Dependencies: 277
-- Data for Name: notcar_cliente; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2884 (class 0 OID 52968)
-- Dependencies: 279
-- Data for Name: notcar_proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2906 (class 0 OID 57482)
-- Dependencies: 324
-- Data for Name: orden_linea; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2885 (class 0 OID 52982)
-- Dependencies: 281
-- Data for Name: periodo; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2886 (class 0 OID 52990)
-- Dependencies: 283
-- Data for Name: presentacion; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2887 (class 0 OID 52996)
-- Dependencies: 284
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2888 (class 0 OID 53003)
-- Dependencies: 286
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2889 (class 0 OID 53014)
-- Dependencies: 288
-- Data for Name: registro_entrada; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2890 (class 0 OID 53025)
-- Dependencies: 290
-- Data for Name: registro_salida; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2891 (class 0 OID 53045)
-- Dependencies: 292
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

INSERT INTO rol (idrol, cnomrol, dfecreg) VALUES (1, 'ADMINISTRADOR', NULL);


--
-- TOC entry 2905 (class 0 OID 57450)
-- Dependencies: 323
-- Data for Name: situacion_pedido; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

INSERT INTO situacion_pedido (idsituacion, cnomsituacion, nescala) VALUES ('001', 'DIGITADO', 10);
INSERT INTO situacion_pedido (idsituacion, cnomsituacion, nescala) VALUES ('002', 'IMPRESO', 30);
INSERT INTO situacion_pedido (idsituacion, cnomsituacion, nescala) VALUES ('003', 'ENTREGADO', 50);


--
-- TOC entry 2892 (class 0 OID 53066)
-- Dependencies: 301
-- Data for Name: sublinea; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2893 (class 0 OID 53071)
-- Dependencies: 302
-- Data for Name: tipo_cuenta_bancaria; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2894 (class 0 OID 53076)
-- Dependencies: 303
-- Data for Name: tipo_pago; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2895 (class 0 OID 53083)
-- Dependencies: 304
-- Data for Name: tipo_persona; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2896 (class 0 OID 53088)
-- Dependencies: 305
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
-- TOC entry 2897 (class 0 OID 53091)
-- Dependencies: 306
-- Data for Name: unidad_negocio; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2898 (class 0 OID 53096)
-- Dependencies: 307
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--

INSERT INTO usuario (idusuario, cnomusuario, bactivo, idrol, clogin, cclave, dfecreg, dfecmod) VALUES (2, 'USUARIO DEMO', true, 1, 'zarcillo', '89fda8694151031cfefdab162332feaf6bdfba92a604fc5c48d9bb146b74d7f1', '2013-07-24 09:12:59.218738', '2013-07-24 09:12:59.218738');


--
-- TOC entry 2899 (class 0 OID 53103)
-- Dependencies: 308
-- Data for Name: vendedor; Type: TABLE DATA; Schema: public; Owner: agewunue_farmacia
--



--
-- TOC entry 2688 (class 2606 OID 54475)
-- Dependencies: 315 315
-- Name: acceso_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY acceso
    ADD CONSTRAINT acceso_pkey PRIMARY KEY (idacceso);


--
-- TOC entry 2582 (class 2606 OID 53184)
-- Dependencies: 216 216
-- Name: almacen_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY almacen
    ADD CONSTRAINT almacen_pkey PRIMARY KEY (idalmacen);


--
-- TOC entry 2584 (class 2606 OID 53186)
-- Dependencies: 218 218
-- Name: amortizacion_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_pkey PRIMARY KEY (idamortizacion);


--
-- TOC entry 2586 (class 2606 OID 53188)
-- Dependencies: 220 220
-- Name: amortizacion_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_pkey PRIMARY KEY (idamortizacion);


--
-- TOC entry 2588 (class 2606 OID 53190)
-- Dependencies: 222 222
-- Name: autorizacion_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY autorizacion
    ADD CONSTRAINT autorizacion_pkey PRIMARY KEY (idautorizacion);


--
-- TOC entry 2590 (class 2606 OID 53192)
-- Dependencies: 224 224
-- Name: aval_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY aval
    ADD CONSTRAINT aval_pkey PRIMARY KEY (idaval);


--
-- TOC entry 2592 (class 2606 OID 53194)
-- Dependencies: 226 226
-- Name: banco_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY banco
    ADD CONSTRAINT banco_pkey PRIMARY KEY (idbanco);


--
-- TOC entry 2594 (class 2606 OID 53196)
-- Dependencies: 228 228
-- Name: cheque_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_pkey PRIMARY KEY (idcheque);


--
-- TOC entry 2596 (class 2606 OID 53198)
-- Dependencies: 230 230
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);


--
-- TOC entry 2598 (class 2606 OID 53200)
-- Dependencies: 232 232
-- Name: comprobante_emitido_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_pkey PRIMARY KEY (idcomprobante);


--
-- TOC entry 2600 (class 2606 OID 53202)
-- Dependencies: 234 234
-- Name: condicion_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY condicion_venta
    ADD CONSTRAINT condicion_venta_pkey PRIMARY KEY (idcondicion);


--
-- TOC entry 2602 (class 2606 OID 53204)
-- Dependencies: 236 236
-- Name: cuenta_bancaria_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_pkey PRIMARY KEY (idcuenta);


--
-- TOC entry 2604 (class 2606 OID 57420)
-- Dependencies: 238 238 238 238 238
-- Name: cuenta_pagar_idproveedor_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idproveedor_key UNIQUE (idproveedor, iddocumento, cserie, cnumero);


--
-- TOC entry 2606 (class 2606 OID 53206)
-- Dependencies: 238 238
-- Name: cuenta_pagar_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_pkey PRIMARY KEY (idcuenta);


--
-- TOC entry 2608 (class 2606 OID 53208)
-- Dependencies: 240 240
-- Name: deposito_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_pkey PRIMARY KEY (iddeposito);


--
-- TOC entry 2610 (class 2606 OID 53210)
-- Dependencies: 242 242
-- Name: detalle_autorizacion_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY detalle_autorizacion
    ADD CONSTRAINT detalle_autorizacion_pkey PRIMARY KEY (iddetalle);


--
-- TOC entry 2612 (class 2606 OID 53212)
-- Dependencies: 244 244
-- Name: documento_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY documento
    ADD CONSTRAINT documento_pkey PRIMARY KEY (iddocumento);


--
-- TOC entry 2614 (class 2606 OID 53214)
-- Dependencies: 246 246
-- Name: empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (idempresa);


--
-- TOC entry 2616 (class 2606 OID 53216)
-- Dependencies: 247 247 247
-- Name: existencia_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY existencia
    ADD CONSTRAINT existencia_pkey PRIMARY KEY (idalmacen, idproducto);


--
-- TOC entry 2618 (class 2606 OID 53218)
-- Dependencies: 249 249
-- Name: familia_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY familia
    ADD CONSTRAINT familia_pkey PRIMARY KEY (idfamilia);


--
-- TOC entry 2620 (class 2606 OID 53220)
-- Dependencies: 251 251
-- Name: letra_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_pkey PRIMARY KEY (idletra);


--
-- TOC entry 2622 (class 2606 OID 53222)
-- Dependencies: 253 253
-- Name: letra_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY letra_proveedor
    ADD CONSTRAINT letra_proveedor_pkey PRIMARY KEY (idletra);


--
-- TOC entry 2624 (class 2606 OID 53224)
-- Dependencies: 255 255
-- Name: linea_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY linea
    ADD CONSTRAINT linea_pkey PRIMARY KEY (idlinea);


--
-- TOC entry 2626 (class 2606 OID 53226)
-- Dependencies: 257 257
-- Name: lote_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY lote
    ADD CONSTRAINT lote_pkey PRIMARY KEY (idlote);


--
-- TOC entry 2686 (class 2606 OID 54445)
-- Dependencies: 313 313
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (idmapa);


--
-- TOC entry 2684 (class 2606 OID 54382)
-- Dependencies: 311 311
-- Name: menu_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (idmenu);


--
-- TOC entry 2682 (class 2606 OID 54372)
-- Dependencies: 310 310
-- Name: modulo_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT modulo_pkey PRIMARY KEY (idmodulo);


--
-- TOC entry 2628 (class 2606 OID 53228)
-- Dependencies: 259 259
-- Name: moneda_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY moneda
    ADD CONSTRAINT moneda_pkey PRIMARY KEY (idmoneda);


--
-- TOC entry 2632 (class 2606 OID 53230)
-- Dependencies: 263 263
-- Name: motivo_notabo_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY motivo_notabo_cliente
    ADD CONSTRAINT motivo_notabo_pkey PRIMARY KEY (idmotivo);


--
-- TOC entry 2634 (class 2606 OID 53232)
-- Dependencies: 265 265
-- Name: motivo_notabo_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY motivo_notabo_proveedor
    ADD CONSTRAINT motivo_notabo_proveedor_pkey PRIMARY KEY (idmotivo);


--
-- TOC entry 2636 (class 2606 OID 53234)
-- Dependencies: 267 267
-- Name: motivo_notcar_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY motivo_notcar_cliente
    ADD CONSTRAINT motivo_notcar_pkey PRIMARY KEY (idmotivo);


--
-- TOC entry 2638 (class 2606 OID 53236)
-- Dependencies: 269 269
-- Name: motivo_notcar_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY motivo_notcar_proveedor
    ADD CONSTRAINT motivo_notcar_proveedor_pkey PRIMARY KEY (idmotivo);


--
-- TOC entry 2640 (class 2606 OID 53238)
-- Dependencies: 271 271
-- Name: motivo_salida_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY motivo_salida
    ADD CONSTRAINT motivo_salida_pkey PRIMARY KEY (idmotivo);


--
-- TOC entry 2630 (class 2606 OID 53240)
-- Dependencies: 261 261
-- Name: motivoentrada_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY motivo_entrada
    ADD CONSTRAINT motivoentrada_pkey PRIMARY KEY (idmotivo);


--
-- TOC entry 2690 (class 2606 OID 54542)
-- Dependencies: 321 321
-- Name: movimiento_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY movimiento
    ADD CONSTRAINT movimiento_pkey PRIMARY KEY (idmovimiento);


--
-- TOC entry 2642 (class 2606 OID 53242)
-- Dependencies: 273 273
-- Name: notabo_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_pkey PRIMARY KEY (idnotabo);


--
-- TOC entry 2644 (class 2606 OID 53244)
-- Dependencies: 275 275
-- Name: notabo_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_pkey PRIMARY KEY (idnotabo);


--
-- TOC entry 2646 (class 2606 OID 53246)
-- Dependencies: 277 277
-- Name: notcar_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_pkey PRIMARY KEY (idnotcar);


--
-- TOC entry 2648 (class 2606 OID 53248)
-- Dependencies: 279 279
-- Name: notcar_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_pkey PRIMARY KEY (idnotcar);


--
-- TOC entry 2694 (class 2606 OID 57492)
-- Dependencies: 324 324
-- Name: orden_linea_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY orden_linea
    ADD CONSTRAINT orden_linea_pkey PRIMARY KEY (idorden);


--
-- TOC entry 2650 (class 2606 OID 53250)
-- Dependencies: 281 281
-- Name: periodo_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY periodo
    ADD CONSTRAINT periodo_pkey PRIMARY KEY (idperiodo);


--
-- TOC entry 2652 (class 2606 OID 53252)
-- Dependencies: 283 283
-- Name: presentacion_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY presentacion
    ADD CONSTRAINT presentacion_pkey PRIMARY KEY (idpresentacion);


--
-- TOC entry 2654 (class 2606 OID 53254)
-- Dependencies: 284 284
-- Name: producto_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (idproducto);


--
-- TOC entry 2656 (class 2606 OID 53256)
-- Dependencies: 286 286
-- Name: proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (idproveedor);


--
-- TOC entry 2658 (class 2606 OID 57418)
-- Dependencies: 288 288 288 288 288
-- Name: registro_entrada_idproveedor_key; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_idproveedor_key UNIQUE (idproveedor, iddocumento, cserie, cnumero);


--
-- TOC entry 2660 (class 2606 OID 53258)
-- Dependencies: 288 288
-- Name: registro_entrada_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_pkey PRIMARY KEY (idregentrada);


--
-- TOC entry 2662 (class 2606 OID 53260)
-- Dependencies: 290 290
-- Name: registro_salida_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_pkey PRIMARY KEY (idregsalida);


--
-- TOC entry 2664 (class 2606 OID 53262)
-- Dependencies: 292 292
-- Name: rol_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (idrol);


--
-- TOC entry 2692 (class 2606 OID 57458)
-- Dependencies: 323 323
-- Name: situacion_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY situacion_pedido
    ADD CONSTRAINT situacion_pedido_pkey PRIMARY KEY (idsituacion);


--
-- TOC entry 2666 (class 2606 OID 53264)
-- Dependencies: 301 301
-- Name: sublinea_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY sublinea
    ADD CONSTRAINT sublinea_pkey PRIMARY KEY (idsublinea);


--
-- TOC entry 2668 (class 2606 OID 53266)
-- Dependencies: 302 302
-- Name: tipo_cuenta_bancaria_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY tipo_cuenta_bancaria
    ADD CONSTRAINT tipo_cuenta_bancaria_pkey PRIMARY KEY (idtipo);


--
-- TOC entry 2670 (class 2606 OID 53268)
-- Dependencies: 303 303
-- Name: tipo_pago_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY tipo_pago
    ADD CONSTRAINT tipo_pago_cliente_pkey PRIMARY KEY (idtipo);


--
-- TOC entry 2672 (class 2606 OID 53270)
-- Dependencies: 304 304
-- Name: tipo_persona_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY tipo_persona
    ADD CONSTRAINT tipo_persona_pkey PRIMARY KEY (idtipo);


--
-- TOC entry 2674 (class 2606 OID 53272)
-- Dependencies: 305 305
-- Name: ubigeo_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY ubigeo
    ADD CONSTRAINT ubigeo_pkey PRIMARY KEY (idubigeo);


--
-- TOC entry 2676 (class 2606 OID 53274)
-- Dependencies: 306 306
-- Name: unidad_negocio_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY unidad_negocio
    ADD CONSTRAINT unidad_negocio_pkey PRIMARY KEY (idunidad);


--
-- TOC entry 2678 (class 2606 OID 53276)
-- Dependencies: 307 307
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (idusuario);


--
-- TOC entry 2680 (class 2606 OID 53278)
-- Dependencies: 308 308
-- Name: vendedor_pkey; Type: CONSTRAINT; Schema: public; Owner: agewunue_farmacia; Tablespace: 
--

ALTER TABLE ONLY vendedor
    ADD CONSTRAINT vendedor_pkey PRIMARY KEY (idvendedor);


--
-- TOC entry 2845 (class 2606 OID 54481)
-- Dependencies: 315 216 2581
-- Name: acceso_idalmacen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY acceso
    ADD CONSTRAINT acceso_idalmacen_fkey FOREIGN KEY (idalmacen) REFERENCES almacen(idalmacen);


--
-- TOC entry 2844 (class 2606 OID 54476)
-- Dependencies: 315 307 2677
-- Name: acceso_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY acceso
    ADD CONSTRAINT acceso_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2695 (class 2606 OID 53649)
-- Dependencies: 305 2673 216
-- Name: almacen_idubigeo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY almacen
    ADD CONSTRAINT almacen_idubigeo_fkey FOREIGN KEY (idubigeo) REFERENCES ubigeo(idubigeo);


--
-- TOC entry 2696 (class 2606 OID 53654)
-- Dependencies: 216 306 2675
-- Name: almacen_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY almacen
    ADD CONSTRAINT almacen_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2697 (class 2606 OID 53659)
-- Dependencies: 2677 307 216
-- Name: almacen_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY almacen
    ADD CONSTRAINT almacen_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2698 (class 2606 OID 53664)
-- Dependencies: 218 232 2597
-- Name: amortizacion_cliente_idcomprobante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idcomprobante_fkey FOREIGN KEY (idcomprobante) REFERENCES comprobante_emitido(idcomprobante);


--
-- TOC entry 2699 (class 2606 OID 53669)
-- Dependencies: 218 244 2611
-- Name: amortizacion_cliente_iddocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES documento(iddocumento);


--
-- TOC entry 2700 (class 2606 OID 53674)
-- Dependencies: 218 2619 251
-- Name: amortizacion_cliente_idletra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idletra_fkey FOREIGN KEY (idletra) REFERENCES letra_cliente(idletra);


--
-- TOC entry 2701 (class 2606 OID 53679)
-- Dependencies: 259 2627 218
-- Name: amortizacion_cliente_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 2702 (class 2606 OID 53684)
-- Dependencies: 218 2641 273
-- Name: amortizacion_cliente_idnotabo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idnotabo_fkey FOREIGN KEY (idnotabo) REFERENCES notabo_cliente(idnotabo);


--
-- TOC entry 2703 (class 2606 OID 53689)
-- Dependencies: 2645 277 218
-- Name: amortizacion_cliente_idnotcar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idnotcar_fkey FOREIGN KEY (idnotcar) REFERENCES notcar_cliente(idnotcar);


--
-- TOC entry 2704 (class 2606 OID 53694)
-- Dependencies: 218 2669 303
-- Name: amortizacion_cliente_idtipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idtipo_fkey FOREIGN KEY (idtipo) REFERENCES tipo_pago(idtipo);


--
-- TOC entry 2705 (class 2606 OID 53699)
-- Dependencies: 218 2677 307
-- Name: amortizacion_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2706 (class 2606 OID 53704)
-- Dependencies: 308 2679 218
-- Name: amortizacion_cliente_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_cliente
    ADD CONSTRAINT amortizacion_cliente_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor);


--
-- TOC entry 2707 (class 2606 OID 53709)
-- Dependencies: 220 226 2591
-- Name: amortizacion_proveedor_idbanco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES banco(idbanco);


--
-- TOC entry 2708 (class 2606 OID 53714)
-- Dependencies: 238 220 2605
-- Name: amortizacion_proveedor_idcuenta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idcuenta_fkey FOREIGN KEY (idcuenta) REFERENCES cuenta_pagar(idcuenta);


--
-- TOC entry 2709 (class 2606 OID 53719)
-- Dependencies: 220 2611 244
-- Name: amortizacion_proveedor_iddocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES documento(iddocumento);


--
-- TOC entry 2710 (class 2606 OID 53724)
-- Dependencies: 2621 220 253
-- Name: amortizacion_proveedor_idletra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idletra_fkey FOREIGN KEY (idletra) REFERENCES letra_proveedor(idletra);


--
-- TOC entry 2711 (class 2606 OID 53729)
-- Dependencies: 259 220 2627
-- Name: amortizacion_proveedor_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 2712 (class 2606 OID 53734)
-- Dependencies: 2643 275 220
-- Name: amortizacion_proveedor_idnotabo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idnotabo_fkey FOREIGN KEY (idnotabo) REFERENCES notabo_proveedor(idnotabo);


--
-- TOC entry 2713 (class 2606 OID 53739)
-- Dependencies: 2647 279 220
-- Name: amortizacion_proveedor_idnotcar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idnotcar_fkey FOREIGN KEY (idnotcar) REFERENCES notcar_proveedor(idnotcar);


--
-- TOC entry 2714 (class 2606 OID 53744)
-- Dependencies: 2669 303 220
-- Name: amortizacion_proveedor_idtipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idtipo_fkey FOREIGN KEY (idtipo) REFERENCES tipo_pago(idtipo);


--
-- TOC entry 2715 (class 2606 OID 53749)
-- Dependencies: 307 2677 220
-- Name: amortizacion_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY amortizacion_proveedor
    ADD CONSTRAINT amortizacion_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2717 (class 2606 OID 53754)
-- Dependencies: 224 230 2595
-- Name: aval_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY aval
    ADD CONSTRAINT aval_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2718 (class 2606 OID 53759)
-- Dependencies: 224 2677 307
-- Name: aval_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY aval
    ADD CONSTRAINT aval_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2719 (class 2606 OID 53764)
-- Dependencies: 259 2627 226
-- Name: banco_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY banco
    ADD CONSTRAINT banco_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 2720 (class 2606 OID 53769)
-- Dependencies: 2677 307 226
-- Name: banco_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY banco
    ADD CONSTRAINT banco_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2721 (class 2606 OID 53774)
-- Dependencies: 226 228 2591
-- Name: cheque_cliente_idbanco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES banco(idbanco);


--
-- TOC entry 2722 (class 2606 OID 53779)
-- Dependencies: 2595 230 228
-- Name: cheque_cliente_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2723 (class 2606 OID 53784)
-- Dependencies: 281 2649 228
-- Name: cheque_cliente_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2724 (class 2606 OID 53789)
-- Dependencies: 306 228 2675
-- Name: cheque_cliente_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2725 (class 2606 OID 53794)
-- Dependencies: 2677 307 228
-- Name: cheque_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cheque_cliente
    ADD CONSTRAINT cheque_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2726 (class 2606 OID 53799)
-- Dependencies: 304 2671 230
-- Name: cliente_idtipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_idtipo_fkey FOREIGN KEY (idtipo) REFERENCES tipo_persona(idtipo);


--
-- TOC entry 2727 (class 2606 OID 53804)
-- Dependencies: 305 2673 230
-- Name: cliente_idubigeo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_idubigeo_fkey FOREIGN KEY (idubigeo) REFERENCES ubigeo(idubigeo);


--
-- TOC entry 2728 (class 2606 OID 53809)
-- Dependencies: 2675 230 306
-- Name: cliente_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2729 (class 2606 OID 53814)
-- Dependencies: 307 230 2677
-- Name: cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2730 (class 2606 OID 53819)
-- Dependencies: 2595 230 232
-- Name: comprobante_emitido_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2731 (class 2606 OID 53824)
-- Dependencies: 232 2599 234
-- Name: comprobante_emitido_idcondicion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idcondicion_fkey FOREIGN KEY (idcondicion) REFERENCES condicion_venta(idcondicion);


--
-- TOC entry 2732 (class 2606 OID 53829)
-- Dependencies: 244 2611 232
-- Name: comprobante_emitido_iddocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES documento(iddocumento);


--
-- TOC entry 2733 (class 2606 OID 53834)
-- Dependencies: 2661 232 290
-- Name: comprobante_emitido_idregsalida_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idregsalida_fkey FOREIGN KEY (idregsalida) REFERENCES registro_salida(idregsalida);


--
-- TOC entry 2734 (class 2606 OID 53839)
-- Dependencies: 2675 306 232
-- Name: comprobante_emitido_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2735 (class 2606 OID 53844)
-- Dependencies: 2677 307 232
-- Name: comprobante_emitido_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2736 (class 2606 OID 53849)
-- Dependencies: 2679 308 232
-- Name: comprobante_emitido_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY comprobante_emitido
    ADD CONSTRAINT comprobante_emitido_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor);


--
-- TOC entry 2737 (class 2606 OID 53854)
-- Dependencies: 2677 307 234
-- Name: condicion_venta_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY condicion_venta
    ADD CONSTRAINT condicion_venta_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2738 (class 2606 OID 53859)
-- Dependencies: 236 226 2591
-- Name: cuenta_bancaria_idbanco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES banco(idbanco);


--
-- TOC entry 2739 (class 2606 OID 53864)
-- Dependencies: 236 286 2655
-- Name: cuenta_bancaria_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 2740 (class 2606 OID 53869)
-- Dependencies: 236 2667 302
-- Name: cuenta_bancaria_idtipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_idtipo_fkey FOREIGN KEY (idtipo) REFERENCES tipo_cuenta_bancaria(idtipo);


--
-- TOC entry 2741 (class 2606 OID 53874)
-- Dependencies: 236 307 2677
-- Name: cuenta_bancaria_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2742 (class 2606 OID 53879)
-- Dependencies: 244 2611 238
-- Name: cuenta_pagar_iddocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES documento(iddocumento);


--
-- TOC entry 2743 (class 2606 OID 53884)
-- Dependencies: 238 259 2627
-- Name: cuenta_pagar_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 2744 (class 2606 OID 53889)
-- Dependencies: 238 281 2649
-- Name: cuenta_pagar_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2745 (class 2606 OID 53894)
-- Dependencies: 238 286 2655
-- Name: cuenta_pagar_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 2746 (class 2606 OID 53899)
-- Dependencies: 288 2659 238
-- Name: cuenta_pagar_idregentrada_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idregentrada_fkey FOREIGN KEY (idregentrada) REFERENCES registro_entrada(idregentrada);


--
-- TOC entry 2747 (class 2606 OID 53904)
-- Dependencies: 306 2675 238
-- Name: cuenta_pagar_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2748 (class 2606 OID 53909)
-- Dependencies: 307 238 2677
-- Name: cuenta_pagar_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2749 (class 2606 OID 53914)
-- Dependencies: 2591 226 240
-- Name: deposito_cliente_idbanco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES banco(idbanco);


--
-- TOC entry 2750 (class 2606 OID 53919)
-- Dependencies: 230 2595 240
-- Name: deposito_cliente_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2751 (class 2606 OID 53924)
-- Dependencies: 281 240 2649
-- Name: deposito_cliente_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2752 (class 2606 OID 53929)
-- Dependencies: 306 2675 240
-- Name: deposito_cliente_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2753 (class 2606 OID 53934)
-- Dependencies: 240 2677 307
-- Name: deposito_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY deposito_cliente
    ADD CONSTRAINT deposito_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2754 (class 2606 OID 53939)
-- Dependencies: 222 242 2587
-- Name: detalle_autorizacion_idautorizacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY detalle_autorizacion
    ADD CONSTRAINT detalle_autorizacion_idautorizacion_fkey FOREIGN KEY (idautorizacion) REFERENCES autorizacion(idautorizacion);


--
-- TOC entry 2755 (class 2606 OID 53944)
-- Dependencies: 307 2677 244
-- Name: documento_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY documento
    ADD CONSTRAINT documento_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2756 (class 2606 OID 53949)
-- Dependencies: 2673 305 246
-- Name: empresa_idubigeo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_idubigeo_fkey FOREIGN KEY (idubigeo) REFERENCES ubigeo(idubigeo);


--
-- TOC entry 2757 (class 2606 OID 53954)
-- Dependencies: 246 307 2677
-- Name: empresa_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2758 (class 2606 OID 53959)
-- Dependencies: 2677 247 307
-- Name: existencia_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY existencia
    ADD CONSTRAINT existencia_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2759 (class 2606 OID 53964)
-- Dependencies: 2677 307 249
-- Name: familia_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY familia
    ADD CONSTRAINT familia_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2760 (class 2606 OID 53969)
-- Dependencies: 224 2589 251
-- Name: letra_cliente_idaval_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idaval_fkey FOREIGN KEY (idaval) REFERENCES aval(idaval);


--
-- TOC entry 2761 (class 2606 OID 53974)
-- Dependencies: 2591 226 251
-- Name: letra_cliente_idbanco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES banco(idbanco);


--
-- TOC entry 2762 (class 2606 OID 53979)
-- Dependencies: 251 230 2595
-- Name: letra_cliente_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2763 (class 2606 OID 53984)
-- Dependencies: 2649 251 281
-- Name: letra_cliente_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2764 (class 2606 OID 53989)
-- Dependencies: 2675 251 306
-- Name: letra_cliente_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2765 (class 2606 OID 53994)
-- Dependencies: 307 251 2677
-- Name: letra_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2766 (class 2606 OID 53999)
-- Dependencies: 2679 251 308
-- Name: letra_cliente_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_cliente
    ADD CONSTRAINT letra_cliente_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor);


--
-- TOC entry 2767 (class 2606 OID 54004)
-- Dependencies: 259 2627 253
-- Name: letra_proveedor_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_proveedor
    ADD CONSTRAINT letra_proveedor_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 2768 (class 2606 OID 54009)
-- Dependencies: 253 281 2649
-- Name: letra_proveedor_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_proveedor
    ADD CONSTRAINT letra_proveedor_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2769 (class 2606 OID 54014)
-- Dependencies: 253 286 2655
-- Name: letra_proveedor_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_proveedor
    ADD CONSTRAINT letra_proveedor_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 2770 (class 2606 OID 54019)
-- Dependencies: 253 306 2675
-- Name: letra_proveedor_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_proveedor
    ADD CONSTRAINT letra_proveedor_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2771 (class 2606 OID 54024)
-- Dependencies: 253 307 2677
-- Name: letra_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY letra_proveedor
    ADD CONSTRAINT letra_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2772 (class 2606 OID 54029)
-- Dependencies: 255 307 2677
-- Name: linea_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY linea
    ADD CONSTRAINT linea_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2773 (class 2606 OID 54034)
-- Dependencies: 257 257 247 247 2615
-- Name: lote_idalmacen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY lote
    ADD CONSTRAINT lote_idalmacen_fkey FOREIGN KEY (idalmacen, idproducto) REFERENCES existencia(idalmacen, idproducto);


--
-- TOC entry 2774 (class 2606 OID 54039)
-- Dependencies: 257 261 2629
-- Name: lote_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY lote
    ADD CONSTRAINT lote_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_entrada(idmotivo);


--
-- TOC entry 2775 (class 2606 OID 54044)
-- Dependencies: 257 307 2677
-- Name: lote_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY lote
    ADD CONSTRAINT lote_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2842 (class 2606 OID 54451)
-- Dependencies: 313 311 2683
-- Name: mapa_idmenu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_idmenu_fkey FOREIGN KEY (idmenu) REFERENCES menu(idmenu);


--
-- TOC entry 2841 (class 2606 OID 54446)
-- Dependencies: 313 292 2663
-- Name: mapa_idrol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_idrol_fkey FOREIGN KEY (idrol) REFERENCES rol(idrol);


--
-- TOC entry 2843 (class 2606 OID 54456)
-- Dependencies: 313 307 2677
-- Name: mapa_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2839 (class 2606 OID 54421)
-- Dependencies: 311 310 2681
-- Name: menu_idmodulo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_idmodulo_fkey FOREIGN KEY (idmodulo) REFERENCES modulo(idmodulo);


--
-- TOC entry 2840 (class 2606 OID 54426)
-- Dependencies: 311 307 2677
-- Name: menu_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2838 (class 2606 OID 54373)
-- Dependencies: 310 307 2677
-- Name: modulo_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT modulo_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2776 (class 2606 OID 54049)
-- Dependencies: 2677 307 259
-- Name: moneda_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY moneda
    ADD CONSTRAINT moneda_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2778 (class 2606 OID 54054)
-- Dependencies: 307 263 2677
-- Name: motivo_notabo_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY motivo_notabo_cliente
    ADD CONSTRAINT motivo_notabo_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2779 (class 2606 OID 54059)
-- Dependencies: 265 307 2677
-- Name: motivo_notabo_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY motivo_notabo_proveedor
    ADD CONSTRAINT motivo_notabo_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2780 (class 2606 OID 54064)
-- Dependencies: 267 307 2677
-- Name: motivo_notcar_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY motivo_notcar_cliente
    ADD CONSTRAINT motivo_notcar_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2781 (class 2606 OID 54069)
-- Dependencies: 2677 307 269
-- Name: motivo_notcar_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY motivo_notcar_proveedor
    ADD CONSTRAINT motivo_notcar_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2782 (class 2606 OID 54074)
-- Dependencies: 2677 307 271
-- Name: motivo_salida_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY motivo_salida
    ADD CONSTRAINT motivo_salida_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2777 (class 2606 OID 54079)
-- Dependencies: 2677 261 307
-- Name: motivoentrada_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY motivo_entrada
    ADD CONSTRAINT motivoentrada_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2846 (class 2606 OID 54543)
-- Dependencies: 321 321 2615 247 247
-- Name: movimiento_idalmacen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY movimiento
    ADD CONSTRAINT movimiento_idalmacen_fkey FOREIGN KEY (idalmacen, idproducto) REFERENCES existencia(idalmacen, idproducto);


--
-- TOC entry 2847 (class 2606 OID 54593)
-- Dependencies: 321 2659 288
-- Name: movimiento_idregentrada_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY movimiento
    ADD CONSTRAINT movimiento_idregentrada_fkey FOREIGN KEY (idregentrada) REFERENCES registro_entrada(idregentrada);


--
-- TOC entry 2848 (class 2606 OID 54598)
-- Dependencies: 2661 290 321
-- Name: movimiento_idregsalida_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY movimiento
    ADD CONSTRAINT movimiento_idregsalida_fkey FOREIGN KEY (idregsalida) REFERENCES registro_salida(idregsalida);


--
-- TOC entry 2783 (class 2606 OID 54084)
-- Dependencies: 273 230 2595
-- Name: notabo_cliente_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2784 (class 2606 OID 54089)
-- Dependencies: 273 263 2631
-- Name: notabo_cliente_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_notabo_cliente(idmotivo);


--
-- TOC entry 2785 (class 2606 OID 54094)
-- Dependencies: 273 281 2649
-- Name: notabo_cliente_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2786 (class 2606 OID 54099)
-- Dependencies: 273 306 2675
-- Name: notabo_cliente_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2787 (class 2606 OID 54104)
-- Dependencies: 307 2677 273
-- Name: notabo_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2788 (class 2606 OID 54109)
-- Dependencies: 273 2679 308
-- Name: notabo_cliente_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_cliente
    ADD CONSTRAINT notabo_cliente_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor);


--
-- TOC entry 2789 (class 2606 OID 54114)
-- Dependencies: 275 2627 259
-- Name: notabo_proveedor_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 2790 (class 2606 OID 54119)
-- Dependencies: 275 2633 265
-- Name: notabo_proveedor_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_notabo_proveedor(idmotivo);


--
-- TOC entry 2791 (class 2606 OID 54124)
-- Dependencies: 275 2649 281
-- Name: notabo_proveedor_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2792 (class 2606 OID 54129)
-- Dependencies: 2655 286 275
-- Name: notabo_proveedor_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 2793 (class 2606 OID 54134)
-- Dependencies: 306 2675 275
-- Name: notabo_proveedor_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2794 (class 2606 OID 54139)
-- Dependencies: 307 2677 275
-- Name: notabo_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notabo_proveedor
    ADD CONSTRAINT notabo_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2795 (class 2606 OID 54144)
-- Dependencies: 230 2595 277
-- Name: notcar_cliente_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2796 (class 2606 OID 54149)
-- Dependencies: 267 2635 277
-- Name: notcar_cliente_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_notcar_cliente(idmotivo);


--
-- TOC entry 2797 (class 2606 OID 54154)
-- Dependencies: 281 2649 277
-- Name: notcar_cliente_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2798 (class 2606 OID 54159)
-- Dependencies: 2675 277 306
-- Name: notcar_cliente_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2799 (class 2606 OID 54164)
-- Dependencies: 277 2677 307
-- Name: notcar_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2800 (class 2606 OID 54169)
-- Dependencies: 308 2679 277
-- Name: notcar_cliente_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_cliente
    ADD CONSTRAINT notcar_cliente_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor);


--
-- TOC entry 2801 (class 2606 OID 54174)
-- Dependencies: 279 259 2627
-- Name: notcar_proveedor_idmoneda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idmoneda_fkey FOREIGN KEY (idmoneda) REFERENCES moneda(idmoneda);


--
-- TOC entry 2802 (class 2606 OID 54179)
-- Dependencies: 2637 279 269
-- Name: notcar_proveedor_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_notcar_proveedor(idmotivo);


--
-- TOC entry 2803 (class 2606 OID 54184)
-- Dependencies: 2649 279 281
-- Name: notcar_proveedor_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2804 (class 2606 OID 54189)
-- Dependencies: 279 286 2655
-- Name: notcar_proveedor_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 2805 (class 2606 OID 54194)
-- Dependencies: 279 306 2675
-- Name: notcar_proveedor_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2806 (class 2606 OID 54199)
-- Dependencies: 279 307 2677
-- Name: notcar_proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY notcar_proveedor
    ADD CONSTRAINT notcar_proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2850 (class 2606 OID 57503)
-- Dependencies: 255 324 2623
-- Name: orden_linea_idlinea_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY orden_linea
    ADD CONSTRAINT orden_linea_idlinea_fkey FOREIGN KEY (idlinea) REFERENCES linea(idlinea);


--
-- TOC entry 2849 (class 2606 OID 57498)
-- Dependencies: 324 306 2675
-- Name: orden_linea_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY orden_linea
    ADD CONSTRAINT orden_linea_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2851 (class 2606 OID 57513)
-- Dependencies: 307 324 2677
-- Name: orden_linea_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY orden_linea
    ADD CONSTRAINT orden_linea_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2807 (class 2606 OID 54204)
-- Dependencies: 281 307 2677
-- Name: periodo_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY periodo
    ADD CONSTRAINT periodo_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2716 (class 2606 OID 54209)
-- Dependencies: 307 2677 222
-- Name: permiso_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY autorizacion
    ADD CONSTRAINT permiso_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2808 (class 2606 OID 54214)
-- Dependencies: 283 307 2677
-- Name: presentacion_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY presentacion
    ADD CONSTRAINT presentacion_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2809 (class 2606 OID 54219)
-- Dependencies: 284 249 2617
-- Name: producto_idfamilia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_idfamilia_fkey FOREIGN KEY (idfamilia) REFERENCES familia(idfamilia);


--
-- TOC entry 2810 (class 2606 OID 54224)
-- Dependencies: 284 2651 283
-- Name: producto_idpresentacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_idpresentacion_fkey FOREIGN KEY (idpresentacion) REFERENCES presentacion(idpresentacion);


--
-- TOC entry 2811 (class 2606 OID 54229)
-- Dependencies: 284 301 2665
-- Name: producto_idsublinea_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_idsublinea_fkey FOREIGN KEY (idsublinea) REFERENCES sublinea(idsublinea);


--
-- TOC entry 2812 (class 2606 OID 54234)
-- Dependencies: 2677 284 307
-- Name: producto_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY producto
    ADD CONSTRAINT producto_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2813 (class 2606 OID 54239)
-- Dependencies: 286 2673 305
-- Name: proveedor_idubigeo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY proveedor
    ADD CONSTRAINT proveedor_idubigeo_fkey FOREIGN KEY (idubigeo) REFERENCES ubigeo(idubigeo);


--
-- TOC entry 2814 (class 2606 OID 54244)
-- Dependencies: 2677 307 286
-- Name: proveedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY proveedor
    ADD CONSTRAINT proveedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2815 (class 2606 OID 54249)
-- Dependencies: 288 216 2581
-- Name: registro_entrada_idalmacen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_idalmacen_fkey FOREIGN KEY (idalmacen) REFERENCES almacen(idalmacen);


--
-- TOC entry 2816 (class 2606 OID 54254)
-- Dependencies: 288 244 2611
-- Name: registro_entrada_iddocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES documento(iddocumento);


--
-- TOC entry 2817 (class 2606 OID 54259)
-- Dependencies: 288 261 2629
-- Name: registro_entrada_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_entrada(idmotivo);


--
-- TOC entry 2818 (class 2606 OID 54264)
-- Dependencies: 288 281 2649
-- Name: registro_entrada_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2819 (class 2606 OID 54269)
-- Dependencies: 288 286 2655
-- Name: registro_entrada_idproveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_idproveedor_fkey FOREIGN KEY (idproveedor) REFERENCES proveedor(idproveedor);


--
-- TOC entry 2820 (class 2606 OID 54274)
-- Dependencies: 288 307 2677
-- Name: registro_entrada_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_entrada
    ADD CONSTRAINT registro_entrada_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2821 (class 2606 OID 54279)
-- Dependencies: 290 234 2599
-- Name: registro_salida_idcondicion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_idcondicion_fkey FOREIGN KEY (idcondicion) REFERENCES condicion_venta(idcondicion);


--
-- TOC entry 2822 (class 2606 OID 54284)
-- Dependencies: 290 244 2611
-- Name: registro_salida_iddocumento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES documento(iddocumento);


--
-- TOC entry 2823 (class 2606 OID 54289)
-- Dependencies: 290 271 2639
-- Name: registro_salida_idmotivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_idmotivo_fkey FOREIGN KEY (idmotivo) REFERENCES motivo_salida(idmotivo);


--
-- TOC entry 2824 (class 2606 OID 54294)
-- Dependencies: 290 281 2649
-- Name: registro_salida_idperiodo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_idperiodo_fkey FOREIGN KEY (idperiodo) REFERENCES periodo(idperiodo);


--
-- TOC entry 2827 (class 2606 OID 57459)
-- Dependencies: 2691 323 290
-- Name: registro_salida_idsituacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_idsituacion_fkey FOREIGN KEY (idsituacion) REFERENCES situacion_pedido(idsituacion);


--
-- TOC entry 2825 (class 2606 OID 54299)
-- Dependencies: 290 306 2675
-- Name: registro_salida_idunidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_idunidad_fkey FOREIGN KEY (idunidad) REFERENCES unidad_negocio(idunidad);


--
-- TOC entry 2826 (class 2606 OID 54304)
-- Dependencies: 290 308 2679
-- Name: registro_salida_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY registro_salida
    ADD CONSTRAINT registro_salida_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES vendedor(idvendedor);


--
-- TOC entry 2828 (class 2606 OID 54309)
-- Dependencies: 301 255 2623
-- Name: sublinea_idlinea_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY sublinea
    ADD CONSTRAINT sublinea_idlinea_fkey FOREIGN KEY (idlinea) REFERENCES linea(idlinea);


--
-- TOC entry 2829 (class 2606 OID 54314)
-- Dependencies: 301 307 2677
-- Name: sublinea_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY sublinea
    ADD CONSTRAINT sublinea_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2830 (class 2606 OID 54319)
-- Dependencies: 302 307 2677
-- Name: tipo_cuenta_bancaria_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY tipo_cuenta_bancaria
    ADD CONSTRAINT tipo_cuenta_bancaria_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2831 (class 2606 OID 54324)
-- Dependencies: 303 307 2677
-- Name: tipo_pago_cliente_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY tipo_pago
    ADD CONSTRAINT tipo_pago_cliente_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2832 (class 2606 OID 54329)
-- Dependencies: 304 307 2677
-- Name: tipo_persona_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY tipo_persona
    ADD CONSTRAINT tipo_persona_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2833 (class 2606 OID 54334)
-- Dependencies: 306 246 2613
-- Name: unidad_negocio_idempresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY unidad_negocio
    ADD CONSTRAINT unidad_negocio_idempresa_fkey FOREIGN KEY (idempresa) REFERENCES empresa(idempresa);


--
-- TOC entry 2834 (class 2606 OID 54339)
-- Dependencies: 306 305 2673
-- Name: unidad_negocio_idubigeo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY unidad_negocio
    ADD CONSTRAINT unidad_negocio_idubigeo_fkey FOREIGN KEY (idubigeo) REFERENCES ubigeo(idubigeo);


--
-- TOC entry 2835 (class 2606 OID 54344)
-- Dependencies: 306 307 2677
-- Name: unidad_negocio_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY unidad_negocio
    ADD CONSTRAINT unidad_negocio_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2836 (class 2606 OID 54349)
-- Dependencies: 307 292 2663
-- Name: usuario_idrol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_idrol_fkey FOREIGN KEY (idrol) REFERENCES rol(idrol);


--
-- TOC entry 2837 (class 2606 OID 54354)
-- Dependencies: 308 307 2677
-- Name: vendedor_idusuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agewunue_farmacia
--

ALTER TABLE ONLY vendedor
    ADD CONSTRAINT vendedor_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2910 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2913 (class 0 OID 0)
-- Dependencies: 216
-- Name: almacen; Type: ACL; Schema: public; Owner: agewunue_farmacia
--

REVOKE ALL ON TABLE almacen FROM PUBLIC;
REVOKE ALL ON TABLE almacen FROM agewunue_farmacia;
GRANT ALL ON TABLE almacen TO agewunue_farmacia;


--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 218
-- Name: amortizacion_cliente; Type: ACL; Schema: public; Owner: agewunue_farmacia
--

REVOKE ALL ON TABLE amortizacion_cliente FROM PUBLIC;
REVOKE ALL ON TABLE amortizacion_cliente FROM agewunue_farmacia;
GRANT ALL ON TABLE amortizacion_cliente TO agewunue_farmacia;


-- Completed on 2013-08-04 09:14:43

--
-- PostgreSQL database dump complete
--

