SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'gpdatabase'
  AND pid <> pg_backend_pid();	
DROP DATABASE gpdatabase;

CREATE DATABASE gpdatabase;
connect gpdatabse;
-- Enable PostGIS (includes raster)
CREATE EXTENSION postgis;
drop table if exists medicoespecialidad;
drop table if exists especialidad;
drop table if exists medicocobertura;
drop table if exists cobertura;
drop table if exists medicodireccion;
drop table if exists telefono;
drop table if exists direccion;
drop table if exists medico;
drop table if exists provincia;
drop table if exists agenda;
create table especialidad (
	id serial primary key,
	descripcion varchar(200));
create table cobertura (
	id serial primary key,
	descripcion varchar(200));	
create table medico (
	id serial primary key,
	nombre varchar(200));
create table provincia (
	id serial primary key , 
	descripcion varchar(50));
create table direccion (
	id serial primary key,
	descripcion varchar(500),
	idProvincia int references provincia(id));
SELECT AddGeometryColumn('direccion','direccion', 4326, 'POINT', 2 );
create table telefono (
    id serial primary key,
	idDireccion int references direccion(id),
	telefono varchar(20));
create table medicoespecialidad (
	idMedico int references medico(id),
	idEspecialidad int references especialidad(id));
alter table medicoespecialidad add constraint medicoespecialidadPK primary key (idEspecialidad,idMedico);	
create table medicocobertura (
	idMedico int references medico(id),
	idCobertura int references cobertura(id));
alter table medicocobertura add constraint medicocoberturaPK primary key (idCobertura,idMedico);	
create table medicodireccion (
	idMedico int references medico(id),
	idDireccion int references direccion(id),
	agenda varchar(500));
alter table medicodireccion add constraint medicodireccionPK primary key (idDireccion,idMedico);	

insert into cobertura (descripcion) values ('Sin cobertura');
insert into cobertura (descripcion) values ('ACA Salud');
insert into cobertura (descripcion) values ('Accord Salud');
insert into cobertura (descripcion) values ('AMFFA');
insert into cobertura (descripcion) values ('Bristol Medicine');
insert into cobertura (descripcion) values ('COMI');
insert into cobertura (descripcion) values ('Construir Salud');
insert into cobertura (descripcion) values ('FEMEBA Salud');
insert into cobertura (descripcion) values ('Galeno Plata');
insert into cobertura (descripcion) values ('Galeno Oro');
insert into cobertura (descripcion) values ('IOMA');
insert into cobertura (descripcion) values ('Medicus');
insert into cobertura (descripcion) values ('Medife');
insert into cobertura (descripcion) values ('MOA');
insert into cobertura (descripcion) values ('Omint');
insert into cobertura (descripcion) values ('OSALARA');
insert into cobertura (descripcion) values ('OSDE 210');
insert into cobertura (descripcion) values ('OSDE 310');
insert into cobertura (descripcion) values ('OSDE 410');
insert into cobertura (descripcion) values ('OSDE 510');
insert into cobertura (descripcion) values ('OSDEM');
insert into cobertura (descripcion) values ('OSDEPYM');
insert into cobertura (descripcion) values ('OSDIPP');
insert into cobertura (descripcion) values ('OSJOMN');
insert into cobertura (descripcion) values ('OSFOT');
insert into cobertura (descripcion) values ('OSPAT');
insert into cobertura (descripcion) values ('OSPEPBA');
insert into cobertura (descripcion) values ('OSPERYHRA');
insert into cobertura (descripcion) values ('OSPETAX');
insert into cobertura (descripcion) values ('OSPIA');
insert into cobertura (descripcion) values ('OSPPEA');
insert into cobertura (descripcion) values ('OSPP');
insert into cobertura (descripcion) values ('OSSdeB');
insert into cobertura (descripcion) values ('Sancor Salud');
insert into cobertura (descripcion) values ('Swiss Medical');
insert into cobertura (descripcion) values ('Union Personal');

