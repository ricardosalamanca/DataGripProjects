select * from documento;
SELECT * FROM estudio;
SELECT * FROM inmueble;
SELECT * FROM inmueble_documento;
SELECT * FROM usuario;
SELECT * FROM usuario_documento;
SELECT * FROM usuario_estudio;

ALTER TABLE inmueble
    ADD COLUMN documento_inmobiliaria VARCHAR(50) NULL;

ALTER TABLE inmueble
    MODIFY COLUMN documento_inmobiliaria INT NULL;

ALTER TABLE inmueble
    ADD COLUMN tipo_documento_inmobiliaria VARCHAR(10) NULL;