--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2024-10-15 23:40:43

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 43319)
-- Name: alumnos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE alumnos (
    id_alu integer NOT NULL,
    id_per integer,
    alu_imagen character varying,
    id_padre integer,
    consentimiento_padre character varying
);


ALTER TABLE alumnos OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 43325)
-- Name: anhos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE anhos (
    id_anho integer NOT NULL,
    anho_descrip character varying
);


ALTER TABLE anhos OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 43331)
-- Name: asignaturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE asignaturas (
    id_asi integer NOT NULL,
    asi_descrip character varying
);


ALTER TABLE asignaturas OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 43337)
-- Name: cronogramas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cronogramas (
    id_cro integer NOT NULL,
    id_anho integer,
    id_tur integer,
    id_cur integer,
    id_seccion integer
);


ALTER TABLE cronogramas OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 43340)
-- Name: cronogramas_asignaturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cronogramas_asignaturas (
    id_cro integer NOT NULL,
    id_asi integer NOT NULL,
    carga_horaria time without time zone
);


ALTER TABLE cronogramas_asignaturas OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 43343)
-- Name: cronogramas_asignaturas_detalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cronogramas_asignaturas_detalles (
    id_cro integer NOT NULL,
    id_asi integer NOT NULL,
    id_dia integer NOT NULL,
    id_doc integer NOT NULL,
    hora_desde time without time zone,
    hora_hasta time without time zone
);


ALTER TABLE cronogramas_asignaturas_detalles OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 43346)
-- Name: cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cursos (
    id_cur integer NOT NULL,
    cur_descrip character varying
);


ALTER TABLE cursos OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 43352)
-- Name: dias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dias (
    id_dia integer NOT NULL,
    dia_descrip character varying
);


ALTER TABLE dias OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 43358)
-- Name: docentes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE docentes (
    id_doc integer NOT NULL,
    id_per integer,
    doc_imagen character varying,
    consentimiento_docente character varying
);


ALTER TABLE docentes OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 43833)
-- Name: estado_registros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE estado_registros (
    id_er integer NOT NULL,
    er_descrip character varying
);


ALTER TABLE estado_registros OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 43364)
-- Name: inscripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE inscripcion (
    id_alu integer NOT NULL,
    id_anho integer NOT NULL,
    id_tur integer NOT NULL,
    id_cur integer NOT NULL,
    id_seccion integer NOT NULL
);


ALTER TABLE inscripcion OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 43367)
-- Name: padres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE padres (
    id_padre integer NOT NULL,
    id_per integer
);


ALTER TABLE padres OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 43370)
-- Name: paginas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE paginas (
    id_pag integer NOT NULL,
    pag_descrip character varying,
    pag_ubicacion character varying,
    pag_icono character varying
);


ALTER TABLE paginas OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 43376)
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE personas (
    id_per integer NOT NULL,
    per_ci character varying,
    per_nombre character varying,
    per_apellido character varying,
    fecha_nacimiento date,
    celular character varying
);


ALTER TABLE personas OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 43882)
-- Name: registros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE registros (
    id_reg integer NOT NULL,
    id_tr integer,
    id_doc integer,
    id_per_cor integer,
    id_per_dir integer,
    id_alu integer,
    id_anho integer,
    id_tur integer,
    id_cur integer,
    id_seccion integer,
    reg_docente character varying,
    reg_coordinador character varying,
    reg_directivo character varying,
    id_er integer
);


ALTER TABLE registros OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 43382)
-- Name: secciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE secciones (
    id_seccion integer NOT NULL,
    sec_descrip character varying
);


ALTER TABLE secciones OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 43825)
-- Name: tipo_registros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_registros (
    id_tr integer NOT NULL,
    tr_descrip character varying
);


ALTER TABLE tipo_registros OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 43388)
-- Name: tipo_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_usuarios (
    id_tipo_usu integer NOT NULL,
    tipo_usu_descrip character varying
);


ALTER TABLE tipo_usuarios OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 43394)
-- Name: tipo_usuarios_paginas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo_usuarios_paginas (
    id_tipo_usu integer NOT NULL,
    id_pag integer NOT NULL
);