insert into especialidad (descripcion) values ('ADOLESCENCIA Y PUBERTAD');
insert into especialidad (descripcion) values ('ALERGIA E INMUNOLOGÍA');
insert into especialidad (descripcion) values ('ALERGIA E INMUNOLOGÍA INFANTIL');
insert into especialidad (descripcion) values ('ANATOMÍA PATOLÓGICA');
insert into especialidad (descripcion) values ('ANDROLOGÍA');
insert into especialidad (descripcion) values ('ANGIOGRAFÍA DIGITAL');
insert into especialidad (descripcion) values ('ANGIOPLASTÍAS');
insert into especialidad (descripcion) values ('ANGIOPLASTÍAS Y VALVULOPLASTÍAS PEDIÁTRICAS');
insert into especialidad (descripcion) values ('ARTICULACIÓN TEMPORO-MANDIBULAR');
insert into especialidad (descripcion) values ('AUDIOMETRÍAS');
insert into especialidad (descripcion) values ('CARDIOLOGÍA');
insert into especialidad (descripcion) values ('CARDIOLOGÍA INFANTIL');
insert into especialidad (descripcion) values ('CIRUGÍA CARDIOVASCULAR');
insert into especialidad (descripcion) values ('CIRUGÍA CARDIOVASCULAR INFANTIL');
insert into especialidad (descripcion) values ('CIRUGÍA DE CABEZA Y CUELLO Y MAXILO-FACIAL');
insert into especialidad (descripcion) values ('CIRUGÍA DE CABEZA Y CUELLO Y MAXILO-FACIAL INFANTIL');
insert into especialidad (descripcion) values ('CIRUGÍA DE MANO');
insert into especialidad (descripcion) values ('CIRUGÍA DE QUEMADOS');
insert into especialidad (descripcion) values ('CIRUGÍA DEL PIE');
insert into especialidad (descripcion) values ('CIRUGÍA DENTO-MAXILAR');
insert into especialidad (descripcion) values ('CIRUGÍA DIGESTIVA ENDOSCÓPICA');
insert into especialidad (descripcion) values ('CIRUGÍA ESTÉTICA');
insert into especialidad (descripcion) values ('CIRUGÍA GENERAL');
insert into especialidad (descripcion) values ('CIRUGÍA HEPATOBILIAR PANCREÁTICA');
insert into especialidad (descripcion) values ('CIRUGÍA INFANTIL');
insert into especialidad (descripcion) values ('CIRUGÍA ONCOLÓGICA');
insert into especialidad (descripcion) values ('CIRUGÍA REPARADORA');
insert into especialidad (descripcion) values ('CIRUGÍA TORÁCICA');
insert into especialidad (descripcion) values ('CIRUGÍA VASCULAR PERIFÉRICA');
insert into especialidad (descripcion) values ('CIRUGÍA Y TRAUMATOLOGÍA BUCO-MAXILO-FACIAL');
insert into especialidad (descripcion) values ('CITODIAGNÓSTICO');
insert into especialidad (descripcion) values ('CLÍNICA MÉDICA');
insert into especialidad (descripcion) values ('DENSITOMETRÍAS ÓSEAS');
insert into especialidad (descripcion) values ('DERMATOLOGÍA');
insert into especialidad (descripcion) values ('DERMATOLOGÍA INFANTIL');
insert into especialidad (descripcion) values ('DIAGNÓSTICO POR IMÁGENES');
insert into especialidad (descripcion) values ('DROGADEPENDENCIA Y ALCOHOLISMO');
insert into especialidad (descripcion) values ('ECOCARDIOGRAFÍA');
insert into especialidad (descripcion) values ('ECOCARDIOGRAFÍA INFANTIL');
insert into especialidad (descripcion) values ('ECOGRAFÍAS');
insert into especialidad (descripcion) values ('ECOGRAFÍAS INFANTILES');
insert into especialidad (descripcion) values ('ELECTROCARDIOGRAFÍA INFANTIL');
insert into especialidad (descripcion) values ('ELECTROCARDIOGRAFÍA Y ELECTROCARDIOGRAFÍA DINÁMICA');
insert into especialidad (descripcion) values ('ELECTROENCEFALOGRAFÍA');
insert into especialidad (descripcion) values ('ELECTROENCEFALOGRAFÍA INFANTIL');
insert into especialidad (descripcion) values ('ELECTROMIOGRAFÍAS');
insert into especialidad (descripcion) values ('ENDOCRINOLOGÍA Y METABOLISMO');
insert into especialidad (descripcion) values ('ENDOCRINOLOGÍA Y METABOLISMO INFANTIL');
insert into especialidad (descripcion) values ('ENDODONCIA');
insert into especialidad (descripcion) values ('ENDOSCOPÍAS DIGESTIVAS');
insert into especialidad (descripcion) values ('ENDOSCOPÍAS DIGESTIVAS PEDIÁTRICAS');
insert into especialidad (descripcion) values ('ENDOSCOPÍAS RESPIRATORIAS');
insert into especialidad (descripcion) values ('ENDOSCOPÍAS RESPIRATORIAS PEDIÁTRICAS');
insert into especialidad (descripcion) values ('ENDOSCOPÍAS UROLÓGICAS');
insert into especialidad (descripcion) values ('ERGOMETRÍAS');
insert into especialidad (descripcion) values ('ESTERILIDAD');
insert into especialidad (descripcion) values ('ESTOMATOLOGÍA');
insert into especialidad (descripcion) values ('ESTOMATOLOGÍA');
insert into especialidad (descripcion) values ('ESTUDIOS FUNCIONALES RESPIRATORIOS');
insert into especialidad (descripcion) values ('ESTUDIOS FUNCIONALES RESPIRATORIOS INFANTILES');
insert into especialidad (descripcion) values ('ESTUDIOS MAMARIOS');
insert into especialidad (descripcion) values ('FISIATRÍA');
insert into especialidad (descripcion) values ('FLEBOLOGÍA');
insert into especialidad (descripcion) values ('FONOAUDIOLOGÍA');
insert into especialidad (descripcion) values ('GASTROENTEROLOGÍA');
insert into especialidad (descripcion) values ('GASTROENTEROLOGÍA INFANTIL');
insert into especialidad (descripcion) values ('GENÉTICA MÉDICA');
insert into especialidad (descripcion) values ('GERIATRÍA');
insert into especialidad (descripcion) values ('GINECOLOGÍA');
insert into especialidad (descripcion) values ('GINECOLOGÍA INFANTO-JUVENIL');
insert into especialidad (descripcion) values ('HEMATOLOGÍA');
insert into especialidad (descripcion) values ('HEMATOLOGÍA INFANTIL');
insert into especialidad (descripcion) values ('HEMODINAMIA ADULTOS');
insert into especialidad (descripcion) values ('HEMODINAMIA INFANTIL');
insert into especialidad (descripcion) values ('HEMOSTASIA Y TROMBOSIS');
insert into especialidad (descripcion) values ('HEPATOLOGÍA');
insert into especialidad (descripcion) values ('IMPLANTOLOGÍA');
insert into especialidad (descripcion) values ('INFECTOLOGÍA');
insert into especialidad (descripcion) values ('INFECTOLOGÍA INFANTIL');
insert into especialidad (descripcion) values ('KINESIOLOGÍA - TERAPIA FÍSICA');
insert into especialidad (descripcion) values ('KINESIOLOGÍA PEDIÁTRICA');
insert into especialidad (descripcion) values ('LABORATORIO DE ANÁLISIS CLÍNICOS');
insert into especialidad (descripcion) values ('LABORATORIO DE ANÁLISIS CLÍNICOS PEDIÁTRICOS');
insert into especialidad (descripcion) values ('MEDICINA GENERAL');
insert into especialidad (descripcion) values ('MEDICINA NUCLEAR');
insert into especialidad (descripcion) values ('MEDICINA NUCLEAR INFANTIL');
insert into especialidad (descripcion) values ('MICOLOGÍA MÉDICA');
insert into especialidad (descripcion) values ('MONITOREO FETAL');
insert into especialidad (descripcion) values ('NEFROLOGÍA');
insert into especialidad (descripcion) values ('NEFROLOGÍA INFANTIL');
insert into especialidad (descripcion) values ('NEUMONOLOGÍA');
insert into especialidad (descripcion) values ('NEUMONOLOGÍA INFANTIL');
insert into especialidad (descripcion) values ('NEUROCIRUGÍA');
insert into especialidad (descripcion) values ('NEUROCIRUGÍA INFANTIL');
insert into especialidad (descripcion) values ('NEUROFISIOLOGÍA');
insert into especialidad (descripcion) values ('NEUROFISIOLOGÍA INFANTIL');
insert into especialidad (descripcion) values ('NEUROLOGÍA');
insert into especialidad (descripcion) values ('NEUROLOGÍA INFANTIL');
insert into especialidad (descripcion) values ('NEUROOFTALMOLOGÍA');
insert into especialidad (descripcion) values ('NEUROOFTALMOLOGÍA INFANTIL');
insert into especialidad (descripcion) values ('NUTRICIÓN');
insert into especialidad (descripcion) values ('NUTRICIÓN INFANTIL');
insert into especialidad (descripcion) values ('NUTRICIÓN Y DIABETOLOGÍA');
insert into especialidad (descripcion) values ('NUTRICIÓN Y DIABETOLOGÍA INFANTO-JUVENIL');
insert into especialidad (descripcion) values ('OBSTETRICIA');
insert into especialidad (descripcion) values ('ODONTOGERIATRÍA');
insert into especialidad (descripcion) values ('ODONTOLOGÍA GENERAL');
insert into especialidad (descripcion) values ('ODONTOLOGÍA PACIENTES DE ALTO RIESGO');
insert into especialidad (descripcion) values ('ODONTOLOGÍA PERSONAS CON DISCAPACIDAD');
insert into especialidad (descripcion) values ('ODONTOPEDIATRÍA');
insert into especialidad (descripcion) values ('OFTALMOLOGÍA');
insert into especialidad (descripcion) values ('OFTALMOLOGÍA INFANTIL');
insert into especialidad (descripcion) values ('ONCOLOGÍA');
insert into especialidad (descripcion) values ('ONCOLOGÍA INFANTIL');
insert into especialidad (descripcion) values ('ORTODONCIA Y ORTOPEDIA DE MAXILARES');
insert into especialidad (descripcion) values ('ORTÓPTICA');
insert into especialidad (descripcion) values ('OSTEOPATÍAS METABÓLICAS');
insert into especialidad (descripcion) values ('OTORRINOLARINGOLOGÍA');
insert into especialidad (descripcion) values ('OTORRINOLARINGOLOGÍA INFANTIL');
insert into especialidad (descripcion) values ('PATOLOGÍA MAMARIA');
insert into especialidad (descripcion) values ('PEDIATRÍA');
insert into especialidad (descripcion) values ('PERIODONCIA');
insert into especialidad (descripcion) values ('POTENCIALES EVOCADOS');
insert into especialidad (descripcion) values ('PRÁCTICA GENERAL');
insert into especialidad (descripcion) values ('PREVENCIÓN MÉDICA ESCOLAR');
insert into especialidad (descripcion) values ('PROCTOLOGÍA');
insert into especialidad (descripcion) values ('PRÓTESIS DENTAL');
insert into especialidad (descripcion) values ('PSICOLOGÍA');
insert into especialidad (descripcion) values ('PSICOPEDAGOGÍA');
insert into especialidad (descripcion) values ('PSICOPROFILAXIS DEL PARTO');
insert into especialidad (descripcion) values ('PSIQUIATRÍA');
insert into especialidad (descripcion) values ('PUNCIONES BIÓPSICAS BAJO CONTROL ECOGRÁFICO');
insert into especialidad (descripcion) values ('PUNCIONES BIÓPSICAS BAJO CONTROL TOMOGRÁFICO');
insert into especialidad (descripcion) values ('QUIMIOTERAPIA');
insert into especialidad (descripcion) values ('RADIOLOGÍA');
insert into especialidad (descripcion) values ('RADIOLOGÍA DENTAL');
insert into especialidad (descripcion) values ('RADIOLOGÍA INFANTIL');
insert into especialidad (descripcion) values ('RADIOLOGÍA MAMARIA');
insert into especialidad (descripcion) values ('RADIOTERAPIA Y TELECOBALTOTERAPIA');
insert into especialidad (descripcion) values ('REHABILITACIÓN CARDIOVASCULAR');
insert into especialidad (descripcion) values ('REHABILITACIÓN POSTURAL GLOBAL (R.P.G.)');
insert into especialidad (descripcion) values ('RESONANCIA NUCLEAR MAGNÉTICA');
insert into especialidad (descripcion) values ('REUMATOLOGÍA');
insert into especialidad (descripcion) values ('REUMATOLOGÍA INFANTIL');
insert into especialidad (descripcion) values ('SEXOLOGÍA CLÍNICA');
insert into especialidad (descripcion) values ('SEXOLOGÍA CLÍNICA');
insert into especialidad (descripcion) values ('TOMOGRAFÍA COMPUTADA');
insert into especialidad (descripcion) values ('TOXICOLOGÍA');
insert into especialidad (descripcion) values ('TRASTORNOS DE LA CONDUCTA ALIMENTARIA');
insert into especialidad (descripcion) values ('TRAUMATOLOGÍA Y ORTOPEDIA');
insert into especialidad (descripcion) values ('TRAUMATOLOGÍA Y ORTOPEDIA INFANTIL');
insert into especialidad (descripcion) values ('URODINAMIA');
insert into especialidad (descripcion) values ('UROGINECOLOGÍA');
insert into especialidad (descripcion) values ('UROLOGÍA');
insert into especialidad (descripcion) values ('UROLOGÍA INFANTIL');

