## mysql

los inier join devuelve los registro que tiene valores coincidentes en ambas tablas 

ejercicio de joins

```sql

create database if not exists lugar;

create table if not exists Regiones(
idRegion int(2) primary key,
Region varchar(20) not null);

create table if not exists Provincias(
idProvincia int(2) primary key,
Provincia varchar(20) not null,
idRegion int(2) not null,
foreign key (idRegion) references Regiones(idRegion));

create table if not exists Comunas(
idComuna int(2) primary key,
Comuna varchar(20) not null,
idProvincia int(2) not null,
foreign key (idProvincia) references Provincias(idProvincia));

## otra parte del codigo

insert into Regiones (idRegion, Region)
values (1, 'Andina'),(2, 'Pacifica'),(3,'Caribe');

insert into Provincias(idProvincia, Provincia,
idRegion) values (1, 'Cundinamarca', 1), (2,'Choco',2),(3,'Antioquia',1); 

insert into Comunas(idComuna, Comuna, idProvincia)
values (1,'Bogotá',1),(2,'Medellín',3),(3, 'Facatativa',1);

##consultas

select Regiones.idRegion, Region, Provincia, Comuna
from ((Provincias
inner join Regiones on 
Provincias.idRegion=Regiones.idRegion)
inner join Comunas on 
Comunas.idProvincia=Provincias.idProvincia); 

select Regiones.idRegion, Region, Provincia, Comuna
from ((Provincias
left join regiones on 
Provincias.idRegion=Regiones.idRegion)
left join Comunas on 
Comunas.idProvincia=Provincias.idProvincia); 

select Regiones.idRegion, Region, Provincia, Comuna
from ((regiones
left join Provincias on 
Provincias.idRegion=Regiones.idRegion)
left join Comunas on 
Comunas.idProvincia=Provincias.idProvincia);






```

````sql

SELECT * FROM
ingreso
RIGHT JOIN medico
on ingreso.med_ingreso=medico.cod_identificacion;

SELECT * FROM
paciente
LEFT JOIN
ingreso
ON paciente.num_historial=paciente.pac_ingreso;

SELECT * FROM 
paciente
INNER JOIN ingreso ON paciente.num_historial=ingreso.pac_ingreso
INNER JOIN medico ON ingreso.num_ingreso=medico.cod_identificacion;


````

## libreria Tigger

````sql

CREATE TABLE audi_socio(
    id_audi INT(10) AUTO_INCREMENT,
    socNumero_audi INT(11),
    socNombre_anterior VARCHAR(45),
    socApellido_anterior VARCHAR(45),
    socDireccion_anterior VARCHAR(255),
    socTelefono_anterior VARCHAR(10),
    socNombre_nuevo VARCHAR(45),
    socApellido_nuevo VARCHAR(45),
    socDireccion_nuevo VARCHAR(255),
    socTelefono_nuevo VARCHAR(10),
    audi_fechaModificacion DATETIME,
    audi_usuario VARCHAR(10),
    audi_accion VARCHAR(45),
    PRIMARY KEY(id_audi)
);

````
---

## Elimnar

````sql

DROP TRIGGER IF EXISTS socios_after_delete;
CREATE TRIGGER socios_after_delete AFTER DELETE ON
tbl_socio
FOR EACH ROW
INSERT INTO audi_socio(
socNumero_audi,
socNombre_anterior,
socApellido_anterior,
socDireccion_anterior,
socTelefono_anterior,
audi_fechaModificacion,
audi_usuario,
audi_accion)
VALUES(
old.soc_numero,
old.soc_nombre,
old.soc_apellido,
old.soc_direccion,
old.soc_telefono,
NOW(),
CURRENT_USER(),
'Registro eliminado');


DELETE FROM tbl_socio
WHERE soc_numero=123456;

SELECT * FROM audi_socio;

````

---

## Tabla Creada Libros

````sql

