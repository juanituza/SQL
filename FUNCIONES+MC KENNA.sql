/* Función para obtener nombre y apellido del socio "filtrado" por idsocio*/
use gimnasio_mckenna;
DELIMITER $$
CREATE FUNCTION `nombre_socio` (id int)
RETURNS varchar(100)
READS SQL DATA
BEGIN
declare resultado varchar(100);

	SELECT concat(nombre, ' ' ,apellido)  into resultado from socios where idsocio=id;
    
    return resultado;

END $$
DELIMITER ;



select nombre_socio(45) from dual;





/* ------------------------------*********************----------------------------*/

/* Función para obtener nombre de la sucursal "filtrado" por idsucursal*/

use gimnasio_mckenna;

DELIMITER $$
CREATE FUNCTION `sucursales_nombre` (id int)
RETURNS varchar(100)
READS SQL DATA
begin

declare resultado varchar(100);
SELECT sucu.nombre as nombre_sucursal into resultado FROM sucursales sucu
where sucu.idsucursal=id;
return resultado;

end $$
delimiter ;

select sucursales_nombre(45) from dual;




/*---------------------------*********************--------------------------------*/

/* Función para obtener suma total de los sueldos de los entrenadores */

use gimnasio_mckenna;
DELIMITER $$
CREATE FUNCTION `suma_sueldo` ()
RETURNS float
READS SQL DATA
begin
declare resultado float;
SELECT sum(e.sueldo) into resultado FROM entrenadores as e;
return resultado;
end $$
delimiter ;

select suma_sueldo( ) from dual;