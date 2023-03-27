SELECT @@AUTOCOMMIT;
SET AUTOCOMMIT = 0;

START TRANSACTION;
update actividades
set dia= 'mier/jue'
where
nombre = 'danzas';

select * from actividades;
savepoint danzas;

COMMIT;

/*----------------------******************---------------------------------*/


START TRANSACTION;
insert into actividades ( nombre, horario,dia,fk_idsucursal)
			values 	('CroosFit','10:00:00','lun/mar/mier/jue/vier',8);
COMMIT;
select * from actividades;