CREATE TABLE audi_libros(
    id_audi INT AUTO_INCREMENT,
    lib_isbn_audi BIGINT,
    
    lib_titulo_anterior VARCHAR(255),
    lib_genero_anterior VARCHAR(20),
    lib_numeroPaginas_anterior INT,
    lib_diasPrestamo_anterior TINYINT,
    
    lib_titulo_nuevo VARCHAR(255),
    lib_genero_nuevo VARCHAR(20),
    lib_numeroPaginas_nuevo INT,
    lib_diasPrestamo_nuevo TINYINT,
    
    audi_fechaModificacion DATETIME,
    audi_usuario VARCHAR(45),
    audi_accion VARCHAR(20),
    
    PRIMARY KEY(id_audi)
);

````

---

### INSERT Libros Trigger 

````sql

DROP TRIGGER IF EXISTS Insertar_after_libro;

CREATE TRIGGER Insertar_after_libro
AFTER INSERT ON tbl_libro
FOR EACH ROW
INSERT INTO audi_libros(
    lib_titulo_nuevo,
    lib_genero_nuevo,
    lib_numeroPaginas_nuevo,
    lib_diasPrestamo_nuevo,
    audi_fechaModificacion,
    audi_usuario,
    audi_accion
)
VALUES(
    NEW.lib_titulo,
    NEW.lib_genero,
    NEW.lib_numeroPaginas,
    NEW.lib_diasPrestamo,
    NOW(),
    USER(),
    'Insertaste un nuevo libro'
);


INSERT INTO `tbl_libro`(`lib_isbn`, `lib_titulo`, `lib_genero`, `lib_numeroPaginas`, `lib_diasPrestamo`) VALUES (1223212, 'Miedo a la altura', 'Terror', 32 , 15);

SELECT * FROM audi_libros;

````


----

## UPDATE Libros Trigger 

`````sql

CREATE TRIGGER tr_update_libros
AFTER UPDATE ON tbl_libro
FOR EACH ROW
INSERT INTO audi_libros(
    lib_isbn_audi,
    lib_titulo_anterior,
    lib_genero_anterior,
    lib_numeroPaginas_anterior,
    lib_diasPrestamo_anterior,
    lib_titulo_nuevo,
    lib_genero_nuevo,
    lib_numeroPaginas_nuevo,
    lib_diasPrestamo_nuevo,
    audi_fechaModificacion,
    audi_usuario,
    audi_accion
)
VALUES(
    OLD.lib_isbn,
    OLD.lib_titulo,
    OLD.lib_genero,
    OLD.lib_numeroPaginas,
    OLD.lib_diasPrestamo,
    NEW.lib_titulo,
    NEW.lib_genero,
    NEW.lib_numeroPaginas,
    NEW.lib_diasPrestamo,
    NOW(),
    USER(),
    'UPDATE'
);

UPDATE tbl_libro SET 
lib_titulo ='Locos de Locura',
lib_genero='Comedia',
lib_numeroPaginas= 15
WHERE lib_isbn = 1234567890;


SELECT * FROM audi_libros;

`````

----

## Delete Libros Trigger 

````sql

DROP TRIGGER IF EXISTS libros_after_delete;
CREATE TRIGGER libros_after_delete AFTER DELETE ON
tbl_libro
FOR EACH ROW
INSERT INTO audi_libros(
    lib_isbn_audi,
    lib_titulo_anterior,
    lib_genero_anterior,
    lib_numeroPaginas_anterior,
    lib_diasPrestamo_anterior,
    audi_fechaModificacion,
    audi_usuario,
    audi_accion
)
VALUES(
    OLD.lib_isbn,
    OLD.lib_titulo,
    OLD.lib_genero,
    OLD.lib_numeroPaginas,
    OLD.lib_diasPrestamo,
NOW(),
CURRENT_USER(),
'Su libro ha sido eliminado');

UPDATE `tbl_libro` SET `lib_titulo`='Miedo a la altura',`lib_genero`='Terror' WHERE 1223212;

SELECT * FROM audi_libros;

````