insert into provincia (descripcion) values ('Ciudad de Buenos Aires');
insert into provincia (descripcion) values ('GBA Zona Norte');
insert into provincia (descripcion) values ('GBA Zona Noroeste');
insert into provincia (descripcion) values ('GBA Zona Oeste');
insert into provincia (descripcion) values ('GBA Zona Sudoeste');
insert into provincia (descripcion) values ('GBA Zona Sudeste');
insert into provincia (descripcion) values ('Buenos Aires');
insert into provincia (descripcion) values ('Catamarca');
insert into provincia (descripcion) values ('Chaco');
insert into provincia (descripcion) values ('Chubut');
insert into provincia (descripcion) values ('Córdoba');
insert into provincia (descripcion) values ('Corrientes');
insert into provincia (descripcion) values ('Entre Ríos');
insert into provincia (descripcion) values ('Formosa');
insert into provincia (descripcion) values ('Jujuy');
insert into provincia (descripcion) values ('La Pampa');
insert into provincia (descripcion) values ('La Rioja');
insert into provincia (descripcion) values ('Mendoza');
insert into provincia (descripcion) values ('Misiones');
insert into provincia (descripcion) values ('Neuquén');
insert into provincia (descripcion) values ('Río Negro');
insert into provincia (descripcion) values ('Salta');
insert into provincia (descripcion) values ('San Juan');
insert into provincia (descripcion) values ('San Luis');
insert into provincia (descripcion) values ('Santa Cruz');
insert into provincia (descripcion) values ('Santa Fe');
insert into provincia (descripcion) values ('Santiago del Estero');
insert into provincia (descripcion) values ('Tierra del Fuego');
insert into provincia (descripcion) values ('Tucumán');

