USE [abraham]
GO
ALTER TABLE [FOO].[SessionService] DROP CONSTRAINT [FK_Session_SSS_ID]
GO
ALTER TABLE [FOO].[SessionService] DROP CONSTRAINT [FK_Service_SRV_ID]
GO
/****** Object:  Table [FOO].[SessionService]    Script Date: 10/08/2017 15:07:39 ******/
DROP TABLE [FOO].[SessionService]
GO
/****** Object:  Table [FOO].[SessionService]    Script Date: 10/08/2017 15:07:39 ******/
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