ALTER TABLE tipo_usuarios_paginas OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 43397)
-- Name: turnos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE turnos (
    id_tur integer NOT NULL,
    tur_descrip character varying,
    hora_entrada time without time zone,
    hora_salida time without time zone
);


ALTER TABLE turnos OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 43403)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuarios (
    id_usu integer NOT NULL,
    id_per integer,
    usu_nombre character varying,
    usu_contrasenha character varying,
    id_tipo_usu integer
);


ALTER TABLE usuarios OWNER TO postgres;

--
-- TOC entry 2257 (class 0 OID 43319)
-- Dependencies: 181
-- Data for Name: alumnos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO alumnos (id_alu, id_per, alu_imagen, id_padre, consentimiento_padre) VALUES (1, 6, '/sarad/estilo/img/alumnos/1.jpeg', 1, 'SI');
INSERT INTO alumnos (id_alu, id_per, alu_imagen, id_padre, consentimiento_padre) VALUES (2, 5, '/sarad/estilo/img/alumnos/2.png', 1, 'SI');


--
-- TOC entry 2258 (class 0 OID 43325)
-- Dependencies: 182
-- Data for Name: anhos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO anhos (id_anho, anho_descrip) VALUES (1, '2024');


--
-- TOC entry 2259 (class 0 OID 43331)
-- Dependencies: 183
-- Data for Name: asignaturas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO asignaturas (id_asi, asi_descrip) VALUES (1, 'Informática');
INSERT INTO asignaturas (id_asi, asi_descrip) VALUES (3, 'Software');
INSERT INTO asignaturas (id_asi, asi_descrip) VALUES (4, 'Hardware');
INSERT INTO asignaturas (id_asi, asi_descrip) VALUES (5, 'Lengua y Literatura Castellana');
INSERT INTO asignaturas (id_asi, asi_descrip) VALUES (2, 'Algorítmica');


--
-- TOC entry 2260 (class 0 OID 43337)
-- Dependencies: 184
-- Data for Name: cronogramas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cronogramas (id_cro, id_anho, id_tur, id_cur, id_seccion) VALUES (1, 1, 1, 1, 1);


--
-- TOC entry 2261 (class 0 OID 43340)
-- Dependencies: 185
-- Data for Name: cronogramas_asignaturas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cronogramas_asignaturas (id_cro, id_asi, carga_horaria) VALUES (1, 2, '05:00:00');
INSERT INTO cronogramas_asignaturas (id_cro, id_asi, carga_horaria) VALUES (1, 4, '04:00:00');
INSERT INTO cronogramas_asignaturas (id_cro, id_asi, carga_horaria) VALUES (1, 3, '04:00:00');
INSERT INTO cronogramas_asignaturas (id_cro, id_asi, carga_horaria) VALUES (1, 1, '10:00:00');
INSERT INTO cronogramas_asignaturas (id_cro, id_asi, carga_horaria) VALUES (1, 5, '02:00:00');


--
-- TOC entry 2262 (class 0 OID 43343)
-- Dependencies: 186
-- Data for Name: cronogramas_asignaturas_detalles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cronogramas_asignaturas_detalles (id_cro, id_asi, id_dia, id_doc, hora_desde, hora_hasta) VALUES (1, 2, 1, 1, '07:00:00', '08:00:00');
INSERT INTO cronogramas_asignaturas_detalles (id_cro, id_asi, id_dia, id_doc, hora_desde, hora_hasta) VALUES (1, 2, 2, 1, '07:00:00', '08:00:00');
INSERT INTO cronogramas_asignaturas_detalles (id_cro, id_asi, id_dia, id_doc, hora_desde, hora_hasta) VALUES (1, 2, 3, 1, '07:00:00', '08:00:00');
INSERT INTO cronogramas_asignaturas_detalles (id_cro, id_asi, id_dia, id_doc, hora_desde, hora_hasta) VALUES (1, 2, 4, 1, '07:00:00', '09:00:00');


