USE [abraham]
GO
/****** Object:  Table [FOO].[Invoice]    Script Date: 10/08/2017 15:07:39 ******/
DROP TABLE [FOO].[Invoice]
GO
/****** Object:  Table [FOO].[Invoice]    Script Date: 10/08/2017 15:07:39 ******/
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
