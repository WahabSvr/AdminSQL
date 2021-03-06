USE [master]
GO
/****** Object:  Database [Hotel_Management_System]    Script Date: 29-Oct-20 8:55:20 AM ******/
CREATE DATABASE [Hotel_Management_System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hotel_Management_System', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Hotel_Management_System.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hotel_Management_System_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Hotel_Management_System_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Hotel_Management_System] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hotel_Management_System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hotel_Management_System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hotel_Management_System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hotel_Management_System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hotel_Management_System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hotel_Management_System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hotel_Management_System] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Hotel_Management_System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hotel_Management_System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hotel_Management_System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hotel_Management_System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hotel_Management_System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hotel_Management_System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hotel_Management_System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hotel_Management_System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hotel_Management_System] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Hotel_Management_System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hotel_Management_System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hotel_Management_System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hotel_Management_System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hotel_Management_System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hotel_Management_System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hotel_Management_System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hotel_Management_System] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hotel_Management_System] SET  MULTI_USER 
GO
ALTER DATABASE [Hotel_Management_System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hotel_Management_System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hotel_Management_System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hotel_Management_System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hotel_Management_System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hotel_Management_System] SET QUERY_STORE = OFF
GO
USE [Hotel_Management_System]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Hotel_Management_System]
GO
/****** Object:  UserDefinedFunction [dbo].[Fn_Room]    Script Date: 29-Oct-20 8:55:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Function [dbo].[Fn_Room]()
returns int
as begin
	declare @total int
	select @total = count(Rooms.RoomID) from Rooms
	return @total
end
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 29-Oct-20 8:55:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[Date_In] [date] NULL,
	[Date_Out] [date] NULL,
	[Number_of_Person] [int] NULL,
	[Number_of_Days] [int] NULL,
	[Room_no] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Booking_CurrentMonth]    Script Date: 29-Oct-20 8:55:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_Booking_CurrentMonth]
as
select * from Bookings
where MONTH(Date_In)=MONTH(Getdate())
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 29-Oct-20 8:55:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Name] [varchar](30) NULL,
	[Gender] [varchar](15) NULL,
	[C_Address] [varchar](50) NULL,
	[Phone] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel_Info]    Script Date: 29-Oct-20 8:55:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel_Info](
	[HID] [int] IDENTITY(1,1) NOT NULL,
	[B_ID] [int] NULL,
	[R_ID] [int] NULL,
	[Cs_ID] [int] NULL,
	[PID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[HID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 29-Oct-20 8:55:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[Payment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Total_Ammount] [money] NULL,
	[Paid_Ammount] [money] NULL,
	[Due_Ammount] [money] NULL,
	[Payer_Name] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Payment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 29-Oct-20 8:55:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[Room_No] [int] NULL,
	[Room_Categories] [varchar](15) NULL,
	[Room_price_perNight] [money] NULL,
	[Room_status] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Room_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [index_Customer]    Script Date: 29-Oct-20 8:55:21 AM ******/
CREATE NONCLUSTERED INDEX [index_Customer] ON [dbo].[Customers]
(
	[Customer_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ('Free') FOR [Room_status]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([Room_no])
REFERENCES [dbo].[Rooms] ([Room_No])
GO
ALTER TABLE [dbo].[Hotel_Info]  WITH CHECK ADD FOREIGN KEY([Cs_ID])
REFERENCES [dbo].[Customers] ([Customer_ID])
GO
ALTER TABLE [dbo].[Hotel_Info]  WITH CHECK ADD FOREIGN KEY([B_ID])
REFERENCES [dbo].[Bookings] ([BookingID])
GO
ALTER TABLE [dbo].[Hotel_Info]  WITH CHECK ADD FOREIGN KEY([PID])
REFERENCES [dbo].[Payments] ([Payment_ID])
GO
ALTER TABLE [dbo].[Hotel_Info]  WITH CHECK ADD FOREIGN KEY([R_ID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
/****** Object:  StoredProcedure [dbo].[Sp_ins_Bookings]    Script Date: 29-Oct-20 8:55:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Sp_ins_Bookings]
@din date,@Dout date, @Np int,@Nd int,@Rm int
As
Begin
	Insert Bookings
	Values(@din,@Dout, @Np,@Nd,@Rm)
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ins_Customers]    Script Date: 29-Oct-20 8:55:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ins_Customers]
@Cname Varchar(30),@Gnd varchar(15),@Addrs varchar(50),@Phn varchar(15)
as
begin
	Insert Customers
	values (@Cname ,@Gnd,@Addrs ,@Phn )
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ins_Hotel_Info]    Script Date: 29-Oct-20 8:55:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ins_Hotel_Info]
@BID int,@RID int,@CsId int,@PID int
as
begin
	Insert Hotel_Info
	values (@BID,@RID ,@CsId ,@PID )
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ins_Rooms]    Script Date: 29-Oct-20 8:55:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ins_Rooms]
@RmNo int,@RmCtg varchar(15),@RmPr money,@RmS varchar(20)
as
begin
	Insert Rooms
	values (@RmNo,@RmCtg,@RmPr,@RmS)
End
GO
USE [master]
GO
ALTER DATABASE [Hotel_Management_System] SET  READ_WRITE 
GO
