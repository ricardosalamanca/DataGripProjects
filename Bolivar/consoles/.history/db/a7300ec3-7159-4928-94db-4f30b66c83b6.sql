COMMIT;
;-- -. . -..- - / . -. - .-. -.--
CREATE SCHEMA flowableElLibertador;
;-- -. . -..- - / . -. - .-. -.--
GRANT ALL PRIVILEGES ON analisis_digital.* TO 'app_analisis_libertador'@'172.17.0.1' IDENTIFIED BY 'mysql1991*';
;-- -. . -..- - / . -. - .-. -.--
CREATE USER IF NOT EXISTS 'app_analisis_libertador'@'172.17.0.1' IDENTIFIED BY 'mysql1991*';
;-- -. . -..- - / . -. - .-. -.--
GRANT ALL PRIVILEGES ON analisis_digital.* TO 'app_analisis_libertador'@'172.17.0.1';
;-- -. . -..- - / . -. - .-. -.--
GRANT ALL PRIVILEGES ON flowableElLibertador.* TO 'app_analisis_libertador'@'172.17.0.1';
;-- -. . -..- - / . -. - .-. -.--
GRANT ALL PRIVILEGES ON *.* TO 'root'@'172.17.0.1' WITH GRANT OPTION;
;-- -. . -..- - / . -. - .-. -.--
CREATE USER 'root'@'172.17.0.1' IDENTIFIED BY 'my1991*';
;-- -. . -..- - / . -. - .-. -.--
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'my1991*';
;-- -. . -..- - / . -. - .-. -.--
FLUSH PRIVILEGES;
;-- -. . -..- - / . -. - .-. -.--
SELECT user, host FROM mysql.user WHERE user = 'root';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM mysql.user WHERE user = 'root';
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE IF NOT EXISTS analisis_digital.usuario (
                                                        id int AUTO_INCREMENT NOT NULL UNIQUE,
                                                        fecha_creacion datetime NOT NULL DEFAULT NOW(),
                                                        fecha_modificacion datetime NOT NULL DEFAULT NOW(),
                                                        tipo_usuario enum(
                                                            'PN',
                                                            'PJ'
                                                            ) NOT NULL COMMENT '(SAI): P. Natural, P. Jurídica, Extranjero, Empresa',
                                                        nombres_usuario varchar(255) NOT NULL,
                                                        apellidos_usuario varchar(255) NOT NULL,
                                                        tipo_documento enum(
                                                            'CC',
                                                            'CE',
                                                            'NT'
                                                            ) NOT NULL COMMENT '(SAI): Cédula ciudadanía, Cédula Extranjería, NIT',
                                                        documento varchar(255) NOT NULL,
                                                        fecha_expedicion datetime,
                                                        tipo_perfil enum(
                                                            'DEUDOR',
                                                            'CODEUDOR',
                                                            'REPRESENTANTE_LEGAL',
                                                            'AGENTE'
                                                            ) NOT NULL COMMENT 'Deudor, Codeudor, Representante legal, agente',
                                                        representante_legal boolean DEFAULT false,
                                                        correo_electronico varchar(255),
                                                        telefono_movil varchar(255),
                                                        genero enum('M', 'F'),
                                                        id_ciudad int COMMENT '(SAI)',
                                                        ciudad varchar(255),
                                                        direccion varchar(255),
                                                        id_ocupacion int COMMENT '(SAI)',
                                                        ocupacion varchar(255),
                                                        ingresos varchar(255),
                                                        comentarios varchar(255),
                                                        usuario_padre_id int,
                                                        estado_biometria varchar(255) DEFAULT 'PENDIENTE',
                                                        PRIMARY KEY (id)
);
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE IF NOT EXISTS analisis_digital.inmueble (
                                                         id int AUTO_INCREMENT NOT NULL UNIQUE,
                                                         fecha_creacion datetime NOT NULL DEFAULT NOW(),
                                                         fecha_modificacion datetime NOT NULL DEFAULT NOW(),
                                                         id_inmobiliaria int,
                                                         inmobiliaria varchar(255),
                                                         uso_inmueble enum('RESIDENCIAL', 'COMERCIAL') NOT NULL DEFAULT 'RESIDENCIAL',
                                                         canon_mensual varchar(255) DEFAULT '0',
                                                         administracion varchar(255) DEFAULT '0',
                                                         administracion_incluida boolean DEFAULT false,
                                                         id_tipo_inmueble int COMMENT '(SAI)',
                                                         tipo_inmueble varchar(255),
                                                         id_ciudad int,
                                                         ciudad varchar(255),
                                                         direccion VARCHAR(255),
                                                         PRIMARY KEY (id)
);
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE IF NOT EXISTS analisis_digital.usuario_estudio (
                                                                id int AUTO_INCREMENT NOT NULL UNIQUE,
                                                                id_usuario int NOT NULL,
                                                                id_estudio int NOT NULL,
                                                                PRIMARY KEY (id)
);
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE IF NOT EXISTS analisis_digital.estudio (
                                                        id int AUTO_INCREMENT NOT NULL UNIQUE,
                                                        fecha_creacion datetime NOT NULL DEFAULT NOW(),
                                                        fecha_modificacion datetime NOT NULL DEFAULT NOW(),
                                                        consecutivo_sai int NOT NULL,
                                                        estado varchar(255) NOT NULL DEFAULT 'PENDIENTE',
                                                        observaciones_estado varchar(255),
                                                        paso_form int NOT NULL DEFAULT 1,
                                                        id_inmueble int NOT NULL,
                                                        resultado_biometria varchar(255) DEFAULT NULL,
                                                        valor_pagar int,
                                                        valor_iva int,
                                                        porcentaje_iva int,
                                                        estado_pago varchar(255),
                                                        cupon varchar(255),
                                                        codigo_sucursal int,
                                                        PRIMARY KEY (id)
);
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE IF NOT EXISTS analisis_digital.usuario_documento (
                                                                  id int AUTO_INCREMENT NOT NULL UNIQUE,
                                                                  id_usuario int NOT NULL,
                                                                  id_documento int NOT NULL,
                                                                  PRIMARY KEY (id)
);
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE IF NOT EXISTS documento (
                                         id int AUTO_INCREMENT NOT NULL UNIQUE,
                                         fecha_creacion datetime NOT NULL DEFAULT NOW(),
                                         fecha_modificacion datetime NOT NULL DEFAULT NOW(),
                                         url varchar(255) NOT NULL,
                                         nombre_archivo varchar(255) NOT NULL,
                                         PRIMARY KEY (id)
);
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE IF NOT EXISTS analisis_digital.inmueble_documento (
                                                                   id int AUTO_INCREMENT NOT NULL UNIQUE,
                                                                   id_inmueble int NOT NULL,
                                                                   id_documento int NOT NULL,
                                                                   PRIMARY KEY (id)
);
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE analisis_digital.usuario_estudio ADD CONSTRAINT usuario_estudio_fk2 FOREIGN KEY (id_estudio) REFERENCES estudio(id);
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE analisis_digital.estudio ADD CONSTRAINT estudio_fk4 FOREIGN KEY (id_inmueble) REFERENCES inmueble(id);
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE analisis_digital.usuario_documento ADD CONSTRAINT usuario_documento_fk1 FOREIGN KEY (id_usuario) REFERENCES usuario(id);
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE analisis_digital.usuario_documento ADD CONSTRAINT usuario_documento_fk2 FOREIGN KEY (id_documento) REFERENCES documento(id);
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE analisis_digital.inmueble_documento ADD CONSTRAINT inmueble_documentos_fk1 FOREIGN KEY (id_inmueble) REFERENCES inmueble(id);
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE analisis_digital.inmueble_documento ADD CONSTRAINT inmueble_documentos_fk2 FOREIGN KEY (id_documento) REFERENCES documento(id);
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE analisis_digital.usuario ADD CONSTRAINT usuario_padre_fk1 FOREIGN KEY (usuario_padre_id) REFERENCES usuario(id);
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE analisis_digital.usuario_estudio ADD CONSTRAINT usuario_estudio_fk1 FOREIGN KEY (id_usuario) REFERENCES usuario(id);
;-- -. . -..- - / . -. - .-. -.--
CREATE DATABASE IF NOT EXISTS `flowableElLibertador`;
;-- -. . -..- - / . -. - .-. -.--
select * from documento;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM estudio;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM inmueble_documento;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM usuario;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM usuario_documento;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM usuario_estudio;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE inmueble
    ADD COLUMN informacion_adicional VARCHAR(255) NULL;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE inmueble
    ADD COLUMN id_ciudad_inmobiliaria BIGINT NULL;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE inmueble
    MODIFY COLUMN id_ciudad_inmobiliaria INT NULL;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE inmueble
    ADD COLUMN documento_inmobiliaria VARCHAR(50) NULL;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM inmueble;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE inmueble
    MODIFY COLUMN documento_inmobiliaria INT NULL;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE inmueble
    ADD COLUMN tipo_documento_inmobiliaria VARCHAR(10) NULL;