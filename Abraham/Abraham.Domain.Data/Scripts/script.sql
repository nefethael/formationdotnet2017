/*    ==Paramètres de script==

    Version du serveur source : SQL Server 2016 (13.0.4001)
    Édition du moteur de base de données source : Microsoft SQL Server Express Edition
    Type du moteur de base de données source : SQL Server autonome

    Version du serveur cible : SQL Server 2017
    Édition du moteur de base de données cible : Microsoft SQL Server Standard Edition
    Type du moteur de base de données cible : SQL Server autonome
*/
USE [master]
GO
/****** Object:  Database [abraham]    Script Date: 02/10/2017 22:12:35 ******/
CREATE DATABASE [abraham]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'abraham', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\abraham.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'abraham_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\abraham_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [abraham] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [abraham].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [abraham] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [abraham] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [abraham] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [abraham] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [abraham] SET ARITHABORT OFF 
GO
ALTER DATABASE [abraham] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [abraham] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [abraham] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [abraham] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [abraham] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [abraham] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [abraham] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [abraham] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [abraham] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [abraham] SET  DISABLE_BROKER 
GO
ALTER DATABASE [abraham] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [abraham] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [abraham] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [abraham] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [abraham] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [abraham] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [abraham] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [abraham] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [abraham] SET  MULTI_USER 
GO
ALTER DATABASE [abraham] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [abraham] SET DB_CHAINING OFF 
GO
ALTER DATABASE [abraham] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [abraham] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [abraham] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [abraham] SET QUERY_STORE = OFF
GO
USE [abraham]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [abraham]
GO
/****** Object:  Schema [FOO]    Script Date: 02/10/2017 22:12:35 ******/
CREATE SCHEMA [FOO]
GO
/****** Object:  Table [FOO].[Computer]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FOO].[Computer](
	[CMP_Id] [int] IDENTITY(1,1) NOT NULL,
	[CMP_Description] [varchar](512) NOT NULL,
	[CMP_Date] [datetime] NOT NULL,
	[CMP_MaintenanceDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CMP_Id] PRIMARY KEY CLUSTERED 
(
	[CMP_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [FOO].[VW_Computer]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [FOO].[VW_Computer]
AS
SELECT CMP_Id AS Id, CMP_Description AS Description, CMP_Date AS Date, CMP_MaintenanceDate AS MaintenanceDate
FROM     FOO.Computer
GO
/****** Object:  Table [FOO].[Invoice]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FOO].[Invoice](
	[IVC_Id] [int] IDENTITY(1,1) NOT NULL,
	[IVC_Code] [varchar](16) NOT NULL,
	[IVC_Total] [decimal](5, 2) NOT NULL,
	[IVC_Date] [datetime] NOT NULL,
	[IVC_PaidDate] [datetime] NOT NULL,
 CONSTRAINT [PK_IVC_Id] PRIMARY KEY CLUSTERED 
(
	[IVC_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [FOO].[VW_Invoice]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [FOO].[VW_Invoice]
AS
SELECT        IVC_Id AS Id, IVC_Code AS Code, IVC_Total AS Total, IVC_Date AS Date, IVC_PaidDate AS PaidDate
FROM            FOO.Invoice
GO
/****** Object:  Table [FOO].[InvoiceDetail]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FOO].[InvoiceDetail](
	[IVD_Id] [int] IDENTITY(1,1) NOT NULL,
	[IVD_SSS_Id] [int] NOT NULL,
	[IVD_IVC_ID] [int] NOT NULL,
 CONSTRAINT [PK_IVD_Id] PRIMARY KEY CLUSTERED 
(
	[IVD_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [FOO].[VW_InvoiceDetail]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [FOO].[VW_InvoiceDetail]
AS
SELECT        IVD_Id AS Id, IVD_SSS_Id AS SessionId, IVD_IVC_ID AS InvoiceId
FROM            FOO.InvoiceDetail
GO
/****** Object:  Table [FOO].[Service]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FOO].[Service](
	[SRV_Id] [int] IDENTITY(1,1) NOT NULL,
	[SRV_Description] [nvarchar](50) NOT NULL,
	[SRV_Price] [decimal](5, 2) NOT NULL,
	[SRV_Type_Id] [int] NOT NULL,
 CONSTRAINT [PK_SRV_ID] PRIMARY KEY CLUSTERED 
(
	[SRV_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [FOO].[VW_Service]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [FOO].[VW_Service]
AS
SELECT SRV_Id AS Id, SRV_Description AS Description, SRV_Price AS Price, SRV_Type_Id AS ServiceTypeId
FROM     FOO.Service
GO
/****** Object:  Table [FOO].[ServiceType]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FOO].[ServiceType](
	[SVT_Id] [int] IDENTITY(1,1) NOT NULL,
	[SVT_Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_SVT_ID] PRIMARY KEY CLUSTERED 
(
	[SVT_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [FOO].[VW_ServiceType]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [FOO].[VW_ServiceType]
AS
SELECT        SVT_Id AS Id, SVT_Description AS Description
FROM            FOO.ServiceType
GO
/****** Object:  Table [FOO].[Session]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FOO].[Session](
	[SSS_Id] [int] IDENTITY(1,1) NOT NULL,
	[SSS_BeginDate] [datetime] NOT NULL,
	[SSS_EndDate] [datetime] NULL,
	[SSS_USR_Id] [int] NOT NULL,
	[SSS_CMP_Id] [int] NOT NULL,
 CONSTRAINT [PK_SSS_Id] PRIMARY KEY CLUSTERED 
(
	[SSS_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [FOO].[VW_Session]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [FOO].[VW_Session]
AS
SELECT SSS_Id AS Id, SSS_BeginDate AS BeginDate, SSS_EndDate AS EndDate, SSS_USR_Id AS UserId, SSS_CMP_Id AS CmpId
FROM     FOO.Session
GO
/****** Object:  Table [FOO].[SessionService]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FOO].[SessionService](
	[SSV_Id] [int] IDENTITY(1,1) NOT NULL,
	[SSV_Date] [datetime] NOT NULL,
	[SSV_PaidDate] [datetime] NULL,
	[SSV_SSS_Id] [int] NOT NULL,
	[SSV_SRV_Id] [int] NOT NULL,
 CONSTRAINT [PK_SSV_Id] PRIMARY KEY CLUSTERED 
(
	[SSV_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [FOO].[VW_SessionService]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [FOO].[VW_SessionService]
AS
SELECT        SSV_Id AS Id, SSV_Date AS Date, SSV_PaidDate AS PaidDate, SSV_SSS_Id AS SessionId, SSV_SRV_Id AS ServiceId
FROM            FOO.SessionService
GO
/****** Object:  Table [FOO].[TimeBalance]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FOO].[TimeBalance](
	[TMB_Id] [int] IDENTITY(1,1) NOT NULL,
	[TMB_Value] [int] NOT NULL,
	[TMB_Date] [datetime] NOT NULL,
	[TMB_USR_Id] [int] NOT NULL,
 CONSTRAINT [PK_TMB_Id] PRIMARY KEY CLUSTERED 
(
	[TMB_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [FOO].[VW_TimeBalance]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [FOO].[VW_TimeBalance]
AS
SELECT TMB_Id AS Id, TMB_Value AS Value, TMB_Date AS Date, TMB_USR_Id AS UserId
FROM     FOO.TimeBalance
GO
/****** Object:  Table [FOO].[TimeBalanceSession]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FOO].[TimeBalanceSession](
	[TBS_SSS_Id] [int] NOT NULL,
	[TBS_TMB_Id] [int] NOT NULL,
 CONSTRAINT [PK_TBS] PRIMARY KEY CLUSTERED 
(
	[TBS_SSS_Id] ASC,
	[TBS_TMB_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [FOO].[VW_TimeBalanceSession]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [FOO].[VW_TimeBalanceSession]
AS
SELECT        TBS_SSS_Id AS SessionId, TBS_TMB_Id AS TimeBalanceId
FROM            FOO.TimeBalanceSession
GO
/****** Object:  Table [FOO].[User]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FOO].[User](
	[USR_Id] [int] IDENTITY(1,1) NOT NULL,
	[USR_Firstname] [nvarchar](64) NOT NULL,
	[USR_Lastname] [nvarchar](64) NOT NULL,
	[USR_Email] [nvarchar](128) NOT NULL,
	[USR_Balance] [numeric](3, 2) NOT NULL,
 CONSTRAINT [PK_USR_User] PRIMARY KEY CLUSTERED 
(
	[USR_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [FOO].[VW_User]    Script Date: 02/10/2017 22:12:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [FOO].[VW_User]
AS
SELECT        USR_Id AS Id, USR_Firstname AS FirstName, USR_Lastname AS LastName, USR_Email AS Email, USR_Balance AS Balance
FROM            FOO.[User]
GO
ALTER TABLE [FOO].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_IVD_IVC_ID] FOREIGN KEY([IVD_IVC_ID])
REFERENCES [FOO].[Invoice] ([IVC_Id])
GO
ALTER TABLE [FOO].[InvoiceDetail] CHECK CONSTRAINT [FK_IVD_IVC_ID]
GO
ALTER TABLE [FOO].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_IVD_SSS_Id] FOREIGN KEY([IVD_SSS_Id])
REFERENCES [FOO].[Session] ([SSS_Id])
GO
ALTER TABLE [FOO].[InvoiceDetail] CHECK CONSTRAINT [FK_IVD_SSS_Id]
GO
ALTER TABLE [FOO].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_SRV_Type_Id] FOREIGN KEY([SRV_Type_Id])
REFERENCES [FOO].[ServiceType] ([SVT_Id])
GO
ALTER TABLE [FOO].[Service] CHECK CONSTRAINT [FK_Service_SRV_Type_Id]
GO
ALTER TABLE [FOO].[Session]  WITH CHECK ADD  CONSTRAINT [FK_SSS_CMP_Id] FOREIGN KEY([SSS_CMP_Id])
REFERENCES [FOO].[Computer] ([CMP_Id])
GO
ALTER TABLE [FOO].[Session] CHECK CONSTRAINT [FK_SSS_CMP_Id]
GO
ALTER TABLE [FOO].[Session]  WITH CHECK ADD  CONSTRAINT [FK_SSS_USR_Id] FOREIGN KEY([SSS_USR_Id])
REFERENCES [FOO].[User] ([USR_Id])
GO
ALTER TABLE [FOO].[Session] CHECK CONSTRAINT [FK_SSS_USR_Id]
GO
ALTER TABLE [FOO].[SessionService]  WITH CHECK ADD  CONSTRAINT [FK_Service_SRV_ID] FOREIGN KEY([SSV_SRV_Id])
REFERENCES [FOO].[Service] ([SRV_Id])
GO
ALTER TABLE [FOO].[SessionService] CHECK CONSTRAINT [FK_Service_SRV_ID]
GO
ALTER TABLE [FOO].[SessionService]  WITH CHECK ADD  CONSTRAINT [FK_Session_SSS_ID] FOREIGN KEY([SSV_SSS_Id])
REFERENCES [FOO].[Session] ([SSS_Id])
GO
ALTER TABLE [FOO].[SessionService] CHECK CONSTRAINT [FK_Session_SSS_ID]
GO
ALTER TABLE [FOO].[TimeBalance]  WITH CHECK ADD  CONSTRAINT [FK_TMB_USR_Id] FOREIGN KEY([TMB_USR_Id])
REFERENCES [FOO].[User] ([USR_Id])
GO
ALTER TABLE [FOO].[TimeBalance] CHECK CONSTRAINT [FK_TMB_USR_Id]
GO
ALTER TABLE [FOO].[TimeBalanceSession]  WITH CHECK ADD  CONSTRAINT [FK_TBS_SSS_Id] FOREIGN KEY([TBS_SSS_Id])
REFERENCES [FOO].[Session] ([SSS_Id])
GO
ALTER TABLE [FOO].[TimeBalanceSession] CHECK CONSTRAINT [FK_TBS_SSS_Id]
GO
ALTER TABLE [FOO].[TimeBalanceSession]  WITH CHECK ADD  CONSTRAINT [FK_TBS_TMB_Id] FOREIGN KEY([TBS_TMB_Id])
REFERENCES [FOO].[TimeBalance] ([TMB_Id])
GO
ALTER TABLE [FOO].[TimeBalanceSession] CHECK CONSTRAINT [FK_TBS_TMB_Id]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Computer (FOO)"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 168
               Right = 296
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_Computer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_Computer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Invoice (FOO)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 167
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 645
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_Invoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_Invoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "InvoiceDetail (FOO)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 118
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1005
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_InvoiceDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_InvoiceDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Service (FOO)"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 168
               Right = 292
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_Service'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_Service'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ServiceType (FOO)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 101
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_ServiceType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_ServiceType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Session (FOO)"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 168
               Right = 292
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_Session'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_Session'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SessionService (FOO)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 187
               Right = 273
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1755
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_SessionService'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_SessionService'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TimeBalance (FOO)"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 168
               Right = 292
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_TimeBalance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_TimeBalance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TimeBalanceSession (FOO)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 169
               Right = 277
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1140
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_TimeBalanceSession'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_TimeBalanceSession'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[37] 4[24] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "User (FOO)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 180
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1395
         Alias = 1035
         Table = 1215
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_User'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'FOO', @level1type=N'VIEW',@level1name=N'VW_User'
GO
USE [master]
GO
ALTER DATABASE [abraham] SET  READ_WRITE 
GO