insert into cobertura (descripcion) values ('ACA Salud');
insert into cobertura (descripcion) values ('Accord Salud');
insert into cobertura (descripcion) values ('AMFFA');
insert into cobertura (descripcion) values ('Bristol Medicine');
insert into cobertura (descripcion) values ('COMI');
insert into cobertura (descripcion) values ('Construir Salud');
insert into cobertura (descripcion) values ('FEMEBA Salud');
insert into cobertura (descripcion) values ('Galeno');
insert into cobertura (descripcion) values ('IOMA');
insert into cobertura (descripcion) values ('Medicus');
insert into cobertura (descripcion) values ('Medife');
insert into cobertura (descripcion) values ('MOA');
insert into cobertura (descripcion) values ('Omint');
insert into cobertura (descripcion) values ('OSALARA');
insert into cobertura (descripcion) values ('OSDE');
insert into cobertura (descripcion) values ('OSDEM');
insert into cobertura (descripcion) values ('OSDEPYM');
insert into cobertura (descripcion) values ('OSDIPP');
insert into cobertura (descripcion) values ('OSJOMN');
insert into cobertura (descripcion) values ('OSFOT');
insert into cobertura (descripcion) values ('OSPAT');
insert into cobertura (descripcion) values ('OSPEPBA');
insert into cobertura (descripcion) values ('OSPERYHRA');
insert into cobertura (descripcion) values ('OSPETAX');
insert into cobertura (descripcion) values ('OSPIA');
insert into cobertura (descripcion) values ('OSPPEA');
insert into cobertura (descripcion) values ('OSPP');
insert into cobertura (descripcion) values ('OSSdeB');
insert into cobertura (descripcion) values ('Sancor Salud');
insert into cobertura (descripcion) values ('Swiss Medical');
insert into cobertura (descripcion) values ('Union Personal');

