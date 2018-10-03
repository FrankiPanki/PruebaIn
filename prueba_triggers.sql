insert into usuraio (correo,nombre,direccion,fecha_nacimiendo,numero,username,tipoUsuario,contrasena)
values ('frank@frank','frank', 'frankopolis', '1996-01-08',312215,'frankProfe','profesor','frank');

insert into horario (dia,hora_inicio,hora_fin,h_idProfesor) 
values ('lunes', '12:00:00' ,'13:00:00',1);

delete from usuraio where contrasena='frank';


call prueba();

truncate table resena;
truncate table usuraio;



select * from usuraio;
select * from alumno;
select * from profesor;
select * from resena;
select * from horario;
drop trigger if exists tipoUsuario_creacion;
drop trigger if exists usuario_calificacion;

update usuraio 
	set calificacion = 0
	where contrasena = 'frank';

insert into resena (comentario,calificacion,r_idUsuario)
values ('le hecha ganas',5,'frank');

insert into resena (comentario,calificacion,r_idUsuario)
values ('le hecha ganas x2',2,'frank');

insert into resena (comentario,calificacion,r_idUsuario)
values ('le hecha ganas x7',0,'frankProfe');