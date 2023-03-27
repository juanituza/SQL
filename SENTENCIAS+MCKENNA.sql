use mysql;

/*elimino el usuario en caso de que exista*/
DROP USER 'bochi'@'localhost';
/*creo el usuario en localhost*/
create user bochi@localhost;
/*genero password*/
ALTER USER 'bochi'@'localhost' IDENTIFIED BY 'bochini';
FLUSH PRIVILEGES;

/*verifico si fue creado correctamente*/
select * from user where user like 'bochi';
/*otorgo permisos de solo lectura*/
GRANT SELECT ON gimnasio_mckenna.* TO 'bochi'@'localhost';



/*--------------------------------------*******************************-------------------------------------------*/
use mysql;

/*elimino el usuario en caso de que exista*/
DROP USER 'diabloRojo'@'localhost';
/*creo el usuario en localhost*/
create user diabloRojo@localhost;
/*genero password*/
ALTER USER 'diabloRojo'@'localhost' IDENTIFIED BY 'LDAREB';
FLUSH PRIVILEGES;
/*verifico si fue creado correctamente*/
select * from user where user like 'diabloRojo';

GRANT SELECT,INSERT, UPDATE ON gimnasio_mckenna.* TO 'diabloRojo'@'localhost';




