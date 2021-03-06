USE [master]
GO
/****** Object:  Database [dbEMPRESA]    Script Date: 29/10/2021 00:56:47 ******/
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
/****** Object:  UserDefinedTableType [dbo].[DetalleVenta]    Script Date: 29/10/2021 00:56:47 ******/
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
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 29/10/2021 00:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[COMPRAS]    Script Date: 29/10/2021 00:56:47 ******/
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
/****** Object:  Table [dbo].[COMPRAS_DETALLE]    Script Date: 29/10/2021 00:56:47 ******/
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
/****** Object:  Table [dbo].[EMPLEADOS]    Script Date: 29/10/2021 00:56:47 ******/
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
	[fecha_nacimiento] [datetime] NULL,
	[idPuesto] [int] NULL,
	[fecha_inicio_labores] [datetime] NULL,
	[fechaingreso] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCAS]    Script Date: 29/10/2021 00:56:47 ******/
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
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 29/10/2021 00:56:47 ******/
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
/****** Object:  Table [dbo].[PROVEEDORES]    Script Date: 29/10/2021 00:56:47 ******/
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
/****** Object:  Table [dbo].[PUESTOS]    Script Date: 29/10/2021 00:56:47 ******/
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
/****** Object:  Table [dbo].[VENTAS]    Script Date: 29/10/2021 00:56:47 ******/
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
/****** Object:  Table [dbo].[VENTAS_DETALLE]    Script Date: 29/10/2021 00:56:47 ******/
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
SET IDENTITY_INSERT [dbo].[CLIENTES] ON 

INSERT [dbo].[CLIENTES] ([idCliente], [nombres], [apellidos], [nit], [genero], [telefono], [correo], [fecha_ingreso]) VALUES (3, N'Ivan', N'Sandoval', N'831116', N'M', N'56461028', N'juniordar93@gmail.com', CAST(N'2021-10-25T23:57:48.083' AS DateTime))
SET IDENTITY_INSERT [dbo].[CLIENTES] OFF
GO
SET IDENTITY_INSERT [dbo].[COMPRAS] ON 

INSERT [dbo].[COMPRAS] ([idCompra], [no_orden_compra], [idProveedor], [fecha_orden], [fechaingreso]) VALUES (4, 1, 23, CAST(N'2021-10-29' AS Date), CAST(N'2021-10-29' AS Date))
SET IDENTITY_INSERT [dbo].[COMPRAS] OFF
GO
SET IDENTITY_INSERT [dbo].[COMPRAS_DETALLE] ON 

