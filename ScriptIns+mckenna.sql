CREATE SCHEMA gimnasio_mckenna;


use gimnasio_mckenna;

/*Creación de tablas*/
CREATE TABLE IF NOT EXISTS sucursales(idsucursal int  NOT NULL AUTO_INCREMENT,
						nombre varchar(50),
						direccion varchar(50),
						telefono varchar(50),
						horario datetime,
						PRIMARY KEY (idsucursal) USING BTREE)
						ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=UTF8MB4;

CREATE TABLE IF NOT EXISTS actividades(idactividad int NOT NULL AUTO_INCREMENT,
										nombre varchar(50),
										horario time,
										dia varchar(50),
										fk_idsucursal int NOT NULL,
										PRIMARY KEY (idactividad) USING BTREE,
										FOREIGN KEY (fk_idsucursal) REFERENCES sucursales(idsucursal));
                                        
							
CREATE TABLE IF NOT EXISTS socios(idsocio int NOT NULL AUTO_INCREMENT,
								nombre varchar(50),
                                apellido varchar(50),
                                dni varchar(50),
                                edad int,
                                direccion varchar(50),
                                correo varchar(50),
                                telefono varchar(50),
                                activo boolean,
                                fk_idactividad int NOT NULL,
                                PRIMARY KEY (idsocio) USING BTREE,
                                FOREIGN KEY (fk_idactividad) REFERENCES actividades(idactividad));
                                
                                
CREATE TABLE IF NOT EXISTS socios_historicos(idsocio int NOT NULL AUTO_INCREMENT,
								nombre varchar(50),
                                apellido varchar(50),
                                dni varchar(50),
                                edad int,
                                direccion varchar(50),
                                correo varchar(50),
                                telefono varchar(50),
                                activo boolean,
                                fk_idactividad int NOT NULL,
                                PRIMARY KEY (idsocio) USING BTREE,
                               FOREIGN KEY (fk_idactividad) REFERENCES actividades(idactividad));							


		

CREATE TABLE IF NOT EXISTS entrenadores(identrenador int NOT NULL AUTO_INCREMENT,
								nombre varchar(50),
                                apellido varchar(50),
                                dni varchar(50),
                                edad int,
                                direccion varchar(50),
                                correo varchar(50),
                                telefono varchar(50),
                                sueldo float,
                                fk_idactividad int NOT NULL,
                                PRIMARY KEY (identrenador) USING BTREE,
                                FOREIGN KEY (fk_idactividad) REFERENCES actividades(idactividad));
                                
                                
                                
CREATE TABLE IF NOT EXISTS empleados(idempleado int NOT NULL AUTO_INCREMENT,
								nombre varchar(50),
                                apellido varchar(50),
                                dni varchar(50),
                                edad int,
                                direccion varchar(50),
                                correo varchar(50),
                                telefono varchar(50),
                                sueldo float,
                                fk_idsucursal int NOT NULL,
                                PRIMARY KEY (idempleado) USING BTREE,
                                FOREIGN KEY (fk_idsucursal) REFERENCES sucursales(idsucursal));

/*Modificación de columnas tabla sucursales*/                            
ALTER TABLE `gimnasio_mckenna`.`sucursales` 
								CHANGE COLUMN `horario` `horario_de_apertura` TIME NULL DEFAULT NULL ;

ALTER TABLE `gimnasio_mckenna`.`sucursales` 
								ADD COLUMN  `horario_de_cierre` TIME NULL DEFAULT NULL;						

                                
/* Inserción de datos por archivos csv "sucursales.csv" (inserción en tabla ya generada) */
SELECT * FROM sucursales;

/*Inserción de datos por archivos csv "empleados.csv" (se realiza DROP y reemplazo de tabla*/
/*Tabla empleados se realiza un DROP y se crea una nueva*/
SELECT * FROM empleados;





                                  
 /*Inserción de datos mediante SCRIPT*/                                   