--
-- TOC entry 2263 (class 0 OID 43346)
-- Dependencies: 187
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cursos (id_cur, cur_descrip) VALUES (1, '1er Año - Informática');
INSERT INTO cursos (id_cur, cur_descrip) VALUES (2, '2do Año - Informática');
INSERT INTO cursos (id_cur, cur_descrip) VALUES (3, '3er Año - Informática');


--
-- TOC entry 2264 (class 0 OID 43352)
-- Dependencies: 188
-- Data for Name: dias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO dias (id_dia, dia_descrip) VALUES (1, 'LUNES');
INSERT INTO dias (id_dia, dia_descrip) VALUES (2, 'MARTES');
INSERT INTO dias (id_dia, dia_descrip) VALUES (3, 'MIÉRCOLES');
INSERT INTO dias (id_dia, dia_descrip) VALUES (4, 'JUEVES');
INSERT INTO dias (id_dia, dia_descrip) VALUES (5, 'VIERNES');


--
-- TOC entry 2265 (class 0 OID 43358)
-- Dependencies: 189
-- Data for Name: docentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO docentes (id_doc, id_per, doc_imagen, consentimiento_docente) VALUES (1, 3, '/sarad/estilo/img/docentes/1.jpeg', 'SI');


--
-- TOC entry 2276 (class 0 OID 43833)
-- Dependencies: 200
-- Data for Name: estado_registros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO estado_registros (id_er, er_descrip) VALUES (1, 'Carga del Docente');
INSERT INTO estado_registros (id_er, er_descrip) VALUES (2, 'Comentario del Coordinador');
INSERT INTO estado_registros (id_er, er_descrip) VALUES (3, 'Veredicto del Directivo');


--
-- TOC entry 2266 (class 0 OID 43364)
-- Dependencies: 190
-- Data for Name: inscripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO inscripcion (id_alu, id_anho, id_tur, id_cur, id_seccion) VALUES (2, 1, 1, 1, 1);
INSERT INTO inscripcion (id_alu, id_anho, id_tur, id_cur, id_seccion) VALUES (1, 1, 1, 1, 1);


--
-- TOC entry 2267 (class 0 OID 43367)
-- Dependencies: 191
-- Data for Name: padres; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO padres (id_padre, id_per) VALUES (1, 4);


--
-- TOC entry 2268 (class 0 OID 43370)
-- Dependencies: 192
-- Data for Name: paginas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO paginas (id_pag, pag_descrip, pag_ubicacion, pag_icono) VALUES (2, 'Cursos', '/sarad/cursos/', 'fa-graduation-cap');
INSERT INTO paginas (id_pag, pag_descrip, pag_ubicacion, pag_icono) VALUES (8, 'Docentes', '/sarad/docentes/', 'fa-address-book');
INSERT INTO paginas (id_pag, pag_descrip, pag_ubicacion, pag_icono) VALUES (7, 'Alumnos', '/sarad/alumnos/', 'fa-address-card-o');
INSERT INTO paginas (id_pag, pag_descrip, pag_ubicacion, pag_icono) VALUES (6, 'Personas', '/sarad/personas/', 'fa-user-circle-o');
INSERT INTO paginas (id_pag, pag_descrip, pag_ubicacion, pag_icono) VALUES (4, 'Secciones', '/sarad/secciones/', 'fa-database');
INSERT INTO paginas (id_pag, pag_descrip, pag_ubicacion, pag_icono) VALUES (3, 'Asignaturas', '/sarad/asignaturas/', 'fa-pencil-square-o');
INSERT INTO paginas (id_pag, pag_descrip, pag_ubicacion, pag_icono) VALUES (5, 'Turnos', '/sarad/turnos/', 'fa-list-ol');
INSERT INTO paginas (id_pag, pag_descrip, pag_ubicacion, pag_icono) VALUES (9, 'Padres', '/sarad/padres/', 'fa-user');
INSERT INTO paginas (id_pag, pag_descrip, pag_ubicacion, pag_icono) VALUES (10, 'Hijos', '/sarad/hijos/', 'fa-address-card-o');
INSERT INTO paginas (id_pag, pag_descrip, pag_ubicacion, pag_icono) VALUES (11, 'Cronogramas', '/sarad/cronogramas/', 'fa-calendar');
INSERT INTO paginas (id_pag, pag_descrip, pag_ubicacion, pag_icono) VALUES (1, 'Años Lectivos', '/sarad/anhos/', 'fa-calendar');
INSERT INTO paginas (id_pag, pag_descrip, pag_ubicacion, pag_icono) VALUES (12, 'Inscripción', '/sarad/inscripcion/', 'fa-graduation-cap');
INSERT INTO paginas (id_pag, pag_descrip, pag_ubicacion, pag_icono) VALUES (13, 'Registros Acnedóticos', '/sarad/registro_docente/', 'fa-list-alt');
INSERT INTO paginas (id_pag, pag_descrip, pag_ubicacion, pag_icono) VALUES (14, 'Registros Acnedóticos', '/sarad/registro_coordinador/', 'fa-list-alt');
INSERT INTO paginas (id_pag, pag_descrip, pag_ubicacion, pag_icono) VALUES (15, 'Registros Acnedóticos', '/sarad/registro_directivo/', 'fa-list-alt');
INSERT INTO paginas (id_pag, pag_descrip, pag_ubicacion, pag_icono) VALUES (16, 'Registros Acnedóticos', '/sarad/registro_padre/', 'fa-list-alt');


