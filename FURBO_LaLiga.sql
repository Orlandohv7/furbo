drop database if exists Furbo_LaLiga;
create database Furbo_LaLiga;
use Furbo_LaLiga;

create table jugadores (
Nombre varchar(20),
apellido varchar(20),
id_jugador int not null,
edad int,
fecha_fichaje date,
id_equipo int not null,
primary key (id_jugador)
);

create table equipos (
Nombre varchar(20),
Ciudad varchar(20),
Num_titulos int,
fecha_inauguracion date,
id_equipo int not null,
primary key (id_equipo)
);
 
 create table estadisticas (
 Cod_estadistica int not null,
 partidos_jugados int,
 goles_contra int,
 goles_favor int,
 puntos_totales int,
 posición_tabal int,
 id_equipo int not null,
 primary key(Cod_estadistica)
 );
 
 create table patrocinadores (
 nombre_empresa varchar(20),
 fecha_contrato date,
 localizacion_empresa varchar(20),
 cod_empresa int not null,
 id_equipo int not null,
 primary key(cod_empresa)
 );
 
 create table competiciones (
 nombre_compe varchar(20),
 final_ciudad varchar(20),
 num_ganadores int,
 fecha_creacion date,
 cod_competicion int not null,
 primary key (cod_competicion)
 );
 
 create table partidos (
 Duracion int,
 fecha_partido date,
 num_golesmetidos int,
 jornada int,
 cod_partido int not null,
 cod_competicion int not null,
 primary key(cod_partido)
 );
 
 create table estadio (
 nombre_estadio varchar(20),
 localizacion varchar(20),
 fecha_apertura date,
 cod_estadio int not null,
 cod_partido int not null,
 primary key(cod_estadio)
 );
 
 create table arbitros (
 nombre varchar(20),
 apellido varchar(20),
 edad int,
 fecha_titulo date,
 id_arbitro int not null,
 cod_partido int not null,
 primary key (id_arbitro)
 );
 
 create table dietistas (
 nombre varchar(20),
 apellido varchar(20),
 edad int,
 fecha_titulo date,
 id_dietista int not null,
 primary key (id_dietista)
 );
 
 create table competiciones_equipos (
  cod_competicion int not null,
  id_equipo int not null,
  primary key (cod_competicion, id_equipo)
  );

 create table equipos_partidos (
 id_equipo int not null,
 cod_partido int not null,
 primary key (id_equipo, cod_partido)
 );
 
 create table dietista_equipos (
 id_equipo int not null,
 id_dietista int not null,
 primary key (id_equipo, id_dietista)
 );

alter table jugadores
add constraint fk1_equipo foreign key (id_equipo) references equipos (id_equipo);

alter table estadisticas 
add constraint fk2_equipo foreign key (id_equipo) references equipos (id_equipo);

alter table patrocinadores
add constraint fk3_equipo foreign key (id_equipo) references equipos (id_equipo);

alter table partidos
add constraint fk1_competicion foreign key (cod_competicion) references competiciones (cod_competicion);

alter table estadio 
add constraint fk1_partido foreign key (cod_partido) references partidos (cod_partido);

alter table arbitros 
add constraint fk2_partido foreign key (cod_partido) references partidos (cod_partido);

alter table competiciones_equipos
add constraint fk4_equipo foreign key (id_equipo) references equipos (id_equipo),
add constraint fk2_competicion foreign key (cod_competicion) references competiciones (cod_competicion);

alter table equipos_partidos
add constraint fk5_equipo foreign key (id_equipo) references equipos (id_equipo),
add constraint fk3_partido foreign key (cod_partido) references partidos (cod_partido);

alter table dietista_equipos
add constraint fk6_equipo foreign key (id_equipo) references equipos (id_equipo),
add constraint fk1_dietista foreign key (id_dietista) references dietistas (id_dietista); 


insert into equipos values('Real Madrid', 'Madrid', 14, '1902-03-06', 1);
insert into equipos values('Real Sociedad', 'País Vasco', 3, '1909-09-07', 2);
insert into equipos values('FCBarcelona', 'Barcelona', 5, '1899-11-29', 3);
insert into equipos values('FCSevilla', 'Sevilla', 8, '1890-01-25', 4);
insert into equipos values('UDLasPalmas', 'Las Palmas', 20, '1949-08-22', 5);

