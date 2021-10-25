USE [master]
GO
/****** Object:  Database [dbEMPRESA]    Script Date: 19/10/2021 17:02:45 ******/
CREATE DATABASE [dbEMPRESA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbEMPRESA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbEMPRESA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbEMPRESA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbEMPRESA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbEMPRESA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbEMPRESA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbEMPRESA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbEMPRESA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbEMPRESA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbEMPRESA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbEMPRESA] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbEMPRESA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbEMPRESA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbEMPRESA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbEMPRESA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbEMPRESA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbEMPRESA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbEMPRESA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbEMPRESA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbEMPRESA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbEMPRESA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbEMPRESA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbEMPRESA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbEMPRESA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbEMPRESA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbEMPRESA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbEMPRESA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbEMPRESA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbEMPRESA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbEMPRESA] SET  MULTI_USER 
GO
ALTER DATABASE [dbEMPRESA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbEMPRESA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbEMPRESA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbEMPRESA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbEMPRESA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbEMPRESA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbEMPRESA] SET QUERY_STORE = OFF
GO
USE [dbEMPRESA]
GO
/****** Object:  UserDefinedTableType [dbo].[DetalleVenta]    Script Date: 19/10/2021 17:02:46 ******/
CREATE TYPE [dbo].[DetalleVenta] AS TABLE(
	[id] [int] NOT NULL,
	[idProducto] [int] NULL,
	[cantidad] [varchar](45) NULL,
	[precio_unitarui] [decimal](8, 2) NULL,
	PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 19/10/2021 17:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[idCliente] [int] NOT NULL,
	[nombres] [varchar](60) NULL,
	[apellidos] [varchar](60) NULL,
	[nit] [varchar](12) NULL,
	[genero] [varchar](1) NULL,
	[telefono] [varchar](25) NULL,
	[correo] [varchar](45) NULL,
	[fecha_ingreso] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPRAS]    Script Date: 19/10/2021 17:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRAS](
	[idCompra] [int] IDENTITY(1,1) NOT NULL,
	[no_orden_compra] [int] NULL,
	[idProveedor] [int] NOT NULL,
	[fecha_orden] [date] NULL,
	[fechaingreso] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPRAS_DETALLE]    Script Date: 19/10/2021 17:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRAS_DETALLE](
	[idCompra_detalle] [int] IDENTITY(1,1) NOT NULL,
	[idCompra] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_costo_unitario] [decimal](8, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCompra_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLEADOS]    Script Date: 19/10/2021 17:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADOS](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NULL,
	[apellido] [varchar](60) NULL,
	[direccion] [varchar](80) NULL,
	[telefono] [varchar](25) NULL,
	[DPI] [varchar](15) NULL,
	[genero] [varchar](1) NULL,
	[fecha_nacimiento] [date] NULL,
	[idPuesto] [int] NULL,
	[fecha_inicio_labores] [date] NULL,
	[fechaingreso] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCAS]    Script Date: 19/10/2021 17:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCAS](
	[idMarca] [int] NOT NULL,
	[marca] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 19/10/2021 17:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTOS](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[producto] [varchar](50) NULL,
	[idMarca] [int] NOT NULL,
	[descripcion] [varchar](100) NULL,
	[imagen] [varchar](30) NULL,
	[precio_costo] [decimal](8, 2) NULL,
	[precio_venta] [decimal](8, 2) NULL,
	[existencia] [int] NOT NULL,
	[fecha_ingreso] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVEEDORES]    Script Date: 19/10/2021 17:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDORES](
	[idProveedor] [int] IDENTITY(1,1) NOT NULL,
	[proveedor] [varchar](60) NULL,
	[nit] [varchar](12) NULL,
	[direccion] [varchar](80) NULL,
	[telefono] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PUESTOS]    Script Date: 19/10/2021 17:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PUESTOS](
	[idPuesto] [int] NOT NULL,
	[puesto1] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTAS]    Script Date: 19/10/2021 17:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTAS](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[nofactura] [int] NOT NULL,
	[serie] [varchar](1) NULL,
	[fechafactura] [date] NULL,
	[idCliente] [int] NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[fechaingreso] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTAS_DETALLE]    Script Date: 19/10/2021 17:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTAS_DETALLE](
	[idVenta_detalle] [int] IDENTITY(1,1) NOT NULL,
	[idVenta] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[cantidad] [varchar](45) NULL,
	[precio_unitarui] [decimal](8, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idVenta_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EMPLEADOS] ON 

INSERT [dbo].[EMPLEADOS] ([idEmpleado], [nombre], [apellido], [direccion], [telefono], [DPI], [genero], [fecha_nacimiento], [idPuesto], [fecha_inicio_labores], [fechaingreso]) VALUES (1, N'EDGAR', N'DARDON', N'ZONA 6', N'56461028', N'2399519990101', N'M', CAST(N'1993-02-14' AS Date), 1, CAST(N'2021-10-18' AS Date), CAST(N'2021-10-19T00:00:00.000' AS DateTime))
INSERT [dbo].[EMPLEADOS] ([idEmpleado], [nombre], [apellido], [direccion], [telefono], [DPI], [genero], [fecha_nacimiento], [idPuesto], [fecha_inicio_labores], [fechaingreso]) VALUES (2, N'MARIO', N'DARDON', N'ZONA 6', N'56461028', N'2399519990102', N'M', CAST(N'1993-02-14' AS Date), 1, CAST(N'2021-10-18' AS Date), CAST(N'2021-10-19T16:58:08.070' AS DateTime))
SET IDENTITY_INSERT [dbo].[EMPLEADOS] OFF
GO
INSERT [dbo].[MARCAS] ([idMarca], [marca]) VALUES (1, N'Asus')
INSERT [dbo].[MARCAS] ([idMarca], [marca]) VALUES (2, N'Mac')
INSERT [dbo].[MARCAS] ([idMarca], [marca]) VALUES (3, N'Mac')
GO
SET IDENTITY_INSERT [dbo].[PRODUCTOS] ON 

INSERT [dbo].[PRODUCTOS] ([idProducto], [producto], [idMarca], [descripcion], [imagen], [precio_costo], [precio_venta], [existencia], [fecha_ingreso]) VALUES (1, N'Laptop', 2, N'Gaming', N'imagen', CAST(10000.00 AS Decimal(8, 2)), CAST(110000.00 AS Decimal(8, 2)), 10, N'2021-10-19')
INSERT [dbo].[PRODUCTOS] ([idProducto], [producto], [idMarca], [descripcion], [imagen], [precio_costo], [precio_venta], [existencia], [fecha_ingreso]) VALUES (2, N'Tablet samsung', 3, NULL, NULL, CAST(0.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), 0, NULL)
INSERT [dbo].[PRODUCTOS] ([idProducto], [producto], [idMarca], [descripcion], [imagen], [precio_costo], [precio_venta], [existencia], [fecha_ingreso]) VALUES (3, N'Tablet A7', 1, NULL, NULL, CAST(0.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), 0, NULL)
SET IDENTITY_INSERT [dbo].[PRODUCTOS] OFF
GO
INSERT [dbo].[PUESTOS] ([idPuesto], [puesto1]) VALUES (1, N'Gerente')
INSERT [dbo].[PUESTOS] ([idPuesto], [puesto1]) VALUES (2, N'comprador')
GO
ALTER TABLE [dbo].[COMPRAS]  WITH CHECK ADD  CONSTRAINT [FK_PROVEEDOR] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[PROVEEDORES] ([idProveedor])
GO
ALTER TABLE [dbo].[COMPRAS] CHECK CONSTRAINT [FK_PROVEEDOR]
GO
ALTER TABLE [dbo].[COMPRAS_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_COMPRA] FOREIGN KEY([idCompra])
REFERENCES [dbo].[COMPRAS] ([idCompra])
GO
ALTER TABLE [dbo].[COMPRAS_DETALLE] CHECK CONSTRAINT [FK_COMPRA]
GO
ALTER TABLE [dbo].[COMPRAS_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO] FOREIGN KEY([idProducto])
REFERENCES [dbo].[PRODUCTOS] ([idProducto])
GO
ALTER TABLE [dbo].[COMPRAS_DETALLE] CHECK CONSTRAINT [FK_PRODUCTO]
GO
ALTER TABLE [dbo].[EMPLEADOS]  WITH CHECK ADD  CONSTRAINT [FK_PUESTOS] FOREIGN KEY([idPuesto])
REFERENCES [dbo].[PUESTOS] ([idPuesto])
GO
ALTER TABLE [dbo].[EMPLEADOS] CHECK CONSTRAINT [FK_PUESTOS]
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_MARCARS] FOREIGN KEY([idMarca])
REFERENCES [dbo].[MARCAS] ([idMarca])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_MARCARS]
GO
ALTER TABLE [dbo].[VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTES] FOREIGN KEY([idCliente])
REFERENCES [dbo].[CLIENTES] ([idCliente])
GO
ALTER TABLE [dbo].[VENTAS] CHECK CONSTRAINT [FK_CLIENTES]
GO
ALTER TABLE [dbo].[VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADO] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[EMPLEADOS] ([idEmpleado])
GO
ALTER TABLE [dbo].[VENTAS] CHECK CONSTRAINT [FK_EMPLEADO]
GO
ALTER TABLE [dbo].[VENTAS_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS] FOREIGN KEY([idProducto])
REFERENCES [dbo].[PRODUCTOS] ([idProducto])
GO
ALTER TABLE [dbo].[VENTAS_DETALLE] CHECK CONSTRAINT [FK_PRODUCTOS]
GO
ALTER TABLE [dbo].[VENTAS_DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_VENTAS] FOREIGN KEY([idVenta])
REFERENCES [dbo].[VENTAS] ([idVenta])
GO
ALTER TABLE [dbo].[VENTAS_DETALLE] CHECK CONSTRAINT [FK_VENTAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_CLIENTES]    Script Date: 19/10/2021 17:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_CLIENTES]
	@idcliente int,
	@nombres varchar(60),
