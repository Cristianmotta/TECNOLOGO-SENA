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