INSERT [dbo].[COMPRAS_DETALLE] ([idCompra_detalle], [idCompra], [idProducto], [cantidad], [precio_costo_unitario]) VALUES (1, 4, 1, 9, CAST(2000.00 AS Decimal(8, 2)))
INSERT [dbo].[COMPRAS_DETALLE] ([idCompra_detalle], [idCompra], [idProducto], [cantidad], [precio_costo_unitario]) VALUES (2, 4, 1, 9, CAST(2000.00 AS Decimal(8, 2)))
INSERT [dbo].[COMPRAS_DETALLE] ([idCompra_detalle], [idCompra], [idProducto], [cantidad], [precio_costo_unitario]) VALUES (3, 4, 1, 25, CAST(2000.00 AS Decimal(8, 2)))
INSERT [dbo].[COMPRAS_DETALLE] ([idCompra_detalle], [idCompra], [idProducto], [cantidad], [precio_costo_unitario]) VALUES (4, 4, 1, 9, CAST(2000.00 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[COMPRAS_DETALLE] OFF
GO
SET IDENTITY_INSERT [dbo].[EMPLEADOS] ON 

INSERT [dbo].[EMPLEADOS] ([idEmpleado], [nombre], [apellido], [direccion], [telefono], [DPI], [genero], [fecha_nacimiento], [idPuesto], [fecha_inicio_labores], [fechaingreso]) VALUES (1, N'EDGAR', N'DARDON', N'ZONA 6', N'56461028', N'2399519990101', N'M', CAST(N'1993-02-14T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-18T00:00:00.000' AS DateTime), CAST(N'2021-10-19T00:00:00.000' AS DateTime))
INSERT [dbo].[EMPLEADOS] ([idEmpleado], [nombre], [apellido], [direccion], [telefono], [DPI], [genero], [fecha_nacimiento], [idPuesto], [fecha_inicio_labores], [fechaingreso]) VALUES (6, N'MARIO', N'DARDON', N'ZONA 6', N'56461028', N'239951999011', N'M', CAST(N'1993-02-14T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-18T00:00:00.000' AS DateTime), CAST(N'2021-10-24T00:00:00.000' AS DateTime))
INSERT [dbo].[EMPLEADOS] ([idEmpleado], [nombre], [apellido], [direccion], [telefono], [DPI], [genero], [fecha_nacimiento], [idPuesto], [fecha_inicio_labores], [fechaingreso]) VALUES (7, N'MARIO', N'DARDON', N'ZONA 6', N'56461028', N'23995199011', N'M', CAST(N'1993-02-14T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-18T00:00:00.000' AS DateTime), CAST(N'2021-10-25T00:00:00.000' AS DateTime))
INSERT [dbo].[EMPLEADOS] ([idEmpleado], [nombre], [apellido], [direccion], [telefono], [DPI], [genero], [fecha_nacimiento], [idPuesto], [fecha_inicio_labores], [fechaingreso]) VALUES (8, N'MARIO', N'DARDON', N'ZONA 6', N'56461028', N'239951990711', N'M', CAST(N'1993-02-14T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-18T00:00:00.000' AS DateTime), CAST(N'2021-10-25T00:00:00.000' AS DateTime))
INSERT [dbo].[EMPLEADOS] ([idEmpleado], [nombre], [apellido], [direccion], [telefono], [DPI], [genero], [fecha_nacimiento], [idPuesto], [fecha_inicio_labores], [fechaingreso]) VALUES (9, N'MARIO', N'DARDON', N'ZONA 6', N'56461028', N'2399519905511', N'M', CAST(N'1993-02-14T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-18T00:00:00.000' AS DateTime), CAST(N'2021-10-25T00:00:00.000' AS DateTime))
INSERT [dbo].[EMPLEADOS] ([idEmpleado], [nombre], [apellido], [direccion], [telefono], [DPI], [genero], [fecha_nacimiento], [idPuesto], [fecha_inicio_labores], [fechaingreso]) VALUES (10, N'MARIO', N'DARDON', N'ZONA 6', N'56461028', N'23995199055181', N'M', CAST(N'1993-02-14T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-18T00:00:00.000' AS DateTime), CAST(N'2021-10-26T00:00:53.497' AS DateTime))
INSERT [dbo].[EMPLEADOS] ([idEmpleado], [nombre], [apellido], [direccion], [telefono], [DPI], [genero], [fecha_nacimiento], [idPuesto], [fecha_inicio_labores], [fechaingreso]) VALUES (11, N'MARIO', N'DARDON', N'ZONA 6', N'56461028', N'123', N'M', CAST(N'1993-02-14T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-18T00:00:00.000' AS DateTime), CAST(N'2021-10-26T00:04:15.667' AS DateTime))
SET IDENTITY_INSERT [dbo].[EMPLEADOS] OFF
GO
INSERT [dbo].[MARCAS] ([idMarca], [marca]) VALUES (1, N'Asus')
INSERT [dbo].[MARCAS] ([idMarca], [marca]) VALUES (2, N'Mac')
INSERT [dbo].[MARCAS] ([idMarca], [marca]) VALUES (3, N'Mac')
GO
SET IDENTITY_INSERT [dbo].[PRODUCTOS] ON 

INSERT [dbo].[PRODUCTOS] ([idProducto], [producto], [idMarca], [descripcion], [imagen], [precio_costo], [precio_venta], [existencia], [fecha_ingreso]) VALUES (1, N'Laptop', 2, N'Gaming', N'imagen', CAST(10000.00 AS Decimal(8, 2)), CAST(110000.00 AS Decimal(8, 2)), 50, N'2021-10-19')
INSERT [dbo].[PRODUCTOS] ([idProducto], [producto], [idMarca], [descripcion], [imagen], [precio_costo], [precio_venta], [existencia], [fecha_ingreso]) VALUES (2, N'Tablet samsung', 3, NULL, NULL, CAST(0.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), 80, NULL)
INSERT [dbo].[PRODUCTOS] ([idProducto], [producto], [idMarca], [descripcion], [imagen], [precio_costo], [precio_venta], [existencia], [fecha_ingreso]) VALUES (3, N'Tablet A7', 1, NULL, NULL, CAST(0.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), 25, NULL)
SET IDENTITY_INSERT [dbo].[PRODUCTOS] OFF
GO
SET IDENTITY_INSERT [dbo].[PROVEEDORES] ON 

INSERT [dbo].[PROVEEDORES] ([idProveedor], [proveedor], [nit], [direccion], [telefono]) VALUES (23, N'1', N'83111506', N'zone 6', N'56461028')
SET IDENTITY_INSERT [dbo].[PROVEEDORES] OFF
GO
INSERT [dbo].[PUESTOS] ([idPuesto], [puesto1]) VALUES (1, N'Gerente')
GO
SET IDENTITY_INSERT [dbo].[VENTAS] ON 

INSERT [dbo].[VENTAS] ([idVenta], [nofactura], [serie], [fechafactura], [idCliente], [idEmpleado], [fechaingreso]) VALUES (66, 1, N'A', CAST(N'2021-10-26' AS Date), 3, 1, CAST(N'2021-10-26T23:05:52.420' AS DateTime))
INSERT [dbo].[VENTAS] ([idVenta], [nofactura], [serie], [fechafactura], [idCliente], [idEmpleado], [fechaingreso]) VALUES (70, 3, N'A', CAST(N'2021-10-26' AS Date), 3, 1, CAST(N'2021-10-27T23:21:06.777' AS DateTime))
SET IDENTITY_INSERT [dbo].[VENTAS] OFF
GO
SET IDENTITY_INSERT [dbo].[VENTAS_DETALLE] ON 

INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (2, 66, 1, N'5', CAST(10.12 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (3, 66, 1, N'5', CAST(10.12 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (4, 66, 1, N'5', CAST(10.12 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (5, 66, 1, N'5', CAST(10.12 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (6, 66, 1, N'5', CAST(10.12 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (7, 66, 1, N'5', CAST(10.12 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (8, 66, 1, N'5', CAST(10.12 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (9, 66, 1, N'5', CAST(10.12 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (10, 66, 1, N'5', CAST(112.20 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (11, 66, 1, N'5', CAST(112.20 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (12, 66, 1, N'5', CAST(112.20 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (13, 66, 1, N'5', CAST(112.20 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (14, 66, 1, N'5', CAST(112.20 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (15, 66, 1, N'5', CAST(112.20 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (16, 66, 2, N'25', CAST(112.20 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (17, 66, 1, N'5', CAST(120.20 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (18, 66, 1, N'5', CAST(120.20 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (19, 66, 1, N'1', CAST(120.20 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (20, 66, 3, N'50', CAST(120.20 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (21, 66, 3, N'25', CAST(1250.00 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (22, 66, 1, N'2', CAST(100.00 AS Decimal(8, 2)))
INSERT [dbo].[VENTAS_DETALLE] ([idVenta_detalle], [idVenta], [idProducto], [cantidad], [precio_unitarui]) VALUES (23, 66, 1, N'1', CAST(1250.00 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[VENTAS_DETALLE] OFF
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
/****** Object:  StoredProcedure [dbo].[SP_CLIENTES]    Script Date: 29/10/2021 00:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_CLIENTES]
	@idcliente int =0,
	@nombres varchar(60),
@apellidos varchar(60),
@nit varchar (12),
@genero varchar(1),
@telefono varchar(25),
@correo varchar(45),
@fecha_ingreso datetime2,
@OPC int


AS
BEGIN TRAN
	
	IF(@OPC = 1) --Insert
	BEGIN
		
		


		INSERT INTO CLIENTES(nombres,apellidos,nit,genero,telefono,correo,fecha_ingreso)
		output inserted.idCliente,inserted.nombres,inserted.apellidos,inserted.nit,inserted.genero,inserted.telefono,inserted.correo,inserted.fecha_ingreso
			           VALUES(@nombres,@apellidos,@nit,@genero,@telefono,@correo,GETDATE())

		

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
		output inserted.idCliente,inserted.nombres,inserted.apellidos,inserted.nit,inserted.genero,inserted.telefono,inserted.correo,inserted.fecha_ingreso			   
		WHERE idCliente=@idcliente

		
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
/****** Object:  StoredProcedure [dbo].[SP_COMPRAS]    Script Date: 29/10/2021 00:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_COMPRAS]
@idCompra int=0,
@no_orden_compra int,
@idProveedor int,
@fecha_orden datetime2,
@fechaingreso datetime2,
	@OPC int

AS
BEGIN TRAN
	
	
	IF(@OPC = 1) --Insert
	
	BEGIN
				SET @no_orden_compra = (SELECT COUNT(*) FROM COMPRAS) + 1

		INSERT INTO COMPRAS(no_orden_compra,idProveedor,fecha_orden,fechaingreso)output 
		inserted.idCompra, inserted.no_orden_compra,inserted.idProveedor,inserted.fecha_orden,inserted.fechaingreso
		
			           VALUES(@no_orden_compra,@idProveedor,@fecha_orden,GETDATE())

		
	END
	ELSE IF(@OPC = 2) --Update
	BEGIN
		IF (@idCompra = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Producto invalido',16,1);	
			RETURN
		END

		UPDATE COMPRAS SET idProveedor=@idProveedor,
						  fecha_orden=@fecha_orden,
						  fechaingreso=@fechaingreso
							 
						output 
		inserted.idCompra, inserted.no_orden_compra,inserted.idProveedor,inserted.fecha_orden,inserted.fechaingreso
						WHERE idCompra=@idCompra

		
	END
	ELSE IF(@OPC = 3) --Delete
	BEGIN
		IF (@idCompra = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Proveedor Invalido !!!~',16,1);	
			RETURN
		END

		DELETE FROM COMPRAS WHERE idCompra=@idCompra
	END
COMMIT TRAN

GO
/****** Object:  StoredProcedure [dbo].[SP_COMPRAS_DETALLE]    Script Date: 29/10/2021 00:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_COMPRAS_DETALLE]
@idCompra_detalle int=0,
@idCompra int,
@idProducto int,
@cantidad int,
@precio_costo_unitario Decimal(8,2),
	@OPC int,
	 @mensaje varchar(100) OUTPUT

AS

BEGIN TRAN
	
	
	IF(@OPC = 1) --Insert
	
	BEGIN
		   
					   
		INSERT INTO COMPRAS_DETALLE(idCompra,idProducto,cantidad,precio_costo_unitario)output 
		inserted.idCompra_detalle,inserted.idCompra, inserted.idProducto,inserted.cantidad,inserted.precio_costo_unitario
			           VALUES(@idCompra,@idProducto,@cantidad,@precio_costo_unitario)
					  					
					   update PRODUCTOS set existencia= existencia + @cantidad where PRODUCTOS.idProducto=@idProducto
					   

	END
	ELSE IF(@OPC = 2) --Update
	BEGIN
		IF (@idCompra_detalle = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Producto invalido',16,1);	
			RETURN
		END

		UPDATE COMPRAS_DETALLE SET idCompra=@idCompra,
						  idProducto=@idProducto,
						  cantidad=@cantidad,
						  precio_costo_unitario=@precio_costo_unitario
						output 		inserted.idCompra_detalle,inserted.idCompra, inserted.idProducto,inserted.cantidad,inserted.precio_costo_unitario
						WHERE idCompra_detalle=@idCompra_detalle

		
	END
	ELSE IF(@OPC = 3) --Delete
	BEGIN
		IF (@idCompra_detalle = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Proveedor Invalido !!!~',16,1);	
			RETURN
		END

		DELETE FROM COMPRAS_DETALLE WHERE idCompra_detalle=@idCompra_detalle
	END
COMMIT TRAN

GO
/****** Object:  StoredProcedure [dbo].[SP_EMPLEADOS]    Script Date: 29/10/2021 00:56:47 ******/
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
@fecha_nacimiento datetime2,
@idPuesto int,
@fecha_inicio_labores datetime2,
@fechaingreso datetime2,
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
						WHERE idEmpleado=@idEmpleado

		
	END
	ELSE IF(@OPC = 3) --Delete
	BEGIN
		IF (@idEmpleado = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Proveedor Invalido !!!~',16,1);	
			RETURN
		END

		DELETE FROM EMPLEADOS WHERE idEmpleado=@idEmpleado
	END
COMMIT TRAN
GO
/****** Object:  StoredProcedure [dbo].[SP_MARCAS]    Script Date: 29/10/2021 00:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_MARCAS]
	@idmarca int,
	@marca varchar(50),
	@OPC int

AS
BEGIN TRAN
	
	IF(@OPC = 1) --Insert
	BEGIN
		
				SET @idmarca = (SELECT COUNT(*) FROM MARCAS) + 1


		INSERT INTO MARCAS(idMarca,marca)
			           VALUES(@idmarca,@marca)

		SELECT * FROM MARCAS WHERE idMarca=@idmarca

	END
	ELSE IF(@OPC = 2) --Update
	BEGIN
		IF (@idmarca = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Puesto invalido',16,1);	
			RETURN
		END

		UPDATE MARCAS SET marca=@marca
						   
						WHERE idMarca=@idmarca

		SELECT * FROM MARCAS WHERE idMarca=@idmarca
	END
	ELSE IF(@OPC = 3) --Delete
	BEGIN
		IF (@idmarca = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Puesto Invalido !!!~',16,1);	
			RETURN
		END

		DELETE FROM MARCAS WHERE idMarca=@idmarca
	END
COMMIT TRAN
GO
/****** Object:  StoredProcedure [dbo].[SP_PRODUCTOS]    Script Date: 29/10/2021 00:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PRODUCTOS]
@idProducto int=0,
@producto varchar(50),
@idMarca int,
@descripcion varchar(100),
@imagen varchar(30),
@precio_costo Decimal(8,2),
@precio_venta Decimal(8,2),
@existencia int ,
@fecha_ingreso varchar(45),
	@OPC int,
	@cMensaje VARCHAR(100) OUTPUT

AS
BEGIN TRAN
	
	IF(@OPC = 1) --Insert
	BEGIN
		IF EXISTS(SELECT 1 FROM PRODUCTOS WHERE producto = @producto)
 BEGIN
	SET @cMensaje = 'El producto  ya existe';
 END
 ELSE
				

		INSERT INTO PRODUCTOS(producto,idMarca,descripcion,imagen,precio_costo,precio_venta,existencia,fecha_ingreso)output inserted.idProducto, 
		inserted.producto,inserted.idMarca
			           VALUES(@producto,@idMarca,@descripcion,@imagen,@precio_costo,@precio_venta,@existencia,@fecha_ingreso)

		
	END
	ELSE IF(@OPC = 2) --Update
	BEGIN
		IF (@idProducto = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Producto invalido',16,1);	
			RETURN
		END

		UPDATE PRODUCTOS SET producto=@producto,
							 idMarca=@idMarca,
							 descripcion=@descripcion,
							 imagen=@imagen,
							 precio_costo=@precio_costo,
							 precio_venta=@precio_venta,
							 existencia=@existencia,
							 fecha_ingreso=@fecha_ingreso
						output inserted.idProducto, inserted.producto,inserted.idMarca
						WHERE idProducto=@idProducto

		
	END
	ELSE IF(@OPC = 3) --Delete
	BEGIN
		IF (@idProducto = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Proveedor Invalido !!!~',16,1);	
			RETURN
		END

		DELETE FROM PRODUCTOS WHERE idProducto=@idProducto
	END
COMMIT TRAN
GO
/****** Object:  StoredProcedure [dbo].[SP_PROVEEDORES]    Script Date: 29/10/2021 00:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PROVEEDORES]
	@idproveedor int=0,
	@proveedor varchar(60),
	@nit varchar(12),
	@direccion varchar(80),
	@telefono varchar(25),
	@OPC int,
	@cMensaje VARCHAR(100) OUTPUT

AS
BEGIN TRAN
	
	IF(@OPC = 1) --Insert
	BEGIN
		IF EXISTS(SELECT 1 FROM PROVEEDORES WHERE nit = @nit)
 BEGIN
	SET @cMensaje = 'El codigo para este producto  ya existe';
 END
 ELSE
				

		INSERT INTO PROVEEDORES(proveedor,nit,direccion,telefono)output inserted.idProveedor, 
		inserted.proveedor,inserted.nit,inserted.direccion,inserted.telefono
			           VALUES(@proveedor,@nit,@direccion,@telefono)

		
	END
	ELSE IF(@OPC = 2) --Update
	BEGIN
		IF (@idproveedor = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Proveedor invalido',16,1);	
			RETURN
		END

		UPDATE PROVEEDORES SET proveedor=@proveedor,
							   nit=@nit,
							   direccion=@direccion,
							   telefono=@telefono
						   output inserted.idProveedor, 
		inserted.proveedor,inserted.nit,inserted.direccion,inserted.telefono
						WHERE idProveedor=@idproveedor

		
	END
	ELSE IF(@OPC = 3) --Delete
	BEGIN
		IF (@idproveedor = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Proveedor Invalido !!!~',16,1);	
			RETURN
		END

		DELETE FROM PROVEEDORES WHERE idProveedor=@idproveedor
	END
COMMIT TRAN
GO
/****** Object:  StoredProcedure [dbo].[SP_PUESTOS]    Script Date: 29/10/2021 00:56:47 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_VENTAS]    Script Date: 29/10/2021 00:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_VENTAS]
@idVenta int=0,
@nofactura int,
@serie varchar(1),
@fechafactura datetime2,
@idCliente int,
@idEmpleado int,
@fechaingreso datetime2,
	@OPC int

AS
BEGIN TRAN
	
	
	IF(@OPC = 1) --Insert
	
	BEGIN
				SET @nofactura = (SELECT COUNT(*) FROM VENTAS) + 1

		INSERT INTO VENTAS(nofactura,serie,fechafactura,idCliente,idEmpleado,fechaingreso)output 
		inserted.idVenta, inserted.nofactura,inserted.serie,inserted.fechafactura,inserted.idCliente,inserted.idEmpleado,
		inserted.fechaingreso
		
			           VALUES(@nofactura,@serie,@fechafactura,@idCliente,@idEmpleado,GETDATE())

		
	END
	ELSE IF(@OPC = 2) --Update
	BEGIN
		IF (@idVenta = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Producto invalido',16,1);	
			RETURN
		END

		UPDATE VENTAS SET serie=@serie,
						  fechafactura=@fechafactura,
						  idCliente=@idCliente,
						  idEmpleado=@idEmpleado,
						  fechaingreso=@fechaingreso
							 
						output 
		inserted.idVenta, inserted.nofactura,inserted.serie,inserted.fechafactura,inserted.idCliente,inserted.idEmpleado,
		inserted.fechaingreso
						WHERE idVenta=@idVenta

		
	END
	ELSE IF(@OPC = 3) --Delete
	BEGIN
		IF (@idVenta = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Proveedor Invalido !!!~',16,1);	
			RETURN
		END

		DELETE FROM VENTAS WHERE idVenta=@idVenta
	END
COMMIT TRAN

GO
/****** Object:  StoredProcedure [dbo].[SP_VENTAS_DETALLE]    Script Date: 29/10/2021 00:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_VENTAS_DETALLE]
@idVenta_detalle int=0,
@idVenta int,
@idProducto int,
@cantidad int,
@precio_unitarui Decimal(8,2),
	@OPC int,
	 @mensaje varchar(100) OUTPUT

AS

BEGIN TRAN
	
	declare @exist int
	declare @newcant int
	
	IF(@OPC = 1) --Insert
	
	BEGIN
		   
		   select @exist=existencia from PRODUCTOS where idProducto=@idProducto
		   set @newcant = @exist-@cantidad
		   if(@newcant>=0)
		   begin
					   
		INSERT INTO VENTAS_DETALLE(idVenta,idProducto,cantidad,precio_unitarui)output 
		inserted.idVenta_detalle, inserted.idProducto,inserted.cantidad,inserted.precio_unitarui
			           VALUES(@idVenta,@idProducto,@cantidad,@precio_unitarui)
					  					
					   update PRODUCTOS set existencia=@newcant where idProducto=@idProducto
					   end
					   else
					   begin
					   print 'no hay stock'
					   end				   

	END
	ELSE IF(@OPC = 2) --Update
	BEGIN
		IF (@idVenta_detalle = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Producto invalido',16,1);	
			RETURN
		END

		UPDATE VENTAS_DETALLE SET idVenta=@idVenta,
						  idProducto=@idProducto,
						  cantidad=@cantidad,
						  precio_unitarui=@precio_unitarui
						output inserted.idVenta_detalle, inserted.idProducto,inserted.cantidad,inserted.precio_unitarui
						WHERE idVenta_detalle=@idVenta_detalle

		
	END
	ELSE IF(@OPC = 3) --Delete
	BEGIN
		IF (@idVenta_detalle = 0)
		BEGIN
			ROLLBACK
				RAISERROR (N'Proveedor Invalido !!!~',16,1);	
			RETURN
		END

		DELETE FROM VENTAS_DETALLE WHERE idVenta_detalle=@idVenta_detalle
	END
COMMIT TRAN

--exec SP_VENTAS_DETALLE @idVenta=66,@idProducto=1,@cantidad=5,@precio_unitarui=100.00,@OPC=1,@mensaje=''
GO
USE [master]
GO
ALTER DATABASE [dbEMPRESA] SET  READ_WRITE 
GO