@apellidos varchar(60),
@nit varchar (12),
@genero varchar(1),
@telefono varchar(25),
@correo varchar(45),
@fecha_ingreso DateTime,
@OPC int


AS
BEGIN TRAN
	
	IF(@OPC = 1) --Insert
	BEGIN
		
				SET @idcliente = (SELECT COUNT(*) FROM CLIENTES) + 1


		INSERT INTO CLIENTES(idCliente,nombres,apellidos,nit,genero,telefono,correo,fecha_ingreso)
			           VALUES(@idcliente,@nombres,@apellidos,@nit,@genero,@telefono,@correo,@fecha_ingreso)

		SELECT * FROM CLIENTES WHERE idCliente=@idcliente

	END
	ELSE IF(@OPC = 2) --Update
	BEGIN
		IF (@idcliente = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Puesto invalido',16,1);	
			RETURN
		END

		UPDATE CLIENTES SET nombres=@nombres, apellidos=@apellidos, nit=@nit, genero=@genero, telefono=@telefono, correo=@correo
						   
						WHERE idCliente=@idcliente

		SELECT * FROM CLIENTES WHERE idCliente=@idcliente
	END
	ELSE IF(@OPC = 3) --Delete
	BEGIN
		IF (@idcliente = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Puesto Invalido !!!~',16,1);	
			RETURN
		END

		DELETE FROM CLIENTES WHERE idCliente=@idcliente
	END
COMMIT TRAN
GO
/****** Object:  StoredProcedure [dbo].[SP_EMPLEADOS]    Script Date: 19/10/2021 17:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EMPLEADOS]
@idEmpleado int=0,
@nombre varchar(60),
@apellido varchar(60),
@direccion varchar(80),
@telefono varchar(25),
@DPI varchar(15),
@genero varchar(1),
@fecha_nacimiento Date,
@idPuesto int,
@fecha_inicio_labores Date,
@fechaingreso DateTime,
	@OPC int,
	@cMensaje VARCHAR(100) OUTPUT

AS
BEGIN TRAN
	
	IF(@OPC = 1) --Insert
	BEGIN
		IF EXISTS(SELECT 1 FROM EMPLEADOS WHERE DPI = @DPI)
 BEGIN
	SET @cMensaje = 'El DPI  ya existe';
 END
 ELSE
				

		INSERT INTO EMPLEADOS(nombre,apellido,direccion,telefono,DPI,genero,fecha_nacimiento,idPuesto,fecha_inicio_labores,fechaingreso)output 
		inserted.idEmpleado, inserted.nombre,inserted.apellido,inserted.direccion,inserted.telefono,inserted.DPI,
		inserted.genero,inserted.fecha_nacimiento,inserted.idPuesto,inserted.fecha_inicio_labores,inserted.fechaingreso
			           VALUES(@nombre,@apellido,@direccion,@telefono,@DPI,@genero,@fecha_nacimiento,@idPuesto,@fecha_inicio_labores,GETDATE())

		
	END
	ELSE IF(@OPC = 2) --Update
	BEGIN
		IF (@idEmpleado = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Producto invalido',16,1);	
			RETURN
		END

		UPDATE EMPLEADOS SET nombre=@nombre,
							 apellido=@apellido,
							 direccion=@direccion,
							 telefono=@telefono,
							 DPI=@DPI,
							 genero=@genero,
							 @fecha_nacimiento=@fecha_nacimiento,
							 idPuesto=@idPuesto,
							 fecha_inicio_labores=@fecha_inicio_labores,
							 fechaingreso=@fechaingreso
						output 
		inserted.idEmpleado, inserted.nombre,inserted.apellido,inserted.direccion,inserted.telefono,inserted.DPI,
		inserted.genero,inserted.fecha_nacimiento,inserted.idPuesto,inserted.fecha_inicio_labores,inserted.fechaingreso
						WHERE idEmpleado=@idEmpleado਍ഀ਀ऀऀഀ਀ऀ䔀一䐀ഀ਀ऀ䔀䰀匀䔀 䤀䘀⠀䀀伀倀䌀 㴀 ㌀⤀ ⴀⴀ䐀攀氀攀琀攀ഀ਀ऀ䈀䔀䜀䤀一ഀ਀ऀऀ䤀䘀 ⠀䀀椀搀䔀洀瀀氀攀愀搀漀 㴀 　⤀ഀ਀ऀऀ䈀䔀䜀䤀一ഀ਀ऀऀऀ刀伀䰀䰀䈀䄀䌀䬀ഀ਀ऀऀऀऀ刀䄀䤀匀䔀刀刀伀刀 ⠀一✀倀爀漀瘀攀攀搀漀爀 䤀渀瘀愀氀椀搀漀 ℀℀℀縀✀Ⰰ㄀㘀Ⰰ㄀⤀㬀ऀഀ਀ऀऀऀ刀䔀吀唀刀一ഀ਀ऀऀ䔀一䐀ഀ਀ഀ਀ऀऀ䐀䔀䰀䔀吀䔀 䘀刀伀䴀 䔀䴀倀䰀䔀䄀䐀伀匀 圀䠀䔀刀䔀 椀搀䔀洀瀀氀攀愀搀漀㴀䀀椀搀䔀洀瀀氀攀愀搀漀ഀ਀ऀ䔀一䐀ഀ਀䌀伀䴀䴀䤀吀 吀刀䄀一ഀ਀䜀伀ഀ਀⼀⨀⨀⨀⨀⨀⨀ 伀戀樀攀挀琀㨀  匀琀漀爀攀搀倀爀漀挀攀搀甀爀攀 嬀搀戀漀崀⸀嬀匀倀开䴀䄀刀䌀䄀匀崀    匀挀爀椀瀀琀 䐀愀琀攀㨀 ㄀㤀⼀㄀　⼀㈀　㈀㄀ ㄀㜀㨀　㈀㨀㐀㘀 ⨀⨀⨀⨀⨀⨀⼀ഀ਀匀䔀吀 䄀一匀䤀开一唀䰀䰀匀 伀一ഀ਀䜀伀ഀ਀匀䔀吀 儀唀伀吀䔀䐀开䤀䐀䔀一吀䤀䘀䤀䔀刀 伀一ഀ਀䜀伀ഀ਀ഀ਀䌀刀䔀䄀吀䔀 倀刀伀䌀䔀䐀唀刀䔀 嬀搀戀漀崀⸀嬀匀倀开䴀䄀刀䌀䄀匀崀ഀ਀ऀ䀀椀搀洀愀爀挀愀 椀渀琀Ⰰഀ਀ऀ䀀洀愀爀挀愀 瘀愀爀挀栀愀爀⠀㔀　⤀Ⰰഀ਀ऀ䀀伀倀䌀 椀渀琀ഀ਀ഀ਀䄀匀ഀ਀䈀䔀䜀䤀一 吀刀䄀一ഀ਀ऀഀ਀ऀ䤀䘀⠀䀀伀倀䌀 㴀 ㄀⤀ ⴀⴀ䤀渀猀攀爀琀ഀ਀ऀ䈀䔀䜀䤀一ഀ਀ऀऀഀ਀ऀऀऀऀ匀䔀吀 䀀椀搀洀愀爀挀愀 㴀 ⠀匀䔀䰀䔀䌀吀 䌀伀唀一吀⠀⨀⤀ 䘀刀伀䴀 䴀䄀刀䌀䄀匀⤀ ⬀ ㄀ഀ਀ഀ਀ഀ਀ऀऀ䤀一匀䔀刀吀 䤀一吀伀 䴀䄀刀䌀䄀匀⠀椀搀䴀愀爀挀愀Ⰰ洀愀爀挀愀⤀ഀ਀ऀऀऀ           嘀䄀䰀唀䔀匀⠀䀀椀搀洀愀爀挀愀Ⰰ䀀洀愀爀挀愀⤀ഀ਀ഀ਀ऀऀ匀䔀䰀䔀䌀吀 ⨀ 䘀刀伀䴀 䴀䄀刀䌀䄀匀 圀䠀䔀刀䔀 椀搀䴀愀爀挀愀㴀䀀椀搀洀愀爀挀愀ഀ਀ഀ਀ऀ䔀一䐀ഀ਀ऀ䔀䰀匀䔀 䤀䘀⠀䀀伀倀䌀 㴀 ㈀⤀ ⴀⴀ唀瀀搀愀琀攀ഀ਀ऀ䈀䔀䜀䤀一ഀ਀ऀऀ䤀䘀 ⠀䀀椀搀洀愀爀挀愀 㴀 　⤀ഀ਀ऀऀ䈀䔀䜀䤀一ഀ਀ऀऀऀ刀伀䰀䰀䈀䄀䌀䬀ഀ਀ऀऀऀऀ刀䄀䤀匀䔀刀刀伀刀 ⠀一✀倀甀攀猀琀漀 椀渀瘀愀氀椀搀漀✀Ⰰ㄀㘀Ⰰ㄀⤀㬀ऀഀ਀ऀऀऀ刀䔀吀唀刀一ഀ਀ऀऀ䔀一䐀ഀ਀ഀ਀ऀऀ唀倀䐀䄀吀䔀 䴀䄀刀䌀䄀匀 匀䔀吀 洀愀爀挀愀㴀䀀洀愀爀挀愀ഀ਀ऀऀऀऀऀऀ   ഀ਀ऀऀऀऀऀऀ圀䠀䔀刀䔀 椀搀䴀愀爀挀愀㴀䀀椀搀洀愀爀挀愀ഀ਀ഀ਀ऀऀ匀䔀䰀䔀䌀吀 ⨀ 䘀刀伀䴀 䴀䄀刀䌀䄀匀 圀䠀䔀刀䔀 椀搀䴀愀爀挀愀㴀䀀椀搀洀愀爀挀愀ഀ਀ऀ䔀一䐀ഀ਀ऀ䔀䰀匀䔀 䤀䘀⠀䀀伀倀䌀 㴀 ㌀⤀ ⴀⴀ䐀攀氀攀琀攀ഀ਀ऀ䈀䔀䜀䤀一ഀ਀ऀऀ䤀䘀 ⠀䀀椀搀洀愀爀挀愀 㴀 　⤀ഀ਀ऀऀ䈀䔀䜀䤀一ഀ਀ऀऀऀ刀伀䰀䰀䈀䄀䌀䬀ഀ਀ऀऀऀऀ刀䄀䤀匀䔀刀刀伀刀 ⠀一✀倀甀攀猀琀漀 䤀渀瘀愀氀椀搀漀 ℀℀℀縀✀Ⰰ㄀㘀Ⰰ㄀⤀㬀ऀഀ਀ऀऀऀ刀䔀吀唀刀一ഀ਀ऀऀ䔀一䐀ഀ਀ഀ਀ऀऀ䐀䔀䰀䔀吀䔀 䘀刀伀䴀 䴀䄀刀䌀䄀匀 圀䠀䔀刀䔀 椀搀䴀愀爀挀愀㴀䀀椀搀洀愀爀挀愀ഀ਀ऀ䔀一䐀ഀ਀䌀伀䴀䴀䤀吀 吀刀䄀一ഀ਀䜀伀ഀ਀⼀⨀⨀⨀⨀⨀⨀ 伀戀樀攀挀琀㨀  匀琀漀爀攀搀倀爀漀挀攀搀甀爀攀 嬀搀戀漀崀⸀嬀匀倀开倀刀伀䐀唀䌀吀伀匀崀    匀挀爀椀瀀琀 䐀愀琀攀㨀 ㄀㤀⼀㄀　⼀㈀　㈀㄀ ㄀㜀㨀　㈀㨀㐀㘀 ⨀⨀⨀⨀⨀⨀⼀ഀ਀匀䔀吀 䄀一匀䤀开一唀䰀䰀匀 伀一ഀ਀䜀伀ഀ਀匀䔀吀 儀唀伀吀䔀䐀开䤀䐀䔀一吀䤀䘀䤀䔀刀 伀一ഀ਀䜀伀ഀ਀䌀刀䔀䄀吀䔀 倀刀伀䌀䔀䐀唀刀䔀 嬀搀戀漀崀⸀嬀匀倀开倀刀伀䐀唀䌀吀伀匀崀ഀ਀䀀椀搀倀爀漀搀甀挀琀漀 椀渀琀㴀　Ⰰഀ਀䀀瀀爀漀搀甀挀琀漀 瘀愀爀挀栀愀爀⠀㔀　⤀Ⰰഀ਀䀀椀搀䴀愀爀挀愀 椀渀琀Ⰰഀ਀䀀搀攀猀挀爀椀瀀挀椀漀渀 瘀愀爀挀栀愀爀⠀㄀　　⤀Ⰰഀ਀䀀椀洀愀最攀渀 瘀愀爀挀栀愀爀⠀㌀　⤀Ⰰഀ਀䀀瀀爀攀挀椀漀开挀漀猀琀漀 䐀攀挀椀洀愀氀⠀㠀Ⰰ㈀⤀Ⰰഀ਀䀀瀀爀攀挀椀漀开瘀攀渀琀愀 䐀攀挀椀洀愀氀⠀㠀Ⰰ㈀⤀Ⰰഀ਀䀀攀砀椀猀琀攀渀挀椀愀 椀渀琀 Ⰰഀ਀䀀昀攀挀栀愀开椀渀最爀攀猀漀 瘀愀爀挀栀愀爀⠀㐀㔀⤀Ⰰഀ਀ऀ䀀伀倀䌀 椀渀琀Ⰰഀ਀ऀ䀀挀䴀攀渀猀愀樀攀 嘀䄀刀䌀䠀䄀刀⠀㄀　　⤀ 伀唀吀倀唀吀ഀ਀ഀ਀䄀匀ഀ਀䈀䔀䜀䤀一 吀刀䄀一ഀ਀ऀഀ਀ऀ䤀䘀⠀䀀伀倀䌀 㴀 ㄀⤀ ⴀⴀ䤀渀猀攀爀琀ഀ਀ऀ䈀䔀䜀䤀一ഀ਀ऀऀ䤀䘀 䔀堀䤀匀吀匀⠀匀䔀䰀䔀䌀吀 ㄀ 䘀刀伀䴀 倀刀伀䐀唀䌀吀伀匀 圀䠀䔀刀䔀 瀀爀漀搀甀挀琀漀 㴀 䀀瀀爀漀搀甀挀琀漀⤀ഀ਀ 䈀䔀䜀䤀一ഀ਀ऀ匀䔀吀 䀀挀䴀攀渀猀愀樀攀 㴀 ✀䔀氀 瀀爀漀搀甀挀琀漀  礀愀 攀砀椀猀琀攀✀㬀ഀ਀ 䔀一䐀ഀ਀ 䔀䰀匀䔀ഀ਀ऀऀऀऀഀ਀ഀ਀ऀऀ䤀一匀䔀刀吀 䤀一吀伀 倀刀伀䐀唀䌀吀伀匀⠀瀀爀漀搀甀挀琀漀Ⰰ椀搀䴀愀爀挀愀Ⰰ搀攀猀挀爀椀瀀挀椀漀渀Ⰰ椀洀愀最攀渀Ⰰ瀀爀攀挀椀漀开挀漀猀琀漀Ⰰ瀀爀攀挀椀漀开瘀攀渀琀愀Ⰰ攀砀椀猀琀攀渀挀椀愀Ⰰ昀攀挀栀愀开椀渀最爀攀猀漀⤀漀甀琀瀀甀琀 椀渀猀攀爀琀攀搀⸀椀搀倀爀漀搀甀挀琀漀Ⰰ ഀ਀ऀऀ椀渀猀攀爀琀攀搀⸀瀀爀漀搀甀挀琀漀Ⰰ椀渀猀攀爀琀攀搀⸀椀搀䴀愀爀挀愀ഀ਀ऀऀऀ           嘀䄀䰀唀䔀匀⠀䀀瀀爀漀搀甀挀琀漀Ⰰ䀀椀搀䴀愀爀挀愀Ⰰ䀀搀攀猀挀爀椀瀀挀椀漀渀Ⰰ䀀椀洀愀最攀渀Ⰰ䀀瀀爀攀挀椀漀开挀漀猀琀漀Ⰰ䀀瀀爀攀挀椀漀开瘀攀渀琀愀Ⰰ䀀攀砀椀猀琀攀渀挀椀愀Ⰰ䀀昀攀挀栀愀开椀渀最爀攀猀漀⤀ഀ਀ഀ਀ऀऀഀ਀ऀ䔀一䐀ഀ਀ऀ䔀䰀匀䔀 䤀䘀⠀䀀伀倀䌀 㴀 ㈀⤀ ⴀⴀ唀瀀搀愀琀攀ഀ਀ऀ䈀䔀䜀䤀一ഀ਀ऀऀ䤀䘀 ⠀䀀椀搀倀爀漀搀甀挀琀漀 㴀 　⤀ഀ਀ऀऀ䈀䔀䜀䤀一ഀ਀ऀऀऀ刀伀䰀䰀䈀䄀䌀䬀ഀ਀ऀऀऀऀ刀䄀䤀匀䔀刀刀伀刀 ⠀一✀倀爀漀搀甀挀琀漀 椀渀瘀愀氀椀搀漀✀Ⰰ㄀㘀Ⰰ㄀⤀㬀ऀഀ਀ऀऀऀ刀䔀吀唀刀一ഀ਀ऀऀ䔀一䐀ഀ਀ഀ਀ऀऀ唀倀䐀䄀吀䔀 倀刀伀䐀唀䌀吀伀匀 匀䔀吀 瀀爀漀搀甀挀琀漀㴀䀀瀀爀漀搀甀挀琀漀Ⰰഀ਀ऀऀऀऀऀऀऀ 椀搀䴀愀爀挀愀㴀䀀椀搀䴀愀爀挀愀Ⰰഀ਀ऀऀऀऀऀऀऀ 搀攀猀挀爀椀瀀挀椀漀渀㴀䀀搀攀猀挀爀椀瀀挀椀漀渀Ⰰഀ਀ऀऀऀऀऀऀऀ 椀洀愀最攀渀㴀䀀椀洀愀最攀渀Ⰰഀ਀ऀऀऀऀऀऀऀ 瀀爀攀挀椀漀开挀漀猀琀漀㴀䀀瀀爀攀挀椀漀开挀漀猀琀漀Ⰰഀ਀ऀऀऀऀऀऀऀ 瀀爀攀挀椀漀开瘀攀渀琀愀㴀䀀瀀爀攀挀椀漀开瘀攀渀琀愀Ⰰഀ਀ऀऀऀऀऀऀऀ 攀砀椀猀琀攀渀挀椀愀㴀䀀攀砀椀猀琀攀渀挀椀愀Ⰰഀ਀ऀऀऀऀऀऀऀ 昀攀挀栀愀开椀渀最爀攀猀漀㴀䀀昀攀挀栀愀开椀渀最爀攀猀漀ഀ਀ऀऀऀऀऀऀ漀甀琀瀀甀琀 椀渀猀攀爀琀攀搀⸀椀搀倀爀漀搀甀挀琀漀Ⰰ 椀渀猀攀爀琀攀搀⸀瀀爀漀搀甀挀琀漀Ⰰ椀渀猀攀爀琀攀搀⸀椀搀䴀愀爀挀愀ഀ਀ऀऀऀऀऀऀ圀䠀䔀刀䔀 椀搀倀爀漀搀甀挀琀漀㴀䀀椀搀倀爀漀搀甀挀琀漀ഀ਀ഀ਀ऀऀഀ਀ऀ䔀一䐀ഀ਀ऀ䔀䰀匀䔀 䤀䘀⠀䀀伀倀䌀 㴀 ㌀⤀ ⴀⴀ䐀攀氀攀琀攀ഀ਀ऀ䈀䔀䜀䤀一ഀ਀ऀऀ䤀䘀 ⠀䀀椀搀倀爀漀搀甀挀琀漀 㴀 　⤀ഀ਀ऀऀ䈀䔀䜀䤀一ഀ਀ऀऀऀ刀伀䰀䰀䈀䄀䌀䬀ഀ਀ऀऀऀऀ刀䄀䤀匀䔀刀刀伀刀 ⠀一✀倀爀漀瘀攀攀搀漀爀 䤀渀瘀愀氀椀搀漀 ℀℀℀縀✀Ⰰ㄀㘀Ⰰ㄀⤀㬀ऀഀ਀ऀऀऀ刀䔀吀唀刀一ഀ਀ऀऀ䔀一䐀ഀ਀ഀ਀ऀऀ䐀䔀䰀䔀吀䔀 䘀刀伀䴀 倀刀伀䐀唀䌀吀伀匀 圀䠀䔀刀䔀 椀搀倀爀漀搀甀挀琀漀㴀䀀椀搀倀爀漀搀甀挀琀漀ഀ਀ऀ䔀一䐀ഀ਀䌀伀䴀䴀䤀吀 吀刀䄀一ഀ਀䜀伀ഀ਀⼀⨀⨀⨀⨀⨀⨀ 伀戀樀攀挀琀㨀  匀琀漀爀攀搀倀爀漀挀攀搀甀爀攀 嬀搀戀漀崀⸀嬀匀倀开倀刀伀嘀䔀䔀䐀伀刀䔀匀崀    匀挀爀椀瀀琀 䐀愀琀攀㨀 ㄀㤀⼀㄀　⼀㈀　㈀㄀ ㄀㜀㨀　㈀㨀㐀㘀 ⨀⨀⨀⨀⨀⨀⼀ഀ਀匀䔀吀 䄀一匀䤀开一唀䰀䰀匀 伀一ഀ਀䜀伀ഀ਀匀䔀吀 儀唀伀吀䔀䐀开䤀䐀䔀一吀䤀䘀䤀䔀刀 伀一ഀ਀䜀伀ഀ਀䌀刀䔀䄀吀䔀 倀刀伀䌀䔀䐀唀刀䔀 嬀搀戀漀崀⸀嬀匀倀开倀刀伀嘀䔀䔀䐀伀刀䔀匀崀ഀ਀ऀ䀀椀搀瀀爀漀瘀攀攀搀漀爀 椀渀琀㴀　Ⰰഀ਀ऀ䀀瀀爀漀瘀攀攀搀漀爀 瘀愀爀挀栀愀爀⠀㘀　⤀Ⰰഀ਀ऀ䀀渀椀琀 瘀愀爀挀栀愀爀⠀㄀㈀⤀Ⰰഀ਀ऀ䀀搀椀爀攀挀挀椀漀渀 瘀愀爀挀栀愀爀⠀㠀　⤀Ⰰഀ਀ऀ䀀琀攀氀攀昀漀渀漀 瘀愀爀挀栀愀爀⠀㈀㔀⤀Ⰰഀ਀ऀ䀀伀倀䌀 椀渀琀Ⰰഀ਀ऀ䀀挀䴀攀渀猀愀樀攀 嘀䄀刀䌀䠀䄀刀⠀㄀　　⤀ 伀唀吀倀唀吀ഀ਀ഀ਀䄀匀ഀ਀䈀䔀䜀䤀一 吀刀䄀一ഀ਀ऀഀ਀ऀ䤀䘀⠀䀀伀倀䌀 㴀 ㄀⤀ ⴀⴀ䤀渀猀攀爀琀ഀ਀ऀ䈀䔀䜀䤀一ഀ਀ऀऀ䤀䘀 䔀堀䤀匀吀匀⠀匀䔀䰀䔀䌀吀 ㄀ 䘀刀伀䴀 倀刀伀嘀䔀䔀䐀伀刀䔀匀 圀䠀䔀刀䔀 瀀爀漀瘀攀攀搀漀爀 㴀 䀀瀀爀漀瘀攀攀搀漀爀⤀ഀ਀ 䈀䔀䜀䤀一ഀ਀ऀ匀䔀吀 䀀挀䴀攀渀猀愀樀攀 㴀 ✀䔀氀 挀漀搀椀最漀 瀀愀爀愀 攀猀琀攀 瀀爀漀搀甀挀琀漀  礀愀 攀砀椀猀琀攀✀㬀ഀ਀ 䔀一䐀ഀ਀ 䔀䰀匀䔀ഀ਀ऀऀऀऀഀ਀ഀ਀ऀऀ䤀一匀䔀刀吀 䤀一吀伀 倀刀伀嘀䔀䔀䐀伀刀䔀匀⠀瀀爀漀瘀攀攀搀漀爀Ⰰ渀椀琀Ⰰ搀椀爀攀挀挀椀漀渀Ⰰ琀攀氀攀昀漀渀漀⤀漀甀琀瀀甀琀 椀渀猀攀爀琀攀搀⸀椀搀倀爀漀瘀攀攀搀漀爀Ⰰ ഀ਀ऀऀ椀渀猀攀爀琀攀搀⸀瀀爀漀瘀攀攀搀漀爀Ⰰ椀渀猀攀爀琀攀搀⸀渀椀琀Ⰰ椀渀猀攀爀琀攀搀⸀搀椀爀攀挀挀椀漀渀Ⰰ椀渀猀攀爀琀攀搀⸀琀攀氀攀昀漀渀漀ഀ਀ऀऀऀ           嘀䄀䰀唀䔀匀⠀䀀瀀爀漀瘀攀攀搀漀爀Ⰰ䀀渀椀琀Ⰰ䀀搀椀爀攀挀挀椀漀渀Ⰰ䀀琀攀氀攀昀漀渀漀⤀ഀ਀ഀ਀ऀऀഀ਀ऀ䔀一䐀ഀ਀ऀ䔀䰀匀䔀 䤀䘀⠀䀀伀倀䌀 㴀 ㈀⤀ ⴀⴀ唀瀀搀愀琀攀ഀ਀ऀ䈀䔀䜀䤀一ഀ਀ऀऀ䤀䘀 ⠀䀀椀搀瀀爀漀瘀攀攀搀漀爀 㴀 　⤀ഀ਀ऀऀ䈀䔀䜀䤀一ഀ਀ऀऀऀ刀伀䰀䰀䈀䄀䌀䬀ഀ਀ऀऀऀऀ刀䄀䤀匀䔀刀刀伀刀 ⠀一✀倀爀漀瘀攀攀搀漀爀 椀渀瘀愀氀椀搀漀✀Ⰰ㄀㘀Ⰰ㄀⤀㬀ऀഀ਀ऀऀऀ刀䔀吀唀刀一ഀ਀ऀऀ䔀一䐀ഀ਀ഀ਀ऀऀ唀倀䐀䄀吀䔀 倀刀伀嘀䔀䔀䐀伀刀䔀匀 匀䔀吀 瀀爀漀瘀攀攀搀漀爀㴀䀀瀀爀漀瘀攀攀搀漀爀Ⰰഀ਀ऀऀऀऀऀऀऀ   渀椀琀㴀䀀渀椀琀Ⰰഀ਀ऀऀऀऀऀऀऀ   搀椀爀攀挀挀椀漀渀㴀䀀搀椀爀攀挀挀椀漀渀Ⰰഀ਀ऀऀऀऀऀऀऀ   琀攀氀攀昀漀渀漀㴀䀀琀攀氀攀昀漀渀漀ഀ਀ऀऀऀऀऀऀ   漀甀琀瀀甀琀 椀渀猀攀爀琀攀搀⸀椀搀倀爀漀瘀攀攀搀漀爀Ⰰ ഀ਀ऀऀ椀渀猀攀爀琀攀搀⸀瀀爀漀瘀攀攀搀漀爀Ⰰ椀渀猀攀爀琀攀搀⸀渀椀琀Ⰰ椀渀猀攀爀琀攀搀⸀搀椀爀攀挀挀椀漀渀Ⰰ椀渀猀攀爀琀攀搀⸀琀攀氀攀昀漀渀漀ഀ਀ऀऀऀऀऀऀ圀䠀䔀刀䔀 椀搀倀爀漀瘀攀攀搀漀爀㴀䀀椀搀瀀爀漀瘀攀攀搀漀爀ഀ਀ഀ਀ऀऀഀ਀ऀ䔀一䐀ഀ਀ऀ䔀䰀匀䔀 䤀䘀⠀䀀伀倀䌀 㴀 ㌀⤀ ⴀⴀ䐀攀氀攀琀攀ഀ਀ऀ䈀䔀䜀䤀一ഀ਀ऀऀ䤀䘀 ⠀䀀椀搀瀀爀漀瘀攀攀搀漀爀 㴀 　⤀ഀ਀ऀऀ䈀䔀䜀䤀一ഀ਀ऀऀऀ刀伀䰀䰀䈀䄀䌀䬀ഀ਀ऀऀऀऀ刀䄀䤀匀䔀刀刀伀刀 ⠀一✀倀爀漀瘀攀攀搀漀爀 䤀渀瘀愀氀椀搀漀 ℀℀℀縀✀Ⰰ㄀㘀Ⰰ㄀⤀㬀ऀഀ਀ऀऀऀ刀䔀吀唀刀一ഀ਀ऀऀ䔀一䐀ഀ਀ഀ਀ऀऀ䐀䔀䰀䔀吀䔀 䘀刀伀䴀 倀刀伀嘀䔀䔀䐀伀刀䔀匀 圀䠀䔀刀䔀 椀搀倀爀漀瘀攀攀搀漀爀㴀䀀椀搀瀀爀漀瘀攀攀搀漀爀ഀ਀ऀ䔀一䐀ഀ਀䌀伀䴀䴀䤀吀 吀刀䄀一ഀ਀䜀伀ഀ਀⼀⨀⨀⨀⨀⨀⨀ 伀戀樀攀挀琀㨀  匀琀漀爀攀搀倀爀漀挀攀搀甀爀攀 嬀搀戀漀崀⸀嬀匀倀开倀唀䔀匀吀伀匀崀    匀挀爀椀瀀琀 䐀愀琀攀㨀 ㄀㤀⼀㄀　⼀㈀　㈀㄀ ㄀㜀㨀　㈀㨀㐀㘀 ⨀⨀⨀⨀⨀⨀⼀ഀ਀匀䔀吀 䄀一匀䤀开一唀䰀䰀匀 伀一ഀ਀䜀伀ഀ਀匀䔀吀 儀唀伀吀䔀䐀开䤀䐀䔀一吀䤀䘀䤀䔀刀 伀一ഀ਀䜀伀ഀ਀ഀ਀䌀刀䔀䄀吀䔀 倀刀伀䌀䔀䐀唀刀䔀 嬀搀戀漀崀⸀嬀匀倀开倀唀䔀匀吀伀匀崀ഀ਀ऀ䀀椀搀瀀甀攀猀琀漀 椀渀琀Ⰰഀ਀ऀ䀀瀀甀攀猀琀漀 瘀愀爀挀栀愀爀⠀㔀　⤀Ⰰഀ਀ऀ䀀伀倀䌀 椀渀琀ഀ਀ഀ਀䄀匀ഀ਀䈀䔀䜀䤀一 吀刀䄀一ഀ਀ऀഀ਀ऀ䤀䘀⠀䀀伀倀䌀 㴀 ㄀⤀ ⴀⴀ䤀渀猀攀爀琀ഀ਀ऀ䈀䔀䜀䤀一ഀ਀ऀऀഀ਀ऀऀऀऀ匀䔀吀 䀀椀搀瀀甀攀猀琀漀 㴀 ⠀匀䔀䰀䔀䌀吀 䌀伀唀一吀⠀⨀⤀ 䘀刀伀䴀 倀唀䔀匀吀伀匀⤀ ⬀ ㄀ഀ਀ഀ਀ഀ਀ऀऀ䤀一匀䔀刀吀 䤀一吀伀 倀唀䔀匀吀伀匀⠀椀搀倀甀攀猀琀漀Ⰰ瀀甀攀猀琀漀㄀⤀ഀ਀ऀऀऀ           嘀䄀䰀唀䔀匀⠀䀀椀搀瀀甀攀猀琀漀Ⰰ䀀瀀甀攀猀琀漀⤀ഀ਀ഀ਀ऀऀ匀䔀䰀䔀䌀吀 ⨀ 䘀刀伀䴀 倀唀䔀匀吀伀匀 圀䠀䔀刀䔀 椀搀倀甀攀猀琀漀㴀䀀椀搀瀀甀攀猀琀漀ഀ਀ഀ਀ऀ䔀一䐀ഀ਀ऀ䔀䰀匀䔀 䤀䘀⠀䀀伀倀䌀 㴀 ㈀⤀ ⴀⴀ唀瀀搀愀琀攀ഀ਀ऀ䈀䔀䜀䤀一ഀ਀ऀऀ䤀䘀 ⠀䀀椀搀瀀甀攀猀琀漀 㴀 　⤀ഀ਀ऀऀ䈀䔀䜀䤀一ഀ਀ऀऀऀ刀伀䰀䰀䈀䄀䌀䬀ഀ਀ऀऀऀऀ刀䄀䤀匀䔀刀刀伀刀 ⠀一✀倀甀攀猀琀漀 椀渀瘀愀氀椀搀漀✀Ⰰ㄀㘀Ⰰ㄀⤀㬀ऀഀ਀ऀऀऀ刀䔀吀唀刀一ഀ਀ऀऀ䔀一䐀ഀ਀ഀ਀ऀऀ唀倀䐀䄀吀䔀 倀唀䔀匀吀伀匀 匀䔀吀 瀀甀攀猀琀漀㄀㴀䀀瀀甀攀猀琀漀ഀ਀ऀऀऀऀऀऀ   ഀ਀ऀऀऀऀऀऀ圀䠀䔀刀䔀 椀搀倀甀攀猀琀漀㴀䀀椀搀瀀甀攀猀琀漀ഀ਀ഀ਀ऀऀ匀䔀䰀䔀䌀吀 ⨀ 䘀刀伀䴀 倀唀䔀匀吀伀匀 圀䠀䔀刀䔀 椀搀倀甀攀猀琀漀㴀䀀椀搀瀀甀攀猀琀漀ഀ਀ऀ䔀一䐀ഀ਀ऀ䔀䰀匀䔀 䤀䘀⠀䀀伀倀䌀 㴀 ㌀⤀ ⴀⴀ䐀攀氀攀琀攀ഀ਀ऀ䈀䔀䜀䤀一ഀ਀ऀऀ䤀䘀 ⠀䀀椀搀瀀甀攀猀琀漀 㴀 　⤀ഀ਀ऀऀ䈀䔀䜀䤀一ഀ਀ऀऀऀ刀伀䰀䰀䈀䄀䌀䬀ഀ਀ऀऀऀऀ刀䄀䤀匀䔀刀刀伀刀 ⠀一✀倀甀攀猀琀漀 䤀渀瘀愀氀椀搀漀 ℀℀℀縀✀Ⰰ㄀㘀Ⰰ㄀⤀㬀ऀഀ਀ऀऀऀ刀䔀吀唀刀一ഀ਀ऀऀ䔀一䐀ഀ਀ഀ਀ऀऀ䐀䔀䰀䔀吀䔀 䘀刀伀䴀 倀唀䔀匀吀伀匀 圀䠀䔀刀䔀 椀搀倀甀攀猀琀漀㴀䀀椀搀瀀甀攀猀琀漀ഀ਀ऀ䔀一䐀ഀ਀䌀伀䴀䴀䤀吀 吀刀䄀一ഀ਀䜀伀ഀ਀唀匀䔀 嬀洀愀猀琀攀爀崀ഀ਀䜀伀ഀ਀䄀䰀吀䔀刀 䐀䄀吀䄀䈀䄀匀䔀 嬀搀戀䔀䴀倀刀䔀匀䄀崀 匀䔀吀  刀䔀䄀䐀开圀刀䤀吀䔀 ഀ਀䜀伀ഀ਀\00