--
-- TOC entry 2269 (class 0 OID 43376)
-- Dependencies: 193
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO personas (id_per, per_ci, per_nombre, per_apellido, fecha_nacimiento, celular) VALUES (1, '4580373', 'Christian', 'Torres', '1996-11-02', '0985526589');
INSERT INTO personas (id_per, per_ci, per_nombre, per_apellido, fecha_nacimiento, celular) VALUES (2, '1234567', 'Fabiola', 'Britos', '2000-01-01', '0984953759');
INSERT INTO personas (id_per, per_ci, per_nombre, per_apellido, fecha_nacimiento, celular) VALUES (3, '1234568', 'Juan', 'Perez', '1970-01-01', '0981000000');
INSERT INTO personas (id_per, per_ci, per_nombre, per_apellido, fecha_nacimiento, celular) VALUES (6, '7173208', 'Thiago', 'Segovia', '2007-09-10', '0986644697');
INSERT INTO personas (id_per, per_ci, per_nombre, per_apellido, fecha_nacimiento, celular) VALUES (5, '1234569', 'Maria', 'Segovia', '2000-01-01', '0981000001');
INSERT INTO personas (id_per, per_ci, per_nombre, per_apellido, fecha_nacimiento, celular) VALUES (4, '6115634', 'Tobias', 'Segovia', '1970-06-08', '0976980186');


--
-- TOC entry 2277 (class 0 OID 43882)
-- Dependencies: 201
-- Data for Name: registros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO registros (id_reg, id_tr, id_doc, id_per_cor, id_per_dir, id_alu, id_anho, id_tur, id_cur, id_seccion, reg_docente, reg_coordinador, reg_directivo, id_er) VALUES (1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 'La alumna le faltó el respeto al docente', 'Se constata el hecho de que es maleducada', 'Se sanciona 5 días', 3);
INSERT INTO registros (id_reg, id_tr, id_doc, id_per_cor, id_per_dir, id_alu, id_anho, id_tur, id_cur, id_seccion, reg_docente, reg_coordinador, reg_directivo, id_er) VALUES (2, 2, 1, 2, 1, 1, 1, 1, 1, 1, 'Alumno muy bueno y atento en clases', 'Se constata el hecho de que es buen alumno', 'Se le entrega una medalla de felicitaciones', 3);
INSERT INTO registros (id_reg, id_tr, id_doc, id_per_cor, id_per_dir, id_alu, id_anho, id_tur, id_cur, id_seccion, reg_docente, reg_coordinador, reg_directivo, id_er) VALUES (3, 1, 1, NULL, NULL, 2, 1, 1, 1, 1, 'Se repite la situación de discusiones', NULL, NULL, 1);
INSERT INTO registros (id_reg, id_tr, id_doc, id_per_cor, id_per_dir, id_alu, id_anho, id_tur, id_cur, id_seccion, reg_docente, reg_coordinador, reg_directivo, id_er) VALUES (4, 2, 1, NULL, NULL, 1, 1, 1, 1, 1, 'Excelente', NULL, NULL, 1);


