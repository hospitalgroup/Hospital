USE [Hospital]
GO
/****** Object:  Table [dbo].[tCama]    Script Date: 16/12/2020 11:43:01 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCama](
	[idCama] [int] NOT NULL,
	[fkPlanta] [int] NULL,
 CONSTRAINT [PK_tCama] PRIMARY KEY CLUSTERED 
(
	[idCama] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tHistoria]    Script Date: 16/12/2020 11:43:01 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tHistoria](
	[idHistoria] [int] NOT NULL,
	[fechaEntrada] [datetime] NOT NULL,
	[fechaAlta] [datetime] NOT NULL,
	[fkPaciente] [int] NULL,
 CONSTRAINT [PK_tHistoria] PRIMARY KEY CLUSTERED 
(
	[idHistoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tMedico]    Script Date: 16/12/2020 11:43:01 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tMedico](
	[idMedico] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[especialidad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tMedico] PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tPaciente]    Script Date: 16/12/2020 11:43:01 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tPaciente](
	[idPaciente] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[edad] [int] NOT NULL,
 CONSTRAINT [PK_tPaciente] PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tPacienteCama]    Script Date: 16/12/2020 11:43:01 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPacienteCama](
	[idPacienteCama] [int] NOT NULL,
	[fechaAsignacion] [datetime] NOT NULL,
	[fkCama] [int] NULL,
	[fkHistoria] [int] NULL,
 CONSTRAINT [PK_tPacienteCama] PRIMARY KEY CLUSTERED 
(
	[idPacienteCama] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tPlanta]    Script Date: 16/12/2020 11:43:01 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tPlanta](
	[idPlanta] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[numeroCamas] [int] NOT NULL,
 CONSTRAINT [PK_tPlanta] PRIMARY KEY CLUSTERED 
(
	[idPlanta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tVisitaMedica]    Script Date: 16/12/2020 11:43:01 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tVisitaMedica](
	[FechaHoraVista] [datetime] NOT NULL,
	[DiagnosticoEnfermedad] [varchar](50) NOT NULL,
	[fkMedico] [int] NULL,
	[fkPacienteCama] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tMedico] ON 

INSERT [dbo].[tMedico] ([idMedico], [nombre], [apellido], [especialidad]) VALUES (3, N'Maria', N'Encarnacion', N'Pediatra')
INSERT [dbo].[tMedico] ([idMedico], [nombre], [apellido], [especialidad]) VALUES (5, N'Pedro ', N'Gonzalez', N'Cardiologo')
INSERT [dbo].[tMedico] ([idMedico], [nombre], [apellido], [especialidad]) VALUES (6, N'Ariel', N'Perez Gimenes', N'Endocrinologo')
INSERT [dbo].[tMedico] ([idMedico], [nombre], [apellido], [especialidad]) VALUES (7, N'Juana', N'Rivera', N'Neumologa')
SET IDENTITY_INSERT [dbo].[tMedico] OFF
ALTER TABLE [dbo].[tCama]  WITH CHECK ADD  CONSTRAINT [FK_tCama_tPlanta] FOREIGN KEY([fkPlanta])
REFERENCES [dbo].[tPlanta] ([idPlanta])
GO
ALTER TABLE [dbo].[tCama] CHECK CONSTRAINT [FK_tCama_tPlanta]
GO
ALTER TABLE [dbo].[tHistoria]  WITH CHECK ADD  CONSTRAINT [FK_tHistoria_tPaciente] FOREIGN KEY([fkPaciente])
REFERENCES [dbo].[tPaciente] ([idPaciente])
GO
ALTER TABLE [dbo].[tHistoria] CHECK CONSTRAINT [FK_tHistoria_tPaciente]
GO
ALTER TABLE [dbo].[tPacienteCama]  WITH CHECK ADD  CONSTRAINT [FK_tPacienteCama_tCama] FOREIGN KEY([fkCama])
REFERENCES [dbo].[tCama] ([idCama])
GO
ALTER TABLE [dbo].[tPacienteCama] CHECK CONSTRAINT [FK_tPacienteCama_tCama]
GO
ALTER TABLE [dbo].[tPacienteCama]  WITH CHECK ADD  CONSTRAINT [FK_tPacienteCama_tHistoria] FOREIGN KEY([fkHistoria])
REFERENCES [dbo].[tHistoria] ([idHistoria])
GO
ALTER TABLE [dbo].[tPacienteCama] CHECK CONSTRAINT [FK_tPacienteCama_tHistoria]
GO
ALTER TABLE [dbo].[tVisitaMedica]  WITH CHECK ADD  CONSTRAINT [FK_tVisitaMedica_tMedico] FOREIGN KEY([fkMedico])
REFERENCES [dbo].[tMedico] ([idMedico])
GO
ALTER TABLE [dbo].[tVisitaMedica] CHECK CONSTRAINT [FK_tVisitaMedica_tMedico]
GO
ALTER TABLE [dbo].[tVisitaMedica]  WITH CHECK ADD  CONSTRAINT [FK_tVisitaMedica_tPacienteCama] FOREIGN KEY([fkPacienteCama])
REFERENCES [dbo].[tPacienteCama] ([idPacienteCama])
GO
ALTER TABLE [dbo].[tVisitaMedica] CHECK CONSTRAINT [FK_tVisitaMedica_tPacienteCama]
GO