insert into actividades ( nombre, horario,dia,fk_idsucursal)
			values 	('pilates','08:30:00','lun/mier/vier',1),
					('yoga','10:30:00','mar/mier/jue',2),
					('danzas','08:00:00','mar/jue',3),
					('danzas','17:00:00','mar/jue',4),
					('aerobox','09:00:00','lun a vier',5),
					('aerobox','17:00:00','lun a vier',6),
					('zumba','09:00:00','lun a vier',7),
					('danza contemporanea','09:00:00','lun/mar/jue/vier',8),					
					('maquinas','08:30:00','lun a sabado',9),
					('boxeo','10:30:00','lun a sabado',10),   
					('boxeo','10:30:00','lun a sabado',11),
                    ('zumba','10:00:00','lun a sabado',12),
                    ('crossfit','09:00:00','lun a sabado',13),
                    ('crossfit','09:00:00','lun a sabado',14),
                    ('crossfit','14:00:00','lun a sabado',15),
                    ('crossfit','10:00:00','lun a sabado',16),
                    ('crossfit','16:00:00','lun a vier',17),
                    ('crossfit','18:00:00','lun a vier',18),
                    ('crossfit','19:00:00','lun / juev',19),
                    ('crossfit','20:00:00','lun / juev',20),
                    ('crossfit','21:00:00','mar / mier / vier',21),
                    ('crossfit','14:00:00','mar / mier / vier',22),
                    ('maquinas','10:30:00','lun a sabado',23),
                    ('maquinas','12:30:00','lun a vier',24),
                    ('maquinas','14:30:00','lun a vier',25),
                    ('maquinas','16:30:00','mar a sab',26),
                    ('maquinas','18:30:00','lun a dom',27),
                    ('maquinas','19:00:00','lun a dom',28),
                    ('maquinas','21:00:00','lun a dom',29),
                    ('maquinas','21:00:00','lun a dom',30),
                    ('danza contemporanea','10:00:00','lun/mar/vier',31),
                    ('danza contemporanea','12:00:00','lun/mier',32),
                    ('danza contemporanea','18:00:00','lun a vier',33),
                    ('danza contemporanea','19:00:00','lun/mier/vier',34),
                    ('danza contemporanea','20:00:00','lun/mier/vier',35),
                    ('danza contemporanea','21:00:00','lun/mier/vier',36),
                    ('pilates','10:30:00','lun/mier/vier',37),
                    ('pilates','12:30:00','lun/vier',38),
                    ('pilates','15:30:00','lun/mar/mier/vier',39),
                    ('pilates','17:30:00','lun a vier',40),
                    ('pilates','21:00:00','lun a vier',41),
                    ('pilates','20:00:00','lun a vier',42),
                    ('pilates','20:00:00','lun a vier',42),
                    ('yoga','12:00:00','mar/mier/jue',43),
                    ('yoga','16:00:00','mar/jue',44),
                    ('yoga','17:00:00','mar/jue',45),
                    ('yoga','18:00:00','mar/jue',46),
                    ('yoga','21:00:00','mar',47),
                    ('zumba','09:00:00','lun a vier',48),
                    ('zumba','10:00:00','lun a sab',49),
                    ('zumba','18:00:00','lun a sab',50);
                    

select * from socios;
select * from actividades;
                               
                                


                    
insert into entrenadores (nombre,apellido,dni,edad,direccion,correo,telefono,sueldo,fk_idactividad)
			values ('Stepha','Agnolo','32965850',30,'8 Fremont Lane','abarents0@yolasite.com','543-333-9669','853624',8),
				   ('Blondy','Davidson','33487306',35,'56 Thackeray Center','bdavidson1@msu.edu','377-587-3698','677349',2),
			       ('Stacie','Mancktelow','34008762',52,'888 Rowland Road','smancktelow2@spiegel.de','825-208-5560','911105',3),
			       ('Kaleb','Gilling','34530218',28,'800 Shopko Trail','kgilling3@facebook.com','160-820-1912','345280',4),
			       ('Bernardo','Hercock','35051674',45,'42 Moose Court','bhercock4@fema.gov','917-843-8017','586186',7),
			       ('Allina','Ivanovic','35573130',29,'42 Moose Court','aivanovic5@hatena.ne.jp','258-870-2178','866238',6),
			       ('Blinnie','Durdle','36094586',38,'59 Dayton Avenue','bdurdle6@posterous.com','848-337-8902','506160',5),
			       ('Florri','Crennell','36616042',55,'59 Dayton Avenue','fcrennell7@fc2.com','8231-129-2781','653838',10),
			       ('Benny','Matej','37137498',31,'02021 Darwin Drive','bmatej8@apple.com','137-325-4157','643946',1),
			       ('Sybilla','Baggarley','37658954',48,'02021 Darwin Drive','sbaggarley9@privacy.gov.au','964-720-8516','935244',9),
			       ('Freida','Cavan','23791876',45,'11 Badeau Circle','fcavan0@bbc.co.uk','586-956-1975','153919',8),
			       ('Christi','Rishworth','26843038',54,'3 Manley Way','crishworth1@ycombinator.com	','606-231-1482','169087',1),
			       ('Mort','Foulis','31212435',33,'7514 Lakeland Place','mfoulis2@rediff.com','876-551-5137','174645',6),
			       ('Lanna','Ivashnyov','24298831',45,'00890 Eliot Hill','livashnyov3@gov.uk','637-844-2029','175007',2),
			       ('Bobbye','Huggen','30604410',39,'483 Vahlen Alley','bhuggen4@ow.ly','105-254-7152','174711',7),
			       ('Nealson','Foucher','22831931',51,'404 Ridgeway Lane','nfoucher5@washingtonpost.com','218-404-4880','150038',4),
			       ('Marcy','Abrahamsson','31822870',32,'51 Havey Point','mabrahamsson6@stumbleupon.com','124-266-5440','157873',9),
			       ('Rosalinde','Attew','32147653',52,'99 Rowland Street','rattew7@statcounter.com','102-396-5768','183543',5),
			       ('Merwyn','Livingston','35297821',46,'2 Fuller Crossing','mlivingston8@networksolutions.com','207-701-1330','179256',6),
			       ('Melodie','Tomadoni','30722972',32,'1025 Meadow Valley Center','mtomadoni9@desdev.cn','347-440-7576','163999',3),
			       ('Arlena','Burnett','30759989',26,'53 Veith Junction','aburnetta@bloomberg.com','316-433-6017','177310',2);