--
-- TOC entry 2270 (class 0 OID 43382)
-- Dependencies: 194
-- Data for Name: secciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO secciones (id_seccion, sec_descrip) VALUES (2, 'Segunda Sección');
INSERT INTO secciones (id_seccion, sec_descrip) VALUES (1, 'Primera Sección');


--
-- TOC entry 2275 (class 0 OID 43825)
-- Dependencies: 199
-- Data for Name: tipo_registros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipo_registros (id_tr, tr_descrip) VALUES (1, 'NEGATIVO');
INSERT INTO tipo_registros (id_tr, tr_descrip) VALUES (2, 'POSITIVO');


--
-- TOC entry 2271 (class 0 OID 43388)
-- Dependencies: 195
-- Data for Name: tipo_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipo_usuarios (id_tipo_usu, tipo_usu_descrip) VALUES (1, 'DIRECTIVO');
INSERT INTO tipo_usuarios (id_tipo_usu, tipo_usu_descrip) VALUES (2, 'COORDINADOR');
INSERT INTO tipo_usuarios (id_tipo_usu, tipo_usu_descrip) VALUES (3, 'DOCENTE');
INSERT INTO tipo_usuarios (id_tipo_usu, tipo_usu_descrip) VALUES (4, 'ENCARGADO');


--
-- TOC entry 2272 (class 0 OID 43394)
-- Dependencies: 196
-- Data for Name: tipo_usuarios_paginas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipo_usuarios_paginas (id_tipo_usu, id_pag) VALUES (1, 1);
INSERT INTO tipo_usuarios_paginas (id_tipo_usu, id_pag) VALUES (1, 2);
INSERT INTO tipo_usuarios_paginas (id_tipo_usu, id_pag) VALUES (1, 3);
INSERT INTO tipo_usuarios_paginas (id_tipo_usu, id_pag) VALUES (1, 4);
INSERT INTO tipo_usuarios_paginas (id_tipo_usu, id_pag) VALUES (1, 5);
INSERT INTO tipo_usuarios_paginas (id_tipo_usu, id_pag) VALUES (1, 6);
INSERT INTO tipo_usuarios_paginas (id_tipo_usu, id_pag) VALUES (1, 7);
INSERT INTO tipo_usuarios_paginas (id_tipo_usu, id_pag) VALUES (1, 8);
INSERT INTO tipo_usuarios_paginas (id_tipo_usu, id_pag) VALUES (1, 9);
INSERT INTO tipo_usuarios_paginas (id_tipo_usu, id_pag) VALUES (2, 11);
INSERT INTO tipo_usuarios_paginas (id_tipo_usu, id_pag) VALUES (2, 12);
INSERT INTO tipo_usuarios_paginas (id_tipo_usu, id_pag) VALUES (4, 10);
INSERT INTO tipo_usuarios_paginas (id_tipo_usu, id_pag) VALUES (3, 13);
INSERT INTO tipo_usuarios_paginas (id_tipo_usu, id_pag) VALUES (2, 14);
INSERT INTO tipo_usuarios_paginas (id_tipo_usu, id_pag) VALUES (1, 15);
INSERT INTO tipo_usuarios_paginas (id_tipo_usu, id_pag) VALUES (4, 16);


--
-- TOC entry 2273 (class 0 OID 43397)
-- Dependencies: 197
-- Data for Name: turnos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO turnos (id_tur, tur_descrip, hora_entrada, hora_salida) VALUES (1, 'Mañana', '07:00:00', '11:00:00');
INSERT INTO turnos (id_tur, tur_descrip, hora_entrada, hora_salida) VALUES (2, 'Tarde', '13:00:00', '17:00:00');
INSERT INTO turnos (id_tur, tur_descrip, hora_entrada, hora_salida) VALUES (3, 'Noche', '17:00:00', '21:00:00');


