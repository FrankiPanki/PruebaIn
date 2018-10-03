DELIMITER %%
create procedure prueba()
	begin
		truncate table resena;
        drop trigger if exists usuario_calificacion;
        update usuraio 
			set calificacion = 0
			where contrasena = 'frank';
	end;%%
DELIMITER ;