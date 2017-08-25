
create table agenda (
     id serial primary key,
     agenda varchar(500) ,
     iddireccion int references direccion(id)
);
insert into agenda (agenda,iddireccion) select agenda,iddireccion from medicodireccion;
alter table medicodireccion drop column agenda;
alter table medico add column turnoEnMin int default 60;