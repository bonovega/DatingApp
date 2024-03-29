USE [master]
GO
/****** Object:  Database [datingapp.db]    Script Date: 8/20/2022 4:47:22 PM ******/
CREATE DATABASE [datingapp.db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'datingapp.db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\datingapp.db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'datingapp.db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\datingapp.db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [datingapp.db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [datingapp.db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [datingapp.db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [datingapp.db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [datingapp.db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [datingapp.db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [datingapp.db] SET ARITHABORT OFF 
GO
ALTER DATABASE [datingapp.db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [datingapp.db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [datingapp.db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [datingapp.db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [datingapp.db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [datingapp.db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [datingapp.db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [datingapp.db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [datingapp.db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [datingapp.db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [datingapp.db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [datingapp.db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [datingapp.db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [datingapp.db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [datingapp.db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [datingapp.db] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [datingapp.db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [datingapp.db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [datingapp.db] SET  MULTI_USER 
GO
ALTER DATABASE [datingapp.db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [datingapp.db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [datingapp.db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [datingapp.db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [datingapp.db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [datingapp.db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [datingapp.db] SET QUERY_STORE = OFF
GO
USE [datingapp.db]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/20/2022 4:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photos]    Script Date: 8/20/2022 4:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](max) NULL,
	[IsMain] [bit] NOT NULL,
	[PublicId] [nvarchar](max) NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK_Photos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/20/2022 4:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[PasswordSalt] [varbinary](max) NULL,
	[Passwordhash] [varbinary](max) NULL,
	[City] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Created] [datetime2](7) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[Gender] [nvarchar](max) NULL,
	[Intersts] [nvarchar](max) NULL,
	[Introduction] [nvarchar](max) NULL,
	[KnownAs] [nvarchar](max) NULL,
	[LastActive] [datetime2](7) NOT NULL,
	[LookingFor] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211008180805_InitialCreate', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211015165319_UserPaswordEdit', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211025201536_ExtendedUserEntity', N'5.0.11')
GO
SET IDENTITY_INSERT [dbo].[Photos] ON 

INSERT [dbo].[Photos] ([Id], [Url], [IsMain], [PublicId], [AppUserId]) VALUES (1, N'https://randomuser.me/api/portraits/women/85.jpg', 1, NULL, 1)
INSERT [dbo].[Photos] ([Id], [Url], [IsMain], [PublicId], [AppUserId]) VALUES (2, N'https://randomuser.me/api/portraits/women/58.jpg', 1, NULL, 2)
INSERT [dbo].[Photos] ([Id], [Url], [IsMain], [PublicId], [AppUserId]) VALUES (3, N'https://randomuser.me/api/portraits/women/89.jpg', 1, NULL, 3)
INSERT [dbo].[Photos] ([Id], [Url], [IsMain], [PublicId], [AppUserId]) VALUES (4, N'https://randomuser.me/api/portraits/women/45.jpg', 1, NULL, 4)
INSERT [dbo].[Photos] ([Id], [Url], [IsMain], [PublicId], [AppUserId]) VALUES (5, N'https://randomuser.me/api/portraits/women/72.jpg', 1, NULL, 5)
INSERT [dbo].[Photos] ([Id], [Url], [IsMain], [PublicId], [AppUserId]) VALUES (6, N'https://randomuser.me/api/portraits/men/98.jpg', 1, NULL, 6)
INSERT [dbo].[Photos] ([Id], [Url], [IsMain], [PublicId], [AppUserId]) VALUES (7, N'https://randomuser.me/api/portraits/men/54.jpg', 1, NULL, 7)
INSERT [dbo].[Photos] ([Id], [Url], [IsMain], [PublicId], [AppUserId]) VALUES (8, N'https://randomuser.me/api/portraits/men/34.jpg', 1, NULL, 8)
INSERT [dbo].[Photos] ([Id], [Url], [IsMain], [PublicId], [AppUserId]) VALUES (9, N'https://randomuser.me/api/portraits/men/38.jpg', 1, NULL, 9)
INSERT [dbo].[Photos] ([Id], [Url], [IsMain], [PublicId], [AppUserId]) VALUES (10, N'https://randomuser.me/api/portraits/men/41.jpg', 1, NULL, 10)
INSERT [dbo].[Photos] ([Id], [Url], [IsMain], [PublicId], [AppUserId]) VALUES (11, N'https://randomuser.me/api/portraits/women/58.jpg', 0, NULL, 11)
INSERT [dbo].[Photos] ([Id], [Url], [IsMain], [PublicId], [AppUserId]) VALUES (13, N'https://res.cloudinary.com/dwv2vfwe8/image/upload/v1636122551/kipgawbi1ewh2uioajrh.jpg', 1, N'kipgawbi1ewh2uioajrh', 11)
INSERT [dbo].[Photos] ([Id], [Url], [IsMain], [PublicId], [AppUserId]) VALUES (16, N'https://res.cloudinary.com/dwv2vfwe8/image/upload/v1636215145/lfpvcgg3exfa9gt9hfgk.png', 0, N'lfpvcgg3exfa9gt9hfgk', 11)
INSERT [dbo].[Photos] ([Id], [Url], [IsMain], [PublicId], [AppUserId]) VALUES (17, N'https://res.cloudinary.com/dwv2vfwe8/image/upload/v1636656182/x2e9z2fuykqtzmcr0bxp.png', 1, N'x2e9z2fuykqtzmcr0bxp', 14)
INSERT [dbo].[Photos] ([Id], [Url], [IsMain], [PublicId], [AppUserId]) VALUES (18, N'https://res.cloudinary.com/dwv2vfwe8/image/upload/v1636656554/pm09vbaog2l0si8glpka.png', 1, N'pm09vbaog2l0si8glpka', 15)
SET IDENTITY_INSERT [dbo].[Photos] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (1, N'megan', 0x8B454BB3FAEA33843D4AFF5DB79EA42438F6447F3215449E4BEA2F20D08A33FA0D69979B6134FF05C55FFC32DA6812C86042E752FC63A1FB1CF5C20E115F791FEB5E11964C3B29E7F44A59F335B359BDD39E9FCF00985E72944EE965AB33DFF0DAB999F657CF0B5D4433527FA763E6DC7DC9934FC33E341DE00B1D508BB34D9C, 0xF011D4C0A3189E08FDE1CDECFD29C02EF0B3A7A6A852A591B72780B2BB555E367644FE6860DDD072DECE1206BF54D6AE42839668E499DC7F496A6B594D683D21, N'Marbury', N'Antarctica', CAST(N'2020-02-16T00:00:00.0000000' AS DateTime2), CAST(N'1962-11-16T00:00:00.0000000' AS DateTime2), N'female', NULL, N'Aliquip consequat voluptate officia labore. Consequat do aliquip reprehenderit cupidatat. Qui in ad ut aliquip cupidatat sit tempor cupidatat consectetur ipsum et dolor sunt aute. Officia ea nulla mollit adipisicing eiusmod. Incididunt voluptate nostrud officia qui do labore voluptate sint consectetur.
', N'Megan', CAST(N'2020-05-30T00:00:00.0000000' AS DateTime2), N'Eiusmod culpa qui irure mollit sit. Enim do minim non incididunt anim sit Lorem. In enim qui adipisicing reprehenderit consequat qui nulla magna eu in aute enim laboris. Tempor consequat incididunt dolor consequat sit dolore voluptate commodo. Eu minim mollit ut deserunt irure consequat ex mollit aliquip laboris tempor sit cillum ea. Amet aute nostrud commodo sunt consequat exercitation eiusmod enim. Aliqua cillum veniam occaecat ea dolore.
')
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (2, N'natalie', 0x87599F7C67E39F454AAAF0E814A551BD3869666C21C2DE582FD4C9DAB551452B7845CB708AA3A34DEBB3874AD6AADCE7E029AEBEBF4429AB6E81779EE20EBE06CBA9099DDB90176475C9E9510D86534D8434F0552BEC457B63B54464FE6177358D9FBC9C933C38ACFCBA7260AFF6F1D28ACC3E3E45BE8BBC83A87CA83B8BBEC9, 0xF3EA0FEA47031B14B080EF4C270D8DBEF5497F5AB0BAD9E75FA8DAFB794AAA7B41916CF5516B2D0197F2BA5417863E2D13F2505C00623AD4A7530B64ED01AEA5, N'Waterloo', N'Liberia', CAST(N'2020-01-21T00:00:00.0000000' AS DateTime2), CAST(N'1962-07-18T00:00:00.0000000' AS DateTime2), N'female', NULL, N'Occaecat eiusmod cupidatat est minim nisi voluptate nisi laboris. Proident magna laborum elit elit deserunt ipsum ipsum reprehenderit fugiat occaecat. Voluptate tempor Lorem esse mollit ea reprehenderit qui aute incididunt enim sint.
', N'Natalie', CAST(N'2020-05-14T00:00:00.0000000' AS DateTime2), N'Mollit minim ex ex dolor aliquip consequat laboris. Irure tempor sit quis culpa fugiat exercitation adipisicing sit voluptate aliquip ex. Eiusmod esse Lorem sint consequat. Irure id ipsum cillum Lorem magna et deserunt voluptate elit culpa. Sint ad reprehenderit occaecat tempor voluptate dolor reprehenderit quis adipisicing. Commodo cupidatat qui anim quis.
')
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (3, N'patty', 0x067B1C7A3147F671EEE8F4AF85F758C89E00C788749FE56F09D02B8FF193D6BA8C42A2C4E4F2C50DD4DB79A682A214CEF54451E5C7DBF9AADE0A3B8FB1C8AD3C8DBB1D48961649A4D4CDA5520421B2E232DDE385802253A4598BF0B50D53827C5BE4EBF4B25E9774C5D6D4BFBF1589C0EBD497E837AC5664ED86A6990C0E6E92, 0xEBD244D2023E54BA3F17FE0C48F0A73EEEB2B34014F989589F91DCCF574D072974511070A87BB3301B052678383F64E72A39AFF7427EBB1F764D789DF73E68A8, N'Bergoo', N'Tanzania', CAST(N'2019-03-22T00:00:00.0000000' AS DateTime2), CAST(N'1970-07-15T00:00:00.0000000' AS DateTime2), N'female', NULL, N'Aliqua magna exercitation ea consequat cillum amet non. Adipisicing enim elit laborum dolore exercitation in in irure irure minim sint do in. Cupidatat nostrud aliquip Lorem et in sit culpa duis. Commodo aliquip elit et exercitation veniam commodo. Non officia minim ea in sit qui sit nisi reprehenderit sit anim exercitation Lorem ullamco.
', N'Patty', CAST(N'2020-05-03T00:00:00.0000000' AS DateTime2), N'Ex proident culpa est sint commodo aliquip dolore pariatur id. Culpa enim laborum duis cupidatat tempor velit veniam proident ipsum. Aliqua id mollit Lorem ea ullamco quis et est Lorem ut sint cupidatat.
')
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (4, N'ashlee', 0xE602237808B61A2294B6B4C398079AD0D5085A9BB0FF758C1C56282FF981C81F765D086D3FF61DE7415ECF857AF7FB659CAC1D4CDE49DB164BDB79BF4C24E460B906453A9DA82A453DC6A877AF85EB7317AF7584B3145087F7089F39C66DA3902B271EBE3756FA062C8D4F15EBF48B6B2D02A6DB1831C3EB4A5170E46E2DC218, 0x46A928D96184D1CD1351C8DB81D0E1E11CD8A7A4DF032F04C19080EA6A03B4A370D80DA30EF6C1CB1069FD1A5701CBEBBD5E7FE78B1AFCB2461F3C1C36B17ADE, N'Cuylerville', N'Svalbard and Jan Mayen Islands', CAST(N'2019-07-18T00:00:00.0000000' AS DateTime2), CAST(N'1985-10-10T00:00:00.0000000' AS DateTime2), N'female', NULL, N'Sint ex ipsum enim id. Dolore culpa labore deserunt id fugiat est esse culpa laborum tempor duis nostrud magna ea. Mollit dolore nostrud ullamco deserunt enim. Qui cupidatat elit culpa minim anim elit est cillum nulla nostrud labore ad nostrud. Esse eu irure velit dolor adipisicing ullamco cillum officia ut in. Aliqua et anim sint consectetur nostrud dolore officia mollit eiusmod veniam non. Magna ullamco nisi excepteur irure incididunt cillum irure laborum duis reprehenderit Lorem.
', N'Ashlee', CAST(N'2020-05-24T00:00:00.0000000' AS DateTime2), N'Deserunt eu cillum eu cupidatat excepteur occaecat sint mollit velit sunt sunt duis. Quis nisi quis officia ea excepteur aliquip cupidatat non duis commodo ex occaecat deserunt deserunt. Reprehenderit anim nulla officia pariatur cupidatat sint fugiat esse nulla dolor amet labore officia laborum. Pariatur velit velit exercitation ipsum culpa et commodo. Et deserunt eu qui amet sunt nisi anim quis adipisicing voluptate. Velit pariatur sunt cupidatat ullamco reprehenderit incididunt.
')
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (5, N'lucile', 0x214FD7D2D9F4047D812ECF6DCCD42D72B5D04C67B1FD4D8C9F8003E41E5495011546B873FA2737C15B58709F76F16D18C1BE23A68969C719DF521E0D17E1A866E1D3CF892E030AEB50E3619AC9EE7E3E8535FC10D7CD19D60D29EA9395A5E2CACB57CFBCD98B5C651FA78D1311DCB7E7C1E006F6597A868F8D15B1E85D0A34FC, 0xB1C2A03EE7D0B951D7128F971DC57F6042FBE6A27BAE2923385FA6D53AF9B7C569F83CD4CC5FF3E4F57698B889DA96F3744A79E4DD5C9DDC1E5AC466A9576033, N'Juarez', N'Saudi Arabia', CAST(N'2019-09-18T00:00:00.0000000' AS DateTime2), CAST(N'1969-01-07T00:00:00.0000000' AS DateTime2), N'female', NULL, N'Proident voluptate commodo ex quis occaecat tempor anim Lorem enim ullamco sit minim excepteur velit. Enim proident nostrud magna minim reprehenderit laboris. Labore in qui eiusmod pariatur quis laboris eu.
', N'Lucile', CAST(N'2020-06-06T00:00:00.0000000' AS DateTime2), N'Dolore minim sit cillum laborum. Ea anim qui ipsum ad est ipsum tempor incididunt incididunt laboris Lorem. Est Lorem elit cupidatat fugiat id aliqua. Aute cupidatat incididunt esse minim culpa eiusmod duis ut deserunt reprehenderit duis amet aliquip sunt. Ad excepteur consequat quis aliquip sint adipisicing irure nostrud proident laboris occaecat. Amet ea occaecat ut eu tempor do dolor commodo laboris tempor excepteur non. Reprehenderit duis dolor non adipisicing.
')
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (6, N'pope', 0xADB0D9537379A6B4919291F4FAAC10432BF042ACE78C5F6BB1C878ACD5036B6D3600648537115CA2C85FE515929D8E7430290733C470E99AC52FB7314FA808E6858B0C27893B7AB41BC8BEF25195FEE42EC060E57A1DC1D72EF35651F4B44B1031868B714100C52521466FD18C6E3C737E2B97B06FB7E87FC33EFD1380D49736, 0x73998D996B8EA0C995AC1F949AD8FD805403D2218D37A2D6130253B94850815082DE6926A5F31D812A280E5FAD9138C29CF223FEAC9432AD319DA697FD8AEE6A, N'Leyner', N'Brazil', CAST(N'2019-11-24T00:00:00.0000000' AS DateTime2), CAST(N'1958-04-30T00:00:00.0000000' AS DateTime2), N'male', NULL, N'Veniam veniam sunt magna ullamco voluptate anim non. Veniam elit commodo non voluptate est consequat dolore. Ut exercitation esse ut id irure esse velit id eu cupidatat ex aliqua non. Ad elit commodo amet velit do nulla ullamco laboris dolor non reprehenderit voluptate dolore. Ad in mollit deserunt Lorem irure veniam cillum excepteur sit duis. Id eiusmod ex id aliqua aute officia. Mollit fugiat excepteur cillum commodo eiusmod culpa fugiat fugiat do nulla eu nisi fugiat.
', N'Pope', CAST(N'2020-06-17T00:00:00.0000000' AS DateTime2), N'Enim nisi sit cillum ad elit consectetur culpa. Ullamco minim dolor nisi tempor mollit cillum velit aliquip Lorem consequat cillum id. Ipsum pariatur anim exercitation sit quis reprehenderit nostrud mollit tempor occaecat velit. Nisi minim et deserunt sunt consectetur labore.
')
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (7, N'stanley', 0x172DBDD86996471862A49C0584F4DE321177B5EC0FEA8BA14B891F98A6B577BB39A47FE1885C7111FDFCD1D8FE249852D3764E9088F3E3F743234804935C39BA89CC3D57D2C7CDD00D691A5628223F2F2C8AD613BC654438D8A711C666EE9932F7143CDBA5EA54CE42C792CC0920296D5444B3D7A598B45F34A133F4D4010989, 0x383D3C34CEA61D44D35024425F045454AE0B280AF6CB599576EDCB2FC22824AE34C77366F28E5E63B6A9A74F9EB4FB5456C670747562D39684EE163956F72C1D, N'Advance', N'Korea (South)', CAST(N'2019-12-31T00:00:00.0000000' AS DateTime2), CAST(N'1963-01-30T00:00:00.0000000' AS DateTime2), N'male', NULL, N'Duis amet deserunt culpa veniam eiusmod veniam irure eu. Ut esse voluptate occaecat ipsum tempor cupidatat do sit tempor. Aliqua laborum aliquip pariatur proident occaecat. Et aute deserunt tempor esse ipsum cupidatat ut excepteur esse exercitation pariatur reprehenderit occaecat. Adipisicing commodo Lorem magna sunt. Id sit cillum ea consequat mollit nisi pariatur. Nisi cillum id quis velit mollit nulla cillum eu fugiat ullamco cillum voluptate sint dolore.
', N'Stanley', CAST(N'2020-05-17T00:00:00.0000000' AS DateTime2), N'Ea fugiat sit ullamco eiusmod reprehenderit consectetur nostrud ipsum. Laborum nisi cillum est deserunt. Nulla est adipisicing irure sunt deserunt dolor excepteur sunt dolore culpa nostrud id mollit officia.
')
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (8, N'schultz', 0xBA83601C5EE44E2A602FE298568EEAEF0534CED65D0507A3750390FF6D0722580AC1775FF42AA7CBBD3814BCCB4CBCBC478B6C9A42FD76E8EC2977CA9DBE8C1CB1E6C324BECE77BD3DDEA4CE84702B48E8F1832E72E3645DF7658BFBB5533E5C82F66E35B01FD52BEC89119A56B0D111E59BDB90E565E23474C5DCEB0CCCB28A, 0xFEA65EA66BD276FEF215B6288AD08CA1426D888C676851AA9A244B364AB31D6A89BFE7586E8DF31CAB8E64CF5AEFB18DBB0482B6BBDE248F53A805B1936680B1, N'Albrightsville', N'Macau', CAST(N'2019-04-28T00:00:00.0000000' AS DateTime2), CAST(N'1998-04-09T00:00:00.0000000' AS DateTime2), N'male', NULL, N'Exercitation enim laboris ea cupidatat eu et elit anim est nulla sunt. Nulla amet anim nisi commodo ipsum. Eiusmod fugiat deserunt id irure amet commodo tempor amet reprehenderit laborum culpa amet. Adipisicing Lorem reprehenderit ex pariatur ullamco do voluptate in ullamco sunt nulla ullamco incididunt anim.
', N'Schultz', CAST(N'2020-05-29T00:00:00.0000000' AS DateTime2), N'Aliquip culpa et reprehenderit cillum occaecat qui laboris. Proident eu occaecat velit veniam. Ex ut ipsum consectetur ad Lorem amet Lorem nisi.
')
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (9, N'dennis', 0x6775167B928DD899DD6F1F8878B65AA90BAD1C30D88945250DBF9DA4E8CC6F09C6A859EE11568716AFEA494C13622198B8BAE5DB564963AEAFF9FF30E9317839BA71CCD020B16071CA0451C970C6818A5167E521B7ACCBB14969499D02274164C31461AE4CCA5670F43B232CA0504B8E419F47234D0C9D5EFBFF3F5486DA87AA, 0x24F3C72E4E4DD535EB5FD280C0087F6187E01735F4C0B73807C132100E11EF6B978928B9A48E5CEF2A8852DDC2166E5B24251FF7FC9FDC7BDDA02A5B0E0DE6EA, N'Sexton', N'Saint Lucia', CAST(N'2019-11-21T00:00:00.0000000' AS DateTime2), CAST(N'1976-07-13T00:00:00.0000000' AS DateTime2), N'male', NULL, N'Tempor nisi irure duis laborum do pariatur dolor ea adipisicing deserunt reprehenderit. Adipisicing sint ut minim cillum laboris aliqua et labore voluptate. Magna mollit aliquip et do laboris dolore. Adipisicing labore occaecat dolor ad ipsum occaecat deserunt non excepteur et fugiat ut. Aute qui culpa exercitation adipisicing cillum commodo.
', N'Dennis', CAST(N'2020-05-06T00:00:00.0000000' AS DateTime2), N'Aute labore cillum excepteur sunt deserunt labore sit veniam deserunt. Anim amet est magna do nulla. Sint sint commodo laboris laborum irure ad mollit. Deserunt exercitation nulla dolore sit velit commodo officia ex quis proident proident occaecat. Esse laborum elit minim reprehenderit Lorem in deserunt fugiat adipisicing labore eu nulla ullamco tempor.
')
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (10, N'waters', 0x1C914EF9275EA11CF4F32B6662A872DA22C820EC66F9A86CDE26B1060F577CC5F790F20F205E7D092B09FFE577907F7D93585CF3DF015FCF765D215A76CEC2477DD13A4CB24BD6EF838F810CBC0553863439C544E3D5CCAC8045CBEA068D4EF3C1568BB6419E82C4B10E288435F09BABC60AEFC2A99C50E8D5592E611672549A, 0xA77727626450BEF8021A7A4CE6A534F6869B540B17DB390E2DC469B3792C49B19136241047FD70131BD7867758532CB8D9BDC023293231455E6084348B57C02D, N'Greenbackville', N'Croatia (Hrvatska)', CAST(N'2020-06-19T00:00:00.0000000' AS DateTime2), CAST(N'1982-06-19T00:00:00.0000000' AS DateTime2), N'male', NULL, N'Id tempor qui exercitation mollit sint minim id consequat. Ex dolore voluptate non consectetur sit amet. Lorem adipisicing magna consequat fugiat. Ut labore exercitation aliquip adipisicing excepteur deserunt sint pariatur voluptate. Incididunt veniam cupidatat ipsum nulla esse. Anim amet et dolor cupidatat aute.
', N'Waters', CAST(N'2020-05-04T00:00:00.0000000' AS DateTime2), N'Duis amet dolor ut ex sunt tempor velit qui. Esse eu do ea aliquip id Lorem aliquip cupidatat dolore veniam tempor proident eiusmod. Culpa culpa adipisicing non ullamco fugiat. Tempor exercitation fugiat magna consequat deserunt eu esse nulla aliquip reprehenderit deserunt mollit eu. Sunt non excepteur eiusmod laborum adipisicing fugiat deserunt laboris. Magna quis cupidatat esse ipsum labore deserunt sit do adipisicing aute et ut amet.
')
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (11, N'lisa', 0xB90081807D41249A9A4276D78C4597B11086BFB5F8727B5D2EF824AB55FD5079B9CF60EC6326158DB913F9F6CCCEF4470A9697FC2CECB52617937FB288F4ABEF3785CCA8B5981653325B5B7CF5466255396E8D97C68009542D3A10D35DCBAD0F0F1BA1414DC3362C5284983B274756E88585FE8D489580A9679181625F1C8660, 0x7B77E94E29AFFC948378272F42FAB5A5A54B32C2485DFB487329AF2B54DF3E82B247D881ED0FB185B30AD1B7550BFA85A0D6057918FD5CE05547108743548961, N'Updated city', N'Updated country', CAST(N'2021-10-28T19:46:50.1386202' AS DateTime2), CAST(N'1976-07-13T00:00:00.0000000' AS DateTime2), N'female', NULL, N'Updated intro 1', N'Lis', CAST(N'2022-01-12T10:02:14.7839327' AS DateTime2), N'Updated lookingFor')
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (12, N'boris', 0x2811A9C760DD5978D44DFB634049E386E25FA8298FC7B9B5DD0A4C321314FFCDE987285B3AEC183AF5EE5C44D6C2ABC786930AA9CDDA8ADE7EB5C446B9D31330CE60B3F6DA68302C297A6791A0A6CF37DB34B9F840227B6E6C1D326D4D568322DBBB44909CF60C86657DBE49B3C962190F86642400FDB29E9214D28491D3C254, 0x6F9024D58673C33832161B7012FF5BAA388CA0C50547B019F835ADC8C705B8CA8416105E222C7E2106767C8235749A01F6E4D6B6DBC4B63417D9F3E25441B894, N'Rijeka', N'Croatia', CAST(N'2021-11-04T21:07:40.8621429' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, N'dfwfv2efv22222', NULL, CAST(N'2021-11-04T21:07:40.8621570' AS DateTime2), N'rbbgbbbbbbbbbbbbbbb')
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (13, N'bob', 0x3BA2FC994C27F9BA3E373A3A83574AC354D4AB944D38BB0D72FF47BAC8AD1023BE12B3E7488D1B3907F95A2A94A0D278A0A16CCAAF5AD858B0F1D333F63D451017E26FA54AF70DC25EE3DAA79166EF36ED456639EFC2CE16B78C2B56B426E1C28F39284E9A5BD3AEA1D956B37896E61DB7A4DC0245C07E25DC97A680B7ED8DC4, 0xF96BF796B464C802F80095914441C482A548915D0F80862E80A72F1AE829A7FEB67755BCDCFBBB4D98C9D118BD9E202642887B46152FFE8EBAD7411102985371, N'London', N'UK', CAST(N'2021-11-11T18:33:15.7003780' AS DateTime2), CAST(N'1985-01-23T00:00:00.0000000' AS DateTime2), N'male', NULL, NULL, N'Bob', CAST(N'2021-11-11T18:33:15.7003958' AS DateTime2), NULL)
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (14, N'bruce', 0x7A29AFAEB59E8BF37B8F5AE842AE6F1A116A0C97F994E7C1E30C0971E8BC4EB73676144EF37F61470E6231F0A62A855DA25A9CC3813F452426D0612BB4A4BA9038A1C58D571B066E7BBA78E7A7B518C33B601624524637CDA03B23C8D6B6C65D06A5D2EE0DC385CF376F53529E18746C81AA437F7954A6265FC9D2CE7506BC47, 0x0E6B986059FAB182E28BDFF772E9B1444661652CC48F8A37E8AF0D04D3DDF6E487637F03B4A95FDEF3A0CDBF79053338C0F7E85243E0A933DEC27D162D056E14, N'London', N'UK', CAST(N'2021-11-11T19:00:54.0111626' AS DateTime2), CAST(N'2003-11-11T17:59:59.4660000' AS DateTime2), N'male', NULL, N'hello', N'Bruce', CAST(N'2021-11-23T20:02:17.2617423' AS DateTime2), NULL)
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (15, N'peter', 0xEEF5CC6D0E63E42EB9B57796653F404925955FD4AFE6AB6EDF32FD2DD2FE0C08AB443F3D9292F4A49E6977E2A2F5E7B03C7FC1B46D08FD43C6FC69ACB4AD21415603D9536B2C249BA057986769992E819087C63FE87EC1281995BE11FE2B3CEE62EC92DA6F7087EBA30523DDD48BC5E6C8FAF00DEE2AC611722EA5F37839FF8A, 0x9EA22B43869372020E673AA8158D9AE4DF9ADDE538A3757BB5128AB7E8528091DF323724E13711A6D82850E94A976DCAAD3062D3ABDCECBE6F0131B10E2BD1E0, N'London', N'UK', CAST(N'2021-11-11T19:48:51.0954005' AS DateTime2), CAST(N'2003-11-07T18:48:21.5060000' AS DateTime2), N'male', NULL, N'hi', N'Peter', CAST(N'2021-11-11T19:48:51.0954067' AS DateTime2), NULL)
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (16, N'string', 0xA0BEF4E9F3C94C7CFE0890AFA0B79577D9F082F62EB85B64F019294B422920E0E0464B8C1FCF813B36E8BBC7696A9546E79028742BE37F2C07EE70C4E27F7257526AD0EE842804EAC2A3580C582CCA999C1EF9D1D0302B15E64DB3A688E407C9F6440AFACCDE4FA4191B00BAE9392AD9436F7CD46B369703DA14764C401E6E16, 0x19E29AC61898D9168A473202FD329CA0428E3F5F72C8C1B5954548A293CDC59809255DEBFD38D9212538507645731E7D0ED23A918F720DAD1EFA0A03EE952A52, N'string', N'string', CAST(N'2021-12-05T18:27:14.5063226' AS DateTime2), CAST(N'2021-12-05T17:27:09.0350000' AS DateTime2), N'string', NULL, NULL, N'string', CAST(N'2021-12-05T18:27:14.5072098' AS DateTime2), NULL)
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (17, N'elvis presley', 0xA89E1BC5DF166D38BCDDA9B56E43BE6EEA283678186DC5A01891F594CC4F58E8B0490C792C2E661C5B02FD2B7383B11E5DDEB7485782F662F7CB4421A70E3E33869AB1D430343F007DA5E2A6329F3DFC89CF669382E0DF6655EDB67C63DA7D8D0FBCA86E543E287E13A541CFD77E39F3951BF9E329661202B75299F14AE860C5, 0x2F9DEBD81E11EBBFB9488C5ECEB325891B1DA3BFD91D872C4CADB837F2DA4FDD1C2099039D584CC1665BC730428E66BF78A61E8FF2FB30CFDB91FA663D002AC7, N'Memphis', N'USA', CAST(N'2022-01-11T12:12:21.6825272' AS DateTime2), CAST(N'0001-01-07T10:49:55.0190000' AS DateTime2), N'male', NULL, NULL, N'elvis', CAST(N'2022-01-11T12:12:22.9539647' AS DateTime2), NULL)
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (18, N'boris jeroncic', 0xF5811B92CE3B84EBD3FA8121B76B091C6DE457F8D7AE3E0C7BF1641D8F0B71C2656F267A8F58521CEA1DD281E6CB3910680ED83D8DD6D8BC28E3305D7C1B7601FB942AB33DD3C34E00DB676D7A6B3D9B35B4DCC70B1A3D644C7B5538167D3873292AD8C2D43E0E939D67F6ADCA9410062CD511E8B3799CF2B3F4967BB690D7DF, 0x4D5F66E3B1D8D96DA853A86440A23A58AB2C98990CDF7E69AFAB5B30AAE964EF894503B3E74203A179B33D68EAEECB105121C8F6E1641D28302D95FB7F58B213, N'Rijeka', N'Croatia', CAST(N'2022-05-29T13:28:42.9074910' AS DateTime2), CAST(N'1973-07-29T12:27:55.2120000' AS DateTime2), N'male', NULL, NULL, N'Boky', CAST(N'2022-05-29T13:30:25.3488784' AS DateTime2), NULL)
INSERT [dbo].[Users] ([Id], [UserName], [PasswordSalt], [Passwordhash], [City], [Country], [Created], [DateOfBirth], [Gender], [Intersts], [Introduction], [KnownAs], [LastActive], [LookingFor]) VALUES (19, N'bjeroncic', 0x8604CC716BD68311A3B7B829FF490AD3995D907ABC19E42FE83E6AD7702BE08816C22663D50543401C850D23242276A576C61EB87B341112F86C2C866285C2F3831A03EEEC63974658C661211C89CDA62ADD7F32E9A6D817FF313A03CD8185991C54EE3A9FB71360BB4181B7AF82CFED447018C8387C3B59604BBC6D809BCC3B, 0x267433FCF3ECE740C685D937FD2D8477520B132FA0C15D7B20455F233497DF2C7E5328100C453EF9CC82414D99D5F667C65E5A74B3657C62C7C709ECF2DA1601, N'rijeka', N'croatia', CAST(N'2022-05-30T12:39:56.6551686' AS DateTime2), CAST(N'2004-05-16T10:39:34.4610000' AS DateTime2), N'male', NULL, NULL, N'boky', CAST(N'2022-05-30T21:33:50.4935218' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Photos_AppUserId]    Script Date: 8/20/2022 4:47:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_Photos_AppUserId] ON [dbo].[Photos]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [Created]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [DateOfBirth]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [LastActive]
GO
ALTER TABLE [dbo].[Photos]  WITH CHECK ADD  CONSTRAINT [FK_Photos_Users_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Photos] CHECK CONSTRAINT [FK_Photos_Users_AppUserId]
GO
USE [master]
GO
ALTER DATABASE [datingapp.db] SET  READ_WRITE 
GO
