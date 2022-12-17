CREATE DATABASE VEHICULOS

USE VEHICULOS

create table Usuarios(
IdUsuario int identity,
Usuario varchar(50) unique,
Clave varchar(30),
Nombre varchar(50),
Apedillo varchar(50),
constraint pk_idUsuario primary key (IdUsuario));



create table Placa (
IdPlaca int identity,
NumPlaca varchar(6) unique,
IdUsuario int,
Monto money default 0,
constraint pk_idPlaca primary key (IdPlaca),
constraint fk_id_Usuario foreign key (IdUsuario) references Usuarios);

--Store Procedure USUARIOS
CREATE PROCEDURE [DBO].[SP_READ_Usuarios]
AS
BEGIN
SELECT [IdUsuario]
      ,[Usuario]
      ,[Clave]
	  ,[Nombre]
	  ,[Apedillo]
  FROM [dbo].[Usuarios]
END
GO

CREATE PROCEDURE [DBO].[SP_INSERT_Usuarios]
(
			@ID_Usuario int
           ,@Usuario varchar
		   ,@Clave varchar
           ,@Nombre varchar
		   ,@Apedillo varchar
		   )
AS
BEGIN
INSERT INTO [dbo].[Usuarios]
           ([IdUsuario]
		   ,[Usuario]
		   ,[Clave]
		   ,[Nombre]
		   ,[Apedillo])
     VALUES
           (@ID_Usuario 
           ,@Usuario 
		   ,@Clave 
           ,@Nombre 
		   ,@Apedillo)
END
GO

CREATE PROCEDURE [DBO].[SP_UPDATE_Usuario]
(
			@ID_Usuario int
           ,@Usuario varchar
		   ,@Clave varchar
           ,@Nombre varchar
		   ,@Apedillo varchar
)
AS
BEGIN
UPDATE [dbo].[Usuarios]
   SET [Usuario] = @Usuario
		   ,[Clave] = @Clave
		   ,[Nombre] = @Nombre
		   ,[Apedillo] = @Apedillo
 WHERE [IdUsuario] = @ID_Usuario
END
GO

CREATE PROCEDURE [DBO].[SP_DELETE_Usuario]
(
		   @ID_Usuario int
           ,@Usuario varchar
		   ,@Clave varchar
           ,@Nombre varchar
		   ,@Apedillo varchar
)
AS
BEGIN
DELETE [dbo].[Usuarios]
 WHERE [IdUsuario] = @ID_Usuario
END
GO

--PROCEDURES PLACA
CREATE PROCEDURE [DBO].[SP_READ_PLACA]
AS
BEGIN
SELECT [IdPlaca]
      ,[NumPlaca]
      ,[IdUsuario]
	  ,[Monto]
  FROM [dbo].[Placa]
END
GO

CREATE PROCEDURE [DBO].[SP_INSERT_PLACA]
(
			@ID_placa int
           ,@NUM_placa varchar
		   ,@ID_usuario INT
           ,@Monto money
		   )
AS
BEGIN
INSERT INTO [dbo].[Placa]
           ([IdPlaca]
		   ,[NumPlaca]
           ,[IdUsuario]
	       ,[Monto])
     VALUES
           (@ID_placa
           ,@NUM_placa
		   ,@ID_usuario
           ,@Monto)
END
GO

CREATE PROCEDURE [DBO].[SP_UPDATE_Placa]
(
			@ID_placa int
           ,@NUM_placa varchar
		   ,@ID_usuario INT
           ,@Monto money
)
AS
BEGIN
UPDATE [dbo].[Placa]
   SET [NumPlaca] = @NUM_placa
      ,[IdUsuario] = @ID_usuario
      ,[Monto] = @Monto
 WHERE [IdPlaca] = @ID_placa
END
GO

CREATE PROCEDURE [DBO].[SP_DELETE_Placa]
(
			@ID_placa int
           ,@NUM_placa varchar
		   ,@ID_usuario INT
           ,@Monto money
)
AS
BEGIN
DELETE [dbo].[Placa]
 WHERE [IdPlaca] = @ID_placa
END
GO

