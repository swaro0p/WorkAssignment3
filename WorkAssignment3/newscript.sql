USE [AssetRegister]
GO
/****** Object:  Table [dbo].[Asset]    Script Date: 31-12-2021 10:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Asset](
	[AssetID] [int] IDENTITY(1,1) NOT NULL,
	[AssetName] [varchar](25) NULL,
	[VendorName] [varchar](25) NULL,
	[PurchaseDate] [date] NOT NULL CONSTRAINT [df_pdate]  DEFAULT (CONVERT([date],'29122021')),
	[Cost] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[AssetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[City]    Script Date: 31-12-2021 10:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 31-12-2021 10:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendor](
	[VendorId] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](25) NULL,
	[VendorEmail] [varchar](25) NULL,
	[VendorContact] [bigint] NULL,
	[CityId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VendorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Asset] ON 

INSERT [dbo].[Asset] ([AssetID], [AssetName], [VendorName], [PurchaseDate], [Cost]) VALUES (13, N'Legion', N'Lenovo', CAST(N'2021-12-30' AS Date), 6900)
INSERT [dbo].[Asset] ([AssetID], [AssetName], [VendorName], [PurchaseDate], [Cost]) VALUES (15, N'Nitro', N'Acer', CAST(N'2021-12-28' AS Date), 6900)
INSERT [dbo].[Asset] ([AssetID], [AssetName], [VendorName], [PurchaseDate], [Cost]) VALUES (16, N'Laptop', N'Mac', CAST(N'2021-12-30' AS Date), 120010)
SET IDENTITY_INSERT [dbo].[Asset] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityId], [CityName]) VALUES (1, N'Mumbai')
INSERT [dbo].[City] ([CityId], [CityName]) VALUES (2, N'Nagpur')
INSERT [dbo].[City] ([CityId], [CityName]) VALUES (3, N'Pune')
INSERT [dbo].[City] ([CityId], [CityName]) VALUES (4, N'Thane')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Vendor] ON 

INSERT [dbo].[Vendor] ([VendorId], [VendorName], [VendorEmail], [VendorContact], [CityId]) VALUES (1, N'Mac', N'Online_India@dell.com', 18004252067, 1)
INSERT [dbo].[Vendor] ([VendorId], [VendorName], [VendorEmail], [VendorContact], [CityId]) VALUES (2, N'Lenovo', N'customercare@lenovo.com', 18004199733, 2)
INSERT [dbo].[Vendor] ([VendorId], [VendorName], [VendorEmail], [VendorContact], [CityId]) VALUES (4, N'Acer', N'ail.easycare@acer.com
', 1800116677, 3)
INSERT [dbo].[Vendor] ([VendorId], [VendorName], [VendorEmail], [VendorContact], [CityId]) VALUES (5, N'Asus', N' rc_india@asus.com', 18002090365, 4)
SET IDENTITY_INSERT [dbo].[Vendor] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Asset__95F2301017875913]    Script Date: 31-12-2021 10:05:56 ******/
ALTER TABLE [dbo].[Asset] ADD UNIQUE NONCLUSTERED 
(
	[AssetName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Vendor__7320A3571BFC8699]    Script Date: 31-12-2021 10:05:56 ******/
ALTER TABLE [dbo].[Vendor] ADD UNIQUE NONCLUSTERED 
(
	[VendorName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([CityId])
GO
