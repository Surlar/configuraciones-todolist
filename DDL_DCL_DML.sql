/**********************************************************************
*INSTRUCCION DDL: Creacion base de datos, roles, esquemas, usuarios.
*INSTRUCCION DCL: PERMISOS VARIOS
**********************************************************************/
--Creacion de la base de datos
CREATE DATABASE prueba_tecnica;

--Creacion del Rol para asignar permisos comunes a los usuarios
CREATE ROLE rol_prueba_tecnica;

--Creacion del esquema especifico para la app
CREATE SCHEMA to_do_list;

--Asignacion de permisos comunes del esquema al rol
GRANT CONNECT ON DATABASE prueba_tecnica TO rol_prueba_tecnica;
GRANT USAGE ON SCHEMA to_do_list TO rol_prueba_tecnica;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA to_do_list to rol_prueba_tecnica;

--Creacion de usuarios, uno para base de datos y otro para aplicaicon
CREATE USER ms_prueba_tecnica WITH PASSWORD 'Manager.1';--Creacion del usuario de base de datos
CREATE USER ap_prueba_tecnica WITH PASSWORD 'Manager.1';--Creacion del usuario de aplicacion

--Asignacion del rol a los nuevos usuarios
GRANT rol_prueba_tecnica TO ms_prueba_tecnica;
GRANT rol_prueba_tecnica TO ap_prueba_tecnica;

--Asignacion de permisos individuales al usuario "ms_prueba_tecncia"
GRANT CREATE ON SCHEMA to_do_list TO ms_prueba_tecnica;



/**********************************************************************
*INSTRUCCION DDL: Creacion de tablas, llaves primarias y foraneas.
*NOTA: Crear con usuario ms_prueba_tecnica
**********************************************************************/
CREATE TABLE to_do_list.tdl_info_usuario (
    id_usuario SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    apellido_p VARCHAR(50) NOT NULL,
    apellido_m VARCHAR(50),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE to_do_list.tdl_accesos_usuario (
    id_acceso SERIAL PRIMARY KEY,
    id_usuario INTEGER NOT NULL UNIQUE REFERENCES to_do_list.tdl_info_usuario(id_usuario) ON DELETE CASCADE,
    password_hash VARCHAR(100) NOT NULL
);

CREATE TABLE to_do_list.tdl_catalogo(
    id_catalogo SERIAL PRIMARY KEY,
    nombre_catalogo VARCHAR(50) NOT NULL,
    cod_catalogo VARCHAR(5) NOT NULL,
    usuario_adicion VARCHAR(15) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE to_do_list.tdl_catalogo_detalle(
    id_catalogo_det SERIAL PRIMARY KEY,
    id_catalogo INTEGER NOT NULL REFERENCES to_do_list.tdl_catalogo(id_catalogo),
    nombre_capo VARCHAR(50) NOT NULL,
    cod_campo VARCHAR(5) NOT NULL,
    descripcion VARCHAR(50) NOT NULL,
    usuario_adicion VARCHAR(15) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE to_do_list.tdl_lista_tareas(
    id_tarea SERIAL PRIMARY KEY,
    id_usuario INTEGER,
    tarea VARCHAR(50),
    descripcion VARCHAR(200),
    estado_tarea INTEGER,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_finalizacion TIMESTAMP
)


/**********************************************************************
*INSTRUCCION DML: Insert en los catalogos.
**********************************************************************/
insert into to_do_list.tdl_catalogo(nombre_catalogo, cod_catalogo, usuario_adicion) values ('ESTADO_TAREA', 'ET', 'seurlaro');
insert into to_do_list.tdl_catalogo_detalle(id_catalogo, nombre_capo, cod_campo, descripcion, usuario_adicion) values (1, 'FINALIZADA', 'FN', 'TAREA FINALIZADA', 'seurlaro');
insert into to_do_list.tdl_catalogo_detalle(id_catalogo, nombre_capo, cod_campo, descripcion, usuario_adicion) values (1, 'PENDIENTE', 'PT', 'TAREA PENDIENTE DE REALIZAR', 'seurlaro');


/**********************************************************************
*INSTRUCCION DCL: Permiso al usuario de aplicacion para las secuencias de la tablas creadas.
**********************************************************************/
GRANT USAGE, SELECT ON SEQUENCE to_do_list.tdl_info_usuario_id_usuario_seq TO rol_prueba_tecnica;
GRANT USAGE, SELECT ON SEQUENCE to_do_list.tdl_accesos_usuario_id_acceso_seq TO rol_prueba_tecnica;
GRANT USAGE, SELECT ON SEQUENCE to_do_list.tdl_lista_tareas_id_tarea_seq TO rol_prueba_tecnica;