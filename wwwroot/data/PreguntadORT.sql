USE [master]
GO
/****** Object:  Database [PreguntadORT]    Script Date: 17/8/2023 15:54:38 ******/
CREATE DATABASE [PreguntadORT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntadORT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadORT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PreguntadORT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadORT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PreguntadORT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreguntadORT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreguntadORT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreguntadORT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreguntadORT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreguntadORT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreguntadORT] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreguntadORT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreguntadORT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreguntadORT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreguntadORT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreguntadORT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreguntadORT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreguntadORT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreguntadORT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreguntadORT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreguntadORT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreguntadORT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreguntadORT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreguntadORT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreguntadORT] SET RECOVERY FULL 
GO
ALTER DATABASE [PreguntadORT] SET  MULTI_USER 
GO
ALTER DATABASE [PreguntadORT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreguntadORT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PreguntadORT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PreguntadORT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PreguntadORT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PreguntadORT', N'ON'
GO
ALTER DATABASE [PreguntadORT] SET QUERY_STORE = OFF
GO
USE [PreguntadORT]
GO
/****** Object:  User [alumno]    Script Date: 17/8/2023 15:54:38 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 17/8/2023 15:54:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultad]    Script Date: 17/8/2023 15:54:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultad](
	[IdDificultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultad] PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pregunta]    Script Date: 17/8/2023 15:54:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pregunta](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdDificultad] [int] NOT NULL,
	[Enunciado] [varchar](150) NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Pregunta] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ranking]    Script Date: 17/8/2023 15:54:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ranking](
	[Nombre] [varchar](50) NOT NULL,
	[Puntaje] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuesta]    Script Date: 17/8/2023 15:54:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuesta](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](50) NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Respuesta] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (1, N'Historia', N'historia.png')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (2, N'Arte', N'arte.png')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (3, N'Ciencia', N'ciencia.png')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (4, N'Deportes', N'deporte.png')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (5, N'Geografía', N'geografia.png')
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Foto]) VALUES (6, N'Entretenimiento', N'entretenimiento.png')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultad] ON 

INSERT [dbo].[Dificultad] ([IdDificultad], [Nombre]) VALUES (1, N'Fácil')
INSERT [dbo].[Dificultad] ([IdDificultad], [Nombre]) VALUES (2, N'Media')
INSERT [dbo].[Dificultad] ([IdDificultad], [Nombre]) VALUES (3, N'Difícil')
SET IDENTITY_INSERT [dbo].[Dificultad] OFF
GO
SET IDENTITY_INSERT [dbo].[Pregunta] ON 

INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (1, 1, 1, N'¿Quién fue el primer presidente de los Estados Unidos?
 ', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (2, 1, 1, N'¿En qué año comenzó la Primera Guerra Mundial?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (3, 1, 1, N'¿Cuál fue el famoso barco que se hundió en su viaje inaugural en 1912?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (4, 1, 1, N'¿En qué año se firmó la Declaración de Independencia de Argentina?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (5, 1, 1, N'¿Qué civilización antigua construyó las famosas pirámides en Giza?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (6, 1, 2, N'¿Qué líder militar francés conquistó gran parte de Europa en el siglo XIX?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (7, 1, 2, N'¿Qué evento histórico provocó el inicio de la Revolución Francesa en 1789?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (8, 1, 2, N'¿Quién fue el líder político y espiritual de la India que luchó por la independencia pacífica de su país?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (9, 1, 2, N'¿En qué año terminó la Segunda Guerra Mundial?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (10, 1, 2, N'¿Quién fue el líder político y militar que dirigió las fuerzas aliadas durante la Segunda Guerra Mundial?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (11, 1, 3, N'¿Cuál fue la primera dinastía de gobernantes de China, que gobernó desde el siglo XXI a.C. hasta el siglo XVI a.C.?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (12, 1, 3, N'¿Quién fue el zar de Rusia durante la Revolución Rusa de 1917?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (13, 1, 3, N'¿En qué año tuvo lugar la Batalla de Waterloo, en la que Napoleón Bonaparte fue derrotado definitivamente?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (14, 1, 3, N'¿Cuál fue el imperio que gobernó gran parte de Europa, África del Norte y Asia Occidental durante su apogeo en el siglo XIV?', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (15, 1, 3, N'Nombre del buque británico hundido en 1916 durante la Primera Guerra Mundial y cuyo hundimiento fue un factor en la entrada de USA en la guerra', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (16, 4, 1, N'¿Cuál es el nombre del único campeón tanto de Fórmula 1 como de karting?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (17, 4, 1, N'¿Cuál es el nombre del famoso nadador estadounidense que ganó 23 medallas de oro olímpicas?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (18, 4, 1, N'¿Cuántos mundiales ha ganado Italia a lo largo de su historia?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (19, 4, 1, N'¿En qué deporte se utilizan flechas y arcos para disparar a una diana?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (20, 4, 1, N'La serie ''The Last Dance'' relata la temporada 97-98 de Michael Jordan y su equipo, los ...
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (21, 4, 2, N'¿Cuál es el nombre del famoso tenista suizo que debutó en 1998?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (22, 4, 2, N'¿Cuál de estos deportes utiliza una red y una pluma para jugar?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (23, 4, 2, N'¿Quién es el jugador de la NBA con más títulos?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (24, 4, 2, N'¿Cuál es el evento principal de los Juegos Olímpicos que combina natación, ciclismo y carrera a pie?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (25, 4, 2, N'¿En qué año y ciudad se llevaron a cabo los primeros Juegos Olímpicos modernos?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (26, 4, 3, N'¿Cuál es el único país que ha participado en todas las ediciones de los Juegos Olímpicos modernos desde 1896?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (27, 4, 3, N'¿Qué golfista ha ganado el mayor número de Majors en la historia?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (28, 4, 3, N'¿Cuál es el récord mundial masculino en los 100 metros lisos?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (29, 4, 3, N'¿En qué ciudad se celebraron los Juegos Olímpicos de Verano de 2008?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (30, 4, 3, N'¿Quién es el jugador de fútbol con más partidos en mundiales?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (31, 5, 1, N'¿Cuál es el río más largo del mundo?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (32, 5, 1, N'¿Cuál es el país más grande del mundo en términos de área terrestre?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (33, 5, 1, N'¿Cuál es la capital de Francia?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (34, 5, 1, N'¿En qué continente se encuentra Egipto?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (35, 5, 1, N'¿Cuál es el océano más grande del mundo?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (37, 5, 2, N'¿En qué continente se encuentra el monte Kilimanjaro?


', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (38, 5, 2, N'¿Cuál es el país que se encuentra entre España y Francia?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (39, 5, 2, N'¿Cuál es la ciudad italiana famosa por su inclinada torre?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (40, 5, 2, N'¿En qué continente se encuentra el desierto del Sahara?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (41, 5, 2, N'¿Cuál es la capital de Australia?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (42, 5, 3, N'¿Cuál es el país que comparte una frontera con 14 países diferentes?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (43, 5, 3, N'¿En qué océano se encuentra la isla de Madagascar?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (44, 5, 3, N'¿Cuál es el río más largo de América del Sur?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (45, 5, 3, N'¿Cuál es el punto más alto de América del Sur?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (46, 5, 3, N'¿En qué país se encuentra el archipiélago de Bora Bora?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (47, 2, 1, N'¿Quién pintó la famosa obra "La Mona Lisa"?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (48, 2, 1, N'¿Qué famoso escultor italiano creó la estatua de "David"?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (49, 2, 1, N'¿Cuál es el nombre del famoso pintor neerlandés conocido por sus autorretratos y cuadros de girasoles?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (50, 2, 1, N'¿En qué país nació el pintor Salvador Dalí?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (51, 2, 1, N'¿Quién es el famoso pintor holandés conocido por sus cuadros de girasoles y la obra "La noche estrellada"?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (52, 2, 2, N'¿Qué famoso pintor impresionista pintó la serie de "Nenúfares"?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (54, 2, 2, N'¿Cuál es el nombre del famoso muralista mexicano que pintó obras como "El Hombre en la Encrucijada"?', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (55, 2, 2, N'¿Qué famoso pintor holandés es conocido por su estilo surrealista y pintó obras como "La Persistencia de la Memoria"?', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (56, 2, 2, N'¿Cuál es el autor de la obra de teatro "Romeo y Julieta"?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (57, 2, 2, N'¿Qué famoso pintor impresionista es conocido por sus "Nenúfares" y su jardín en Giverny?', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (58, 2, 3, N'¿Quién pintó la famosa obra "El Grito", que muestra una figura angustiada en un paisaje surrealista?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (59, 2, 3, N'¿En qué país se encuentra la famosa escultura "La Sirenita", que se ha convertido en un ícono de la ciudad?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (60, 2, 3, N'¿Cuál es el nombre del famoso pintor español conocido por su estilo abstracto y la creación del "Guernica"?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (61, 2, 3, N'¿Qué artista es conocido por sus esculturas del "Hombre de bronce" y "El Pensador"?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (62, 2, 3, N'¿Quién es el compositor de la famosa obra "El lago de los cisnes"?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (63, 3, 1, N'¿Cuál es el planeta más cercano al Sol en nuestro sistema solar?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (64, 3, 1, N'¿Cuál es la sustancia que los árboles convierten en oxígeno a través de la fotosíntesis?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (65, 3, 1, N'¿Cuál es el órgano del cuerpo humano encargado de bombear sangre a través del sistema circulatorio?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (68, 3, 1, N'¿Cuál es el planeta más grande de nuestro sistema solar?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (70, 3, 1, N'¿Qué científico formuló la famosa ecuación E=mc^2?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (71, 3, 2, N'¿Cuál es el proceso mediante el cual las plantas convierten la luz solar en energía química?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (72, 3, 2, N'¿Cuál es la partícula subatómica con carga positiva que se encuentra en el núcleo de un átomo?

', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (73, 3, 2, N'¿Cuál es la enfermedad contagiosa causada por un virus y se caracteriza por erupciones en la piel?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (74, 3, 2, N'¿Cuál es la unidad básica de la vida en los seres vivos?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (75, 3, 2, N'¿Qué metal es líquido a temperatura ambiente?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (76, 3, 3, N'¿Cuál es la teoría científica que describe el origen y la evolución del universo a partir de una explosión primordial?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (77, 3, 3, N'¿Qué científico desarrolló la teoría de la relatividad?

', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (78, 3, 3, N'¿Cuál es el nombre del proceso que ocurre en el núcleo del Sol y produce su energía?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (79, 3, 3, N'¿Quién formuló la teoría cuántica?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (80, 3, 3, N'¿Cuál es el proceso mediante el cual las células se dividen para formar células sexuales con la mitad del número normal de cromosomas?', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (81, 6, 1, N'¿Cuál es la película animada de Disney que cuenta la historia de una princesa que vive en un castillo con siete enanitos?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (82, 6, 1, N'¿Qué famoso cantante es conocido como "The King of Pop"?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (83, 6, 1, N'¿Cuál es la serie de películas de ciencia ficción dirigida por George Lucas que presenta personajes como Luke Skywalker y Darth Vader?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (84, 6, 1, N'¿En qué película animada un león joven es acusado de la muerte de su padre y se ve obligado a huir de su hogar?', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (85, 6, 1, N'¿Quién interpretó el papel de Harry Potter en las películas basadas en la famosa serie de libros?', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (86, 6, 2, N'¿Cuál es el nombre del actor que interpreta a Iron Man en las películas de Marvel?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (87, 6, 2, N'¿Qué banda de rock británica es conocida por su álbum "The Dark Side of the Moon"?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (88, 6, 2, N'¿Cuál es la película épica de ciencia ficción dirigida por Christopher Nolan sobre viajes en el tiempo e intriga espacial?', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (89, 6, 2, N'¿Qué famosa banda de rock británica es conocida por éxitos como "Bohemian Rhapsody" y "We Will Rock You"?', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (90, 6, 2, N'¿Qué actor interpretó el papel de Jack Dawson en la película "Titanic"?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (91, 6, 3, N'¿Qué película de Quentin Tarantino cuenta la historia de una novia que busca vengarse de su antiguo grupo de asesinos?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (92, 6, 3, N'¿Cuál es el nombre del autor que escribió la serie de libros "Canción de Hielo y Fuego", en la que se basa la serie de televisión "Game of Thrones"?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (93, 6, 3, N'¿Cuál es el nombre del director mexicano que ha sido reconocido por sus películas como "Gravedad" y "El laberinto del fauno"?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (94, 6, 3, N'¿Cuál es el nombre del director y creador de la saga cinematográfica "El Señor de los Anillos"?
', NULL)
INSERT [dbo].[Pregunta] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (95, 6, 3, N'¿En qué película de Quentin Tarantino aparece el famoso personaje "Jules Winnfield" interpretado por Samuel L. Jackson?
', NULL)
SET IDENTITY_INSERT [dbo].[Pregunta] OFF
GO
INSERT [dbo].[Ranking] ([Nombre], [Puntaje]) VALUES (N'Carlos', 50)
INSERT [dbo].[Ranking] ([Nombre], [Puntaje]) VALUES (N'Jose', 45)
INSERT [dbo].[Ranking] ([Nombre], [Puntaje]) VALUES (N'Manuel', 20)
INSERT [dbo].[Ranking] ([Nombre], [Puntaje]) VALUES (N'Florencio', 15)
INSERT [dbo].[Ranking] ([Nombre], [Puntaje]) VALUES (N'Pedro', 0)
GO
SET IDENTITY_INSERT [dbo].[Respuesta] ON 

INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (1, 1, 1, N'John Adams', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (2, 1, 2, N'Abraham Lincoln', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (3, 1, 3, N'Thomas Jefferson', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (4, 1, 4, N'George Washington', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (5, 2, 1, N'1914', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (6, 2, 2, N'1939', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (7, 2, 3, N'1945', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (8, 2, 4, N'1918', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (9, 3, 1, N'Titanic', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (10, 3, 2, N'Lusitania', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (11, 3, 3, N'Queen Mary', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (12, 3, 4, N'Britannic', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (13, 4, 1, N'1916', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (14, 4, 2, N'1900', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (15, 4, 3, N'1800', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (16, 4, 4, N'1816', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (17, 5, 1, N'Romana', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (18, 5, 2, N'China', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (19, 5, 3, N'Egipcia', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (20, 5, 4, N'Barbara', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (21, 6, 1, N'Napoleón Bonaparte', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (22, 6, 2, N'Julio César', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (23, 6, 3, N'Alejandro Magno', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (24, 6, 4, N'Genghis Khan', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (25, 7, 1, N'La caída del Muro de Berlín', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (26, 7, 2, N'La independencia de Estados Unidos', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (27, 7, 3, N'La toma de la Bastilla', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (28, 7, 4, N'La Guerra de los Cien Años', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (29, 8, 1, N'Mahatma Gandhi', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (30, 8, 2, N'Nelson Mandela', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (31, 8, 3, N'Martin Luther King Jr.', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (32, 8, 4, N'Winston Churchill', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (33, 9, 1, N'1945', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (34, 9, 2, N'1939', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (35, 9, 3, N'1941', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (36, 9, 4, N'1944', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (37, 10, 1, N'Winston Churchill', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (38, 10, 2, N'Franklin D. Roosevelt', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (39, 10, 3, N'Joseph Stalin', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (40, 10, 4, N'Dwight D. Eisenhower', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (41, 11, 1, N'Dinastía Zhou', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (42, 11, 2, N'Dinastía Qin', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (43, 11, 3, N'Dinastía Shang', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (44, 11, 4, N'Dinastía Han', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (45, 12, 1, N'Nicolás II', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (46, 12, 2, N'Alejandro I', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (47, 12, 3, N'Iván el Terrible', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (48, 12, 4, N'Pedro el Grande', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (49, 13, 1, N'1815', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (50, 13, 2, N'1805', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (51, 13, 3, N'1820', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (52, 13, 4, N'1799', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (53, 14, 1, N'Otomano', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (54, 14, 2, N'Romano', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (55, 14, 3, N'Mongol', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (56, 14, 4, N'Persa', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (57, 15, 1, N'RMS Titanic', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (58, 15, 2, N'Lusitania', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (59, 15, 3, N'HMS Hood', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (60, 15, 4, N'HMS Britannic', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (61, 16, 1, N'Ayrton Senna', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (62, 16, 2, N'Michael Schumacher', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (63, 16, 3, N'Lewis Hamilton', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (64, 16, 4, N'Max Verstappen', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (65, 17, 1, N'Michael Phelps', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (66, 17, 2, N'Ian Thorpe', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (67, 17, 3, N'Mark Spitz', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (68, 17, 4, N'Ryan Lochte', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (69, 18, 1, N'5', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (70, 18, 2, N'3', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (71, 18, 3, N'2', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (72, 18, 4, N'4', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (73, 19, 1, N'Tiro con arco', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (74, 19, 2, N'Esgrima', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (75, 19, 3, N'Tiro al blanco', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (76, 19, 4, N'Tiro olímpico', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (77, 20, 1, N'Lakers', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (78, 20, 2, N'Pistons', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (79, 20, 3, N'Bulls', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (80, 20, 4, N'Celtics', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (81, 21, 1, N'Novak Djokovic', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (82, 21, 2, N'Rafael Nadal', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (83, 21, 3, N'Roger Federer', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (84, 21, 4, N'Andy Murray', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (85, 22, 1, N'Bádminton', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (86, 22, 2, N'Squash', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (87, 22, 3, N'Ping-Pong', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (88, 22, 4, N'Esgrima', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (89, 23, 1, N'Bill Russell', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (90, 23, 2, N'LeBron James', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (91, 23, 3, N'Michael Jordan', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (92, 23, 4, N'Stephen Curry', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (93, 24, 1, N'Triatlón', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (94, 24, 2, N'Decatlón', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (95, 24, 3, N'Pentatlón moderno', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (96, 24, 4, N'Heptatlón', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (97, 25, 1, N'1896, Atenas', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (98, 25, 2, N'1900, París', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (99, 25, 3, N'1924, Londres', 0, NULL)
GO
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (100, 25, 4, N'1924, Los Ángeles', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (101, 26, 1, N'Reino Unido', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (102, 26, 2, N'Francia', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (103, 26, 3, N'Grecia', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (104, 26, 4, N'Estados Unidos', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (105, 27, 1, N'Tiger Woods', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (106, 27, 2, N'Jack Nicklaus', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (107, 27, 3, N'Arnold Palmer', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (108, 27, 4, N'Phil Mickelson', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (109, 28, 1, N'9,58 segundos', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (110, 28, 2, N'9,63 segundos', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (111, 28, 3, N'9,74 segundos', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (112, 28, 4, N'9,80 segundos', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (113, 29, 1, N'Sídney, Australia', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (114, 29, 2, N'Londres, Reino Unido', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (115, 29, 3, N'Atenas, Grecia', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (116, 29, 4, N'Pekín, China', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (117, 30, 1, N'Lionel Messi', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (118, 30, 2, N'Lothar Matthäus', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (119, 30, 3, N'Cristiano Ronaldo', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (120, 30, 4, N'Paolo Maldini', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (121, 31, 1, N'Nilo', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (122, 31, 2, N'Amazonas', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (123, 31, 3, N'Yangtsé', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (124, 31, 4, N'Misisipi', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (125, 32, 1, N'Estados Unidos', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (126, 32, 2, N'Rusia', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (127, 32, 3, N'China', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (128, 32, 4, N'Brasil', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (129, 33, 1, N'Roma', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (130, 33, 2, N'París', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (131, 33, 3, N'Berlín', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (132, 33, 4, N'Londres', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (133, 34, 1, N'África', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (134, 34, 2, N'Asia', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (135, 34, 3, N'Europa', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (136, 34, 4, N'América', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (137, 35, 1, N'Océano Atlántico', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (138, 35, 2, N'Océano Índico', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (139, 35, 3, N'Océano Pacífico', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (140, 35, 4, N'Océano Ártico', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (142, 38, 1, N'Portugal', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (143, 38, 2, N'Italia', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (144, 38, 3, N'Andorra', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (145, 38, 4, N'Alemania', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (146, 39, 1, N'Florencia', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (147, 39, 2, N'Venecia', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (148, 39, 3, N'Pisa', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (149, 39, 4, N'Roma', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (150, 40, 1, N'África', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (151, 40, 2, N'Asia', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (152, 40, 3, N'América del Norte', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (153, 40, 4, N'Australia', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (154, 41, 1, N'Sydney', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (155, 41, 2, N'Melbourne', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (156, 41, 3, N'Canberra', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (157, 41, 4, N'Perth', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (158, 37, 1, N'Africa', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (159, 37, 2, N'Asia', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (160, 37, 3, N'América del Norte', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (161, 37, 4, N'Australia', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (162, 42, 1, N'China', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (163, 42, 2, N'Rusia', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (164, 42, 3, N'Brasil', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (165, 42, 4, N'Alemania', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (166, 43, 1, N'Océano Índico', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (167, 43, 2, N'Océano Atlántico', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (168, 43, 3, N'Océano Pacífico', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (169, 43, 4, N'Mar Mediterráneo', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (170, 44, 1, N'Río Amazonas', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (171, 44, 2, N'Río Paraná', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (172, 44, 3, N'Río Orinoco', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (173, 44, 4, N'Río Magdalena', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (174, 45, 1, N'Aconcagua', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (175, 45, 2, N'Everest', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (176, 45, 3, N'Kilimanjaro', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (177, 45, 4, N'Denali', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (178, 46, 1, N'Filipinas', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (179, 46, 2, N'Maldivas', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (180, 46, 3, N'Polinesia Francesa', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (181, 46, 4, N'Indonesia', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (182, 47, 1, N'Vincent van Gogh', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (183, 47, 2, N'Pablo Picasso', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (184, 47, 3, N'Leonardo da Vinci', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (185, 47, 4, N'Salvador Dalí', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (186, 48, 1, N'Miguel Angel', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (187, 48, 2, N'Donatello', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (188, 48, 3, N'Leonardo da Vinci', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (189, 48, 4, N'Rafael', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (190, 49, 1, N'Rembrandt', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (191, 49, 2, N'Johannes Vermeer', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (192, 49, 3, N'Vincent van Gogh', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (193, 49, 4, N'Hieronymus Bosch', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (194, 50, 1, N'Francia', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (195, 50, 2, N'España', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (196, 50, 3, N'Italia', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (197, 50, 4, N'Alemania', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (198, 51, 1, N'Pablo Picasso', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (199, 51, 2, N'Vincent van Gogh', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (200, 51, 3, N'Salvador Dalí', 0, NULL)
GO
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (201, 51, 4, N'Claude Monet', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (202, 52, 1, N'Claude Monet', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (203, 52, 2, N'Pierre-Auguste Renoir', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (204, 52, 3, N'Edgar Degas', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (205, 52, 4, N'Édouard Manet', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (206, 54, 1, N'Diego Rivera', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (207, 54, 2, N'Frida Kahlo', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (208, 54, 3, N'David Alfaro Siqueiros', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (209, 54, 4, N'Rufino Tamayo', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (210, 55, 1, N'René Magritte', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (211, 55, 2, N'Salvador Dalí', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (212, 55, 3, N'Joan Miró', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (213, 55, 4, N'Max Ernst', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (214, 56, 1, N'William Shakespeare', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (215, 56, 2, N'Anton Chekhov', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (216, 56, 3, N'Oscar Wilde', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (217, 56, 4, N'Tennessee Williams', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (218, 57, 1, N'Vincent van Gogh', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (219, 57, 2, N'Edgar Degas', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (220, 57, 3, N'Claude Monet', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (221, 57, 4, N'Pierre-Auguste Renoir', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (222, 58, 1, N'Vincent van Gogh', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (223, 58, 2, N'Edvard Munch', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (224, 58, 3, N'Wassily Kandinsky', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (225, 58, 4, N'Gustav Klimt', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (226, 59, 1, N'Noruega', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (227, 59, 2, N'Dinamarca', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (228, 59, 3, N'Suecia', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (229, 59, 4, N'Finlandia', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (230, 60, 1, N'Pablo Picasso', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (231, 60, 2, N'Joan Miró', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (232, 60, 3, N'Salvador Dalí', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (233, 60, 4, N'Francisco de Goya', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (234, 61, 1, N'Auguste Rodin', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (235, 61, 2, N'Michelangelo', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (236, 61, 3, N'Antonio Canova', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (237, 61, 4, N'Donatello', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (238, 62, 1, N'Ludwig van Beethoven', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (239, 62, 2, N'Pyotr Ilyich Tchaikovsky', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (240, 62, 3, N'Wolfgang Amadeus Mozart', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (241, 62, 4, N'Johann Sebastian Bach', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (242, 63, 1, N'Venus', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (243, 63, 2, N'Mercurio', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (244, 63, 3, N'Marte', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (245, 63, 4, N'Júpiter', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (246, 64, 1, N'Aire', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (247, 64, 2, N'Nitrógeno', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (248, 64, 3, N'Agua', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (249, 64, 4, N'Dióxido de carbono', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (250, 65, 1, N'Pulmones', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (251, 65, 2, N'Hígado', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (252, 65, 3, N'Corazón', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (253, 65, 4, N'Riñones', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (254, 68, 1, N'Venus', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (255, 68, 2, N'Marte', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (256, 68, 3, N'Jupiter', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (257, 68, 4, N'Saturno', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (258, 70, 1, N'Isaac Newton', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (259, 70, 2, N'Albert Einstein', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (260, 70, 3, N'Galileo Galilei', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (261, 70, 4, N'Marie Curie', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (262, 71, 1, N'Fotosíntesis ', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (263, 71, 2, N'Respiración', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (264, 71, 3, N'Digestión', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (265, 71, 4, N'Fermentación', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (266, 72, 1, N'Neutrón', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (267, 72, 2, N'Electrón', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (268, 72, 3, N'Fotón', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (269, 72, 4, N'Protón', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (270, 73, 1, N'Gripe', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (271, 73, 2, N'Sarampión', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (272, 73, 3, N'Varicela', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (273, 73, 4, N'Tuberculosis', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (274, 74, 1, N'Átomo', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (275, 74, 2, N'Célula', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (276, 74, 3, N'Molécula', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (277, 74, 4, N'Organelo', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (278, 75, 1, N'Plomo', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (279, 75, 2, N'Mercurio', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (280, 75, 3, N'Oro', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (281, 75, 4, N'Aluminio', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (282, 76, 1, N'Teoría de la relatividad', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (283, 76, 2, N'Teoría de cuerdas', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (284, 76, 3, N'Teoría del Big Bang', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (285, 76, 4, N'Teoría de la evolución', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (286, 77, 1, N'Isaac Newton', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (287, 77, 2, N'Albert Einstein', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (288, 77, 3, N'Galileo Galilei', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (289, 77, 4, N'Stephen Hawking', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (290, 78, 1, N'Fisión nuclear', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (291, 78, 2, N'Fusión nuclear', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (292, 78, 3, N'Radiación solar', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (293, 78, 4, N'Fotosíntesis solar', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (294, 79, 1, N'Isaac Newton', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (295, 79, 2, N'Max Planck', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (296, 79, 3, N'Niels Bohr', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (297, 79, 4, N'Werner Heisenberg', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (298, 80, 1, N'Mitosis', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (299, 80, 2, N'Fotosíntesis', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (300, 80, 3, N'Reproducción asexual', 0, NULL)
GO
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (301, 80, 4, N'Meiosis', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (302, 81, 1, N'La Cenicienta', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (303, 81, 2, N'La Bella Durmiente', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (304, 81, 3, N'Blancanieves y los siete enanitos', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (305, 81, 4, N'La Sirenita', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (306, 82, 1, N'Prince', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (307, 82, 2, N'Elvis Presley', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (308, 82, 3, N'Michael Jackson', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (309, 82, 4, N'Madonna', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (310, 83, 1, N'Star Trek', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (311, 83, 2, N'Star Wars', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (312, 83, 3, N'Blade Runner', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (313, 83, 4, N'Matrix', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (314, 84, 1, N'El Rey León', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (315, 84, 2, N'Mulán', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (316, 84, 3, N'Aladdín', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (317, 84, 4, N'La Sirenita', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (318, 85, 1, N'Daniel Radcliffe', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (319, 85, 2, N'Elijah Wood', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (320, 85, 3, N'Rupert Grint', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (321, 85, 4, N'Tom Felton', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (322, 86, 1, N'Chris Evans', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (323, 86, 2, N'Robert Downey Jr.', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (324, 86, 3, N'Chris Hemsworth', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (325, 86, 4, N'Mark Ruffalo', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (326, 87, 1, N'The Rolling Stones', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (327, 87, 2, N'Pink Floyd', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (328, 87, 3, N'The Beatles', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (329, 87, 4, N'Led Zeppelin', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (330, 88, 1, N'Inception', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (331, 88, 2, N'Interstellar', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (332, 88, 3, N'The Matrix', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (333, 88, 4, N'Blade Runner', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (334, 89, 1, N'The Rolling Stones', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (335, 89, 2, N'The Beatles', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (336, 89, 3, N'Queen', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (337, 89, 4, N'Led Zeppelin', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (338, 90, 1, N'Brad Pitt', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (339, 90, 2, N'Leonardo DiCaprio', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (340, 90, 3, N'Johnny Depp', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (341, 90, 4, N'Tom Hanks', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (342, 91, 1, N'Kill Bill', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (343, 91, 2, N'Pulp Fiction', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (344, 91, 3, N'Django Unchained', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (345, 91, 4, N'Reservoir Dogs', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (346, 92, 1, N'J.K. Rowling', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (347, 92, 2, N'George R.R. Martin', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (348, 92, 3, N'J.R.R. Tolkien', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (349, 92, 4, N'Stephen King', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (350, 93, 1, N'Alejandro González Iñárritu', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (351, 93, 2, N'Guillermo del Toro', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (352, 93, 3, N'Alfonso Cuarón', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (353, 93, 4, N'Pedro Almodóvar', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (354, 94, 1, N'James Cameron', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (355, 94, 2, N'Steven Spielberg', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (356, 94, 3, N'George Lucas', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (357, 94, 4, N'Peter Jackson', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (358, 95, 1, N'Pulp Fiction', 1, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (359, 95, 2, N'Reservoir Dogs', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (360, 95, 3, N'Kill Bill', 0, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (361, 95, 4, N'Inglourious Basterds', 0, NULL)
SET IDENTITY_INSERT [dbo].[Respuesta] OFF
GO
ALTER TABLE [dbo].[Pregunta]  WITH CHECK ADD  CONSTRAINT [FK_Pregunta_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Pregunta] CHECK CONSTRAINT [FK_Pregunta_Categoria]
GO
ALTER TABLE [dbo].[Pregunta]  WITH CHECK ADD  CONSTRAINT [FK_Pregunta_Dificultad] FOREIGN KEY([IdDificultad])
REFERENCES [dbo].[Dificultad] ([IdDificultad])
GO
ALTER TABLE [dbo].[Pregunta] CHECK CONSTRAINT [FK_Pregunta_Dificultad]
GO
ALTER TABLE [dbo].[Respuesta]  WITH CHECK ADD  CONSTRAINT [FK_Respuesta_Pregunta] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Pregunta] ([IdPregunta])
GO
ALTER TABLE [dbo].[Respuesta] CHECK CONSTRAINT [FK_Respuesta_Pregunta]
GO
USE [master]
GO
ALTER DATABASE [PreguntadORT] SET  READ_WRITE 
GO
