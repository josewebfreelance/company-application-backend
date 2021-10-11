USE [master]
GO
/****** Object:  Database [dbEMPRESA]    Script Date: 11/10/2021 16:18:19 ******/
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
/****** Object:  UserDefinedTableType [dbo].[DetalleVenta]    Script Date: 11/10/2021 16:18:19 ******/
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
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 11/10/2021 16:18:19 ******/
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
/****** Object:  Table [dbo].[COMPRAS]    Script Date: 11/10/2021 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRAS](
	[idCompra] [int] NOT NULL,
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
/****** Object:  Table [dbo].[COMPRAS_DETALLE]    Script Date: 11/10/2021 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRAS_DETALLE](
	[idCompra_detalle] [int] NOT NULL,
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
/****** Object:  Table [dbo].[EMPLEADOS]    Script Date: 11/10/2021 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADOS](
	[idEmpleado] [int] NOT NULL,
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
/****** Object:  Table [dbo].[MARCAS]    Script Date: 11/10/2021 16:18:19 ******/
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
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 11/10/2021 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTOS](
	[idProducto] [int] NOT NULL,
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
/****** Object:  Table [dbo].[PROVEEDORES]    Script Date: 11/10/2021 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDORES](
	[idProveedor] [int] NOT NULL,
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
/****** Object:  Table [dbo].[PUESTOS]    Script Date: 11/10/2021 16:18:19 ******/
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
/****** Object:  Table [dbo].[VENTAS]    Script Date: 11/10/2021 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTAS](
	[idVenta] [int] NOT NULL,
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
/****** Object:  Table [dbo].[VENTAS_DETALLE]    Script Date: 11/10/2021 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTAS_DETALLE](
	[idVenta_detalle] [int] NOT NULL,
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
INSERT [dbo].[PUESTOS] ([idPuesto], [puesto1]) VALUES (1, N'Gerente')
INSERT [dbo].[PUESTOS] ([idPuesto], [puesto1]) VALUES (2, N'Cajero')
INSERT [dbo].[PUESTOS] ([idPuesto], [puesto1]) VALUES (3, N'comprador')
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
/****** Object:  StoredProcedure [dbo].[SP_PUESTOS]    Script Date: 11/10/2021 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_PUESTOS]
	@idpuesto int,
	@puesto varchar(50),
	@OPC int

AS
BEGIN TRAN
	
	IF(@OPC = 1) --Insert
	BEGIN
		
				SET @idpuesto = (SELECT COUNT(*) FROM PUESTOS) + 1


		INSERT INTO PUESTOS(idPuesto,puesto1)
			           VALUES(@idpuesto,@puesto)

		SELECT * FROM PUESTOS WHERE idPuesto=@idpuesto

	END
	ELSE IF(@OPC = 2) --Update
	BEGIN
		IF (@idpuesto = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Puesto invalido',16,1);	
			RETURN
		END

		UPDATE PUESTOS SET puesto1=@puesto
						   
						WHERE idPuesto=@idpuesto

		SELECT * FROM PUESTOS WHERE idPuesto=@idpuesto
	END
	ELSE IF(@OPC = 3) --Delete
	BEGIN
		IF (@idpuesto = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Puesto Invalido !!!~',16,1);	
			RETURN
		END

		DELETE FROM PUESTOS WHERE idPuesto=@idpuesto
	END
COMMIT TRAN
GO
/****** Object:  StoredProcedure [dbo].[spaddpuesto]    Script Date: 11/10/2021 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spaddpuesto]
(@puesto varchar(50))
 
 AS
 
 BEGIN
	INSERT INTO PUESTOS(puesto1)
	VALUES(@puesto)
	select idPuesto,puesto1 from PUESTOS

	
 END
GO
/****** Object:  StoredProcedure [dbo].[spaddventas]    Script Date: 11/10/2021 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spaddventas]
@nofactura varchar(45),
@serie varchar(1),
@fechafactura Date,
@idcliente int,
@idempleado int,
@fechaingreso Date,
@detallevn DetalleVenta READONLY
AS
BEGIN

DECLARE @idventa int

INSERT INTO VENTAS(nofactura,serie,fechafactura,idCliente,idEmpleado,fechaingreso)values(@nofactura,@serie,@fechafactura,@idcliente,@idempleado,@fechaingreso)


SET	@idventa = @@IDENTITY

INSERT INTO VENTAS_DETALLE(idProducto,cantidad,precio_unitarui,idVenta)
SELECT idProducto,cantidad,precio_unitarui, @idventa from @detallevn

END
GO
/****** Object:  StoredProcedure [dbo].[spgetpuestos]    Script Date: 11/10/2021 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spgetpuestos]

as 
begin
select *from PUESTOS
end
GO
USE [master]
GO
ALTER DATABASE [dbEMPRESA] SET  READ_WRITE 
GO