insert into jugadores values('ElXokas', 'Torrente', 1, 32, '2000-07-21', 1);
insert into jugadores values('Ibai', 'Llanos', 2, 28, '2001-03-25', 2);
insert into jugadores values('TheGrefg', 'Canovas', 3, 26, '2005-08-15', 3);
insert into jugadores values('Illojuan', 'LMDShow', 4, 27, '1999-03-30', 4);
insert into jugadores values('Knekro', 'Viejo', 5, 72, '1492-12-7', 5);

insert into estadisticas values(1, 45, 2, 200, 32, 1, 1);
insert into estadisticas values(2, 45, 49, 67, 28, 3, 2);
insert into estadisticas values(3, 45, 50, 20, 12, 5, 3);
insert into estadisticas values(4, 45, 23, 131, 31, 2, 4);
insert into estadisticas values(5, 45, 46, 30, 23, 4, 5);

insert into patrocinadores values('NIKE', '2015-04-12', 'Reino Unido', 1, 1);
insert into patrocinadores values('Adidas', '2003-12-07', 'EEUU', 2, 2);
insert into patrocinadores values('Spotify', '2012-06-01', 'Francia', 3, 3);
insert into patrocinadores values('Volkswagen', '2008-10-19', 'Alemania', 4, 4);
insert into patrocinadores values('Ferrari', '2001-01-11', 'Italia', 5, 5);

insert into competiciones values('Champions', 'Madrid', 1, '1995-05-20', 1);
insert into competiciones values('Mundial', 'Paris', 1, '1930-07-10', 2);
insert into competiciones values('LaLiga', 'Barcelona', 1, '1950-01-05', 3);
insert into competiciones values('Copa del rey', 'Sevilla', 1, '1970-03-25', 4);
insert into competiciones values('Europa League', 'Gdansk', 1, '1948-09-11', 5);

insert into partidos values(93, '2004-03-17', 5, 22, 1, 1);
insert into partidos values(95, '2007-11-02', 6, 10, 2, 2);
insert into partidos values(120, '2002-09-11', 10, 30, 3, 3);
insert into partidos values(122, '2001-06-22', 3, 15, 4, 4);
insert into partidos values(91, '2005-04-30', 1, 3, 5, 5);

insert into estadio values('Santiago Bernabeu', 'Madrid', '1947-12-14', 1, 1);
insert into estadio values('Parc des Princes', 'Paris', '1897-07-18', 2, 2);
insert into estadio values('Camp Nou', 'Barcelona', '1957-09-24', 3, 3);
insert into estadio values('Ramón Sánchez', 'Sevilla', '1958-09-07', 4, 4);
insert into estadio values('Stadion Miejski', 'Gdansk', '2011-08-14', 5, 5);

insert into arbitros values('Alfredo', 'Lopez', '24','1999-03-18', 1, 1);
insert into arbitros values('Santiago', 'Segura', '25','1997-03-18', 2, 2);
insert into arbitros values('Jose', 'Ramirez', '26','1996-03-18', 3, 3);
insert into arbitros values('Orlando', 'Hidalgo', '27','1995-03-18', 4, 4);
insert into arbitros values('Pablo', 'Bosa', '28','1994-03-18', 5, 5);

insert into dietistas values('Josue', 'Castro', '19', '2004-05-20', 1);
insert into dietistas values('Ismael', 'Cabrera', '18', '2004-12-12', 2);
insert into dietistas values('Juan Jose', 'Lemes', '20', '2003-04-01', 3);
insert into dietistas values('Brian', 'Sosa', '21', '2002-07-13', 4);
insert into dietistas values('Daniel', 'Garcia', '23', '2000-06-03', 5);

insert into competiciones_equipos values(1, 1);
insert into competiciones_equipos values(2, 2);
insert into competiciones_equipos values(3, 3);
insert into competiciones_equipos values(4, 4);
insert into competiciones_equipos values(5, 5);

insert into equipos_partidos values(1, 1);
insert into equipos_partidos values(2, 2);
insert into equipos_partidos values(3, 3);
insert into equipos_partidos values(4, 4);
insert into equipos_partidos values(5, 5);

insert into dietista_equipos values(1, 1);
insert into dietista_equipos values(2, 2);
insert into dietista_equipos values(3, 3);
insert into dietista_equipos values(4, 4);
insert into dietista_equipos values(5, 5);
