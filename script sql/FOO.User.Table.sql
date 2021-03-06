USE [abraham]
GO
/****** Object:  Table [FOO].[User]    Script Date: 10/08/2017 15:07:39 ******/
DROP TABLE [FOO].[User]
GO
/****** Object:  Table [FOO].[User]    Script Date: 10/08/2017 15:07:39 ******/
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
