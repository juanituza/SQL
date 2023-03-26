use gimnasio_mckenna;

/*vista 1*/
CREATE OR REPLACE VIEW actividades_sucursal AS(
SELECT sucu.idsucursal, sucu.nombre as nombre_sucursal, act.nombre as nombre_actividad FROM sucursales sucu
INNER JOIN actividades act
ON sucu.idsucursal=act.fk_idsucursal);

select * from actividades_sucursal ;

/*vista 2*/
CREATE OR REPLACE VIEW sucursales_entrenadores AS( 
SELECT sucu.nombre as nombre_sucursal ,ent.apellido as apellido_entrenador FROM sucursales sucu
LEFT JOIN entrenadores ent
ON sucu.idsucursal=ent.fk_idactividad);

select * from sucursales_entrenadores ;



/*vista 3*/
CREATE OR REPLACE VIEW  entrenadores_vista AS(
	SELECT ent.nombre,apellido,edad, act.nombre as actividad FROM entrenadores ent
	INNER JOIN actividades act
	ON ent.fk_idactividad=act.idactividad); 
    
select * from entrenadores_vista ;

/*vista 4*/
CREATE OR REPLACE VIEW  empleados_vista AS(
SELECT emp.idempleado,nombre,apellido,edad,correo,telefono FROM empleados emp);

select * from empleados_vista ;

/*vista 5*/
CREATE OR REPLACE VIEW socios_actividad AS( 
SELECT s.nombre as nombre_socio ,apellido as apellido_socio, act.nombre as actividad,horario FROM socios s
INNER JOIN actividades act
ON s.fk_idactividad=act.idactividad);

select * from socios_actividad;