use gimnasio_mckenna;

/*STORED PROCEDURE para seleccionar todos los datos de un socio a travez del nombre*/
drop procedure if exists  nombre_socio;
delimiter $$
create procedure `nombre_socio` (in nombre_socio varchar(60))
begin
	SELECT * FROM socios where nombre like concat('%',nombre_socio ,'%');   

end 
$$
delimiter ;

call nombre_socio ('eonida');
call nombre_socio ('iffa');



/* -----------------------------------************************---------------------------*/

/*STORED PROCEDURE para contar la cantidad de socios*/
use gimnasio_mckenna;
delimiter $$
create procedure `total_socios` (out total integer)
begin
	SELECT count(*) into total from socios ;   

end 
$$
delimiter ;


CALL total_socios( @total );
SELECT @total;

/*------------------------------------************************--------------------------- */
use gimnasio_mckenna;
/*STORED PROCEDURE para buscar socios activos o inactivos*/
drop procedure if exists socio_activo;
delimiter $$
create procedure `socio_activo` (in param boolean)
begin	
		SELECT s.idsocio, s.nombre as nombre_socio,s.apellido, act.nombre as nombre_actividad FROM socios as s
		left JOIN actividades as act
        ON s.fk_idactividad=act.idactividad
		where activo=param;
END
$$
delimiter ;
call socio_activo(1);
call socio_activo(0) ;


/* ----------------------------****************************************------------------------------- */

/*STORED PROCEDURE para calcular la suma de todos los sueldos de entrenadores*/
use gimnasio_mckenna;
delimiter $$
create procedure `sueldo_total` (out total float)
begin
	
	select sum(`sueldo`) into total    
    from
		entrenadores;  
end
$$
delimiter ;


call `sueldo_total`(@total);
select @total as sueldo from dual;