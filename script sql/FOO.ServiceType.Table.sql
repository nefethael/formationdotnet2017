USE [abraham]
GO
/****** Object:  Table [FOO].[ServiceType]    Script Date: 10/08/2017 15:07:39 ******/
DROP TABLE [FOO].[ServiceType]
GO
/****** Object:  Table [FOO].[ServiceType]    Script Date: 10/08/2017 15:07:39 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Description] UNIQUE NONCLUSTERED 
(
	[SVT_Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