insert into direccion (descripcion,direccion,idProvincia) values('Paraguay 1365 5° ',ST_GeomFromText('Point(-34.598163 -58.3864774)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Av. Rivadavia 5170 7° ',ST_GeomFromText('Point(-34.6193753 -58.4385179999999)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('11 de Septiembre 1702 1° ',ST_GeomFromText('Point(-34.5625298 -58.4479275)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Av. Rivadavia 5748 8° ',ST_GeomFromText('Point(-34.6227337 -58.4464893)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Sánchez de Bustamante 1434 4°',ST_GeomFromText('Point(-34.5938529 -58.412216)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Ayacucho 1053 7° ',ST_GeomFromText('Point(-34.5964801 -58.3960063)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Wenceslao Villafañe 1442',ST_GeomFromText('Point(-34.6348707 -58.3724942)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Ravignani 1966',ST_GeomFromText('Point(-34.5796529 -58.4369966999999)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values ('Av. Juan B. Alberdi 4255',ST_GeomFromText('Point(-34.6401351 -58.4853807)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Cosquín 4749',ST_GeomFromText('Point(-34.6855361 -34.6855361)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Lafinur 3090 P.B. ',ST_GeomFromText('Point(-34.5798252 -58.4139975999999)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Av. Santa Fe 3641 1° ',ST_GeomFromText('Point(-34.5855062 -58.4154116)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Santo Tomé 3740 P.B. ',ST_GeomFromText('Point(-34.6102922 -58.4965853)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Av. Alte. Brown 791 1° ',ST_GeomFromText('Point(-34.6318652 -58.3611946)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Sánchez de Bustamante 1346 P.B.',ST_GeomFromText('Point(-34.5948506999999 -58.4126391999999)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Av. Suárez 1729 7° ',ST_GeomFromText('Point(-34.638965 -58.3749634)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Aníbal Troilo 927 P.B. ',ST_GeomFromText('Point(-34.6034499 -58.4319901999999)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('José E. Uriburu 1252 P.B. ',ST_GeomFromText('Point(-34.5936677 -58.3978100999999)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Treinta y Tres Orientales 37 P.B.',ST_GeomFromText('Point(-34.6137224 -58.4248207)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Tacuarí 1077 P.B. ',ST_GeomFromText('Point(-34.6205276 -58.3787716999999)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Ayacucho 1053 7° ',ST_GeomFromText('Point(-34.5964801 -58.3960063)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Ambrosetti 139 5° ',ST_GeomFromText('Point(-34.6162246 -58.4360399)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Bulnes 1937 4° ',ST_GeomFromText('Point(-34.588817 -58.4122919)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Teodoro García 2574 P.B.',ST_GeomFromText('Point(-34.57177 -58.4471544)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Aristóbulo del Valle 1576',ST_GeomFromText('Point(-34.6360457 -58.3735211)',4326),1);
insert into direccion (descripcion,direccion,idProvincia) values('Virrey Arredondo 2474 P.B. ',ST_GeomFromText('Point(-34.5679698 -58.4514097)',4326),1);

insert into medico (nombre) values ('Dr. Berner, Enrique Daniel');
insert into medico (nombre) values ('Dr. Cialzeta, Domingo');
insert into medico (nombre) values ('Dr. Falke, Germán Osvaldo');
insert into medico (nombre) values ('Dr. Ferolla, Fausto');
insert into medico (nombre) values ('Dra. Genni, Paola');
insert into medico (nombre) values ('Dr. Girard, Gustavo');
insert into medico (nombre) values ('Dra. Grieco, Andrea Virginia');
insert into medico (nombre) values ('Dr. Llorens, Alfredo Ernesto');
insert into medico (nombre) values ('Dra. Luciani Conde, Daniela');
insert into medico (nombre) values ('Dra. Medina, Viviana Edith');
insert into medico (nombre) values ('Dr. Milberg, Francisco');
insert into medico (nombre) values ('Dra. Milgram, Laura Diana');
insert into medico (nombre) values ('Dr. Monk, Abel Enrique');
insert into medico (nombre) values ('Dra. Neme, Silvia Mabel');
insert into medico (nombre) values ('Dra. Pasqualini, Diana');
insert into medico (nombre) values ('Dr. Patto Poch, César Adrián');
insert into medico (nombre) values ('Dra. Pipman, Viviana Rebeca');
insert into medico (nombre) values ('Dra. Reboledo Casti¦eiras, Nora Estela');
insert into medico (nombre) values ('Dr. Rosenbaum, Roberto Néstor');
insert into medico (nombre) values ('Dr. Rubinstein, Héctor Eduardo');
insert into medico (nombre) values ('Dr. Sanz, Carlos Alberto y Equipo');
insert into medico (nombre) values ('Dra. Spiner, Sonia');
insert into medico (nombre) values ('Dr. Teselman, Carlos Alberto');
insert into medico (nombre) values ('Dr. Vukasovic, Jorge Basilio');
insert into medico (nombre) values ('Medicina Integral del Adolescente');

insert into medicodireccion values (1,1,'gylgroup.com_qv3cllqmsbo2pallhsshuucob4@group.calendar.google.com');
insert into medicodireccion values (2,2,'gylgroup.com_tj1hv5u112gumudgoja5g8bv3k@group.calendar.google.com');
insert into medicodireccion values (3,3,'2411plthlpphtaqpt8m0k098gc@group.calendar.google.com');
insert into medicodireccion values (4,4,'gylgroup.com_qv3cllqmsbo2pallhsshuucob4@group.calendar.google.com');
insert into medicodireccion values (5,5,'gylgroup.com_tj1hv5u112gumudgoja5g8bv3k@group.calendar.google.com');
insert into medicodireccion values (6,6,'2411plthlpphtaqpt8m0k098gc@group.calendar.google.com');
insert into medicodireccion values (7,7,'gylgroup.com_qv3cllqmsbo2pallhsshuucob4@group.calendar.google.com');
insert into medicodireccion values (8,8,'gylgroup.com_tj1hv5u112gumudgoja5g8bv3k@group.calendar.google.com');
insert into medicodireccion values (9,9,'2411plthlpphtaqpt8m0k098gc@group.calendar.google.com');
insert into medicodireccion values (10,10,'gylgroup.com_qv3cllqmsbo2pallhsshuucob4@group.calendar.google.com');
insert into medicodireccion values (11,11,'gylgroup.com_tj1hv5u112gumudgoja5g8bv3k@group.calendar.google.com');
insert into medicodireccion values (12,12,'2411plthlpphtaqpt8m0k098gc@group.calendar.google.com');
insert into medicodireccion values (13,13,'gylgroup.com_qv3cllqmsbo2pallhsshuucob4@group.calendar.google.com');
insert into medicodireccion values (14,14,'2411plthlpphtaqpt8m0k098gc@group.calendar.google.com');
insert into medicodireccion values (15,15,'gylgroup.com_qv3cllqmsbo2pallhsshuucob4@group.calendar.google.com');
insert into medicodireccion values (16,16,'gylgroup.com_tj1hv5u112gumudgoja5g8bv3k@group.calendar.google.com');
insert into medicodireccion values (17,17,'2411plthlpphtaqpt8m0k098gc@group.calendar.google.com');
insert into medicodireccion values (18,18,'gylgroup.com_qv3cllqmsbo2pallhsshuucob4@group.calendar.google.com');
insert into medicodireccion values (19,19,'gylgroup.com_tj1hv5u112gumudgoja5g8bv3k@group.calendar.google.com');
insert into medicodireccion values (20,20,'2411plthlpphtaqpt8m0k098gc@group.calendar.google.com');
insert into medicodireccion values (21,21,'gylgroup.com_qv3cllqmsbo2pallhsshuucob4@group.calendar.google.com');
insert into medicodireccion values (22,22,'gylgroup.com_tj1hv5u112gumudgoja5g8bv3k@group.calendar.google.com');
insert into medicodireccion values (23,23,'2411plthlpphtaqpt8m0k098gc@group.calendar.google.com');
insert into medicodireccion values (24,24,'gylgroup.com_qv3cllqmsbo2pallhsshuucob4@group.calendar.google.com');
insert into medicodireccion values (25,25,'gylgroup.com_tj1hv5u112gumudgoja5g8bv3k@group.calendar.google.com');
insert into medicodireccion values (25,26,'2411plthlpphtaqpt8m0k098gc@group.calendar.google.com');

insert into telefono (iddireccion,telefono) values (1,'+5491131873306');
insert into telefono (iddireccion,telefono) values (2,'+5491131873306');
insert into telefono (iddireccion,telefono) values (3,'+5491131873306');
insert into telefono (iddireccion,telefono) values (4,'+5491131873306');
insert into telefono (iddireccion,telefono) values (5,'+5491131873306');
insert into telefono (iddireccion,telefono) values (6,'+5491131873306');
insert into telefono (iddireccion,telefono) values (7,'+5491131873306');
insert into telefono (iddireccion,telefono) values (8,'+5491131873306');
insert into telefono (iddireccion,telefono) values (9,'+5491131873306');
insert into telefono (iddireccion,telefono) values (10,'+5491131873306');
insert into telefono (iddireccion,telefono) values (11,'+5491131873306');
insert into telefono (iddireccion,telefono) values (12,'+5491131873306');
insert into telefono (iddireccion,telefono) values (13,'+5491131873306');
insert into telefono (iddireccion,telefono) values (14,'+5491131873306');
insert into telefono (iddireccion,telefono) values (15,'+5491131873306');
insert into telefono (iddireccion,telefono) values (16,'+5491131873306');
insert into telefono (iddireccion,telefono) values (17,'+5491131873306');
insert into telefono (iddireccion,telefono) values (18,'+5491131873306');
insert into telefono (iddireccion,telefono) values (19,'+5491131873306');
insert into telefono (iddireccion,telefono) values (20,'+5491131873306');
insert into telefono (iddireccion,telefono) values (21,'+5491131873306');
insert into telefono (iddireccion,telefono) values (22,'+5491131873306');
insert into telefono (iddireccion,telefono) values (23,'+5491131873306');
insert into telefono (iddireccion,telefono) values (24,'+5491131873306');
insert into telefono (iddireccion,telefono) values (25,'+5491131873306');
insert into telefono (iddireccion,telefono) values (26,'+5491131873306');
insert into telefono (iddireccion,telefono) values (1,'‪+54 9 11 3819-1620‬');
insert into telefono (iddireccion,telefono) values (2,'‪+54 9 11 3819-1620‬');
insert into telefono (iddireccion,telefono) values (3,'‪+54 9 11 3819-1620‬');
insert into telefono (iddireccion,telefono) values (4,'‪+54 9 11 3819-1620‬');
insert into telefono (iddireccion,telefono) values (16,'‪+54 9 11 3819-1620‬');
insert into telefono (iddireccion,telefono) values (17,'‪+54 9 11 3819-1620‬');
insert into telefono (iddireccion,telefono) values (18,'‪+54 9 11 3819-1620‬');
insert into telefono (iddireccion,telefono) values (19,'‪+54 9 11 3819-1620‬');
insert into telefono (iddireccion,telefono) values (20,'‪+54 9 11 3819-1620‬');
insert into telefono (iddireccion,telefono) values (21,'‪+54 9 11 3819-1620‬');
insert into telefono (iddireccion,telefono) values (22,'‪+54 9 11 3819-1620‬');
insert into telefono (iddireccion,telefono) values (23,'‪+54 9 11 3819-1620‬');
insert into telefono (iddireccion,telefono) values (24,'‪+54 9 11 3819-1620‬');
insert into telefono (iddireccion,telefono) values (25,'‪+54 9 11 3819-1620‬');
insert into telefono (iddireccion,telefono) values (26,'‪+54 9 11 3819-1620‬');


insert into medicoespecialidad select m.id,e.id from medico m cross join especialidad e where m.id%e.id=0;
insert into medicocobertura select m.id,c.id from medico m cross join cobertura c  where m.id%c.id=0;

create table agenda (
     id serial primary key,
     agenda varchar(500) ,
     iddireccion int references direccion(id)
);
insert into agenda (agenda,iddireccion) select agenda,iddireccion from medicodireccion;
alter table medicodireccion drop column agenda;
alter table medico add column turnoEnMin int default 60;
update medico set turnoEnMin=30 where id=1;

create table turno (
    id serial primary key,
    idmedico int references medico(id),
    paciente varchar(500),
    fechahora timestamp
);
//cialzeta
insert into agenda (agenda,iddireccion) select distinct agenda,2 from agenda where agenda like '241%';