--
-- TOC entry 2274 (class 0 OID 43403)
-- Dependencies: 198
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuarios (id_usu, id_per, usu_nombre, usu_contrasenha, id_tipo_usu) VALUES (1, 1, 'christian_torres', '123', 1);
INSERT INTO usuarios (id_usu, id_per, usu_nombre, usu_contrasenha, id_tipo_usu) VALUES (2, 2, 'fabiola_britos', '123', 2);
INSERT INTO usuarios (id_usu, id_per, usu_nombre, usu_contrasenha, id_tipo_usu) VALUES (3, 3, 'juan_perez', '123', 3);
INSERT INTO usuarios (id_usu, id_per, usu_nombre, usu_contrasenha, id_tipo_usu) VALUES (4, 4, 'tobias_segovia', '123', 4);


--
-- TOC entry 2075 (class 2606 OID 43410)
-- Name: alumnos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alumnos
    ADD CONSTRAINT alumnos_pkey PRIMARY KEY (id_alu);


--
-- TOC entry 2077 (class 2606 OID 43412)
-- Name: anhos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anhos
    ADD CONSTRAINT anhos_pkey PRIMARY KEY (id_anho);


--
-- TOC entry 2079 (class 2606 OID 43414)
-- Name: asignaturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY asignaturas
    ADD CONSTRAINT asignaturas_pkey PRIMARY KEY (id_asi);


--
-- TOC entry 2085 (class 2606 OID 43416)
-- Name: cronogramas_asignaturas_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronogramas_asignaturas_detalles
    ADD CONSTRAINT cronogramas_asignaturas_detalles_pkey PRIMARY KEY (id_cro, id_asi, id_doc, id_dia);


--
-- TOC entry 2083 (class 2606 OID 43418)
-- Name: cronogramas_asignaturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronogramas_asignaturas
    ADD CONSTRAINT cronogramas_asignaturas_pkey PRIMARY KEY (id_cro, id_asi);


--
-- TOC entry 2081 (class 2606 OID 43420)
-- Name: cronogramas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronogramas
    ADD CONSTRAINT cronogramas_pkey PRIMARY KEY (id_cro);


--
-- TOC entry 2087 (class 2606 OID 43422)
-- Name: cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (id_cur);


--
-- TOC entry 2089 (class 2606 OID 43424)
-- Name: dias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dias
    ADD CONSTRAINT dias_pkey PRIMARY KEY (id_dia);


--
-- TOC entry 2091 (class 2606 OID 43426)
-- Name: docentes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY docentes
    ADD CONSTRAINT docentes_pkey PRIMARY KEY (id_doc);


--
-- TOC entry 2113 (class 2606 OID 43840)
-- Name: estado_registros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado_registros
    ADD CONSTRAINT estado_registros_pkey PRIMARY KEY (id_er);


--
-- TOC entry 2093 (class 2606 OID 43428)
-- Name: inscripcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscripcion
    ADD CONSTRAINT inscripcion_pkey PRIMARY KEY (id_alu, id_anho, id_tur, id_cur, id_seccion);


--
-- TOC entry 2095 (class 2606 OID 43430)
-- Name: padres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY padres
    ADD CONSTRAINT padres_pkey PRIMARY KEY (id_padre);


--
-- TOC entry 2097 (class 2606 OID 43432)
-- Name: paginas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY paginas
    ADD CONSTRAINT paginas_pkey PRIMARY KEY (id_pag);


--
-- TOC entry 2099 (class 2606 OID 43434)
-- Name: personas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id_per);


--
-- TOC entry 2115 (class 2606 OID 43889)
-- Name: registros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registros
    ADD CONSTRAINT registros_pkey PRIMARY KEY (id_reg);


--
-- TOC entry 2101 (class 2606 OID 43436)
-- Name: secciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY secciones
    ADD CONSTRAINT secciones_pkey PRIMARY KEY (id_seccion);


--
-- TOC entry 2111 (class 2606 OID 43832)
-- Name: tipo_registros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_registros
    ADD CONSTRAINT tipo_registros_pkey PRIMARY KEY (id_tr);


--
-- TOC entry 2105 (class 2606 OID 43438)
-- Name: tipo_usuarios_paginas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_usuarios_paginas
    ADD CONSTRAINT tipo_usuarios_paginas_pkey PRIMARY KEY (id_tipo_usu, id_pag);


