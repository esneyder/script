USE [app]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 10/05/2016 5:13:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[password] [char](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCamarero]    Script Date: 10/05/2016 5:13:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCamarero](
	[IdCamarero] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [char](80) NOT NULL,
	[Apellidos] [char](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCamarero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCliente]    Script Date: 10/05/2016 5:13:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [char](80) NOT NULL,
	[Apellidos] [char](80) NULL,
	[Nota] [char](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCocinero]    Script Date: 10/05/2016 5:13:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCocinero](
	[IdCocinero] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [char](80) NOT NULL,
	[Apellidos] [char](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCocinero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDetalleFactura]    Script Date: 10/05/2016 5:13:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDetalleFactura](
	[IdDetalleFactura] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdCocinero] [int] NOT NULL,
	[Plato] [char](150) NOT NULL,
	[Importe] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFactura]    Script Date: 10/05/2016 5:13:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFactura](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdCamarero] [int] NOT NULL,
	[IdMesa] [int] NOT NULL,
	[FechaFactura] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[tblMesa]    Script Date: 10/05/2016 5:13:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMesa](
	[IdMesa] [int] IDENTITY(1,1) NOT NULL,
	[NumMaxComensales] [int] NOT NULL,
	[Ubicacion] [char](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tblDetalleFactura]  WITH CHECK ADD  CONSTRAINT [fk_detailfac_cocin] FOREIGN KEY([IdCocinero])
REFERENCES [dbo].[tblCocinero] ([IdCocinero])
GO
ALTER TABLE [dbo].[tblDetalleFactura] CHECK CONSTRAINT [fk_detailfac_cocin]
GO
ALTER TABLE [dbo].[tblDetalleFactura]  WITH CHECK ADD  CONSTRAINT [fk_detailfac_fac] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[tblFactura] ([IdFactura])
GO
ALTER TABLE [dbo].[tblDetalleFactura] CHECK CONSTRAINT [fk_detailfac_fac]
GO
ALTER TABLE [dbo].[tblFactura]  WITH CHECK ADD  CONSTRAINT [fk_fac_mesa] FOREIGN KEY([IdMesa])
REFERENCES [dbo].[tblMesa] ([IdMesa])
GO
ALTER TABLE [dbo].[tblFactura] CHECK CONSTRAINT [fk_fac_mesa]
GO
ALTER TABLE [dbo].[tblFactura]  WITH CHECK ADD  CONSTRAINT [fk_fact_camarero] FOREIGN KEY([IdCamarero])
REFERENCES [dbo].[tblCamarero] ([IdCamarero])
GO
ALTER TABLE [dbo].[tblFactura] CHECK CONSTRAINT [fk_fact_camarero]
GO
ALTER TABLE [dbo].[tblFactura]  WITH CHECK ADD  CONSTRAINT [fk_fact_client] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[tblCliente] ([IdCliente])
GO
ALTER TABLE [dbo].[tblFactura] CHECK CONSTRAINT [fk_fact_client]
GO
