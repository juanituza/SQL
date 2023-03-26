/* Trigger para evitar ingreso de dni's incorrectos*/
drop trigger if exists tr_comprobar_dni ;


DELIMITER $$
CREATE TRIGGER tr_comprobar_dni
BEFORE INSERT ON socios
FOR EACH ROW 
BEGIN	
    IF NEW.dni<1000000 or NEW.dni>100000000
      THEN signal sqlstate '45000' set message_text='dni incorrecto';        
    END IF; 
END; 
$$
DELIMITER ;

select*from socios;


/*-------------------------------*****************-----------------------*/
/* Trigger para discriminar historico de socios*/
drop trigger if exists tr_socios_historico;


DELIMITER $$
CREATE TRIGGER tr_socios_historico 
AFTER INSERT ON socios
FOR EACH ROW
BEGIN 
   INSERT INTO socios_historicos(idsocio,nombre, apellido,dni,edad,direccion,correo,telefono,activo,fk_idactividad)
   VALUES (NEW.idsocio,NEW.nombre, NEW.apellido, NEW.dni,NEW.edad,NEW.direccion,NEW.correo,NEW.telefono,NEW.activo,NEW.fk_idactividad);
END; $$
DELIMITER ;
select*from socios_historicos;

/* ----------------------------------********************----------------------------------------------- */ 



/*trigger para genear log en tabla socios*/
CREATE TABLE Log_socios (TS_actualiza timestamp,Esquema varchar(50),Tabla varchar(50),Operacion char(6),registros int, user varchar(60));

drop trigger if exists tr_add_log_socios;

delimiter $$
CREATE TRIGGER tr_add_log_socios 
AFTER INSERT ON socios
for each row
  begin
    INSERT INTO log_socios (Ts_actualiza,Esquema,Tabla,Operacion,registros,user) values (now(),database(),'socios','Insert',1,user());
  end$$
delimiter ;

 

select*from log_socios;

/*----------------------------------------------***************************---------------------------*/

/*trigger para genear log en tabla empleados*/


CREATE TABLE log_empleados (TS_actualiza timestamp,Esquema varchar(50),Tabla varchar(50),Operacion char(6),registros int, user varchar(60));

drop trigger if exists tr_add_log_empleados;

delimiter $$
CREATE TRIGGER tr_add_log_empleados AFTER INSERT ON empleados
for each row
  begin
    INSERT INTO log_empleados (TS_actualiza,Esquema,Tabla,Operacion,registros,user) values (now(),database(),'empleados','Insert',1,user());
  end$$
delimiter ;

 

select*from log_empleados;




/*------------------------------******************************-------------------------------------*/

/* datos de prueba*/

INSERT INTO socios(nombre, apellido,dni,edad,direccion,correo,telefono,activo,fk_idactividad)
			VALUES('Terrill','Lechmere','3333387306',40,'07249 Carioca Pass','jmingaye1@4shared.com','727-122-9731',1,8),
			('Terrill','Lechmere','31729647',15,'07249 Carioca Pass','jmingaye1@4shared.com','727-122-9731',1,8);
            
insert into empleados (nombre,apellido,dni,edad,correo,telefono,sueldo,fk_idsucursal)
			values ('Stepha','Agnolo','32965850',30,'abarents0@yolasite.com','543-333-9669','853624',8),
				   ('Blondy','Davidson','33487306',35,'bdavidson1@msu.edu','377-587-3698','677349',2),
			       ('Stacie','Mancktelow','34008762',52,'smancktelow2@spiegel.de','825-208-5560','911105',3);

select *from empleados;
            
            