--
-- TOC entry 2103 (class 2606 OID 43440)
-- Name: tipo_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_usuarios
    ADD CONSTRAINT tipo_usuarios_pkey PRIMARY KEY (id_tipo_usu);


--
-- TOC entry 2107 (class 2606 OID 43442)
-- Name: turnos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY turnos
    ADD CONSTRAINT turnos_pkey PRIMARY KEY (id_tur);


--
-- TOC entry 2109 (class 2606 OID 43444)
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usu);


--
-- TOC entry 2116 (class 2606 OID 43445)
-- Name: alumnos_id_padre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alumnos
    ADD CONSTRAINT alumnos_id_padre_fkey FOREIGN KEY (id_padre) REFERENCES padres(id_padre);


--
-- TOC entry 2117 (class 2606 OID 43450)
-- Name: alumnos_id_per_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alumnos
    ADD CONSTRAINT alumnos_id_per_fkey FOREIGN KEY (id_per) REFERENCES personas(id_per);


--
-- TOC entry 2124 (class 2606 OID 43455)
-- Name: cronogramas_asignaturas_detalles_id_cro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronogramas_asignaturas_detalles
    ADD CONSTRAINT cronogramas_asignaturas_detalles_id_cro_fkey FOREIGN KEY (id_cro, id_asi) REFERENCES cronogramas_asignaturas(id_cro, id_asi);


--
-- TOC entry 2125 (class 2606 OID 43460)
-- Name: cronogramas_asignaturas_detalles_id_dia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronogramas_asignaturas_detalles
    ADD CONSTRAINT cronogramas_asignaturas_detalles_id_dia_fkey FOREIGN KEY (id_dia) REFERENCES dias(id_dia);


--
-- TOC entry 2126 (class 2606 OID 43465)
-- Name: cronogramas_asignaturas_detalles_id_doc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronogramas_asignaturas_detalles
    ADD CONSTRAINT cronogramas_asignaturas_detalles_id_doc_fkey FOREIGN KEY (id_doc) REFERENCES docentes(id_doc);


--
-- TOC entry 2122 (class 2606 OID 43470)
-- Name: cronogramas_asignaturas_id_asi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronogramas_asignaturas
    ADD CONSTRAINT cronogramas_asignaturas_id_asi_fkey FOREIGN KEY (id_asi) REFERENCES asignaturas(id_asi);


--
-- TOC entry 2123 (class 2606 OID 43475)
-- Name: cronogramas_asignaturas_id_cro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronogramas_asignaturas
    ADD CONSTRAINT cronogramas_asignaturas_id_cro_fkey FOREIGN KEY (id_cro) REFERENCES cronogramas(id_cro);


--
-- TOC entry 2118 (class 2606 OID 43480)
-- Name: cronogramas_id_aho_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronogramas
    ADD CONSTRAINT cronogramas_id_aho_fkey FOREIGN KEY (id_anho) REFERENCES anhos(id_anho);


--
-- TOC entry 2119 (class 2606 OID 43485)
-- Name: cronogramas_id_cur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronogramas
    ADD CONSTRAINT cronogramas_id_cur_fkey FOREIGN KEY (id_cur) REFERENCES cursos(id_cur);


--
-- TOC entry 2120 (class 2606 OID 43490)
-- Name: cronogramas_id_seccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronogramas
    ADD CONSTRAINT cronogramas_id_seccion_fkey FOREIGN KEY (id_seccion) REFERENCES secciones(id_seccion);


--
-- TOC entry 2121 (class 2606 OID 43495)
-- Name: cronogramas_id_tur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronogramas
    ADD CONSTRAINT cronogramas_id_tur_fkey FOREIGN KEY (id_tur) REFERENCES turnos(id_tur);


--
-- TOC entry 2127 (class 2606 OID 43500)
-- Name: docentes_id_per_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY docentes
    ADD CONSTRAINT docentes_id_per_fkey FOREIGN KEY (id_per) REFERENCES personas(id_per);