select * from entrenadores;
                               
insert into socios (nombre,apellido,dni,edad,direccion,correo,telefono,activo,fk_idactividad)
			values ('Terrill','Lechmere','33487306',35,'07249 Carioca Pass','jmingaye1@4shared.com','727-122-9731',1,8),
				   ('Leonidas','Maxwaile','34008762',52,'338 Clemons Plazar','lmaxwaile2@123-reg.co.uk','348-823-8405',0,3),
				   ('Cull','Gabbetis','34530218',28,'7 Bay Crossing','cgabbetis3@privacy.gov.au','703-716-1644',1,10),
				   ('Morgana','Troker','35051674',45,'1 Stang Center','mtroker4@instagram.com','685-219-3125',0,4),
				   ('Eula','Chew','35573130',21,'80 Evergreen Plaza','echew5@constantcontact.com','896-875-6344',0,4),
				   ('Prue','Rabbet','36094586',38,'58 Rowland Trail','prabbet6@blog.com','668-446-1936',1,5),
				   ('Kali','Kimberley','36616042',55,'866 Dennis Circle','kkimberley7@posterous.com','716-351-1018',1,10),
				   ('Auguste','Beurich','37137498',31,'8064 Bultman Avenue','abeurich8@istockphoto.com','129-314-2348',0,1),
				   ('Wyatt','McKag','37658954',48,'77 Talisman Court','wmckag9@geocities.com','101-608-0028',0,2),
				   ('Cherie','Lantuff','38180410',24,'7 Pleasure Way','clantuffa@rediff.com','179-232-6345',1,6),
				   ('Letisha','Mushawe','38701866',41,'042 Hintze Circle','lmushaweb@exblog.jp','569-166-6761',1,7),
				   ('Linnie','Coram','39223322',58,'9 Sheridan Center','lcoramc@europa.eu','550-214-39321',1,9),
				   ('Terra','Cady','44776560',52,'4939 Schmedeman Pass','tcadyb@livejournal.com','121-752-9867',1,10),
				   ('Cassius','Woodley','42580096',44,'6 Sutteridge Way','cwoodleyc@army.mil','613-724-8388',0,8),
				   ('Lindsey','Tait','38512372',44,'04595 Monument Point','ltaitd@free.fr','369-162-8401',1,7),
				   ('Rudolf','Kapelhoff','38649383',24,'887 Forest Dale Crossing','rkapelhoffe@ucla.edu','932-960-0868',0,1),
				   ('Carmelina','Truef','40530578',33,'2800 Red Cloud Parkway','ctruef@samsung.com','495-639-5181',0,3),
				   ('Clair','Camelli','42264234',31,'1952 Loeprich Avenue','ccamellig@foxnews.com','250-495-5336',0,5),
				   ('Stephen','McGookin','44423394',25,'0299 6th Crossing','smcgookinh@cyberchimps.com','158-702-7102',0,10),
				   ('Ailee','Linklater','37960865',29,'888 Briar Crest Place','alinklateri@blog.com','845-970-4770',0,8),
				   ('Ailee','Linklater','37960865',29,'888 Briar Crest Place','alinklateri@blog.com','845-970-4770',0,9),
				   ('Cobb','Faldoe','43978166',52,'87929 Marquette Center','cfaldoej@360.cn','314-716-2309',0,9),
				   ('Ferdinande','Levane','36747542',29,'588 Bartelt Drive','flevanek@ucla.edu','908-417-1379',0,7),
				   ('Kora','Friary','45155619',21,'4 David Terrace','kfriaryl@shutterfly.com','256-687-6755',0,3),
				   ('Walker','McCully','31558877',37,'344 Sunbrook Center','wmccullym@miitbeian.gov.cn','677-524-5940',0,4),
				   ('Patsy','McGeever','40730042',52,'52056 Kensington Alley','pmcgeevern@illinois.edu','813-996-3838',1,5),
				   ('Gilbertina','O Ruane','39718550',34,'2 Coolidge Place','goruaneo@hatena.ne.jp','742-539-6346',0,5),
				   ('Grantham','Siggin','31073199',25,'44 Green Ridge Plaza','gsigginp@elpais.com','716-696-3479',1,1),
				   ('Corny','Peat','39470616',38,'3415 Straubel Junction','cpeatq@t.co','962-100-5492',0,6),
				   ('Ashlan','Alsford','33671744',23,'34 Hoepker Court','aalsfordr@google.de','649-818-4181',0,10),
				   ('Ethelda','Bines','31281442',55,'85 Truax Center','ebiness@a8.net','621-773-5245',1,2),
				   ('Israel','Pulley','35795937',49,'783 Prairieview Parkway','ipulleyt@topsy.com','735-716-1711',1,3);
                   
select * from socios;
                   