--
-- TOC entry 2128 (class 2606 OID 43505)
-- Name: inscripcion_alu_cod_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscripcion
    ADD CONSTRAINT inscripcion_alu_cod_fkey FOREIGN KEY (id_alu) REFERENCES alumnos(id_alu);


--
-- TOC entry 2129 (class 2606 OID 43510)
-- Name: inscripcion_id_anho_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscripcion
    ADD CONSTRAINT inscripcion_id_anho_fkey FOREIGN KEY (id_anho) REFERENCES anhos(id_anho);


--
-- TOC entry 2130 (class 2606 OID 43515)
-- Name: inscripcion_id_cur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscripcion
    ADD CONSTRAINT inscripcion_id_cur_fkey FOREIGN KEY (id_cur) REFERENCES cursos(id_cur);


--
-- TOC entry 2131 (class 2606 OID 43520)
-- Name: inscripcion_id_seccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscripcion
    ADD CONSTRAINT inscripcion_id_seccion_fkey FOREIGN KEY (id_seccion) REFERENCES secciones(id_seccion);


--
-- TOC entry 2132 (class 2606 OID 43525)
-- Name: inscripcion_id_turno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscripcion
    ADD CONSTRAINT inscripcion_id_turno_fkey FOREIGN KEY (id_tur) REFERENCES turnos(id_tur);


--
-- TOC entry 2133 (class 2606 OID 43530)
-- Name: padres_id_per_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY padres
    ADD CONSTRAINT padres_id_per_fkey FOREIGN KEY (id_per) REFERENCES personas(id_per);


--
-- TOC entry 2142 (class 2606 OID 43910)
-- Name: registros_id_alu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registros
    ADD CONSTRAINT registros_id_alu_fkey FOREIGN KEY (id_alu, id_anho, id_tur, id_cur, id_seccion) REFERENCES inscripcion(id_alu, id_anho, id_tur, id_cur, id_seccion);


--
-- TOC entry 2138 (class 2606 OID 43890)
-- Name: registros_id_doc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registros
    ADD CONSTRAINT registros_id_doc_fkey FOREIGN KEY (id_doc) REFERENCES docentes(id_doc);


--
-- TOC entry 2141 (class 2606 OID 43905)
-- Name: registros_id_er_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registros
    ADD CONSTRAINT registros_id_er_fkey FOREIGN KEY (id_er) REFERENCES estado_registros(id_er);


--
-- TOC entry 2139 (class 2606 OID 43895)
-- Name: registros_id_per_cor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registros
    ADD CONSTRAINT registros_id_per_cor_fkey FOREIGN KEY (id_per_cor) REFERENCES personas(id_per);


--
-- TOC entry 2140 (class 2606 OID 43900)
-- Name: registros_id_per_dir_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registros
    ADD CONSTRAINT registros_id_per_dir_fkey FOREIGN KEY (id_per_dir) REFERENCES personas(id_per);


--
-- TOC entry 2134 (class 2606 OID 43535)
-- Name: tipo_usuarios_paginas_id_pag_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_usuarios_paginas
    ADD CONSTRAINT tipo_usuarios_paginas_id_pag_fkey FOREIGN KEY (id_pag) REFERENCES paginas(id_pag);


--
-- TOC entry 2135 (class 2606 OID 43540)
-- Name: tipo_usuarios_paginas_id_tipo_usu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_usuarios_paginas
    ADD CONSTRAINT tipo_usuarios_paginas_id_tipo_usu_fkey FOREIGN KEY (id_tipo_usu) REFERENCES tipo_usuarios(id_tipo_usu);


--
-- TOC entry 2136 (class 2606 OID 43545)
-- Name: usuarios_id_per_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_id_per_fkey FOREIGN KEY (id_per) REFERENCES personas(id_per);


--
-- TOC entry 2137 (class 2606 OID 43550)
-- Name: usuarios_id_tipo_usu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_id_tipo_usu_fkey FOREIGN KEY (id_tipo_usu) REFERENCES tipo_usuarios(id_tipo_usu);


--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-10-15 23:40:44

--
-- PostgreSQL database dump complete
--

