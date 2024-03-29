USE [master]
GO
/****** Object:  Database [ChamplainCharityLLC]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE DATABASE [ChamplainCharityLLC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChamplainCharityLLC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ChamplainCharityLLC.mdf' , SIZE = 6336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ChamplainCharityLLC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ChamplainCharityLLC_log.ldf' , SIZE = 7040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ChamplainCharityLLC] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChamplainCharityLLC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChamplainCharityLLC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChamplainCharityLLC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChamplainCharityLLC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChamplainCharityLLC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChamplainCharityLLC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET RECOVERY FULL 
GO
ALTER DATABASE [ChamplainCharityLLC] SET  MULTI_USER 
GO
ALTER DATABASE [ChamplainCharityLLC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChamplainCharityLLC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChamplainCharityLLC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChamplainCharityLLC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ChamplainCharityLLC] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ChamplainCharityLLC]
GO
/****** Object:  User [NT AUTHORITY\NETWORK SERVICE]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE USER [NT AUTHORITY\NETWORK SERVICE] FOR LOGIN [NT AUTHORITY\NETWORK SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [Foodshelf]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE SCHEMA [Foodshelf]
GO
/****** Object:  Schema [Inventory]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE SCHEMA [Inventory]
GO
/****** Object:  Schema [Maintenance]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE SCHEMA [Maintenance]
GO
/****** Object:  Schema [Message]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE SCHEMA [Message]
GO
/****** Object:  Schema [Person]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE SCHEMA [Person]
GO
/****** Object:  Schema [Signature]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE SCHEMA [Signature]
GO
/****** Object:  Schema [SSN]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE SCHEMA [SSN]
GO
/****** Object:  Schema [Volunteer]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE SCHEMA [Volunteer]
GO
/****** Object:  Rule [NoYesMaybe]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE RULE [dbo].[NoYesMaybe] 
AS
@choice IN (0, 1, 2);

GO
/****** Object:  Rule [YesNo]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE RULE [dbo].[YesNo] 
AS
@list in (0,1)

GO
/****** Object:  Rule [YesNoMaybe]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE RULE [dbo].[YesNoMaybe] 
AS
@list in (0,1,2)

GO
/****** Object:  Rule [GroceriesOrBreadProduce]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE RULE [Foodshelf].[GroceriesOrBreadProduce] 
AS
@list in (0,1)

GO
/****** Object:  XmlSchemaCollection [Person].[AdditionalContactInfoSchemaCollection]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE XML SCHEMA COLLECTION [Person].[AdditionalContactInfoSchemaCollection] AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"><xsd:element name="AdditionalContactInfo"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactRecord http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element></xsd:schema><xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactRecord" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactRecord"><xsd:element name="ContactRecord"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:any namespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" /></xsd:choice><xsd:attribute name="date" type="xsd:date" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element></xsd:schema><xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" elementFormDefault="qualified"><xsd:element name="eMail" type="t:eMailType" /><xsd:element name="facsimileTelephoneNumber" type="t:phoneNumberType" /><xsd:element name="homePostalAddress" type="t:addressType" /><xsd:element name="internationaliSDNNumber" type="t:phoneNumberType" /><xsd:element name="mobile" type="t:phoneNumberType" /><xsd:element name="pager" type="t:phoneNumberType" /><xsd:element name="physicalDeliveryOfficeName" type="t:addressType" /><xsd:element name="registeredAddress" type="t:addressType" /><xsd:element name="telephoneNumber" type="t:phoneNumberType" /><xsd:element name="telexNumber" type="t:phoneNumberType" /><xsd:complexType name="addressType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="Street" type="xsd:string" maxOccurs="2" /><xsd:element name="City" type="xsd:string" /><xsd:element name="StateProvince" type="xsd:string" /><xsd:element name="PostalCode" type="xsd:string" minOccurs="0" /><xsd:element name="CountryRegion" type="xsd:string" /><xsd:element name="SpecialInstructions" type="t:specialInstructionsType" minOccurs="0" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="eMailType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="eMailAddress" type="xsd:string" /><xsd:element name="SpecialInstructions" type="t:specialInstructionsType" minOccurs="0" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="phoneNumberType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="number"><xsd:simpleType><xsd:restriction base="xsd:string"><xsd:pattern value="[0-9\(\)\-]*" /></xsd:restriction></xsd:simpleType></xsd:element><xsd:element name="SpecialInstructions" type="t:specialInstructionsType" minOccurs="0" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="specialInstructionsType" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:schema>'
GO
/****** Object:  UserDefinedDataType [dbo].[Flag]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE TYPE [dbo].[Flag] FROM [bit] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[Name]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE TYPE [dbo].[Name] FROM [nvarchar](50) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[NameStyle]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE TYPE [dbo].[NameStyle] FROM [bit] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[Notes]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE TYPE [dbo].[Notes] FROM [nvarchar](max) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[NoYes]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE TYPE [dbo].[NoYes] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[NoYesMaybe]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE TYPE [dbo].[NoYesMaybe] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[Phone]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE TYPE [dbo].[Phone] FROM [nvarchar](25) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[x]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE TYPE [dbo].[x] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [Foodshelf].[GroceryOrBreadProduce]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE TYPE [Foodshelf].[GroceryOrBreadProduce] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [Person].[SSN]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE TYPE [Person].[SSN] FROM [nvarchar](9) NOT NULL
GO
/****** Object:  UserDefinedTableType [dbo].[BatchProcessPersonID]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE TYPE [dbo].[BatchProcessPersonID] AS TABLE(
	[RowID] [int] NOT NULL,
	[PersonID] [int] NULL,
	[ActionToTake] [nvarchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[LUTableChanges]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE TYPE [dbo].[LUTableChanges] AS TABLE(
	[TableRows] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](50) NULL,
	[ActionTaken] [nvarchar](50) NULL,
	[Oldvalue] [nvarchar](max) NULL,
	[OldLUTableID] [int] NULL,
	[NewValue] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[LUTableChangesa]    Script Date: 10/8/2021 11:21:40 PM ******/
CREATE TYPE [dbo].[LUTableChangesa] AS TABLE(
	[TableRows] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](50) NULL,
	[ActionTaken] [nvarchar](50) NULL,
	[Oldvalue] [nvarchar](max) NULL,
	[OldLUTableID] [int] NULL,
	[NewValue] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[ActionToTake]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Gary Savard
-- Create date: 28 April 11
-- Description:	This function validates the actions to be taken when a household member becomes the client, etc.
--				If the input value is valid, then the function returns 1, if not, 0.
-- =============================================
CREATE FUNCTION [dbo].[ActionToTake]
(
	@Source NVarchar(8)
	
)
RETURNS int
AS
BEGIN
	DECLARE
	@Result int,
	@Temp NVarchar(8)
	
	SET @Result =0;
	SET @Temp ='';
	
	
	SELECT @Temp = LTRIM(RTRIM(@Source));--Clean any spaces out
	
	IF @Temp = 'DEMOTE'
		SET @Result = 1; 
	ELSE IF @Temp ='DELETE'	
		SET @Result = 1; 
	ELSE IF @Temp ='NEWHOUSEHOLD'
		SET @Result = 1; 
	ELSE
		SET @Result =0;



	RETURN @Result;

END



GO
/****** Object:  UserDefinedFunction [dbo].[CheckRecertifyDate]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Gary Savard
-- Create date: 26 Oct 10
-- Description:	This function determines whether a customer must recertify based on the 1 year criteria
-- The PersonID input is optional and, if it is zero then we just work based on the LastCertificationDate input
-- If the PersonID is >0 then we get the last certification date from the foodshelf.foodshelfcertification table and ignore
--the input date.
-- =============================================
CREATE FUNCTION [dbo].[CheckRecertifyDate]
(
	@PersonID int =0, --We can just do the calculation based on input date time, or by getting from the Foodshelf.FoodshelfCertification table
	@LastCertificationDate DateTime
	
)
RETURNS bit
AS
BEGIN
	DECLARE
	@Result BIT,
	@TempDate DATETIME
	SET @Result =0; --Could debate whether 0 or 1 is better for default.
	SET @TempDate =SYSDATETIME();
	
	IF @PersonID =0
	BEGIN
		IF (DATEDIFF(DD,@LastCertificationDate,SYSDATETIME()) >= 365)
			BEGIN
				SET	@Result =1;
				RETURN @RESULT;
			END
		ELSE
			BEGIN
				SET @Result =0;
				RETURN @Result;
			END
	END
	
	ELSE 
		BEGIN
		 SELECT @TempDate = MAX(LastCertificationDate) 
			FROM Foodshelf.FoodShelfCertification Where PersonID = @PersonID 
			  
			IF (DATEDIFF(DD,@TempDate,SYSDATETIME()) >= 365)
			BEGIN
				SET	@Result =1;
				RETURN @RESULT;
			END
		ELSE
			BEGIN
				SET @Result =0;
				RETURN @Result;
			END
		END
	
	
	RETURN @Result;

END



GO
/****** Object:  UserDefinedFunction [dbo].[ValidateDataSource]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gary Savard
-- Create date: 26 Oct 10
-- Description:	This function takes in a set of possible values for origin of a new record: FOOD,WX,MICRO,TENANT,COMMACT
--				If the input value is valid, then the function returns 1, if not, 0.
-- =============================================
CREATE FUNCTION [dbo].[ValidateDataSource]
(
	@Source NVarchar(8)
	
)
RETURNS int
AS
BEGIN
	DECLARE
	@Result int,
	@Temp NVarchar(8)
	
	SET @Result =0;
	SET @Temp ='';
	
	
	SELECT @Temp = LTRIM(RTRIM(@Source));--Clean any spaces out
	
	IF @Temp = 'FOOD'
		SET @Result = 1; 
	ELSE IF @Temp ='WX'	
		SET @Result = 1; 
	ELSE IF @Temp ='MICRO'
		SET @Result = 1; 
	ELSE IF @Temp ='TENANT'
		SET @Result = 1; 
	ELSE IF @Temp ='COMMACT'
		SET @Result = 1; 
	ELSE IF @Temp ='ADMIN'
		SET @Result =1;
	ELSE
		SET @Result =0;



	RETURN @Result;

END


GO
/****** Object:  Table [dbo].[GuidelinesByProgram]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuidelinesByProgram](
	[GuidelinesID] [int] IDENTITY(1,1) NOT NULL,
	[ProgramID] [int] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GuidelinesByProgram] PRIMARY KEY CLUSTERED 
(
	[GuidelinesID] ASC,
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HouseholdTransferRequest]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseholdTransferRequest](
	[ClientMaintenanceID] [int] IDENTITY(1,1) NOT NULL,
	[OriginalClientID] [int] NULL,
	[HouseholdMemberToMoveID] [int] NOT NULL,
	[NewClientID] [int] NOT NULL,
	[ActionRequested] [int] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JournalClientFamilyChanges]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JournalClientFamilyChanges](
	[JournalClientFamilyChangesID] [int] IDENTITY(1,1) NOT NULL,
	[HouseholdMembersID] [int] NOT NULL,
	[PreviousClientsID] [int] NULL,
	[NewClientsID] [int] NULL,
	[ActionTaken] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JournalLookupTableChanges]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JournalLookupTableChanges](
	[JournalLookupTableID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](50) NULL,
	[ActionTaken] [nvarchar](50) NOT NULL,
	[OldValue] [nvarchar](max) NULL,
	[OldLUTableID] [int] NULL,
	[NewValue] [nvarchar](max) NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LUHouseholdTransferOptions]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LUHouseholdTransferOptions](
	[HouseholdTransferActionID] [int] IDENTITY(1,1) NOT NULL,
	[ActionToTake] [nvarchar](50) NOT NULL,
	[ActionToTakeDescription] [nvarchar](max) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LUStateFederalProgram]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LUStateFederalProgram](
	[StateFederalProgramID] [int] IDENTITY(1,1) NOT NULL,
	[IsFederal] [bit] NOT NULL,
	[ProgramName] [nvarchar](50) NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUStateFederalProgram] PRIMARY KEY CLUSTERED 
(
	[StateFederalProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Organization]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[OrganizationID] [int] NOT NULL,
	[OrganizationName] [nvarchar](50) NOT NULL,
	[Phone] [nchar](10) NULL,
	[Address] [nvarchar](50) NULL,
	[Note] [nvarchar](max) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProgramGuidelines]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramGuidelines](
	[ProgramGuidelinesID] [int] IDENTITY(1,1) NOT NULL,
	[GuidelinesID] [int] NOT NULL,
	[Guideline1] [nvarchar](max) NOT NULL,
	[Guideline2] [nvarchar](max) NULL,
	[Guideline3] [nvarchar](max) NULL,
	[Guideline4] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProgramGuidelines] PRIMARY KEY CLUSTERED 
(
	[ProgramGuidelinesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Foodshelf].[FoodShelfCertification]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Foodshelf].[FoodShelfCertification](
	[FoodShelfCertificationID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[CertificationTextID] [int] NOT NULL,
	[LastCertificationDate] [datetime] NOT NULL,
	[IsPaperCertification] [bit] NULL,
	[PaperCertificationDate] [datetime] NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_FoodShelfCertification_1] PRIMARY KEY CLUSTERED 
(
	[FoodShelfCertificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Foodshelf].[FoodshelfRules]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Foodshelf].[FoodshelfRules](
	[FoodshelfRulesID] [int] IDENTITY(1,1) NOT NULL,
	[FoodshelfRules] [nvarchar](max) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Foodshelf].[FoodTypeGiven]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Foodshelf].[FoodTypeGiven](
	[PersonID] [int] NOT NULL,
	[FoodTypeGivenID] [int] IDENTITY(1,1) NOT NULL,
	[ReceivedDate] [datetime] NOT NULL,
	[FoodGiven] [Foodshelf].[GroceryOrBreadProduce] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_FoodTypeGiven] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC,
	[FoodTypeGivenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Foodshelf].[HouseholdNotes]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Foodshelf].[HouseholdNotes](
	[HouseholdNotesID] [int] IDENTITY(1,1) NOT NULL,
	[ClientPersonID] [int] NOT NULL,
	[HouseholdMemberPersonID] [int] NULL,
	[Notes] [nvarchar](max) NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[HouseholdNotesID] ASC,
	[ClientPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Foodshelf].[LUCertificationText]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Foodshelf].[LUCertificationText](
	[CertificationTextID] [int] IDENTITY(1,1) NOT NULL,
	[CertificationText] [nvarchar](max) NOT NULL,
	[GuidelinesText] [nvarchar](max) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Foodshelf].[Signature]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Foodshelf].[Signature](
	[SignatureID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[FoodShelfCertificationID] [int] NOT NULL,
	[Signature] [varchar](max) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_Signature] PRIMARY KEY CLUSTERED 
(
	[SignatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Maintenance].[UserModifiableTables]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Maintenance].[UserModifiableTables](
	[UserModifiableTablesID] [int] IDENTITY(1,1) NOT NULL,
	[FromSchema] [nvarchar](30) NOT NULL,
	[FromTable] [nchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Message].[Msg]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Message].[Msg](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [dbo].[Name] NULL,
	[ErrMsg] [varchar](50) NULL,
	[ErrNo] [varchar](50) NULL,
	[StoredProcedure] [varchar](100) NULL,
	[inputValues] [varchar](max) NULL,
	[ErrDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Person].[Address]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PersonID] [int] NOT NULL,
	[AddressLine1] [nvarchar](60) NOT NULL,
	[AddressLine2] [nvarchar](60) NULL,
	[City] [nvarchar](30) NOT NULL,
	[County] [nvarchar](30) NULL,
	[State] [nvarchar](2) NOT NULL,
	[PostalCode] [nvarchar](10) NULL,
	[AddressTypeID] [int] NULL,
	[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Address_ModifiedDate]  DEFAULT (getdate()),
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[Demographics]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Demographics](
	[DemographicsID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[EducationCategoryID] [int] NULL,
	[HousingStatus] [int] NULL,
	[NumberInHousehold] [int] NULL,
	[Gender] [nvarchar](2) NULL,
	[Race] [int] NULL,
	[CountryOfOrigin] [int] NULL,
	[Ethnicity] [int] NULL,
	[Disability] [dbo].[NoYesMaybe] NOT NULL,
	[CSFP] [dbo].[NoYesMaybe] NOT NULL,
	[Veteran] [dbo].[NoYesMaybe] NOT NULL,
	[HealthInsurance] [dbo].[NoYesMaybe] NOT NULL,
	[FamilyStatusType] [int] NULL,
	[InsuranceType] [int] NULL,
	[FoodStamps] [dbo].[NoYesMaybe] NOT NULL,
	[HomeboundDelivery] [dbo].[NoYesMaybe] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK__Deomogra__E81ABA19151B244E] PRIMARY KEY CLUSTERED 
(
	[DemographicsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[FamilyRelationships]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[FamilyRelationships](
	[FamilyRelationshipID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[ClientPersonID] [int] NOT NULL,
	[RelationshipID] [int] NOT NULL,
	[RelationDescription] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_FamilyRelationships] PRIMARY KEY CLUSTERED 
(
	[FamilyRelationshipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[Income]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Income](
	[IncomeSourceRowID] [int] IDENTITY(1,1) NOT NULL,
	[IncomeSourceID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Income] PRIMARY KEY CLUSTERED 
(
	[IncomeSourceRowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LanguagesSpoken]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LanguagesSpoken](
	[LanguageID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[IsPrimaryLanguage] [bit] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[rowid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[LanguagesSpokenID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_LanguagesSpoken] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUAddressType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUAddressType](
	[AddressTypeID] [int] IDENTITY(1,1) NOT NULL,
	[AddressType] [nvarchar](10) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_AddressType_ModifiedDate]  DEFAULT (getdate()),
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_AddressType_AddressTypeID] PRIMARY KEY CLUSTERED 
(
	[AddressTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUCity]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUCity](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[StateID] [int] NOT NULL,
	[CountyID] [int] NOT NULL,
	[PostalCodeID] [int] NOT NULL,
	[CityName] [nvarchar](30) NOT NULL,
	[CityAbbreviation] [nvarchar](30) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUCity] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUContactType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUContactType](
	[ContactTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ContactType_ContactTypeID] PRIMARY KEY CLUSTERED 
(
	[ContactTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUCountryOfOrigin]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUCountryOfOrigin](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryAbbreviation] [nvarchar](50) NULL,
	[CountryName] [nvarchar](70) NOT NULL,
	[FIPSCode] [nvarchar](2) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUCountryOfOrigin_CountryID] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUCounty]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUCounty](
	[CountyID] [int] IDENTITY(1,1) NOT NULL,
	[CityID] [int] NOT NULL,
	[StateID] [int] NOT NULL,
	[CountyName] [nvarchar](20) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUCounty] PRIMARY KEY CLUSTERED 
(
	[CountyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUEducationCategory]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUEducationCategory](
	[EducationCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[EducationLevel] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUEducationCategory_EducationCategoryID] PRIMARY KEY CLUSTERED 
(
	[EducationCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUEthnicity]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUEthnicity](
	[EthnicityID] [int] IDENTITY(1,1) NOT NULL,
	[EthnicityAbbreviation] [nvarchar](20) NOT NULL,
	[EthnicityDescription] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUEthnicity_EthnicityID] PRIMARY KEY CLUSTERED 
(
	[EthnicityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUFamilyRelationship]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUFamilyRelationship](
	[FamilyRelationshipID] [int] IDENTITY(1,1) NOT NULL,
	[RelationshipCode] [nvarchar](30) NOT NULL,
	[RelationshipDescription] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUFamilyRelationship_FamilyRelationshipID] PRIMARY KEY CLUSTERED 
(
	[FamilyRelationshipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUFamilyStatusType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUFamilyStatusType](
	[FamilyStatusTypeID] [int] IDENTITY(1,1) NOT NULL,
	[FamilyStatusType] [nvarchar](50) NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUFamilyStatusType_FamilyStatusTypeID] PRIMARY KEY CLUSTERED 
(
	[FamilyStatusTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUHousingStatus]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUHousingStatus](
	[HousingStatusID] [int] IDENTITY(1,1) NOT NULL,
	[HousingStatus] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUHousingStatus_HousingStatusID] PRIMARY KEY CLUSTERED 
(
	[HousingStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUIncomeSource]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUIncomeSource](
	[IncomeSourceID] [int] IDENTITY(1,1) NOT NULL,
	[IncomeSourceAbbreviation] [nvarchar](20) NOT NULL,
	[IncomeSourceDescription] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUIncomeSource_IncomeSourceID] PRIMARY KEY CLUSTERED 
(
	[IncomeSourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUInsuranceType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUInsuranceType](
	[InsuranceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[InsuranceType] [nvarchar](50) NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUInsuranceType_InsuranceTypeID] PRIMARY KEY CLUSTERED 
(
	[InsuranceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LULanguage]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LULanguage](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageName] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LULanguage_LanguageID] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUPersonType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUPersonType](
	[PersonTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PersonType] [nvarchar](20) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUPersonType_PersonTypeID] PRIMARY KEY CLUSTERED 
(
	[PersonTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUPhoneType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUPhoneType](
	[PhoneTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PhoneType] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUPhoneType_PhoneTypeID] PRIMARY KEY CLUSTERED 
(
	[PhoneTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUPostalCode]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUPostalCode](
	[PostalCodeID] [int] IDENTITY(1,1) NOT NULL,
	[CityID] [int] NOT NULL,
	[PostalCode] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUPostalCode] PRIMARY KEY CLUSTERED 
(
	[PostalCodeID] ASC,
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUProgramServiceType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUProgramServiceType](
	[ProgramServiceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceCode] [nvarchar](20) NOT NULL,
	[ServiceDescription] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUProgramServiceType_ProgramServiceTypeID] PRIMARY KEY CLUSTERED 
(
	[ProgramServiceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUProgramType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUProgramType](
	[ProgramTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProgramName] [nvarchar](20) NOT NULL,
	[ProgramDescription] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUProgramType_ProgramTypeID] PRIMARY KEY CLUSTERED 
(
	[ProgramTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LURace]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LURace](
	[RaceID] [int] IDENTITY(1,1) NOT NULL,
	[RaceAbbreviation] [nvarchar](20) NOT NULL,
	[RaceDescription] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LURace_RaceID] PRIMARY KEY CLUSTERED 
(
	[RaceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[LUState]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[LUState](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateCode] [nvarchar](2) NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_State_ModifiedDate]  DEFAULT (getdate()),
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_State_StateID] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[Notes]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Notes](
	[HouseholdNotesID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[HouseholdNotesID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Person].[Person]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Title] [nvarchar](8) NULL,
	[FirstName] [dbo].[Name] NOT NULL,
	[MiddleName] [dbo].[Name] NULL,
	[LastName] [dbo].[Name] NOT NULL,
	[Suffix] [nvarchar](10) NULL,
	[DateOfBirth] [datetime] NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[EmailContactPreference] [dbo].[NoYes] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Person_ModifiedDate]  DEFAULT (getdate()),
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [dbo].[NoYes] NULL,
 CONSTRAINT [PK_Person_PersonID] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[PersonAddresses]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[PersonAddresses](
	[AddressID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_PersonAddresses] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[Phone]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Phone](
	[PhoneID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[PhoneNumber] [dbo].[Phone] NOT NULL,
	[PhoneExtension] [nvarchar](8) NULL,
	[PhoneType] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[PhoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[Programs]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Programs](
	[ProgramsID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_Programs] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC,
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[ProgramServicesUsed]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[ProgramServicesUsed](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[ProgramServiceID] [int] NOT NULL,
 CONSTRAINT [PK_ProgramServicesUsed_1] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC,
	[PersonID] ASC,
	[ProgramID] ASC,
	[ProgramServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Signature].[Signature]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Signature].[Signature](
	[SignatureID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[Signature] [varchar](max) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_Signature] PRIMARY KEY CLUSTERED 
(
	[SignatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Signature].[Signatures]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Signature].[Signatures](
	[SignaturesID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[SignatureID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_Signatures] PRIMARY KEY CLUSTERED 
(
	[SignaturesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [SSN].[SSN]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SSN].[SSN](
	[SSNID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[SSN] [nvarchar](9) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_SSN] PRIMARY KEY CLUSTERED 
(
	[SSNID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Volunteer].[LUVolunteerDay]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Volunteer].[LUVolunteerDay](
	[DayOfWeekID] [int] IDENTITY(1,1) NOT NULL,
	[DayOfWeek] [nvarchar](10) NULL,
 CONSTRAINT [PK_LUVolunteerDay] PRIMARY KEY CLUSTERED 
(
	[DayOfWeekID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Volunteer].[LUVolunteerJobType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Volunteer].[LUVolunteerJobType](
	[VolunteerJobTypeID] [int] IDENTITY(1,1) NOT NULL,
	[JobType] [varchar](50) NOT NULL,
	[JobDescription] [varchar](100) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUVolunteerJobType] PRIMARY KEY CLUSTERED 
(
	[VolunteerJobTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Volunteer].[LUVolunteerScheduleMonth]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Volunteer].[LUVolunteerScheduleMonth](
	[MonthID] [int] IDENTITY(1,1) NOT NULL,
	[MonthName] [nvarchar](20) NULL,
 CONSTRAINT [PK_LUVolunteerScheduleMonth] PRIMARY KEY CLUSTERED 
(
	[MonthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Volunteer].[LUVolunteerType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Volunteer].[LUVolunteerType](
	[VolunteerTypeID] [int] IDENTITY(1,1) NOT NULL,
	[VolunteerType] [nvarchar](20) NOT NULL,
	[VolunteerTypeDescription] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_LUVolunteerType] PRIMARY KEY CLUSTERED 
(
	[VolunteerTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Volunteer].[VolunteerContactInformation]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Volunteer].[VolunteerContactInformation](
	[ContactInformationID] [int] IDENTITY(1,1) NOT NULL,
	[VolunteerPersonID] [int] NOT NULL,
	[ContactPersonID] [int] NOT NULL,
	[OrganizationID] [int] NULL,
	[ContactFirstName] [dbo].[Name] NOT NULL,
	[ContactLastName] [dbo].[Name] NOT NULL,
	[ContactDOB] [datetime] NULL,
	[ContactAddress1] [nvarchar](max) NULL,
	[ContactAddress2] [nvarchar](max) NULL,
	[ContactHomePhone] [dbo].[Phone] NULL,
	[ContactWorkPhone] [dbo].[Phone] NULL,
	[ContactCellPhone] [dbo].[Phone] NULL,
	[ContactPager] [nvarchar](20) NULL,
	[ContactEmail] [nvarchar](50) NULL,
	[VolunteerTypeID] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_VolunteerContactInformation] PRIMARY KEY CLUSTERED 
(
	[VolunteerPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Volunteer].[VolunteerEmergencyContact]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Volunteer].[VolunteerEmergencyContact](
	[VolunteerEmergencyContactID] [int] IDENTITY(1,1) NOT NULL,
	[VolunteerPersonID] [int] NOT NULL,
	[ContactInformation] [nvarchar](max) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_VolunteerEmergencyContact_VolunteerEmergencyContactID] PRIMARY KEY CLUSTERED 
(
	[VolunteerEmergencyContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Volunteer].[VolunteerJobs]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Volunteer].[VolunteerJobs](
	[VolunteerJobsID] [int] IDENTITY(1,1) NOT NULL,
	[VolunteerScheduleDayTimeID] [int] NOT NULL,
	[Job] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_VolunteerJobs_VolunteerJobsID] PRIMARY KEY CLUSTERED 
(
	[VolunteerJobsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Volunteer].[VolunteerNotes]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Volunteer].[VolunteerNotes](
	[VolunteerNotesID] [int] IDENTITY(1,1) NOT NULL,
	[VolunteerPersonID] [int] NOT NULL,
	[Note] [varchar](max) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_VolunteerNotes_VolunteerNotesID] PRIMARY KEY CLUSTERED 
(
	[VolunteerNotesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Volunteer].[VolunteerScheduleDayTime]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Volunteer].[VolunteerScheduleDayTime](
	[VolunteerScheduleDayTimeID] [int] IDENTITY(1,1) NOT NULL,
	[VolunteerScheduleWeekID] [int] NOT NULL,
	[DayOfWeek] [int] NOT NULL,
	[AvailableBeginTime] [time](7) NOT NULL,
	[AvailableEndTime] [time](7) NOT NULL,
	[IsNoShow] [bit] NOT NULL,
	[ActualHoursTotal] [numeric](18, 0) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_VolunteerScheduleDayTime_VolunteerScheduleDayTimeID] PRIMARY KEY CLUSTERED 
(
	[VolunteerScheduleDayTimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Volunteer].[VolunteerScheduleMonth]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Volunteer].[VolunteerScheduleMonth](
	[VolunteerScheduleMonthID] [int] IDENTITY(1,1) NOT NULL,
	[VolunteerPersonID] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_VolunteerScheduleMonth] PRIMARY KEY CLUSTERED 
(
	[VolunteerScheduleMonthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Volunteer].[VolunteerScheduleWeek]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Volunteer].[VolunteerScheduleWeek](
	[VolunteerScheduleWeekID] [int] IDENTITY(1,1) NOT NULL,
	[VolunteerScheduleMonthID] [int] NOT NULL,
	[Week] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [dbo].[Name] NOT NULL,
 CONSTRAINT [PK_VolunteerScheduleWeek] PRIMARY KEY CLUSTERED 
(
	[VolunteerScheduleWeekID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[GetGroceryHistory]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gary Savard
-- Create date: 14 April, 2011
-- Description:	Returns the number of times a client received groceries from the foodshelf in the past 6 months.
-- =============================================
CREATE FUNCTION [dbo].[GetGroceryHistory] 
(@PersonID int)
RETURNS TABLE 
AS
RETURN 
  select ReceivedDate from foodshelf.FoodTypeGiven where PersonID =@PersonID 
  and ReceivedDate between DATEADD(m,-6,(CONVERT(DATE,GETDATE()))) and CONVERT(DATE,GETDATE()) and FoodGiven =0;


GO
/****** Object:  UserDefinedFunction [dbo].[GetWorkHistory]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetWorkHistory]
	(@VolunteerPersonID int)
	RETURNS TABLE
	AS
	RETURN
		SELECT v.ActualHoursTotal, w.[Week], m.[MonthName], d.[DayOfWeek], l.[JobType], l.[JobDescription]
		FROM Volunteer.VolunteerScheduleDayTime as v
		INNER JOIN Volunteer.VolunteerScheduleWeek as w
		on v.VolunteerScheduleWeekID = w.VolunteerScheduleWeekID
		INNER JOIN Volunteer.VolunteerScheduleMonth as s
		on s.VolunteerScheduleMonthID = w.VolunteerScheduleMonthID
		INNER JOIN Volunteer.LUVolunteerDay as d
		ON v.[DayOfWeek] = d.[DayOfWeekID]
		INNER JOIN Volunteer.LUVolunteerScheduleMonth as m
		ON s.[Month] = m.[MonthID]
		INNER JOIN Volunteer.VolunteerJobs as j
		ON v.VolunteerScheduleDayTimeID = J.VolunteerScheduleDayTimeID
		INNER JOIN Volunteer.LUVolunteerJobType as l
		ON j.Job = l.VolunteerJobTypeID
		WHERE @VolunteerPersonID = VolunteerPersonID;

GO
/****** Object:  View [dbo].[vGetFoodshelfRules]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vGetFoodshelfRules]
AS
SELECT     FoodshelfRules
FROM         Foodshelf.FoodshelfRules
WHERE     (ModifiedDate =
                          (SELECT     MAX(ModifiedDate) AS Expr1
                            FROM          Foodshelf.FoodshelfRules AS FoodshelfRules_1))

GO
SET IDENTITY_INSERT [dbo].[JournalClientFamilyChanges] ON 

INSERT [dbo].[JournalClientFamilyChanges] ([JournalClientFamilyChangesID], [HouseholdMembersID], [PreviousClientsID], [NewClientsID], [ActionTaken], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (1, 188, 186, 0, N'Test record', N'ABCD', N'SSE', CAST(N'2011-04-25 16:17:38.287' AS DateTime))
INSERT [dbo].[JournalClientFamilyChanges] ([JournalClientFamilyChangesID], [HouseholdMembersID], [PreviousClientsID], [NewClientsID], [ActionTaken], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (2, 22, 23, 4, N'garbage om', N'garbage out', N'SSE', CAST(N'2011-04-25 16:19:08.287' AS DateTime))
INSERT [dbo].[JournalClientFamilyChanges] ([JournalClientFamilyChangesID], [HouseholdMembersID], [PreviousClientsID], [NewClientsID], [ActionTaken], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (3, 189, 186, 193, N'Request dependent is moved to current client', N'details', N'DanJohnston', CAST(N'2011-04-27 23:17:19.710' AS DateTime))
INSERT [dbo].[JournalClientFamilyChanges] ([JournalClientFamilyChangesID], [HouseholdMembersID], [PreviousClientsID], [NewClientsID], [ActionTaken], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (4, 189, 186, 193, N'Requires attention as a possible duplicate', N'', N'DanJohnston', CAST(N'2011-04-27 23:18:09.657' AS DateTime))
INSERT [dbo].[JournalClientFamilyChanges] ([JournalClientFamilyChangesID], [HouseholdMembersID], [PreviousClientsID], [NewClientsID], [ActionTaken], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (5, 189, 186, 186, N'Request dependent is moved to current client', N'further details', N'DanJohnston', CAST(N'2011-04-27 23:23:16.900' AS DateTime))
INSERT [dbo].[JournalClientFamilyChanges] ([JournalClientFamilyChangesID], [HouseholdMembersID], [PreviousClientsID], [NewClientsID], [ActionTaken], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (6, 189, 186, 186, N'Request dependent is deleted from original client', N'further details', N'DanJohnston', CAST(N'2011-04-27 23:23:23.653' AS DateTime))
INSERT [dbo].[JournalClientFamilyChanges] ([JournalClientFamilyChangesID], [HouseholdMembersID], [PreviousClientsID], [NewClientsID], [ActionTaken], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (7, 189, 186, 186, N'Requires attention as a possible duplicate', N'further details', N'DanJohnston', CAST(N'2011-04-27 23:23:30.193' AS DateTime))
INSERT [dbo].[JournalClientFamilyChanges] ([JournalClientFamilyChangesID], [HouseholdMembersID], [PreviousClientsID], [NewClientsID], [ActionTaken], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (8, 208, 193, 193, N'Other', N'', N'DanJohnston', CAST(N'2011-04-28 21:20:10.680' AS DateTime))
INSERT [dbo].[JournalClientFamilyChanges] ([JournalClientFamilyChangesID], [HouseholdMembersID], [PreviousClientsID], [NewClientsID], [ActionTaken], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (9, 221, 193, 193, N'Other', N'', N'DanJohnston', CAST(N'2011-04-28 23:31:02.487' AS DateTime))
INSERT [dbo].[JournalClientFamilyChanges] ([JournalClientFamilyChangesID], [HouseholdMembersID], [PreviousClientsID], [NewClientsID], [ActionTaken], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (10, 221, 193, 0, N'Other', N'', N'DanJohnston', CAST(N'2011-04-29 00:49:56.647' AS DateTime))
INSERT [dbo].[JournalClientFamilyChanges] ([JournalClientFamilyChangesID], [HouseholdMembersID], [PreviousClientsID], [NewClientsID], [ActionTaken], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (11, 189, 186, 193, N'Other', N'', N'DanJohnston', CAST(N'2011-04-29 14:27:19.380' AS DateTime))
SET IDENTITY_INSERT [dbo].[JournalClientFamilyChanges] OFF
SET IDENTITY_INSERT [dbo].[LUHouseholdTransferOptions] ON 

INSERT [dbo].[LUHouseholdTransferOptions] ([HouseholdTransferActionID], [ActionToTake], [ActionToTakeDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'Request dependent is moved to current client', N'This is the client that is currently being input or modified. This action
will make the person in question a member of this household.', CAST(N'2011-04-22 14:29:36.420' AS DateTime), N'SSE', NULL)
INSERT [dbo].[LUHouseholdTransferOptions] ([HouseholdTransferActionID], [ActionToTake], [ActionToTakeDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'Requires attention as a possible duplicate', N'This person may exist in more than one household so management needs to research the problem.', CAST(N'2011-04-22 14:30:49.793' AS DateTime), N'SSE', NULL)
INSERT [dbo].[LUHouseholdTransferOptions] ([HouseholdTransferActionID], [ActionToTake], [ActionToTakeDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (3, N'Other', N'Explain in notes field.', CAST(N'2011-04-22 14:32:03.927' AS DateTime), N'SSE', NULL)
SET IDENTITY_INSERT [dbo].[LUHouseholdTransferOptions] OFF
SET IDENTITY_INSERT [dbo].[LUStateFederalProgram] ON 

INSERT [dbo].[LUStateFederalProgram] ([StateFederalProgramID], [IsFederal], [ProgramName], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1, 0, N'TEFAP', N'SSE', CAST(N'2010-10-26 17:35:15.163' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[LUStateFederalProgram] OFF
SET IDENTITY_INSERT [Foodshelf].[FoodShelfCertification] ON 

INSERT [Foodshelf].[FoodShelfCertification] ([FoodShelfCertificationID], [PersonID], [CertificationTextID], [LastCertificationDate], [IsPaperCertification], [PaperCertificationDate], [ModifiedDate], [ModifiedBy]) VALUES (18, 186, 5, CAST(N'2011-04-09 00:00:00.000' AS DateTime), 0, CAST(N'2011-04-09 00:00:00.000' AS DateTime), CAST(N'2011-04-09 14:33:58.130' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodShelfCertification] ([FoodShelfCertificationID], [PersonID], [CertificationTextID], [LastCertificationDate], [IsPaperCertification], [PaperCertificationDate], [ModifiedDate], [ModifiedBy]) VALUES (19, 186, 5, CAST(N'2011-04-09 00:00:00.000' AS DateTime), 1, CAST(N'2011-04-09 00:00:00.000' AS DateTime), CAST(N'2011-04-09 14:44:15.897' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodShelfCertification] ([FoodShelfCertificationID], [PersonID], [CertificationTextID], [LastCertificationDate], [IsPaperCertification], [PaperCertificationDate], [ModifiedDate], [ModifiedBy]) VALUES (20, 186, 5, CAST(N'2011-04-09 00:00:00.000' AS DateTime), 0, CAST(N'2011-04-09 00:00:00.000' AS DateTime), CAST(N'2011-04-09 14:44:27.527' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodShelfCertification] ([FoodShelfCertificationID], [PersonID], [CertificationTextID], [LastCertificationDate], [IsPaperCertification], [PaperCertificationDate], [ModifiedDate], [ModifiedBy]) VALUES (21, 193, 5, CAST(N'2011-04-20 00:00:00.000' AS DateTime), 1, CAST(N'2011-04-20 00:00:00.000' AS DateTime), CAST(N'2011-04-20 09:18:07.213' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodShelfCertification] ([FoodShelfCertificationID], [PersonID], [CertificationTextID], [LastCertificationDate], [IsPaperCertification], [PaperCertificationDate], [ModifiedDate], [ModifiedBy]) VALUES (22, 193, 5, CAST(N'2011-04-20 00:00:00.000' AS DateTime), 0, CAST(N'2011-04-20 00:00:00.000' AS DateTime), CAST(N'2011-04-20 09:23:02.970' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodShelfCertification] ([FoodShelfCertificationID], [PersonID], [CertificationTextID], [LastCertificationDate], [IsPaperCertification], [PaperCertificationDate], [ModifiedDate], [ModifiedBy]) VALUES (23, 193, 5, CAST(N'2011-04-20 00:00:00.000' AS DateTime), 0, CAST(N'2011-04-20 00:00:00.000' AS DateTime), CAST(N'2011-04-20 09:23:20.197' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodShelfCertification] ([FoodShelfCertificationID], [PersonID], [CertificationTextID], [LastCertificationDate], [IsPaperCertification], [PaperCertificationDate], [ModifiedDate], [ModifiedBy]) VALUES (24, 194, 5, CAST(N'2011-04-20 00:00:00.000' AS DateTime), 0, CAST(N'2011-04-20 00:00:00.000' AS DateTime), CAST(N'2011-04-20 09:27:46.720' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodShelfCertification] ([FoodShelfCertificationID], [PersonID], [CertificationTextID], [LastCertificationDate], [IsPaperCertification], [PaperCertificationDate], [ModifiedDate], [ModifiedBy]) VALUES (25, 194, 5, CAST(N'2011-04-20 00:00:00.000' AS DateTime), 0, CAST(N'2011-04-20 00:00:00.000' AS DateTime), CAST(N'2011-04-20 09:28:02.853' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodShelfCertification] ([FoodShelfCertificationID], [PersonID], [CertificationTextID], [LastCertificationDate], [IsPaperCertification], [PaperCertificationDate], [ModifiedDate], [ModifiedBy]) VALUES (26, 195, 5, CAST(N'2011-04-20 00:00:00.000' AS DateTime), 1, CAST(N'2011-04-20 00:00:00.000' AS DateTime), CAST(N'2011-04-20 09:36:57.507' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodShelfCertification] ([FoodShelfCertificationID], [PersonID], [CertificationTextID], [LastCertificationDate], [IsPaperCertification], [PaperCertificationDate], [ModifiedDate], [ModifiedBy]) VALUES (27, 195, 5, CAST(N'2011-04-20 00:00:00.000' AS DateTime), 0, CAST(N'2011-04-20 00:00:00.000' AS DateTime), CAST(N'2011-04-20 09:37:20.110' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodShelfCertification] ([FoodShelfCertificationID], [PersonID], [CertificationTextID], [LastCertificationDate], [IsPaperCertification], [PaperCertificationDate], [ModifiedDate], [ModifiedBy]) VALUES (28, 234, 5, CAST(N'2011-05-02 00:00:00.000' AS DateTime), 1, CAST(N'2011-05-02 00:00:00.000' AS DateTime), CAST(N'2011-05-02 20:32:06.977' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodShelfCertification] ([FoodShelfCertificationID], [PersonID], [CertificationTextID], [LastCertificationDate], [IsPaperCertification], [PaperCertificationDate], [ModifiedDate], [ModifiedBy]) VALUES (29, 236, 5, CAST(N'2011-05-11 00:00:00.000' AS DateTime), 1, CAST(N'2011-05-11 00:00:00.000' AS DateTime), CAST(N'2011-05-11 13:19:11.153' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodShelfCertification] ([FoodShelfCertificationID], [PersonID], [CertificationTextID], [LastCertificationDate], [IsPaperCertification], [PaperCertificationDate], [ModifiedDate], [ModifiedBy]) VALUES (36, 235, 5, CAST(N'2011-05-12 00:00:00.000' AS DateTime), 1, CAST(N'2011-05-12 00:00:00.000' AS DateTime), CAST(N'2011-05-12 08:03:55.023' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodShelfCertification] ([FoodShelfCertificationID], [PersonID], [CertificationTextID], [LastCertificationDate], [IsPaperCertification], [PaperCertificationDate], [ModifiedDate], [ModifiedBy]) VALUES (37, 237, 5, CAST(N'2011-05-17 00:00:00.000' AS DateTime), 1, CAST(N'2011-05-17 00:00:00.000' AS DateTime), CAST(N'2011-05-17 12:58:30.910' AS DateTime), N'gsavard')
SET IDENTITY_INSERT [Foodshelf].[FoodShelfCertification] OFF
SET IDENTITY_INSERT [Foodshelf].[FoodshelfRules] ON 

INSERT [Foodshelf].[FoodshelfRules] ([FoodshelfRulesID], [FoodshelfRules], [ModifiedDate], [ModifiedBy]) VALUES (1, N'This is a test of foodshelf rules. We will be putting rules into the system in the
future, but for now, we will be satisfied with a few lines of rambling. What we put in 
will be solely the responsibility of those who write the rules. However, we may 
outsource it to Monty Python.', CAST(N'2011-04-14 14:36:56.483' AS DateTime), N'SSE')
INSERT [Foodshelf].[FoodshelfRules] ([FoodshelfRulesID], [FoodshelfRules], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Another row for testing because we want to have another row for testing. Press ctrl + alt + delete to unlock this verbiage and use windows server 2008. If not, then 
do not bother to read this rambling mess of stuff. Go watch Monty Python and come up with
some better lines to put in here instead of these', CAST(N'2011-04-14 14:41:21.043' AS DateTime), N'SSE')
SET IDENTITY_INSERT [Foodshelf].[FoodshelfRules] OFF
SET IDENTITY_INSERT [Foodshelf].[FoodTypeGiven] ON 

INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 133, CAST(N'2011-04-08 10:26:20.827' AS DateTime), 0, CAST(N'2011-04-08 10:26:20.870' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 134, CAST(N'2011-04-08 11:26:40.823' AS DateTime), 1, CAST(N'2011-04-08 11:26:40.867' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 135, CAST(N'2011-04-08 11:43:04.270' AS DateTime), 0, CAST(N'2011-04-08 11:43:04.313' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 138, CAST(N'2011-04-09 12:06:27.137' AS DateTime), 0, CAST(N'2011-04-09 12:06:27.167' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 139, CAST(N'2011-04-09 12:07:59.917' AS DateTime), 0, CAST(N'2011-04-09 12:07:59.933' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 140, CAST(N'2011-04-09 13:04:00.573' AS DateTime), 0, CAST(N'2011-04-09 13:04:00.610' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 141, CAST(N'2011-04-09 13:19:22.537' AS DateTime), 0, CAST(N'2011-04-09 13:19:22.570' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 142, CAST(N'2011-04-09 13:22:01.160' AS DateTime), 1, CAST(N'2011-04-09 13:22:01.180' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 143, CAST(N'2011-04-09 13:22:42.943' AS DateTime), 0, CAST(N'2011-04-09 13:22:42.960' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 144, CAST(N'2011-04-09 13:26:14.990' AS DateTime), 0, CAST(N'2011-04-09 13:26:15.033' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 145, CAST(N'2011-04-09 13:26:36.667' AS DateTime), 0, CAST(N'2011-04-09 13:26:36.687' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 146, CAST(N'2011-04-09 13:26:50.707' AS DateTime), 0, CAST(N'2011-04-09 13:26:50.723' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 147, CAST(N'2011-04-09 13:27:03.777' AS DateTime), 1, CAST(N'2011-04-09 13:27:03.793' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 148, CAST(N'2011-04-09 13:30:11.173' AS DateTime), 1, CAST(N'2011-04-09 13:30:11.217' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 149, CAST(N'2011-04-09 13:33:23.333' AS DateTime), 1, CAST(N'2011-04-09 13:33:23.353' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 150, CAST(N'2011-04-09 13:33:28.067' AS DateTime), 1, CAST(N'2011-04-09 13:33:28.083' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 151, CAST(N'2011-04-09 13:34:01.160' AS DateTime), 0, CAST(N'2011-04-09 13:34:01.193' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 152, CAST(N'2011-04-09 13:34:21.553' AS DateTime), 0, CAST(N'2011-04-09 13:34:21.573' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 153, CAST(N'2011-04-09 13:44:23.950' AS DateTime), 0, CAST(N'2011-04-09 13:44:23.993' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 154, CAST(N'2011-04-09 13:44:31.303' AS DateTime), 1, CAST(N'2011-04-09 13:44:31.320' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 155, CAST(N'2011-04-09 13:49:57.237' AS DateTime), 0, CAST(N'2011-04-09 13:49:57.277' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 156, CAST(N'2011-04-09 13:51:32.923' AS DateTime), 0, CAST(N'2011-04-09 13:51:32.957' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 157, CAST(N'2011-04-09 14:10:05.617' AS DateTime), 0, CAST(N'2011-04-09 14:10:05.650' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 158, CAST(N'2011-04-09 14:21:24.723' AS DateTime), 0, CAST(N'2011-04-09 14:21:24.757' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 159, CAST(N'2011-04-09 14:28:58.943' AS DateTime), 0, CAST(N'2011-04-09 14:28:58.977' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 160, CAST(N'2011-04-09 14:32:15.257' AS DateTime), 0, CAST(N'2011-04-09 14:32:15.300' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 161, CAST(N'2011-04-09 14:32:59.857' AS DateTime), 0, CAST(N'2011-04-09 14:32:59.880' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 162, CAST(N'2011-04-09 14:34:10.527' AS DateTime), 0, CAST(N'2011-04-09 14:34:10.547' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 163, CAST(N'2011-04-09 14:34:25.020' AS DateTime), 1, CAST(N'2011-04-09 14:34:25.040' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 164, CAST(N'2011-04-09 14:43:03.447' AS DateTime), 0, CAST(N'2011-04-09 14:43:03.490' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 165, CAST(N'2011-04-09 14:44:15.840' AS DateTime), 0, CAST(N'2011-04-09 14:44:15.883' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 166, CAST(N'2011-04-09 14:44:34.287' AS DateTime), 1, CAST(N'2011-04-09 14:44:34.307' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 167, CAST(N'2010-01-01 00:00:00.000' AS DateTime), 0, CAST(N'2011-04-14 15:25:12.717' AS DateTime), N'SSE')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 169, CAST(N'2011-04-18 09:25:00.370' AS DateTime), 0, CAST(N'2011-04-18 09:25:00.437' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 170, CAST(N'2011-04-18 09:25:14.010' AS DateTime), 0, CAST(N'2011-04-18 09:25:14.030' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 171, CAST(N'2011-04-18 09:30:48.433' AS DateTime), 0, CAST(N'2011-04-18 09:30:48.477' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 172, CAST(N'2011-04-18 09:33:07.520' AS DateTime), 0, CAST(N'2011-04-18 09:33:07.553' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 173, CAST(N'2010-04-19 01:01:01.000' AS DateTime), 0, CAST(N'2011-04-18 09:33:21.217' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (186, 199, CAST(N'2011-05-17 16:35:58.917' AS DateTime), 0, CAST(N'2011-05-17 16:35:58.930' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (190, 136, CAST(N'2011-04-09 11:56:16.620' AS DateTime), 0, CAST(N'2011-04-09 11:56:16.667' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (191, 137, CAST(N'2011-04-09 11:58:54.183' AS DateTime), 0, CAST(N'2011-04-09 11:58:54.213' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (192, 168, CAST(N'2011-04-17 19:46:20.660' AS DateTime), 0, CAST(N'2011-04-17 19:46:20.713' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (192, 198, CAST(N'2011-05-17 12:56:44.800' AS DateTime), 1, CAST(N'2011-05-17 12:56:44.840' AS DateTime), N'gsavard')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (193, 174, CAST(N'2011-04-28 20:33:00.800' AS DateTime), 0, CAST(N'2011-04-28 20:33:00.867' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (193, 176, CAST(N'2011-04-28 21:18:10.573' AS DateTime), 0, CAST(N'2011-04-28 21:18:10.603' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (193, 180, CAST(N'2011-05-12 07:29:37.913' AS DateTime), 0, CAST(N'2011-05-12 07:29:37.943' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (193, 195, CAST(N'2011-05-16 09:35:52.577' AS DateTime), 0, CAST(N'2011-05-16 09:35:52.613' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (193, 196, CAST(N'2011-05-16 09:36:22.153' AS DateTime), 1, CAST(N'2011-05-16 09:36:22.170' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (193, 197, CAST(N'2011-05-16 09:37:15.793' AS DateTime), 0, CAST(N'2011-05-16 09:37:15.810' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (202, 175, CAST(N'2011-04-28 20:35:26.433' AS DateTime), 0, CAST(N'2011-04-28 20:35:26.497' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (211, 177, CAST(N'2011-04-28 21:49:03.507' AS DateTime), 0, CAST(N'2011-04-28 21:49:03.620' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (216, 178, CAST(N'2011-04-28 22:28:34.700' AS DateTime), 0, CAST(N'2011-04-28 22:28:34.733' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (222, 179, CAST(N'2011-04-28 23:52:27.847' AS DateTime), 0, CAST(N'2011-04-28 23:52:27.883' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (235, 181, CAST(N'2011-05-12 07:37:24.873' AS DateTime), 0, CAST(N'2011-05-12 07:37:24.890' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (235, 182, CAST(N'2011-05-12 07:38:09.347' AS DateTime), 0, CAST(N'2011-05-12 07:38:09.387' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (235, 183, CAST(N'2011-05-12 07:40:06.600' AS DateTime), 0, CAST(N'2011-05-12 07:40:06.630' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (235, 184, CAST(N'2011-05-12 07:54:17.043' AS DateTime), 0, CAST(N'2011-05-12 07:54:17.060' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (235, 185, CAST(N'2011-05-12 07:55:33.953' AS DateTime), 0, CAST(N'2011-05-12 07:55:33.970' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (235, 186, CAST(N'2011-05-12 07:55:41.807' AS DateTime), 0, CAST(N'2011-05-12 07:55:41.820' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (235, 187, CAST(N'2011-05-12 07:56:32.463' AS DateTime), 1, CAST(N'2011-05-12 07:56:32.480' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (235, 188, CAST(N'2011-05-12 07:56:42.453' AS DateTime), 0, CAST(N'2011-05-12 07:56:42.473' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (235, 189, CAST(N'2011-05-12 07:59:24.453' AS DateTime), 0, CAST(N'2011-05-12 07:59:24.483' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (235, 190, CAST(N'2011-05-12 08:00:03.703' AS DateTime), 0, CAST(N'2011-05-12 08:00:03.720' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (235, 191, CAST(N'2011-05-12 08:00:26.053' AS DateTime), 0, CAST(N'2011-05-12 08:00:26.070' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (235, 192, CAST(N'2011-05-12 08:01:00.200' AS DateTime), 0, CAST(N'2011-05-12 08:01:00.217' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (235, 193, CAST(N'2011-05-12 08:04:29.787' AS DateTime), 0, CAST(N'2011-05-12 08:04:29.807' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (235, 194, CAST(N'2011-05-12 08:04:53.243' AS DateTime), 0, CAST(N'2011-05-12 08:04:53.260' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[FoodTypeGiven] ([PersonID], [FoodTypeGivenID], [ReceivedDate], [FoodGiven], [ModifiedDate], [ModifiedBy]) VALUES (238, 200, CAST(N'2011-05-18 16:44:48.037' AS DateTime), 0, CAST(N'2011-05-18 16:44:48.050' AS DateTime), N'DanJohnston')
SET IDENTITY_INSERT [Foodshelf].[FoodTypeGiven] OFF
SET IDENTITY_INSERT [Foodshelf].[HouseholdNotes] ON 

INSERT [Foodshelf].[HouseholdNotes] ([HouseholdNotesID], [ClientPersonID], [HouseholdMemberPersonID], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (58, 186, 0, N'testing 12 3', N'DanJohnston', CAST(N'2011-04-08 10:26:20.870' AS DateTime))
INSERT [Foodshelf].[HouseholdNotes] ([HouseholdNotesID], [ClientPersonID], [HouseholdMemberPersonID], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (59, 186, 187, N'the Kid', N'DanJohnston', CAST(N'2011-04-08 10:54:36.873' AS DateTime))
INSERT [Foodshelf].[HouseholdNotes] ([HouseholdNotesID], [ClientPersonID], [HouseholdMemberPersonID], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (60, 186, 187, N'the Kid', N'DanJohnston', CAST(N'2011-04-08 11:24:04.687' AS DateTime))
INSERT [Foodshelf].[HouseholdNotes] ([HouseholdNotesID], [ClientPersonID], [HouseholdMemberPersonID], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (61, 186, 0, N'Anotehr test', N'DanJohnston', CAST(N'2011-04-08 11:43:04.313' AS DateTime))
INSERT [Foodshelf].[HouseholdNotes] ([HouseholdNotesID], [ClientPersonID], [HouseholdMemberPersonID], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (62, 186, 187, N'test', N'DanJohnston', CAST(N'2011-04-08 11:44:41.057' AS DateTime))
INSERT [Foodshelf].[HouseholdNotes] ([HouseholdNotesID], [ClientPersonID], [HouseholdMemberPersonID], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (63, 186, 187, N'woooo', N'DanJohnston', CAST(N'2011-04-08 11:44:56.570' AS DateTime))
INSERT [Foodshelf].[HouseholdNotes] ([HouseholdNotesID], [ClientPersonID], [HouseholdMemberPersonID], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (64, 186, 187, N'New New Again', N'DanJohnston', CAST(N'2011-04-08 12:41:07.087' AS DateTime))
INSERT [Foodshelf].[HouseholdNotes] ([HouseholdNotesID], [ClientPersonID], [HouseholdMemberPersonID], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (65, 186, 187, N'New Changes', N'DanJohnston', CAST(N'2011-04-18 08:44:13.590' AS DateTime))
INSERT [Foodshelf].[HouseholdNotes] ([HouseholdNotesID], [ClientPersonID], [HouseholdMemberPersonID], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (66, 186, 0, N'testing', N'DanJohnston', CAST(N'2011-04-18 09:25:00.437' AS DateTime))
INSERT [Foodshelf].[HouseholdNotes] ([HouseholdNotesID], [ClientPersonID], [HouseholdMemberPersonID], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (67, 186, 0, N'testing again', N'DanJohnston', CAST(N'2011-04-18 09:25:14.030' AS DateTime))
INSERT [Foodshelf].[HouseholdNotes] ([HouseholdNotesID], [ClientPersonID], [HouseholdMemberPersonID], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (68, 186, 0, N'third test', N'DanJohnston', CAST(N'2011-04-18 09:30:48.477' AS DateTime))
INSERT [Foodshelf].[HouseholdNotes] ([HouseholdNotesID], [ClientPersonID], [HouseholdMemberPersonID], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (69, 186, 0, N'grrr', N'DanJohnston', CAST(N'2011-04-18 09:33:07.553' AS DateTime))
INSERT [Foodshelf].[HouseholdNotes] ([HouseholdNotesID], [ClientPersonID], [HouseholdMemberPersonID], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (70, 186, 0, N'bleh', N'DanJohnston', CAST(N'2011-04-18 09:33:21.217' AS DateTime))
INSERT [Foodshelf].[HouseholdNotes] ([HouseholdNotesID], [ClientPersonID], [HouseholdMemberPersonID], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (71, 193, 0, N'Insert test', N'DanJohnston', CAST(N'2011-04-20 09:17:45.243' AS DateTime))
INSERT [Foodshelf].[HouseholdNotes] ([HouseholdNotesID], [ClientPersonID], [HouseholdMemberPersonID], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (72, 237, 0, N'Test for John Wayne', N'gsavard', CAST(N'2011-05-17 12:58:30.763' AS DateTime))
INSERT [Foodshelf].[HouseholdNotes] ([HouseholdNotesID], [ClientPersonID], [HouseholdMemberPersonID], [Notes], [ModifiedBy], [ModifiedDate]) VALUES (73, 244, 0, N'Testing for soundex dont delete', N'SSE', CAST(N'2011-06-20 15:01:03.183' AS DateTime))
SET IDENTITY_INSERT [Foodshelf].[HouseholdNotes] OFF
SET IDENTITY_INSERT [Foodshelf].[LUCertificationText] ON 

INSERT [Foodshelf].[LUCertificationText] ([CertificationTextID], [CertificationText], [GuidelinesText], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (5, N'The Income Eligibility Guidelines table shows a yearly gross income for each family size. If your income is at or below the income listed for the number of people in your household, you are eligible to receive USDA Foods. Please read the following statement carefully, then sign the form. I certify that my yearly gross household income is at or below the income listed in the Income Eligibility Guidelines for households with the same number of people as my household. I also certify that, as of today, my household lives in the area served by the Vermont Emergency Food Assistance Program. This certification form is being completed in connection with the receipt of Federal assistance. Program officials may verify what I have certified to be true. I understand that making a false certification may result in having to pay the State for the value of the food improperly issued to me and may subject me to criminal prosecution under State and Federal law.', N'Form TEFAP-2 ELIGIBILITY TO TAKE FOOD HOME', CAST(N'2011-04-05 15:21:19.523' AS DateTime), N'SSE', NULL)
SET IDENTITY_INSERT [Foodshelf].[LUCertificationText] OFF
SET IDENTITY_INSERT [Foodshelf].[Signature] ON 

INSERT [Foodshelf].[Signature] ([SignatureID], [PersonID], [FoodShelfCertificationID], [Signature], [ModifiedDate], [ModifiedBy]) VALUES (9, 186, 18, N'3134350D0A320D0A373538203237310D0A373537203236390D0A373536203236350D0A373533203236300D0A373439203235310D0A373434203234330D0A373339203233340D0A373335203232360D0A373332203231380D0A373239203231320D0A373237203230370D0A373234203230320D0A373230203139380D0A373136203139330D0A373132203138370D0A373038203138320D0A373032203137360D0A363936203137310D0A363930203136350D0A363833203136300D0A363736203135340D0A363638203134390D0A363539203134350D0A363530203134310D0A363430203133370D0A363239203133340D0A363230203133320D0A363134203133300D0A363039203132390D0A363036203132390D0A363034203133320D0A363033203133380D0A363034203134380D0A363037203136320D0A363133203138310D0A363231203230340D0A363333203233300D0A363436203235380D0A363539203238360D0A363733203331330D0A363835203333380D0A363937203336310D0A373037203338310D0A373137203339370D0A373236203430390D0A373333203431390D0A373338203432350D0A373432203432380D0A373434203432380D0A373435203432360D0A373435203432350D0A373435203432340D0A373435203432340D0A353439203230380D0A353439203230370D0A353531203230370D0A353535203230360D0A353631203230340D0A353731203230320D0A353833203230300D0A353938203139380D0A363136203139370D0A363337203139370D0A363631203230300D0A363836203230340D0A373133203231310D0A373431203232300D0A373732203233300D0A383033203234300D0A383336203234390D0A383638203235380D0A383938203236340D0A393236203236390D0A393532203237310D0A393735203237310D0A393936203236390D0A31303133203236350D0A31303239203235390D0A31303432203235330D0A31303534203234360D0A31303634203233390D0A31303733203233300D0A31303830203232320D0A31303837203231330D0A31303933203230340D0A31303939203139340D0A31313035203138330D0A31313132203137300D0A31313138203135350D0A31313236203133380D0A31313334203132300D0A31313433203130340D0A313135312039300D0A313136302038310D0A313136382037360D0A313137382037330D0A313138392037320D0A313230312037310D0A313231332037310D0A313232332037310D0A313233312037320D0A313233382037330D0A313234322037340D0A313234352037360D0A313234372037380D0A313234382038300D0A313234382038320D0A313234382038330D0A313234382038330D0A313234372038340D0A313234352038340D0A313234342038350D0A313234322038350D0A313234332038360D0A313234372038370D0A313235352038390D0A313236382039330D0A31323837203130300D0A31333131203130380D0A31333337203131360D0A31333636203132330D0A31333935203132380D0A31343233203132390D0A31343530203132370D0A31343736203132340D0A31353030203131390D0A31353231203131330D0A31353339203130380D0A31353534203130330D0A313536342039390D0A313537312039350D0A313537352039320D0A313537362039300D0A313537372038390D0A313537362038390D0A313537352038390D0A313537352038380D0A313537362038370D0A313538302038350D0A313538382038320D0A313539372037390D0A313630352037370D0A313630382037360D0A313630382037360D0A313630382037360D0A300D0A35330D0A00000000000000000000000000000000000000000000000000000000000000000000', CAST(N'2011-04-09 14:33:58.130' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[Signature] ([SignatureID], [PersonID], [FoodShelfCertificationID], [Signature], [ModifiedDate], [ModifiedBy]) VALUES (10, 186, 20, N'3234380D0A330D0A373538203237310D0A373537203236390D0A373536203236350D0A373533203236300D0A373439203235310D0A373434203234330D0A373339203233340D0A373335203232360D0A373332203231380D0A373239203231320D0A373237203230370D0A373234203230320D0A373230203139380D0A373136203139330D0A373132203138370D0A373038203138320D0A373032203137360D0A363936203137310D0A363930203136350D0A363833203136300D0A363736203135340D0A363638203134390D0A363539203134350D0A363530203134310D0A363430203133370D0A363239203133340D0A363230203133320D0A363134203133300D0A363039203132390D0A363036203132390D0A363034203133320D0A363033203133380D0A363034203134380D0A363037203136320D0A363133203138310D0A363231203230340D0A363333203233300D0A363436203235380D0A363539203238360D0A363733203331330D0A363835203333380D0A363937203336310D0A373037203338310D0A373137203339370D0A373236203430390D0A373333203431390D0A373338203432350D0A373432203432380D0A373434203432380D0A373435203432360D0A373435203432350D0A373435203432340D0A373435203432340D0A353439203230380D0A353439203230370D0A353531203230370D0A353535203230360D0A353631203230340D0A353731203230320D0A353833203230300D0A353938203139380D0A363136203139370D0A363337203139370D0A363631203230300D0A363836203230340D0A373133203231310D0A373431203232300D0A373732203233300D0A383033203234300D0A383336203234390D0A383638203235380D0A383938203236340D0A393236203236390D0A393532203237310D0A393735203237310D0A393936203236390D0A31303133203236350D0A31303239203235390D0A31303432203235330D0A31303534203234360D0A31303634203233390D0A31303733203233300D0A31303830203232320D0A31303837203231330D0A31303933203230340D0A31303939203139340D0A31313035203138330D0A31313132203137300D0A31313138203135350D0A31313236203133380D0A31313334203132300D0A31313433203130340D0A313135312039300D0A313136302038310D0A313136382037360D0A313137382037330D0A313138392037320D0A313230312037310D0A313231332037310D0A313232332037310D0A313233312037320D0A313233382037330D0A313234322037340D0A313234352037360D0A313234372037380D0A313234382038300D0A313234382038320D0A313234382038330D0A313234382038330D0A313234372038340D0A313234352038340D0A313234342038350D0A313234322038350D0A313234332038360D0A313234372038370D0A313235352038390D0A313236382039330D0A31323837203130300D0A31333131203130380D0A31333337203131360D0A31333636203132330D0A31333935203132380D0A31343233203132390D0A31343530203132370D0A31343736203132340D0A31353030203131390D0A31353231203131330D0A31353339203130380D0A31353534203130330D0A313536342039390D0A313537312039350D0A313537352039320D0A313537362039300D0A313537372038390D0A313537362038390D0A313537352038390D0A313537352038380D0A313537362038370D0A313538302038350D0A313538382038320D0A313539372037390D0A313630352037370D0A313630382037360D0A313630382037360D0A313630382037360D0A31343332203232300D0A31343330203231380D0A31343235203231360D0A31343138203231330D0A31343037203230390D0A31333935203230360D0A31333831203230330D0A31333636203230320D0A31333530203230310D0A31333334203230310D0A31333139203230320D0A31333033203230320D0A31323837203230330D0A31323730203230330D0A31323533203230340D0A31323335203230360D0A31323135203230380D0A31313934203231310D0A31313731203231340D0A31313437203231380D0A31313232203232320D0A31303936203232360D0A31303637203233300D0A31303337203233330D0A31303036203233370D0A393736203234300D0A393530203234330D0A393238203234350D0A393039203234380D0A383837203234380D0A383631203234360D0A383332203234300D0A383034203233300D0A373831203231390D0A373635203230370D0A373537203139370D0A373533203138380D0A373534203137390D0A373537203136380D0A373633203135360D0A373734203134320D0A373839203132370D0A383039203131320D0A3833332039380D0A3835392038370D0A3838362037390D0A3931322037350D0A3933372037320D0A3936322037310D0A3938392037310D0A313031382037310D0A313034392037320D0A313038312037330D0A313131342037370D0A313134362038310D0A313137372038360D0A313230382039320D0A313233362039380D0A31323632203130340D0A31323835203131300D0A31333036203131370D0A31333234203132350D0A31333431203133320D0A31333536203133390D0A31333730203134350D0A31333830203135320D0A31333838203135380D0A31333934203136340D0A31333937203136390D0A31333938203137340D0A31333935203138300D0A31333930203138370D0A31333832203139340D0A31333730203230310D0A31333534203230370D0A31333334203231320D0A31333132203231350D0A31323836203231360D0A31323539203231350D0A31323331203231320D0A31323033203230390D0A31313738203230340D0A31313535203139390D0A31313335203139330D0A31313139203138360D0A31313036203137380D0A31303936203137300D0A31303931203136310D0A31303838203135330D0A31303930203134360D0A31303934203133370D0A31313031203132390D0A31313131203132310D0A31313235203131330D0A31313431203130370D0A31313632203130330D0A31313834203130330D0A31323038203130370D0A31323238203131330D0A31323432203131390D0A31323437203132320D0A31323438203132330D0A31323437203132320D0A300D0A35330D0A3134350D0A00000000000000000000000000000000000000000000000000000000000000000000', CAST(N'2011-04-09 14:44:27.527' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[Signature] ([SignatureID], [PersonID], [FoodShelfCertificationID], [Signature], [ModifiedDate], [ModifiedBy]) VALUES (11, 193, 22, N'3134370D0A310D0A31343230203333320D0A31343137203333310D0A31343133203333300D0A31343036203332390D0A31333937203332370D0A31333838203332360D0A31333739203332340D0A31333639203332330D0A31333538203332310D0A31333437203331390D0A31333334203331370D0A31333230203331350D0A31333036203331330D0A31323930203331320D0A31323734203331310D0A31323536203331300D0A31323338203331300D0A31323230203330390D0A31323030203330390D0A31313739203330390D0A31313538203330390D0A31313336203330390D0A31313134203330380D0A31303932203330380D0A31303731203330360D0A31303530203330340D0A31303330203330310D0A31303039203239380D0A393838203239340D0A393638203239300D0A393439203238360D0A393331203238320D0A393135203237380D0A393032203237340D0A383931203237300D0A383832203236360D0A383735203236330D0A383639203236310D0A383635203235390D0A383632203235370D0A383630203235350D0A383539203235330D0A383539203235320D0A383539203235310D0A383631203235300D0A383634203234380D0A383639203234350D0A383736203234310D0A383835203233350D0A383937203232370D0A393133203231380D0A393331203230380D0A393531203230300D0A393732203139310D0A393933203138340D0A31303135203137380D0A31303337203137320D0A31303539203136390D0A31303832203136360D0A31313037203136340D0A31313333203136340D0A31313630203136340D0A31313838203136350D0A31323138203136370D0A31323438203137300D0A31323737203137340D0A31333036203138300D0A31333334203138370D0A31333630203139350D0A31333835203230330D0A31343039203231320D0A31343332203232310D0A31343534203233310D0A31343735203234300D0A31343935203234390D0A31353133203235360D0A31353239203236330D0A31353432203236390D0A31353534203237340D0A31353633203237380D0A31353639203238300D0A31353734203238320D0A31353737203238340D0A31353738203238350D0A31353739203238360D0A31353738203238360D0A31353737203238370D0A31353736203238370D0A31353734203238370D0A31353730203238370D0A31353632203238380D0A31353531203238380D0A31353336203238390D0A31353136203238390D0A31343933203239300D0A31343635203239320D0A31343333203239330D0A31333938203239340D0A31333631203239350D0A31333232203239370D0A31323833203330300D0A31323435203330330D0A31323131203330360D0A31313830203330370D0A31313536203330360D0A31313339203330330D0A31313237203239390D0A31313231203239340D0A31313230203238390D0A31313233203238330D0A31313239203237350D0A31313430203236340D0A31313533203235310D0A31313730203233360D0A31313838203232310D0A31323038203230360D0A31323330203139320D0A31323532203137390D0A31323735203136370D0A31333030203135360D0A31333236203134340D0A31333535203133330D0A31333834203132340D0A31343135203131350D0A31343435203130390D0A31343733203130340D0A31343938203130310D0A31353139203130300D0A31353336203130310D0A31353530203130320D0A31353539203130340D0A31353635203130360D0A31353639203130380D0A31353730203131300D0A31353731203131320D0A31353730203131350D0A31353637203131380D0A31353634203132320D0A31353630203132380D0A31353534203133340D0A31353438203134330D0A31353431203135340D0A31353335203136370D0A31353330203137370D0A31353238203138320D0A31353238203138330D0A31353238203138320D0A300D0A00000000000000000000000000000000000000000000000000000000000000000000', CAST(N'2011-04-20 09:23:02.970' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[Signature] ([SignatureID], [PersonID], [FoodShelfCertificationID], [Signature], [ModifiedDate], [ModifiedBy]) VALUES (12, 193, 23, N'3134370D0A310D0A31343230203333320D0A31343137203333310D0A31343133203333300D0A31343036203332390D0A31333937203332370D0A31333838203332360D0A31333739203332340D0A31333639203332330D0A31333538203332310D0A31333437203331390D0A31333334203331370D0A31333230203331350D0A31333036203331330D0A31323930203331320D0A31323734203331310D0A31323536203331300D0A31323338203331300D0A31323230203330390D0A31323030203330390D0A31313739203330390D0A31313538203330390D0A31313336203330390D0A31313134203330380D0A31303932203330380D0A31303731203330360D0A31303530203330340D0A31303330203330310D0A31303039203239380D0A393838203239340D0A393638203239300D0A393439203238360D0A393331203238320D0A393135203237380D0A393032203237340D0A383931203237300D0A383832203236360D0A383735203236330D0A383639203236310D0A383635203235390D0A383632203235370D0A383630203235350D0A383539203235330D0A383539203235320D0A383539203235310D0A383631203235300D0A383634203234380D0A383639203234350D0A383736203234310D0A383835203233350D0A383937203232370D0A393133203231380D0A393331203230380D0A393531203230300D0A393732203139310D0A393933203138340D0A31303135203137380D0A31303337203137320D0A31303539203136390D0A31303832203136360D0A31313037203136340D0A31313333203136340D0A31313630203136340D0A31313838203136350D0A31323138203136370D0A31323438203137300D0A31323737203137340D0A31333036203138300D0A31333334203138370D0A31333630203139350D0A31333835203230330D0A31343039203231320D0A31343332203232310D0A31343534203233310D0A31343735203234300D0A31343935203234390D0A31353133203235360D0A31353239203236330D0A31353432203236390D0A31353534203237340D0A31353633203237380D0A31353639203238300D0A31353734203238320D0A31353737203238340D0A31353738203238350D0A31353739203238360D0A31353738203238360D0A31353737203238370D0A31353736203238370D0A31353734203238370D0A31353730203238370D0A31353632203238380D0A31353531203238380D0A31353336203238390D0A31353136203238390D0A31343933203239300D0A31343635203239320D0A31343333203239330D0A31333938203239340D0A31333631203239350D0A31333232203239370D0A31323833203330300D0A31323435203330330D0A31323131203330360D0A31313830203330370D0A31313536203330360D0A31313339203330330D0A31313237203239390D0A31313231203239340D0A31313230203238390D0A31313233203238330D0A31313239203237350D0A31313430203236340D0A31313533203235310D0A31313730203233360D0A31313838203232310D0A31323038203230360D0A31323330203139320D0A31323532203137390D0A31323735203136370D0A31333030203135360D0A31333236203134340D0A31333535203133330D0A31333834203132340D0A31343135203131350D0A31343435203130390D0A31343733203130340D0A31343938203130310D0A31353139203130300D0A31353336203130310D0A31353530203130320D0A31353539203130340D0A31353635203130360D0A31353639203130380D0A31353730203131300D0A31353731203131320D0A31353730203131350D0A31353637203131380D0A31353634203132320D0A31353630203132380D0A31353534203133340D0A31353438203134330D0A31353431203135340D0A31353335203136370D0A31353330203137370D0A31353238203138320D0A31353238203138330D0A31353238203138320D0A300D0A00000000000000000000000000000000000000000000000000000000000000000000', CAST(N'2011-04-20 09:23:20.197' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[Signature] ([SignatureID], [PersonID], [FoodShelfCertificationID], [Signature], [ModifiedDate], [ModifiedBy]) VALUES (13, 194, 24, N'3135310D0A310D0A353130203230380D0A353132203230360D0A353136203230330D0A353233203139370D0A353333203139300D0A353435203138320D0A353538203137350D0A353733203136370D0A353930203135390D0A363130203135310D0A363332203134340D0A363537203133370D0A363834203133320D0A373132203132370D0A373430203132330D0A373639203132300D0A373937203131380D0A383234203131380D0A383530203131380D0A383736203131390D0A393030203132310D0A393235203132330D0A393439203132360D0A393732203132380D0A393933203133310D0A31303131203133330D0A31303237203133360D0A31303431203133380D0A31303533203133390D0A31303636203134300D0A31303738203134310D0A31303931203134310D0A31313034203134310D0A31313138203134310D0A31313330203133390D0A31313433203133350D0A31313535203133300D0A31313636203132320D0A31313736203131330D0A31313834203130330D0A313139302039350D0A313139342038390D0A313139362038350D0A313139372038340D0A313139372038330D0A313139382038320D0A313139382038320D0A313230302038310D0A313230322038300D0A313230342038300D0A313230382037390D0A313231312037390D0A313231352037390D0A313231372037390D0A313231382037390D0A313231382038300D0A313231372038300D0A313231342038310D0A313230392038320D0A313230302038340D0A313138382038380D0A313137312039330D0A31313532203130320D0A31313331203131330D0A31313039203132370D0A31303837203134320D0A31303637203135390D0A31303531203137350D0A31303339203139300D0A31303331203230330D0A31303237203231320D0A31303235203232300D0A31303235203232350D0A31303237203232390D0A31303330203233330D0A31303335203233360D0A31303431203233380D0A31303439203234300D0A31303538203234310D0A31303730203234320D0A31303833203234310D0A31303938203233380D0A31313135203233340D0A31313333203232370D0A31313533203231380D0A31313732203230350D0A31313930203139310D0A31323036203137360D0A31323138203136300D0A31323237203134360D0A31323331203133330D0A31323332203132320D0A31323238203131320D0A31323231203130330D0A313231312039360D0A313230312039300D0A313138392038360D0A313137362038340D0A313136312038330D0A313134342038340D0A313132332038350D0A313130322038390D0A313037392039330D0A31303535203130300D0A31303330203130380D0A31303034203131370D0A393736203132370D0A393439203133390D0A393231203135320D0A383934203136360D0A383639203138310D0A383437203139350D0A383330203230380D0A383136203231390D0A383037203232380D0A383032203233330D0A373939203233370D0A373939203233380D0A383031203233380D0A383034203233380D0A383130203233370D0A383139203233350D0A383330203233320D0A383434203232380D0A383539203232330D0A383736203231370D0A383934203230390D0A393134203230310D0A393334203139330D0A393536203138350D0A393739203137380D0A31303032203137320D0A31303235203136370D0A31303437203136340D0A31303639203136320D0A31303930203136300D0A31313038203135390D0A31313235203135390D0A31313339203135380D0A31313531203135380D0A31313631203135380D0A31313730203135380D0A31313738203135380D0A31313835203136300D0A31313931203136320D0A31313935203136370D0A31313939203137330D0A31323031203137380D0A31323032203138300D0A31323032203138310D0A31323032203138300D0A300D0A00000000000000000000000000000000000000000000000000000000000000000000', CAST(N'2011-04-20 09:27:46.720' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[Signature] ([SignatureID], [PersonID], [FoodShelfCertificationID], [Signature], [ModifiedDate], [ModifiedBy]) VALUES (14, 194, 25, N'3135310D0A310D0A353130203230380D0A353132203230360D0A353136203230330D0A353233203139370D0A353333203139300D0A353435203138320D0A353538203137350D0A353733203136370D0A353930203135390D0A363130203135310D0A363332203134340D0A363537203133370D0A363834203133320D0A373132203132370D0A373430203132330D0A373639203132300D0A373937203131380D0A383234203131380D0A383530203131380D0A383736203131390D0A393030203132310D0A393235203132330D0A393439203132360D0A393732203132380D0A393933203133310D0A31303131203133330D0A31303237203133360D0A31303431203133380D0A31303533203133390D0A31303636203134300D0A31303738203134310D0A31303931203134310D0A31313034203134310D0A31313138203134310D0A31313330203133390D0A31313433203133350D0A31313535203133300D0A31313636203132320D0A31313736203131330D0A31313834203130330D0A313139302039350D0A313139342038390D0A313139362038350D0A313139372038340D0A313139372038330D0A313139382038320D0A313139382038320D0A313230302038310D0A313230322038300D0A313230342038300D0A313230382037390D0A313231312037390D0A313231352037390D0A313231372037390D0A313231382037390D0A313231382038300D0A313231372038300D0A313231342038310D0A313230392038320D0A313230302038340D0A313138382038380D0A313137312039330D0A31313532203130320D0A31313331203131330D0A31313039203132370D0A31303837203134320D0A31303637203135390D0A31303531203137350D0A31303339203139300D0A31303331203230330D0A31303237203231320D0A31303235203232300D0A31303235203232350D0A31303237203232390D0A31303330203233330D0A31303335203233360D0A31303431203233380D0A31303439203234300D0A31303538203234310D0A31303730203234320D0A31303833203234310D0A31303938203233380D0A31313135203233340D0A31313333203232370D0A31313533203231380D0A31313732203230350D0A31313930203139310D0A31323036203137360D0A31323138203136300D0A31323237203134360D0A31323331203133330D0A31323332203132320D0A31323238203131320D0A31323231203130330D0A313231312039360D0A313230312039300D0A313138392038360D0A313137362038340D0A313136312038330D0A313134342038340D0A313132332038350D0A313130322038390D0A313037392039330D0A31303535203130300D0A31303330203130380D0A31303034203131370D0A393736203132370D0A393439203133390D0A393231203135320D0A383934203136360D0A383639203138310D0A383437203139350D0A383330203230380D0A383136203231390D0A383037203232380D0A383032203233330D0A373939203233370D0A373939203233380D0A383031203233380D0A383034203233380D0A383130203233370D0A383139203233350D0A383330203233320D0A383434203232380D0A383539203232330D0A383736203231370D0A383934203230390D0A393134203230310D0A393334203139330D0A393536203138350D0A393739203137380D0A31303032203137320D0A31303235203136370D0A31303437203136340D0A31303639203136320D0A31303930203136300D0A31313038203135390D0A31313235203135390D0A31313339203135380D0A31313531203135380D0A31313631203135380D0A31313730203135380D0A31313738203135380D0A31313835203136300D0A31313931203136320D0A31313935203136370D0A31313939203137330D0A31323031203137380D0A31323032203138300D0A31323032203138310D0A31323032203138300D0A300D0A00000000000000000000000000000000000000000000000000000000000000000000', CAST(N'2011-04-20 09:28:02.853' AS DateTime), N'DanJohnston')
INSERT [Foodshelf].[Signature] ([SignatureID], [PersonID], [FoodShelfCertificationID], [Signature], [ModifiedDate], [ModifiedBy]) VALUES (15, 195, 27, N'3134320D0A320D0A353131203233390D0A353130203233370D0A353038203233350D0A353036203233320D0A353032203232380D0A343939203232350D0A343937203232330D0A343934203232310D0A343932203231380D0A343930203231360D0A343839203231330D0A343837203230390D0A343836203230340D0A343835203139380D0A343835203139320D0A343835203138350D0A343835203137390D0A343836203137320D0A343837203136360D0A343838203136300D0A343838203135350D0A343838203135300D0A343839203134360D0A343839203134320D0A343839203133390D0A343930203133370D0A343930203133360D0A343932203133350D0A343933203133350D0A343936203133360D0A343939203133370D0A353033203133390D0A353038203134310D0A353133203134340D0A353230203134380D0A353237203135320D0A353336203135360D0A353436203136310D0A353537203136370D0A353639203137330D0A353831203137390D0A353934203138350D0A363038203139300D0A363232203139360D0A363336203230320D0A363531203230370D0A363635203231320D0A363830203231350D0A363935203231380D0A373130203231390D0A373235203231380D0A373339203231360D0A373534203231320D0A373638203230360D0A373831203139390D0A373935203138390D0A383038203137390D0A383231203136380D0A383332203135390D0A383433203135300D0A383531203134330D0A383538203133380D0A383633203133350D0A383638203133330D0A383731203133320D0A383733203133320D0A383736203133320D0A383738203133320D0A383739203133320D0A383831203133330D0A383833203133350D0A383834203133370D0A383835203133390D0A383836203134320D0A383836203134360D0A383836203135300D0A383836203135360D0A383835203136320D0A383834203136380D0A383834203137330D0A383834203137360D0A383836203137370D0A383839203137360D0A383934203137320D0A393031203136340D0A393130203135340D0A393230203134310D0A393332203132370D0A393434203131320D0A3935362039380D0A3936382038340D0A3937392037310D0A3938392035390D0A3939382034390D0A313030362034330D0A313031322033390D0A313031392033380D0A313032352034310D0A313033312034370D0A313033362035360D0A313034322036390D0A313034362038360D0A31303531203130340D0A31303536203132340D0A31303633203134350D0A31303732203136350D0A31303833203138330D0A31303936203139380D0A31313131203231300D0A31313237203232300D0A31313434203232380D0A31313631203233340D0A31313737203233390D0A31313933203234330D0A31323037203234380D0A31323139203235320D0A31323239203235360D0A31323338203236300D0A31323436203236350D0A31323532203236390D0A31323537203237330D0A31323631203237360D0A31323634203237380D0A31323635203237390D0A31323634203237390D0A31323633203237380D0A31323632203237380D0A31323630203237380D0A31323631203237380D0A31323632203139330D0A31323631203139330D0A31323539203139340D0A31323536203139370D0A31323532203230320D0A31323437203230380D0A31323432203231360D0A31323338203232350D0A31323333203233340D0A31323239203234310D0A31323238203234340D0A31323237203234350D0A31323237203234340D0A300D0A3132390D0A00000000000000000000000000000000000000000000000000000000000000000000', CAST(N'2011-04-20 09:37:20.110' AS DateTime), N'DanJohnston')
SET IDENTITY_INSERT [Foodshelf].[Signature] OFF
SET IDENTITY_INSERT [Maintenance].[UserModifiableTables] ON 

INSERT [Maintenance].[UserModifiableTables] ([UserModifiableTablesID], [FromSchema], [FromTable], [ModifiedDate], [ModifiedBy]) VALUES (1, N'Person', N'LUAddresssType                                    ', CAST(N'2011-05-18 15:25:22.420' AS DateTime), N'SSE')
INSERT [Maintenance].[UserModifiableTables] ([UserModifiableTablesID], [FromSchema], [FromTable], [ModifiedDate], [ModifiedBy]) VALUES (2, N'Person', N'LUContactType                                     ', CAST(N'2011-05-18 15:25:22.437' AS DateTime), N'SSE')
INSERT [Maintenance].[UserModifiableTables] ([UserModifiableTablesID], [FromSchema], [FromTable], [ModifiedDate], [ModifiedBy]) VALUES (3, N'Person', N'LUCountryOfOrigin                                 ', CAST(N'2011-05-18 15:25:22.443' AS DateTime), N'SSE')
INSERT [Maintenance].[UserModifiableTables] ([UserModifiableTablesID], [FromSchema], [FromTable], [ModifiedDate], [ModifiedBy]) VALUES (4, N'Person', N'LUEducationCategory                               ', CAST(N'2011-05-18 15:25:22.453' AS DateTime), N'SSE')
INSERT [Maintenance].[UserModifiableTables] ([UserModifiableTablesID], [FromSchema], [FromTable], [ModifiedDate], [ModifiedBy]) VALUES (5, N'Person', N'LUEthnicity                                       ', CAST(N'2011-05-18 15:25:22.460' AS DateTime), N'SSE')
INSERT [Maintenance].[UserModifiableTables] ([UserModifiableTablesID], [FromSchema], [FromTable], [ModifiedDate], [ModifiedBy]) VALUES (6, N'Person', N'LUFamilyRelationship                              ', CAST(N'2011-05-18 15:25:22.470' AS DateTime), N'SSE')
INSERT [Maintenance].[UserModifiableTables] ([UserModifiableTablesID], [FromSchema], [FromTable], [ModifiedDate], [ModifiedBy]) VALUES (7, N'Person', N'LUFamilyStatusType                                ', CAST(N'2011-05-18 15:25:22.477' AS DateTime), N'SSE')
INSERT [Maintenance].[UserModifiableTables] ([UserModifiableTablesID], [FromSchema], [FromTable], [ModifiedDate], [ModifiedBy]) VALUES (8, N'Person', N'LUHousingStatus                                   ', CAST(N'2011-05-18 15:25:22.487' AS DateTime), N'SSE')
INSERT [Maintenance].[UserModifiableTables] ([UserModifiableTablesID], [FromSchema], [FromTable], [ModifiedDate], [ModifiedBy]) VALUES (9, N'Person', N'LUIncomeSource                                    ', CAST(N'2011-05-18 15:25:22.493' AS DateTime), N'SSE')
INSERT [Maintenance].[UserModifiableTables] ([UserModifiableTablesID], [FromSchema], [FromTable], [ModifiedDate], [ModifiedBy]) VALUES (10, N'Person', N'LUInsuranceType                                   ', CAST(N'2011-05-18 15:25:22.503' AS DateTime), N'SSE')
INSERT [Maintenance].[UserModifiableTables] ([UserModifiableTablesID], [FromSchema], [FromTable], [ModifiedDate], [ModifiedBy]) VALUES (11, N'Person', N'LULanguage                                        ', CAST(N'2011-05-18 15:25:22.510' AS DateTime), N'SSE')
INSERT [Maintenance].[UserModifiableTables] ([UserModifiableTablesID], [FromSchema], [FromTable], [ModifiedDate], [ModifiedBy]) VALUES (12, N'Person', N'LUPersonType                                      ', CAST(N'2011-05-18 15:25:22.520' AS DateTime), N'SSE')
INSERT [Maintenance].[UserModifiableTables] ([UserModifiableTablesID], [FromSchema], [FromTable], [ModifiedDate], [ModifiedBy]) VALUES (13, N'Person', N'LUPhoneType                                       ', CAST(N'2011-05-18 15:25:22.527' AS DateTime), N'SSE')
INSERT [Maintenance].[UserModifiableTables] ([UserModifiableTablesID], [FromSchema], [FromTable], [ModifiedDate], [ModifiedBy]) VALUES (14, N'Person', N'LUAddresssType                                    ', CAST(N'2011-05-18 15:25:22.537' AS DateTime), N'SSE')
INSERT [Maintenance].[UserModifiableTables] ([UserModifiableTablesID], [FromSchema], [FromTable], [ModifiedDate], [ModifiedBy]) VALUES (15, N'Person', N'LUProgramType                                     ', CAST(N'2011-05-18 15:25:22.543' AS DateTime), N'SSE')
INSERT [Maintenance].[UserModifiableTables] ([UserModifiableTablesID], [FromSchema], [FromTable], [ModifiedDate], [ModifiedBy]) VALUES (16, N'Person', N'LURace                                            ', CAST(N'2011-05-18 15:25:22.553' AS DateTime), N'SSE')
SET IDENTITY_INSERT [Maintenance].[UserModifiableTables] OFF
SET IDENTITY_INSERT [Person].[Address] ON 

INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (139, 186, N'Poker Hill Rd.', N'', N'Underhill', N'Chittenden', N'VT', N'05489', 1, CAST(N'2011-05-19 13:47:20.840' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (140, 186, N'PO Box 45', N'', N'Underhill', N'Chittenden', N'VT', N'05489', 8, CAST(N'2011-05-19 13:47:20.840' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (141, 190, N' ', N'', N'Underhill', N'Chittenden', N'VT', N'05489', 1, CAST(N'2011-04-09 11:56:16.667' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (142, 190, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-04-09 11:56:16.667' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (143, 191, N' ', N'', N'Jericho', N'Chittenden', N'VT', N'05465', 1, CAST(N'2011-04-09 11:58:54.213' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (144, 191, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-04-09 11:58:54.213' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (145, 192, N' ', N'', N'Jericho', N'Chittenden', N'VT', N'05465', 1, CAST(N'2011-05-17 12:56:44.837' AS DateTime), N'gsavard')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (146, 192, N' ', N'', N'Jericho', N'Chittenden', N'VT', N'05465', 8, CAST(N'2011-05-17 12:56:44.837' AS DateTime), N'gsavard')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (147, 193, N' ', N'', N'Underhill', N'Chittenden', N'VT', N'05489', 1, CAST(N'2011-05-16 09:37:15.810' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (148, 193, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-05-16 09:37:15.810' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (149, 194, N' ', N'', N'Burlington', N'Chittenden', N'VT', N'05402', 1, CAST(N'2011-04-20 09:36:01.037' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (150, 194, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-04-20 09:36:01.037' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (151, 195, N' ', N'', N'Jericho', N'Chittenden', N'VT', N'05465', 1, CAST(N'2011-04-20 09:37:12.723' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (152, 195, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-04-20 09:37:12.723' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (153, 197, N' ', N'', N'Williston', N'Chittenden', N'VT', N'05495', 1, CAST(N'2011-04-28 20:23:10.127' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (154, 197, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-04-28 20:23:10.127' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (155, 198, N' ', N'', N'Burlington', N'Chittenden', N'VT', N'05407', 1, CAST(N'2011-04-28 20:25:41.213' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (156, 198, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-04-28 20:25:41.213' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (157, 199, N' ', N'', N'Underhill', N'Chittenden', N'VT', N'05489', 1, CAST(N'2011-04-28 20:27:22.143' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (158, 199, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-04-28 20:27:22.143' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (159, 200, N' ', N'', N'Essex', N'Chittenden', N'VT', N'05452', 1, CAST(N'2011-04-28 20:30:56.660' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (160, 200, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-04-28 20:30:56.660' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (161, 201, N' ', N'', N'Jericho', N'Chittenden', N'VT', N'05465', 1, CAST(N'2011-04-28 20:33:26.733' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (162, 201, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-04-28 20:33:26.733' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (163, 202, N' ', N'', N'Underhill', N'Chittenden', N'VT', N'05490', 1, CAST(N'2011-04-28 20:35:26.497' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (164, 202, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-04-28 20:35:26.497' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (165, 203, N' ', N'', N'Jericho', N'Chittenden', N'VT', N'05465', 1, CAST(N'2011-04-28 20:55:03.580' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (166, 203, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-04-28 20:55:03.580' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (167, 204, N' ', N'', N'Burlington', N'Chittenden', N'VT', N'05401', 1, CAST(N'2011-04-28 20:59:35.183' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (168, 204, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-04-28 20:59:35.187' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (169, 211, N' ', N'', N'Jericho', N'Chittenden', N'VT', N'05465', 1, CAST(N'2011-04-28 21:49:03.617' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (170, 211, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-04-28 21:49:03.617' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (171, 216, N' ', N'', N'Underhill', N'Chittenden', N'VT', N'05489', 1, CAST(N'2011-04-28 22:28:34.733' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (172, 216, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-04-28 22:28:34.733' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (173, 222, N' ', N'', N'Jericho', N'Chittenden', N'VT', N'05465', 1, CAST(N'2011-04-28 23:52:27.883' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (174, 222, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-04-28 23:52:27.883' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (175, 231, N' ', N'', N'Jericho', N'Chittenden', N'VT', N'05465  ', 1, CAST(N'2011-04-29 14:29:49.677' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (176, 231, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-04-29 14:29:49.677' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (177, 233, N' 62 Main St', N'', N'Colchester', N'Chittenden', N'VT', N'05446', 1, CAST(N'2011-05-02 20:29:17.040' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (178, 233, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-05-02 20:29:17.040' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (179, 234, N' ', N'', N'Burlington', N'Chittenden', N'VT', N'05407', 1, CAST(N'2011-05-02 20:32:06.800' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (180, 234, N' ', N'', N'', N' ', N'VT', N'', 8, CAST(N'2011-05-02 20:32:06.800' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (181, 235, N' ', N'', N'Jericho', N'Chittenden', N'VT', N'05465', 1, CAST(N'2011-05-12 08:04:53.260' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (182, 236, N' ', N'', N'Jericho', N'Chittenden', N'VT', N'05465  ', 1, CAST(N'2011-05-11 13:19:11.043' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (183, 237, N'123 Western St', N'', N'stowe', N'Lamoille', N'VT', N'05672', 1, CAST(N'2011-05-17 12:58:30.757' AS DateTime), N'gsavard')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (184, 238, N' ', N'', N'Jericho', N'Chittenden', N'VT', N'05465  ', 1, CAST(N'2011-05-18 16:44:48.047' AS DateTime), N'DanJohnston')
INSERT [Person].[Address] ([AddressID], [PersonID], [AddressLine1], [AddressLine2], [City], [County], [State], [PostalCode], [AddressTypeID], [ModifiedDate], [ModifiedBy]) VALUES (185, 244, N'123 rabbit st', N'', N'Winooski', N'', N'VT', N'05404', 1, CAST(N'2011-06-20 15:01:03.183' AS DateTime), N'SSE')
SET IDENTITY_INSERT [Person].[Address] OFF
SET IDENTITY_INSERT [Person].[Demographics] ON 

INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (35, 186, 11, 2, 5, N'M', 2, 188, 1, 2, 0, 0, 1, 1, 5, 1, 1, CAST(N'2011-05-19 13:47:20.840' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (36, 187, 7, 7, 0, N'F', 1, 188, 3, 0, 0, 1, 0, 6, 3, 2, 2, CAST(N'2011-05-31 17:12:26.897' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (37, 188, 14, 2, 0, N'', 17, 188, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-08 13:38:27.470' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (38, 189, 14, 2, 0, N'', 17, 195, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-08 13:49:37.107' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (39, 190, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-09 11:56:16.667' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (40, 191, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-09 11:58:54.213' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (41, 192, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-05-17 12:56:44.840' AS DateTime), N'gsavard')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (42, 193, 6, 1, 4, N'M', 1, 188, 1, 0, 0, 0, 1, 1, 2, 0, 0, CAST(N'2011-05-16 09:37:15.810' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (43, 194, 14, 2, 1, N'', 17, 188, 3, 2, 2, 2, 2, 4, 6, 2, 2, CAST(N'2011-04-20 09:36:01.037' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (44, 195, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 1, 6, 2, 2, CAST(N'2011-04-20 09:37:12.723' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (45, 196, 14, 7, 0, N'M', 1, 188, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-29 14:27:21.937' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (46, 197, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 1, 6, 2, 2, CAST(N'2011-04-28 20:23:10.133' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (47, 198, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 1, 6, 2, 2, CAST(N'2011-04-28 20:25:41.213' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (48, 199, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 1, 6, 2, 2, CAST(N'2011-04-28 20:27:22.143' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (49, 200, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 1, 6, 2, 2, CAST(N'2011-04-28 20:30:56.663' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (50, 201, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 1, 6, 2, 2, CAST(N'2011-04-28 20:33:26.733' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (51, 202, 14, 2, 1, N'', 17, 188, 3, 2, 2, 2, 2, 1, 6, 2, 2, CAST(N'2011-04-28 20:35:26.497' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (52, 203, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 1, 6, 2, 2, CAST(N'2011-04-28 20:55:03.580' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (53, 204, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 1, 6, 2, 2, CAST(N'2011-04-28 20:59:35.187' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (54, 205, 14, 7, 0, N'', 17, 195, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-28 20:59:59.867' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (55, 206, 14, 7, 0, N'', 17, 188, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-28 21:03:12.867' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (56, 207, 14, 7, 0, N'', 17, 188, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-28 21:05:26.333' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (57, 208, 14, 7, 0, N'M', 17, 195, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-29 14:27:31.950' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (58, 209, 14, 7, 0, N'', 17, 188, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-29 14:27:41.023' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (59, 210, 14, 7, 0, N'', 1, 195, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-28 21:43:21.280' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (60, 211, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 1, 6, 2, 2, CAST(N'2011-04-28 21:49:03.617' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (61, 212, 14, 7, 0, N'', 17, 188, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-28 21:51:06.090' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (62, 213, 14, 7, 0, N'', 17, 195, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-29 14:16:58.017' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (63, 214, 14, 7, 0, N'', 17, 188, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-28 22:18:26.253' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (64, 215, 14, 7, 0, N'', 17, 188, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-29 13:58:02.867' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (65, 216, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 1, 6, 2, 2, CAST(N'2011-04-28 22:28:34.733' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (66, 217, 14, 7, 0, N'', 17, 195, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-28 22:29:11.230' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (67, 218, 14, 7, 0, N'', 17, 188, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-28 22:32:14.317' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (68, 219, 14, 7, 0, N'', 17, 195, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-28 22:43:25.127' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (69, 220, 14, 7, 0, N'', 17, 195, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-28 23:07:51.380' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (70, 221, 14, 7, 0, N'', 17, 188, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-29 00:52:31.170' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (71, 222, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 1, 6, 2, 2, CAST(N'2011-04-28 23:52:27.883' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (72, 223, 14, 7, 0, N'', 17, 195, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-28 23:52:49.310' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (73, 224, 14, 7, 0, N'', 17, 195, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-29 09:15:47.087' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (74, 225, 14, 7, 0, N'', 17, 195, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-29 09:21:59.387' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (75, 226, 14, 7, 0, N'', 17, 188, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-29 09:26:04.937' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (76, 227, 14, 7, 0, N'', 17, 188, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-29 09:27:30.400' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (77, 228, 14, 7, 0, N'', 17, 195, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-29 12:11:32.317' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (78, 229, 14, 7, 0, N'', 17, 195, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-29 14:16:42.333' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (79, 230, 14, 7, 0, N'', 17, 195, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-29 13:27:18.880' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (80, 231, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 1, 6, 2, 2, CAST(N'2011-04-29 14:29:49.677' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (81, 232, 14, 7, 0, N'', 17, 188, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-04-29 14:30:09.850' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (82, 233, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 1, 6, 2, 2, CAST(N'2011-05-02 20:29:17.040' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (83, 234, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 1, 6, 2, 2, CAST(N'2011-05-02 20:32:06.800' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (84, 235, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-05-12 08:04:53.260' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (85, 236, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 1, 6, 2, 2, CAST(N'2011-05-11 13:19:11.043' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (86, 237, 11, 2, 1, N'M', 1, 188, 3, 2, 2, 2, 1, 1, 4, 2, 2, CAST(N'2011-05-17 12:58:30.757' AS DateTime), N'gsavard')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (87, 238, 14, 1, 1, N'', 17, 188, 3, 2, 2, 2, 2, 6, 6, 2, 2, CAST(N'2011-05-18 16:44:48.050' AS DateTime), N'DanJohnston')
INSERT [Person].[Demographics] ([DemographicsID], [PersonID], [EducationCategoryID], [HousingStatus], [NumberInHousehold], [Gender], [Race], [CountryOfOrigin], [Ethnicity], [Disability], [CSFP], [Veteran], [HealthInsurance], [FamilyStatusType], [InsuranceType], [FoodStamps], [HomeboundDelivery], [ModifiedDate], [ModifiedBy]) VALUES (88, 244, 14, 7, 2, N'M', 1, 195, 3, 0, 0, 0, 0, 6, 6, 0, 0, CAST(N'2011-06-20 15:01:03.183' AS DateTime), N'SSE')
SET IDENTITY_INSERT [Person].[Demographics] OFF
SET IDENTITY_INSERT [Person].[FamilyRelationships] ON 

INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (23, 187, 186, 37, N'Child', CAST(N'2011-05-31 17:12:26.897' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (24, 188, 186, 37, N'Child', CAST(N'2011-04-08 13:38:27.470' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (25, 189, 186, 37, N'Child', CAST(N'2011-04-08 13:49:37.107' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (26, 196, 193, 38, N'Parent', CAST(N'2011-04-29 14:27:21.937' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (27, 205, 204, 37, N'Child', CAST(N'2011-04-28 20:59:59.870' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (28, 206, 204, 37, N'Child', CAST(N'2011-04-28 21:03:12.867' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (29, 207, 204, 37, N'Child', CAST(N'2011-04-28 21:05:26.333' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (30, 208, 193, 37, N'Child', CAST(N'2011-04-29 14:27:31.950' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (31, 209, 193, 38, N'Parent', CAST(N'2011-04-29 14:27:41.023' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (32, 210, 193, 36, N'Spouse', CAST(N'2011-04-28 21:43:21.280' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (33, 212, 211, 36, N'Spouse', CAST(N'2011-04-28 21:51:06.090' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (34, 213, 193, 37, N'Child', CAST(N'2011-04-29 14:16:58.020' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (35, 214, 193, 39, N'Other', CAST(N'2011-04-28 22:18:26.257' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (36, 215, 193, 37, N'Child', CAST(N'2011-04-29 13:58:02.867' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (37, 217, 216, 37, N'Child', CAST(N'2011-04-28 22:29:11.230' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (38, 218, 216, 36, N'Spouse', CAST(N'2011-04-28 22:32:14.317' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (39, 219, 193, 35, N'Head of household', CAST(N'2011-04-28 22:43:25.127' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (40, 220, 193, 37, N'Child', CAST(N'2011-04-28 23:07:51.380' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (41, 221, 193, 36, N'Spouse', CAST(N'2011-04-29 00:52:31.170' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (42, 223, 222, 37, N'Child', CAST(N'2011-04-28 23:52:49.313' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (43, 224, 193, 36, N'Spouse', CAST(N'2011-04-29 09:15:47.087' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (44, 225, 193, 38, N'Parent', CAST(N'2011-04-29 09:21:59.387' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (45, 226, 193, 36, N'Spouse', CAST(N'2011-04-29 09:26:04.937' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (46, 227, 193, 39, N'Other', CAST(N'2011-04-29 09:27:30.400' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (47, 228, 193, 38, N'Parent', CAST(N'2011-04-29 12:11:32.317' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (48, 229, 193, 35, N'Head of household', CAST(N'2011-04-29 14:16:42.333' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (49, 230, 193, 39, N'Other', CAST(N'2011-04-29 13:27:18.880' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (50, 232, 231, 39, N'Other', CAST(N'2011-04-29 14:30:09.850' AS DateTime), N'Fred Flintstone')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (52, 193, 186, 37, N'Child', CAST(N'2021-09-04 10:57:00.000' AS DateTime), N'Aaron Gockley')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (53, 235, 186, 39, N'Other', CAST(N'2021-09-04 00:00:00.000' AS DateTime), N'Aaron Gockley')
INSERT [Person].[FamilyRelationships] ([FamilyRelationshipID], [PersonID], [ClientPersonID], [RelationshipID], [RelationDescription], [ModifiedDate], [ModifiedBy]) VALUES (54, 186, 186, 35, N'Head of Household', CAST(N'2021-09-04 00:00:00.000' AS DateTime), N'Aaron Gockley')
SET IDENTITY_INSERT [Person].[FamilyRelationships] OFF
SET IDENTITY_INSERT [Person].[Income] ON 

INSERT [Person].[Income] ([IncomeSourceRowID], [IncomeSourceID], [PersonID], [ModifiedBy], [ModifiedDate]) VALUES (4, 4, 186, N'DanJohnston', CAST(N'2011-05-19 13:47:20.840' AS DateTime))
INSERT [Person].[Income] ([IncomeSourceRowID], [IncomeSourceID], [PersonID], [ModifiedBy], [ModifiedDate]) VALUES (5, 2, 189, N'DanJohnston', CAST(N'2011-04-08 13:49:37.107' AS DateTime))
INSERT [Person].[Income] ([IncomeSourceRowID], [IncomeSourceID], [PersonID], [ModifiedBy], [ModifiedDate]) VALUES (6, 1, 187, N'DanJohnston', CAST(N'2011-05-31 17:12:26.897' AS DateTime))
INSERT [Person].[Income] ([IncomeSourceRowID], [IncomeSourceID], [PersonID], [ModifiedBy], [ModifiedDate]) VALUES (7, 1, 193, N'DanJohnston', CAST(N'2011-05-16 09:37:15.810' AS DateTime))
INSERT [Person].[Income] ([IncomeSourceRowID], [IncomeSourceID], [PersonID], [ModifiedBy], [ModifiedDate]) VALUES (8, 1, 196, N'DanJohnston', CAST(N'2011-04-29 14:27:21.937' AS DateTime))
INSERT [Person].[Income] ([IncomeSourceRowID], [IncomeSourceID], [PersonID], [ModifiedBy], [ModifiedDate]) VALUES (9, 1, 229, N'DanJohnston', CAST(N'2011-04-29 14:16:42.333' AS DateTime))
INSERT [Person].[Income] ([IncomeSourceRowID], [IncomeSourceID], [PersonID], [ModifiedBy], [ModifiedDate]) VALUES (10, 1, 215, N'DanJohnston', CAST(N'2011-04-29 13:58:02.867' AS DateTime))
INSERT [Person].[Income] ([IncomeSourceRowID], [IncomeSourceID], [PersonID], [ModifiedBy], [ModifiedDate]) VALUES (11, 3, 237, N'gsavard', CAST(N'2011-05-17 12:58:30.757' AS DateTime))
SET IDENTITY_INSERT [Person].[Income] OFF
SET IDENTITY_INSERT [Person].[LUAddressType] ON 

INSERT [Person].[LUAddressType] ([AddressTypeID], [AddressType], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'Home', CAST(N'2010-10-08 12:46:29.313' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUAddressType] ([AddressTypeID], [AddressType], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'Office', CAST(N'2010-10-08 12:46:42.197' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUAddressType] ([AddressTypeID], [AddressType], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (3, N'Homeless', CAST(N'2010-10-08 12:46:50.287' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUAddressType] ([AddressTypeID], [AddressType], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'Shelter', CAST(N'2010-10-08 12:46:56.270' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUAddressType] ([AddressTypeID], [AddressType], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (5, N'Parent', CAST(N'2010-10-08 12:47:04.110' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUAddressType] ([AddressTypeID], [AddressType], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (6, N'Friend', CAST(N'2010-10-08 12:47:10.307' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUAddressType] ([AddressTypeID], [AddressType], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (7, N'Hotel', CAST(N'2010-10-08 12:47:16.453' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUAddressType] ([AddressTypeID], [AddressType], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'Mailing', CAST(N'2011-03-14 15:27:04.427' AS DateTime), N'sse', NULL)
SET IDENTITY_INSERT [Person].[LUAddressType] OFF
SET IDENTITY_INSERT [Person].[LUCity] ON 

INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (245, 45, 1, 0, N'Addison', N'Addision', CAST(N'2010-10-05 18:40:12.053' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (246, 45, 1, 0, N'Bridgeport', N'Bridgeport', CAST(N'2010-10-05 18:40:12.053' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (247, 45, 1, 0, N'Bristol', N'Bristol', CAST(N'2010-10-05 18:40:12.053' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (248, 45, 1, 0, N'Cornwall', N'Cornwall', CAST(N'2010-10-05 18:40:12.057' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (249, 45, 1, 0, N'Ferrisburg', N'Ferrisburg', CAST(N'2010-10-05 18:40:12.057' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (250, 45, 1, 0, N'Goshen', N'Goshen', CAST(N'2010-10-05 18:40:12.057' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (251, 45, 1, 0, N'Granville', N'Granville', CAST(N'2010-10-05 18:40:12.057' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (252, 45, 1, 0, N'Hancock', N'Hancock', CAST(N'2010-10-05 18:40:12.057' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (253, 45, 1, 0, N'Leicester', N'Leicester', CAST(N'2010-10-05 18:40:12.057' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (254, 45, 1, 0, N'Lincoln', N'Lincoln', CAST(N'2010-10-05 18:40:12.057' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (255, 45, 1, 0, N'Middlebury', N'Middlebury', CAST(N'2010-10-05 18:40:12.057' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (256, 45, 1, 0, N'Monkton', N'Monkton', CAST(N'2010-10-05 18:40:12.057' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (257, 45, 1, 0, N'New Haven', N'New Haven', CAST(N'2010-10-05 18:40:12.057' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (258, 45, 1, 0, N'Orwell', N'Orwell', CAST(N'2010-10-05 18:40:12.057' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (259, 45, 1, 0, N'Panton', N'Panton', CAST(N'2010-10-05 18:40:12.057' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (260, 45, 1, 0, N'Ripton', N'Ripton', CAST(N'2010-10-05 18:40:12.057' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (261, 45, 1, 0, N'Salisbury', N'Salisbury', CAST(N'2010-10-05 18:40:12.060' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (262, 45, 1, 0, N'Shoreham', N'Shoreham', CAST(N'2010-10-05 18:40:12.060' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (263, 45, 1, 0, N'Starksboro', N'Starksboro', CAST(N'2010-10-05 18:40:12.060' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (264, 45, 1, 0, N'Vergennes', N'Vergennes', CAST(N'2010-10-05 18:40:12.060' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (265, 45, 1, 0, N'Waltham', N'Waltham', CAST(N'2010-10-05 18:40:12.060' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (266, 45, 1, 0, N'Weybridge', N'Weybridge', CAST(N'2010-10-05 18:40:12.060' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (267, 45, 2, 0, N'Glastenbury', N'Glastenbury', CAST(N'2010-10-05 18:40:12.117' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (268, 45, 2, 0, N'Landgrove', N'Landgrove', CAST(N'2010-10-05 18:40:12.117' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (269, 45, 2, 0, N'Manchester', N'Manchester', CAST(N'2010-10-05 18:40:12.117' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (270, 45, 2, 0, N'Peru', N'Peru', CAST(N'2010-10-05 18:40:12.120' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (271, 45, 2, 0, N'Pownal', N'Pownal', CAST(N'2010-10-05 18:40:12.120' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (272, 45, 2, 0, N'Readsboro', N'Readsboro', CAST(N'2010-10-05 18:40:12.120' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (273, 45, 2, 0, N'Rupert', N'Rupert', CAST(N'2010-10-05 18:40:12.120' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (274, 45, 2, 0, N'Sandgate', N'Sandgate', CAST(N'2010-10-05 18:40:12.120' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (275, 45, 2, 0, N'Searsburg', N'Searsburg', CAST(N'2010-10-05 18:40:12.120' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (276, 45, 2, 0, N'Shaftsbury', N'Shaftsbury', CAST(N'2010-10-05 18:40:12.120' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (277, 45, 2, 0, N'Stamford', N'Stamford', CAST(N'2010-10-05 18:40:12.120' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (278, 45, 2, 0, N'Sunderland', N'Sunderland', CAST(N'2010-10-05 18:40:12.120' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (279, 45, 2, 0, N'Winhall', N'Winhall', CAST(N'2010-10-05 18:40:12.120' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (280, 45, 2, 0, N'Woodford', N'Woodford', CAST(N'2010-10-05 18:40:12.120' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (281, 45, 3, 0, N'Barnet', N'Barnet', CAST(N'2010-10-05 18:40:12.127' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (282, 45, 3, 0, N'Burke', N'Burke', CAST(N'2010-10-05 18:40:12.127' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (283, 45, 3, 0, N'Danville', N'Danville', CAST(N'2010-10-05 18:40:12.127' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (284, 45, 3, 0, N'Groton', N'Groton', CAST(N'2010-10-05 18:40:12.127' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (285, 45, 3, 0, N'Hardwick', N'Hardwick', CAST(N'2010-10-05 18:40:12.127' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (286, 45, 3, 0, N'Kirby', N'Kirby', CAST(N'2010-10-05 18:40:12.127' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (287, 45, 3, 0, N'Lyndon', N'Lyndon', CAST(N'2010-10-05 18:40:12.127' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (288, 45, 3, 0, N'Newark', N'Newark', CAST(N'2010-10-05 18:40:12.127' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (289, 45, 3, 0, N'Peacham', N'Peacham', CAST(N'2010-10-05 18:40:12.127' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (290, 45, 3, 0, N'Ryegate', N'Ryegate', CAST(N'2010-10-05 18:40:12.127' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (291, 45, 3, 0, N'Sheffield', N'Sheffield', CAST(N'2010-10-05 18:40:12.127' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (292, 45, 3, 0, N'St. Johnsbury', N'St. Johnsbury', CAST(N'2010-10-05 18:40:12.127' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (293, 45, 3, 0, N'Stannard', N'Stannard', CAST(N'2010-10-05 18:40:12.127' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (294, 45, 3, 0, N'Sutton', N'Sutton', CAST(N'2010-10-05 18:40:12.130' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (295, 45, 3, 0, N'Walden', N'Walden', CAST(N'2010-10-05 18:40:12.130' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (296, 45, 3, 0, N'Waterford', N'Waterford', CAST(N'2010-10-05 18:40:12.130' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (297, 45, 3, 0, N'Wheelock', N'Wheelock', CAST(N'2010-10-05 18:40:12.130' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (298, 45, 4, 0, N'Bolton', N'Bolton', CAST(N'2010-10-05 18:40:12.137' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (299, 45, 4, 0, N'Burlington', N'Burlington', CAST(N'2010-10-05 18:40:12.137' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (300, 45, 4, 0, N'Charlotte', N'Charlotte', CAST(N'2010-10-05 18:40:12.137' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (301, 45, 4, 0, N'Colchester', N'Colchester', CAST(N'2010-10-05 18:40:12.137' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (302, 45, 4, 0, N'Essex', N'Essex', CAST(N'2010-10-05 18:40:12.137' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (303, 45, 4, 0, N'Hinesburg', N'Hinesburg', CAST(N'2010-10-05 18:40:12.137' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (304, 45, 4, 0, N'Huntington', N'Huntington', CAST(N'2010-10-05 18:40:12.137' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (305, 45, 4, 0, N'Jericho', N'Jericho', CAST(N'2010-10-05 18:40:12.137' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (306, 45, 4, 0, N'Milton', N'Milton', CAST(N'2010-10-05 18:40:12.137' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (307, 45, 4, 0, N'Richmond', N'Richmond', CAST(N'2010-10-05 18:40:12.137' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (308, 45, 4, 0, N'Shelburne', N'Shelburne', CAST(N'2010-10-05 18:40:12.137' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (309, 45, 4, 0, N'St.George', N'St. George', CAST(N'2010-10-05 18:40:12.137' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (310, 45, 4, 0, N'Underhill', N'', CAST(N'2010-10-05 18:40:12.137' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (311, 45, 4, 0, N'Westford', N'Westford', CAST(N'2010-10-05 18:40:12.137' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (312, 45, 4, 0, N'Williston', N'Williston', CAST(N'2010-10-05 18:40:12.137' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (313, 45, 4, 0, N'Winooski', N'Winooski', CAST(N'2010-10-05 18:40:12.137' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (314, 45, 5, 0, N'Averill', N'Averill', CAST(N'2010-10-05 18:40:12.143' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (315, 45, 5, 0, N'Bloomfield', N'Bloomfield', CAST(N'2010-10-05 18:40:12.143' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (316, 45, 5, 0, N'Brighton', N'Brighton', CAST(N'2010-10-05 18:40:12.143' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (317, 45, 5, 0, N'Brunswick', N'Brunswick', CAST(N'2010-10-05 18:40:12.143' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (318, 45, 5, 0, N'Canaan', N'Canaan', CAST(N'2010-10-05 18:40:12.143' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (319, 45, 5, 0, N'Concord', N'Concord', CAST(N'2010-10-05 18:40:12.143' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (320, 45, 5, 0, N'East Haven', N'East Haven', CAST(N'2010-10-05 18:40:12.143' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (321, 45, 5, 0, N'Ferdinand', N'Ferdinand', CAST(N'2010-10-05 18:40:12.143' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (322, 45, 5, 0, N'Granby', N'Granby', CAST(N'2010-10-05 18:40:12.143' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (323, 45, 5, 0, N'Guildhall', N'Guildhall', CAST(N'2010-10-05 18:40:12.143' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (324, 45, 5, 0, N'Lemington', N'Lemington', CAST(N'2010-10-05 18:40:12.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (325, 45, 5, 0, N'Lewis', N'Lewis', CAST(N'2010-10-05 18:40:12.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (326, 45, 5, 0, N'Luneburg', N'Luneburg', CAST(N'2010-10-05 18:40:12.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (327, 45, 5, 0, N'Maidstone', N'Maidstone', CAST(N'2010-10-05 18:40:12.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (328, 45, 5, 0, N'Norton', N'Norton', CAST(N'2010-10-05 18:40:12.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (329, 45, 5, 0, N'Victory', N'Victory', CAST(N'2010-10-05 18:40:12.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (330, 45, 6, 0, N'Bakersfield', N'Bakersfield', CAST(N'2010-10-05 18:40:12.150' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (331, 45, 6, 0, N'Berkshire', N'Berkshire', CAST(N'2010-10-05 18:40:12.150' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (332, 45, 6, 0, N'Enosburgh', N'Enosburgh', CAST(N'2010-10-05 18:40:12.150' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (333, 45, 6, 0, N'Fairfax', N'Fairfax', CAST(N'2010-10-05 18:40:12.150' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (334, 45, 6, 0, N'Fairfield', N'Fairfield', CAST(N'2010-10-05 18:40:12.150' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (335, 45, 6, 0, N'Fletcher', N'Fletcher', CAST(N'2010-10-05 18:40:12.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (336, 45, 6, 0, N'Franklin', N'Franklin', CAST(N'2010-10-05 18:40:12.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (337, 45, 6, 0, N'Georgia', N'Georgia', CAST(N'2010-10-05 18:40:12.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (338, 45, 6, 0, N'Highgate', N'Highgate', CAST(N'2010-10-05 18:40:12.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (339, 45, 6, 0, N'Montgomery', N'Montgomery', CAST(N'2010-10-05 18:40:12.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (340, 45, 6, 0, N'Richford', N'Richford', CAST(N'2010-10-05 18:40:12.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (341, 45, 6, 0, N'Sheldon', N'Sheldon', CAST(N'2010-10-05 18:40:12.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (342, 45, 6, 0, N'St. Albans', N'St. Albans', CAST(N'2010-10-05 18:40:12.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (343, 45, 6, 0, N'Swanton', N'Swanton', CAST(N'2010-10-05 18:40:12.153' AS DateTime), N'SSE', NULL)
GO
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (344, 45, 7, 0, N'Alburgh', N'Alburgh', CAST(N'2010-10-05 18:40:12.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (345, 45, 7, 0, N'Grand Isle', N'Grand Isle', CAST(N'2010-10-05 18:40:12.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (346, 45, 7, 0, N'Isle La Motte', N'Isle La Motte', CAST(N'2010-10-05 18:40:12.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (347, 45, 7, 0, N'North Hero', N'North Hero', CAST(N'2010-10-05 18:40:12.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (348, 45, 7, 0, N'South Hero', N'South Hero', CAST(N'2010-10-05 18:40:12.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (349, 45, 8, 0, N'Belvidere', N'Belvidere', CAST(N'2010-10-05 18:40:12.160' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (350, 45, 8, 0, N'Cambridge', N'Cambridge', CAST(N'2010-10-05 18:40:12.160' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (351, 45, 8, 0, N'Eden', N'Eden', CAST(N'2010-10-05 18:40:12.160' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (352, 45, 8, 0, N'Elmore', N'Elmore', CAST(N'2010-10-05 18:40:12.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (353, 45, 8, 0, N'Hyde Park', N'Hyde Park', CAST(N'2010-10-05 18:40:12.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (354, 45, 8, 0, N'Johnson', N'Johnson', CAST(N'2010-10-05 18:40:12.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (355, 45, 8, 0, N'Morristown', N'Morristown', CAST(N'2010-10-05 18:40:12.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (356, 45, 8, 0, N'Stowe', N'Stowe', CAST(N'2010-10-05 18:40:12.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (357, 45, 8, 0, N'Waterville', N'Waterville', CAST(N'2010-10-05 18:40:12.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (358, 45, 8, 0, N'Wolcott', N'Wolcott', CAST(N'2010-10-05 18:40:12.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (359, 45, 9, 0, N'Bradford', N'Bradford', CAST(N'2010-10-05 18:40:12.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (360, 45, 9, 0, N'Braintree', N'Braintree', CAST(N'2010-10-05 18:40:12.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (361, 45, 9, 0, N'Brookfield', N'Brookfield', CAST(N'2010-10-05 18:40:12.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (362, 45, 9, 0, N'Chelsea', N'Chelsea', CAST(N'2010-10-05 18:40:12.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (363, 45, 9, 0, N'Corinth', N'Corinth', CAST(N'2010-10-05 18:40:12.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (364, 45, 9, 0, N'Fairlee', N'Fairlee', CAST(N'2010-10-05 18:40:12.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (365, 45, 9, 0, N'Newbury', N'Newbury', CAST(N'2010-10-05 18:40:12.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (366, 45, 9, 0, N'Orange', N'Orange', CAST(N'2010-10-05 18:40:12.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (367, 45, 9, 0, N'Randolph', N'Randolph', CAST(N'2010-10-05 18:40:12.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (368, 45, 9, 0, N'Strafford', N'Strafford', CAST(N'2010-10-05 18:40:12.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (369, 45, 9, 0, N'Thetford', N'Thetford', CAST(N'2010-10-05 18:40:12.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (370, 45, 9, 0, N'Topsham', N'Topsham', CAST(N'2010-10-05 18:40:12.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (371, 45, 9, 0, N'Tunbridge', N'Tunbridge', CAST(N'2010-10-05 18:40:12.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (372, 45, 9, 0, N'Vershire', N'Vershire', CAST(N'2010-10-05 18:40:12.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (373, 45, 9, 0, N'Washington', N'Washington', CAST(N'2010-10-05 18:40:12.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (374, 45, 9, 0, N'West Fairlee', N'West Fairlee', CAST(N'2010-10-05 18:40:12.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (375, 45, 9, 0, N'Williamstown', N'Williamstown', CAST(N'2010-10-05 18:40:12.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (376, 45, 10, 0, N'Westmore', N'Westmore', CAST(N'2010-10-05 18:40:12.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (377, 45, 10, 0, N'Westfield', N'Westfield', CAST(N'2010-10-05 18:40:12.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (378, 45, 10, 0, N'Troy', N'Troy', CAST(N'2010-10-05 18:40:12.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (379, 45, 10, 0, N'Newport Center', N'Newport Center', CAST(N'2010-10-05 18:40:12.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (380, 45, 10, 0, N'Newport City', N'Newport City', CAST(N'2010-10-05 18:40:12.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (381, 45, 10, 0, N'Morgan', N'Morgan', CAST(N'2010-10-05 18:40:12.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (382, 45, 10, 0, N'Lowell', N'Lowell', CAST(N'2010-10-05 18:40:12.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (383, 45, 10, 0, N'Jay', N'Jay', CAST(N'2010-10-05 18:40:12.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (384, 45, 10, 0, N'Irasburg', N'Irasburg', CAST(N'2010-10-05 18:40:12.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (385, 45, 10, 0, N'Holland', N'Holland', CAST(N'2010-10-05 18:40:12.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (386, 45, 10, 0, N'Greensboro', N'Greensboro', CAST(N'2010-10-05 18:40:12.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (387, 45, 10, 0, N'Glover', N'Glover', CAST(N'2010-10-05 18:40:12.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (388, 45, 10, 0, N'Derby', N'Derby', CAST(N'2010-10-05 18:40:12.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (389, 45, 10, 0, N'Craftsbury', N'Craftsbury', CAST(N'2010-10-05 18:40:12.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (390, 45, 10, 0, N'Coventry', N'Coventry', CAST(N'2010-10-05 18:40:12.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (391, 45, 10, 0, N'Charleston', N'Charleston', CAST(N'2010-10-05 18:40:12.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (392, 45, 10, 0, N'Brownington', N'Brownington', CAST(N'2010-10-05 18:40:12.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (393, 45, 10, 0, N'Barton', N'Barton', CAST(N'2010-10-05 18:40:12.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (394, 45, 10, 0, N'Albany', N'Albany', CAST(N'2010-10-05 18:40:12.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (395, 45, 11, 0, N'West Rutland', N'West Rutland', CAST(N'2010-10-05 18:40:12.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (396, 45, 11, 0, N'West Haven', N'West Haven', CAST(N'2010-10-05 18:40:12.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (397, 45, 11, 0, N'Wells', N'Wells', CAST(N'2010-10-05 18:40:12.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (398, 45, 11, 0, N'Wallingford', N'Wallingford', CAST(N'2010-10-05 18:40:12.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (399, 45, 11, 0, N'Tinmouth', N'Tinmouth', CAST(N'2010-10-05 18:40:12.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (400, 45, 11, 0, N'Sudbury', N'Sudbury', CAST(N'2010-10-05 18:40:12.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (401, 45, 11, 0, N'Shrewsbury', N'Shrewsbury', CAST(N'2010-10-05 18:40:12.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (402, 45, 11, 0, N'Rutland Town', N'Rutland Town', CAST(N'2010-10-05 18:40:12.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (403, 45, 11, 0, N'Rutland City', N'Rutland City', CAST(N'2010-10-05 18:40:12.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (404, 45, 11, 0, N'Proctor', N'Proctor', CAST(N'2010-10-05 18:40:12.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (405, 45, 11, 0, N'Poultney', N'Poultney', CAST(N'2010-10-05 18:40:12.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (406, 45, 11, 0, N'Pittsford', N'Pittsford', CAST(N'2010-10-05 18:40:12.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (407, 45, 11, 0, N'Pittsfield', N'Pittsfield', CAST(N'2010-10-05 18:40:12.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (408, 45, 11, 0, N'Pawlet', N'Pawlet', CAST(N'2010-10-05 18:40:12.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (409, 45, 11, 0, N'Mount Tabor', N'Mount Tabor', CAST(N'2010-10-05 18:40:12.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (410, 45, 11, 0, N'Mout Holly', N'Mount Holly', CAST(N'2010-10-05 18:40:12.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (411, 45, 11, 0, N'Middletown Springs', N'Middletown Springs', CAST(N'2010-10-05 18:40:12.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (412, 45, 11, 0, N'Mendon', N'Mendon', CAST(N'2010-10-05 18:40:12.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (413, 45, 11, 0, N'Killington', N'Killington', CAST(N'2010-10-05 18:40:12.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (414, 45, 11, 0, N'Ira', N'Ira', CAST(N'2010-10-05 18:40:12.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (415, 45, 11, 0, N'Hubbardton', N'Hubbardton', CAST(N'2010-10-05 18:40:12.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (416, 45, 11, 0, N'Fair Haven', N'Fair Haven', CAST(N'2010-10-05 18:40:12.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (417, 45, 11, 0, N'Danby', N'Danby', CAST(N'2010-10-05 18:40:12.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (418, 45, 11, 0, N'Clarendon', N'Clarendon', CAST(N'2010-10-05 18:40:12.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (419, 45, 11, 0, N'Chittenden', N'Chittenden', CAST(N'2010-10-05 18:40:12.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (420, 45, 11, 0, N'Castleton', N'Castleton', CAST(N'2010-10-05 18:40:12.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (421, 45, 11, 0, N'Brandon', N'Brandon', CAST(N'2010-10-05 18:40:12.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (422, 45, 11, 0, N'Benson', N'Benson', CAST(N'2010-10-05 18:40:12.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (423, 45, 12, 0, N'Barre Town', N'Barre Town', CAST(N'2010-10-05 18:40:12.203' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (424, 45, 12, 0, N'Barre City', N'Barre City', CAST(N'2010-10-05 18:40:12.203' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (425, 45, 12, 0, N'Berlin', N'Berlin', CAST(N'2010-10-05 18:40:12.203' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (426, 45, 12, 0, N'Cabot', N'Cabot', CAST(N'2010-10-05 18:40:12.203' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (427, 45, 12, 0, N'Calais', N'Calais', CAST(N'2010-10-05 18:40:12.203' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (428, 45, 12, 0, N'Duxbury', N'Duxbury', CAST(N'2010-10-05 18:40:12.207' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (429, 45, 12, 0, N'East Montpelier', N'East Montpelier', CAST(N'2010-10-05 18:40:12.207' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (430, 45, 12, 0, N'Fayston', N'Fayston', CAST(N'2010-10-05 18:40:12.207' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (431, 45, 12, 0, N'Marshfield', N'Marshfield', CAST(N'2010-10-05 18:40:12.207' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (432, 45, 12, 0, N'Middlesex', N'Middlesex', CAST(N'2010-10-05 18:40:12.207' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (433, 45, 12, 0, N'Moretown', N'Moretown', CAST(N'2010-10-05 18:40:12.207' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (434, 45, 12, 0, N'Northfield', N'Northfield', CAST(N'2010-10-05 18:40:12.207' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (435, 45, 12, 0, N'Plainfield', N'Plainfield', CAST(N'2010-10-05 18:40:12.207' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (436, 45, 12, 0, N'Roxbury', N'Roxbury', CAST(N'2010-10-05 18:40:12.207' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (437, 45, 12, 0, N'Waitsfield', N'Waitsfield', CAST(N'2010-10-05 18:40:12.207' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (438, 45, 12, 0, N'Montpelier', N'Montpelier', CAST(N'2010-10-05 18:40:12.207' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (439, 45, 12, 0, N'Warren', N'Warren', CAST(N'2010-10-05 18:40:12.207' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (440, 45, 12, 0, N'Waterbury', N'Waterbury', CAST(N'2010-10-05 18:40:12.207' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (441, 45, 12, 0, N'Woodbury', N'Woodbury', CAST(N'2010-10-05 18:40:12.207' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (442, 45, 12, 0, N'Worchester', N'Worchester', CAST(N'2010-10-05 18:40:12.207' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (443, 45, 13, 0, N'Athens', N'Athens', CAST(N'2010-10-05 18:40:12.217' AS DateTime), N'SSE', NULL)
GO
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (444, 45, 13, 0, N'Brattleboro', N'Brattleboro', CAST(N'2010-10-05 18:40:12.217' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (445, 45, 13, 0, N'Brookline', N'Brookline', CAST(N'2010-10-05 18:40:12.217' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (446, 45, 13, 0, N'Dover', N'Dover', CAST(N'2010-10-05 18:40:12.217' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (447, 45, 13, 0, N'Dummerston', N'Dummerston', CAST(N'2010-10-05 18:40:12.217' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (448, 45, 13, 0, N'Grafton', N'Grafton', CAST(N'2010-10-05 18:40:12.217' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (449, 45, 13, 0, N'Guilford', N'Guilford', CAST(N'2010-10-05 18:40:12.217' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (450, 45, 13, 0, N'Halifax', N'Halifax', CAST(N'2010-10-05 18:40:12.220' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (451, 45, 13, 0, N'Jamaica', N'Jamaica', CAST(N'2010-10-05 18:40:12.220' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (452, 45, 13, 0, N'Londonderry', N'Londonderry', CAST(N'2010-10-05 18:40:12.220' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (453, 45, 13, 0, N'Marlboro', N'Marlboro', CAST(N'2010-10-05 18:40:12.220' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (454, 45, 13, 0, N'Newfane', N'Newfane', CAST(N'2010-10-05 18:40:12.220' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (455, 45, 13, 0, N'Putney', N'Putney', CAST(N'2010-10-05 18:40:12.220' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (456, 45, 13, 0, N'Rockingham', N'Rockingham', CAST(N'2010-10-05 18:40:12.220' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (457, 45, 13, 0, N'Somerset', N'Somerset', CAST(N'2010-10-05 18:40:12.220' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (458, 45, 13, 0, N'Stratton', N'Stratton', CAST(N'2010-10-05 18:40:12.220' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (459, 45, 13, 0, N'Townshend', N'Townshend', CAST(N'2010-10-05 18:40:12.220' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (460, 45, 13, 0, N'Vernon', N'Vernon', CAST(N'2010-10-05 18:40:12.220' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (461, 45, 13, 0, N'Wardsboro', N'Wardsboro', CAST(N'2010-10-05 18:40:12.220' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (462, 45, 13, 0, N'Westminster', N'Westminster', CAST(N'2010-10-05 18:40:12.220' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (463, 45, 13, 0, N'Whitingham', N'Whitingham', CAST(N'2010-10-05 18:40:12.223' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (464, 45, 13, 0, N'Wilmington', N'Wilmington', CAST(N'2010-10-05 18:40:12.223' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (465, 45, 13, 0, N'Windham', N'Windham', CAST(N'2010-10-05 18:40:12.223' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (466, 45, 14, 0, N'Andover', N'Andover', CAST(N'2010-10-05 18:40:12.230' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (467, 45, 14, 0, N'Baltimore', N'Baltimore', CAST(N'2010-10-05 18:40:12.230' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (468, 45, 14, 0, N'Barnard', N'Barnard', CAST(N'2010-10-05 18:40:12.233' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (469, 45, 14, 0, N'Bethel', N'Bethel', CAST(N'2010-10-05 18:40:12.233' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (470, 45, 14, 0, N'Bridgewater', N'Bridgewater', CAST(N'2010-10-05 18:40:12.233' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (471, 45, 14, 0, N'Cavendish', N'Cavendish', CAST(N'2010-10-05 18:40:12.233' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (472, 45, 14, 0, N'Chester', N'Chester', CAST(N'2010-10-05 18:40:12.233' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (473, 45, 14, 0, N'Hartford', N'Hartford', CAST(N'2010-10-05 18:40:12.233' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (474, 45, 14, 0, N'Hartland', N'Hartland', CAST(N'2010-10-05 18:40:12.233' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (475, 45, 14, 0, N'Ludlow', N'Ludlow', CAST(N'2010-10-05 18:40:12.233' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (476, 45, 14, 0, N'Norwich', N'Norwich', CAST(N'2010-10-05 18:40:12.233' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (477, 45, 14, 0, N'Plymouth', N'Plymouth', CAST(N'2010-10-05 18:40:12.233' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (478, 45, 14, 0, N'Pomfret', N'Pomfret', CAST(N'2010-10-05 18:40:12.233' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (479, 45, 14, 0, N'Reading', N'Reading', CAST(N'2010-10-05 18:40:12.233' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (480, 45, 14, 0, N'Rochester', N'Rochester', CAST(N'2010-10-05 18:40:12.237' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (481, 45, 14, 0, N'Royalton', N'Royalton', CAST(N'2010-10-05 18:40:12.237' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (482, 45, 14, 0, N'Sharon', N'Sharon', CAST(N'2010-10-05 18:40:12.237' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (483, 45, 14, 0, N'Springfield', N'Springfield', CAST(N'2010-10-05 18:40:12.237' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (484, 45, 14, 0, N'Stockbridge', N'Stockbridge', CAST(N'2010-10-05 18:40:12.237' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (485, 45, 14, 0, N'Weathersfield', N'Weathersfield', CAST(N'2010-10-05 18:40:12.237' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (486, 45, 14, 0, N'West Windsor', N'West Windsor', CAST(N'2010-10-05 18:40:12.237' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (487, 45, 14, 0, N'Weston', N'Weston', CAST(N'2010-10-05 18:40:12.237' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (488, 45, 14, 0, N'Windsor', N'Windsor', CAST(N'2010-10-05 18:40:12.237' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (489, 45, 14, 0, N'Woodstock', N'Woodstock', CAST(N'2010-10-05 18:40:12.237' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (490, 45, 4, 0, N'Essex Junction', N'EssexJunction', CAST(N'2010-10-06 18:06:18.030' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCity] ([CityID], [StateID], [CountyID], [PostalCodeID], [CityName], [CityAbbreviation], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (494, 45, 4, 0, N'South Burlington', N'South Burlington', CAST(N'2010-11-04 20:07:02.667' AS DateTime), N'SSE', NULL)
SET IDENTITY_INSERT [Person].[LUCity] OFF
SET IDENTITY_INSERT [Person].[LUCountryOfOrigin] ON 

INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'Afghanistan', N'Islamic Republic of Afghanistan', N'AF', CAST(N'2010-10-04 21:42:34.143' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'Albania', N'Republic of Albania', N'AL', CAST(N'2010-10-04 21:42:34.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (3, N'Algeria', N'Peoples Democratic Republic of Algeria', N'AG', CAST(N'2010-10-04 21:42:34.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'Andorra', N'Principality of Andorra', N'AN', CAST(N'2010-10-04 21:42:34.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (5, N'Angola ', N'Republic of Angola', N'AO', CAST(N'2010-10-04 21:42:34.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (6, N'Antigua and Barbuda', N'Antigua and Barbuda', N'AC', CAST(N'2010-10-04 21:42:34.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (7, N'Argentina ', N'Argentine Republic', N'AR', CAST(N'2010-10-04 21:42:34.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'Armenia', N'Republic of Armenia', N'AM', CAST(N'2010-10-04 21:42:34.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (9, N'Australia', N'Commonwealth of Australia', N'AS', CAST(N'2010-10-04 21:42:34.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (10, N'Austria', N'Republic of Austria', N'AU', CAST(N'2010-10-04 21:42:34.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (11, N'Azerbaijan', N'Republic of Azerbaijan', N'AJ', CAST(N'2010-10-04 21:42:34.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (12, N'Bahamas', N'Commonwealth of the Bahamas', N'BF', CAST(N'2010-10-04 21:42:34.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (13, N'Bahrain', N'Kingdom of Bahrain', N'BA', CAST(N'2010-10-04 21:42:34.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (14, N'Bangladesh', N'Peoples Republic of Bangladesh', N'BG', CAST(N'2010-10-04 21:42:34.150' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (15, N'Barbados', N'Barbados', N'BB', CAST(N'2010-10-04 21:42:34.150' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (16, N'Belarus', N'Republic of Belarus', N'BO', CAST(N'2010-10-04 21:42:34.150' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (17, N'Belgium', N'Kingdom of Belgium', N'BE', CAST(N'2010-10-04 21:42:34.150' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (18, N'Belize', N'Belize', N'BH', CAST(N'2010-10-04 21:42:34.150' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (19, N'Benin', N'Republic of Benin', N'BN', CAST(N'2010-10-04 21:42:34.150' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (20, N'Bhutan', N'Kingdom of Bhutan', N'BT', CAST(N'2010-10-04 21:42:34.150' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (21, N'Bolivia', N'Plurinational State of Bolivia', N'BL', CAST(N'2010-10-04 21:42:34.150' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (22, N'Bosnia and Herzegovina', N'Bosnia and Herzegovina', N'BK', CAST(N'2010-10-04 21:42:34.150' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (23, N'Botswana', N'Republic of Botswana', N'BC', CAST(N'2010-10-04 21:42:34.150' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (24, N'Brazil', N'Federative Republic of Brazil', N'BR', CAST(N'2010-10-04 21:42:34.150' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (25, N'Brunei', N'Brunei Darussalam', N'BX', CAST(N'2010-10-04 21:42:34.150' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (26, N'Bulgaria', N'Republic of Bulgaria', N'BU', CAST(N'2010-10-04 21:42:34.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (27, N'Burkina Faso', N'Burkina Faso', N'UV', CAST(N'2010-10-04 21:42:34.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (28, N'Burma', N'Union of Burma', N'BM', CAST(N'2010-10-04 21:42:34.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (29, N'Burundi', N'Republic of Burundi', N'BY', CAST(N'2010-10-04 21:42:34.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (30, N'Cambodia', N'Kingdom of Cambodia', N'CB', CAST(N'2010-10-04 21:42:34.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (31, N'Cameroon', N'Republic of Cameroon', N'CM', CAST(N'2010-10-04 21:42:34.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (32, N'Canada', N'Canada', N'CA', CAST(N'2010-10-04 21:42:34.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (33, N'Cape Verde', N'Republic of Cape Verde', N'CV', CAST(N'2010-10-04 21:42:34.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (34, N'Central African Republic', N'Central African Republic', N'CT', CAST(N'2010-10-04 21:42:34.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (35, N'Chad', N'Republic of Chad', N'CD', CAST(N'2010-10-04 21:42:34.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (36, N'Chile', N'Republic of Chile', N'CI', CAST(N'2010-10-04 21:42:34.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (37, N'China', N'Peoples Republic of China', N'CH', CAST(N'2010-10-04 21:42:34.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (38, N'Colombia', N'Republic of Colombia', N'CO', CAST(N'2010-10-04 21:42:34.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (39, N'Comoros', N'Union of the Comoros', N'CN', CAST(N'2010-10-04 21:42:34.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (40, N'Congo (Brazzaville)', N'Republic of the Congo', N'CF', CAST(N'2010-10-04 21:42:34.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (41, N'Congo (Kinshasa)', N'Democratic Republic of the Congo', N'CF', CAST(N'2010-10-04 21:42:34.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (42, N'Costa Rica', N'Republic of Costa Rica', N'CS', CAST(N'2010-10-04 21:42:34.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (43, N'Cote dIvoire', N'Republic of Cote dIvoire', N'IV', CAST(N'2010-10-04 21:42:34.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (44, N'Croatia', N'Republic of Croatia', N'HR', CAST(N'2010-10-04 21:42:34.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (45, N'Cuba', N'Republic of Cuba', N'CU', CAST(N'2010-10-04 21:42:34.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (46, N'Cyprus', N'Republic of Cyprus', N'CY', CAST(N'2010-10-04 21:42:34.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (47, N'Czech Republic', N'Czech Republic', N'EZ', CAST(N'2010-10-04 21:42:34.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (48, N'Denmark', N'Kingdom of Denmark', N'DA', CAST(N'2010-10-04 21:42:34.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (49, N'Djibouti', N'Republic of Djibouti', N'DJ', CAST(N'2010-10-04 21:42:34.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (50, N'Dominica', N'Commonwealth of Dominica', N'DO', CAST(N'2010-10-04 21:42:34.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (51, N'Dominican Republic', N'Dominican Republic', N'DR', CAST(N'2010-10-04 21:42:34.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (52, N'Ecuador', N'Republic of Ecuador', N'EC', CAST(N'2010-10-04 21:42:34.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (53, N'Egypt', N'Arab Republic of Egypt', N'EG', CAST(N'2010-10-04 21:42:34.160' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (54, N'El Salvador', N'Republic of El Salvador', N'ES', CAST(N'2010-10-04 21:42:34.160' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (55, N'Equatorial Guinea', N'Republic of Equatorial Guinea', N'EK', CAST(N'2010-10-04 21:42:34.160' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (56, N'Eritrea', N'State of Eritrea', N'ER', CAST(N'2010-10-04 21:42:34.160' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (57, N'Estonia', N'Republic of Estonia', N'EN', CAST(N'2010-10-04 21:42:34.160' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (58, N'Ethiopia', N'Federal Democratic Republic of Ethiopia', N'ET', CAST(N'2010-10-04 21:42:34.160' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (59, N'Fiji', N'Republic of the Fiji Islands', N'FJ', CAST(N'2010-10-04 21:42:34.160' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (60, N'Finland', N'Republic of Finland', N'FI', CAST(N'2010-10-04 21:42:34.160' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (61, N'France', N'French Republic', N'FR', CAST(N'2010-10-04 21:42:34.160' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (62, N'Gabon', N'Gabonese Republic', N'GB', CAST(N'2010-10-04 21:42:34.160' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (63, N'Gambia', N'Republic of The Gambia', N'GA', CAST(N'2010-10-04 21:42:34.160' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (64, N'Georgia', N'Georgia', N'GG', CAST(N'2010-10-04 21:42:34.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (65, N'Germany', N'Federal Republic of Germany', N'GM', CAST(N'2010-10-04 21:42:34.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (66, N'Ghana', N'Republic of Ghana', N'GH', CAST(N'2010-10-04 21:42:34.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (67, N'Greece', N'Hellenic Republic', N'GR', CAST(N'2010-10-04 21:42:34.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (68, N'Grenada', N'Grenada', N'GJ', CAST(N'2010-10-04 21:42:34.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (69, N'Guatemala', N'Republic of Guatemala', N'GT', CAST(N'2010-10-04 21:42:34.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (70, N'Guinea', N'Republic of Guinea', N'GV', CAST(N'2010-10-04 21:42:34.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (71, N'Guinea-Bissau ', N'Republic of Guinea-Bissau', N'PU', CAST(N'2010-10-04 21:42:34.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (72, N'Guyana', N'Co-operative Republic of Guyana', N'GY', CAST(N'2010-10-04 21:42:34.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (73, N'Haiti', N'Republic of Haiti', N'HA', CAST(N'2010-10-04 21:42:34.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (74, N'Holy See', N'Holy See', N'VT', CAST(N'2010-10-04 21:42:34.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (75, N'Honduras', N'Republic of Honduras', N'HO', CAST(N'2010-10-04 21:42:34.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (76, N'Hungary', N'Republic of Hungary', N'HU', CAST(N'2010-10-04 21:42:34.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (77, N'Iceland', N'Republic of Iceland', N'IC', CAST(N'2010-10-04 21:42:34.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (78, N'India', N'Republic of India', N'IN', CAST(N'2010-10-04 21:42:34.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (79, N'Indonesia', N'Republic of Indonesia', N'ID', CAST(N'2010-10-04 21:42:34.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (80, N'Iran', N'Islamic Republic of Iran', N'IR', CAST(N'2010-10-04 21:42:34.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (81, N'Iraq', N'Republic of Iraq', N'IZ', CAST(N'2010-10-04 21:42:34.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (82, N'Ireland', N'Ireland', N'EI', CAST(N'2010-10-04 21:42:34.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (83, N'Israel', N'State of Israel', N'IS', CAST(N'2010-10-04 21:42:34.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (84, N'Italy', N'Italian Republic', N'IT', CAST(N'2010-10-04 21:42:34.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (85, N'Jamaica', N'Jamaica', N'JM', CAST(N'2010-10-04 21:42:34.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (86, N'Japan', N'Japan', N'JA', CAST(N'2010-10-04 21:42:34.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (87, N'Jordan', N'Hashemite Kingdom of Jordan', N'JO', CAST(N'2010-10-04 21:42:34.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (88, N'Kazakhstan', N'Republic of Kazakhstan', N'KZ', CAST(N'2010-10-04 21:42:34.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (89, N'Kenya', N'Republic of Kenya', N'KE', CAST(N'2010-10-04 21:42:34.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (90, N'Kiribati', N'Republic of Kiribati', N'KR', CAST(N'2010-10-04 21:42:34.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (91, N'North Korea', N'Democratic Peoples Republic of Korea', N'KN', CAST(N'2010-10-04 21:42:34.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (92, N'South Korea', N'Republic of Korea', N'KS', CAST(N'2010-10-04 21:42:34.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (93, N'Kosovo', N'Republic of Kosovo', N'KV', CAST(N'2010-10-04 21:42:34.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (94, N'Kuwait', N'State of Kuwait', N'KU', CAST(N'2010-10-04 21:42:34.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (95, N'Kyrgyzstan', N'Kyrgyz Republic', N'KG', CAST(N'2010-10-04 21:42:34.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (96, N'Laos', N'Lao Peoples Democratic Republic', N'LA', CAST(N'2010-10-04 21:42:34.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (97, N'Latvia', N'Republic of Latvia', N'LG', CAST(N'2010-10-04 21:42:34.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (98, N'Lebanon', N'Lebanese Republic', N'LE', CAST(N'2010-10-04 21:42:34.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (99, N'Lesotho', N'Kingdom of Lesotho', N'LT', CAST(N'2010-10-04 21:42:34.170' AS DateTime), N'SSE', NULL)
GO
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (100, N'Liberia', N'Republic of Liberia', N'LI', CAST(N'2010-10-04 21:42:34.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (101, N'Libya', N'Great Socialist Peoples', N'', CAST(N'2010-10-04 21:42:34.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (102, N'Libyan Arab Jamahiriya', N'LY', N'', CAST(N'2010-10-04 21:42:34.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (103, N'Liechtenstein', N'Principality of Liechtenstein', N'LS', CAST(N'2010-10-04 21:42:34.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (104, N'Lithuania', N'Republic of Lithuania', N'LH', CAST(N'2010-10-04 21:42:34.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (105, N'Luxembourg', N'Grand Duchy of Luxembourg', N'LU', CAST(N'2010-10-04 21:42:34.173' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (106, N'Macedonia', N'Republic of Macedonia', N'MK', CAST(N'2010-10-04 21:42:34.173' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (107, N'Madagascar', N'Republic of Madagascar', N'MA', CAST(N'2010-10-04 21:42:34.173' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (108, N'Malawi', N'Republic of Malawi', N'MI', CAST(N'2010-10-04 21:42:34.173' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (109, N'Malaysia', N'Malaysia', N'MY', CAST(N'2010-10-04 21:42:34.173' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (110, N'Maldives', N'Republic of Maldives', N'MV', CAST(N'2010-10-04 21:42:34.173' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (111, N'Mali', N'Republic of Mali', N'ML', CAST(N'2010-10-04 21:42:34.173' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (112, N'Malta', N'Republic of Malta', N'MT', CAST(N'2010-10-04 21:42:34.173' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (113, N'Marshall Islands', N'Republic of the Marshall Islands', N'RM', CAST(N'2010-10-04 21:42:34.173' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (114, N'Mauritania ', N'Islamic Republic of Mauritania', N'MR', CAST(N'2010-10-04 21:42:34.173' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (115, N'Mauritius ', N'Republic of Mauritius', N'MP', CAST(N'2010-10-04 21:42:34.173' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (116, N'Mexico ', N'United Mexican States', N'MX', CAST(N'2010-10-04 21:42:34.173' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (117, N'"Micronesia', N'Federated States of Micronesia', N'FM', CAST(N'2010-10-04 21:42:34.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (118, N'Moldova', N'Republic of Moldova', N'MD', CAST(N'2010-10-04 21:42:34.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (119, N'Monaco', N'Principality of Monaco', N'MN', CAST(N'2010-10-04 21:42:34.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (120, N'Mongolia', N'Mongolia', N'MG', CAST(N'2010-10-04 21:42:34.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (121, N'Montenegro', N'Montenegro', N'MJ', CAST(N'2010-10-04 21:42:34.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (122, N'Morocco', N'Kingdom of Morocco', N'MO', CAST(N'2010-10-04 21:42:34.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (123, N'Mozambique', N'Republic of Mozambique', N'MZ', CAST(N'2010-10-04 21:42:34.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (124, N'Namibia', N'Republic of Namibia', N'WA', CAST(N'2010-10-04 21:42:34.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (125, N'Nauru', N'Republic of Nauru', N'NR', CAST(N'2010-10-04 21:42:34.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (126, N'Nepal', N'Federal Democratic Republic of Nepal', N'NP', CAST(N'2010-10-04 21:42:34.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (127, N'Netherlands', N'Kingdom of the Netherlands', N'NL', CAST(N'2010-10-04 21:42:34.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (128, N'New Zealand', N'New Zealand', N'NZ', CAST(N'2010-10-04 21:42:34.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (129, N'Nicaragua', N'Republic of Nicaragua', N'NU', CAST(N'2010-10-04 21:42:34.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (130, N'Niger', N'Republic of Niger', N'NG', CAST(N'2010-10-04 21:42:34.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (131, N'Nigeria', N'Federal Republic of Nigeria', N'NI', CAST(N'2010-10-04 21:42:34.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (132, N'Norway', N'Kingdom of Norway', N'NO', CAST(N'2010-10-04 21:42:34.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (133, N'Oman', N'Sultanate of Oman', N'MU', CAST(N'2010-10-04 21:42:34.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (134, N'Pakistan', N'Islamic Republic of Pakistan', N'PK', CAST(N'2010-10-04 21:42:34.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (135, N'Palau', N'Republic of Palau', N'PS', CAST(N'2010-10-04 21:42:34.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (136, N'Panama', N'Republic of Panama', N'PM', CAST(N'2010-10-04 21:42:34.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (137, N'Papua New Guinea', N'Independent State of Papua New Guinea', N'PP', CAST(N'2010-10-04 21:42:34.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (138, N'Paraguay', N'Republic of Paraguay', N'PA', CAST(N'2010-10-04 21:42:34.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (139, N'Peru', N'Republic of Peru', N'PE', CAST(N'2010-10-04 21:42:34.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (140, N'Philippines', N'Republic of the Philippines', N'RP', CAST(N'2010-10-04 21:42:34.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (141, N'Poland', N'Republic of Poland', N'PL', CAST(N'2010-10-04 21:42:34.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (142, N'Portugal', N'Portuguese Republic', N'PO', CAST(N'2010-10-04 21:42:34.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (143, N'Qatar', N'State of Qatar', N'QA', CAST(N'2010-10-04 21:42:34.180' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (144, N'Romania', N'Romania', N'RO', CAST(N'2010-10-04 21:42:34.183' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (145, N'Russia', N'Russian Federation', N'RS', CAST(N'2010-10-04 21:42:34.183' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (146, N'Rwanda', N'Republic of Rwanda', N'RW', CAST(N'2010-10-04 21:42:34.183' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (147, N'Saint Kitts and Nevis ', N'Federation of Saint Kitts and Nevis', N'SC', CAST(N'2010-10-04 21:42:34.183' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (148, N'Saint Lucia ', N'Saint Lucia ', N'ST', CAST(N'2010-10-04 21:42:34.183' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (149, N'Saint Vincent and the Grenadines', N'Saint Vincent and the Grenadines', N'VC', CAST(N'2010-10-04 21:42:34.183' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (150, N'Samoa', N'Independent State of Samoa', N'WS', CAST(N'2010-10-04 21:42:34.183' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (151, N'San Marino', N'Republic of San Marino', N'SM', CAST(N'2010-10-04 21:42:34.183' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (152, N'Sao Tome and Principe', N'Democratic Republic of Sao Tome and Principe', N'TP', CAST(N'2010-10-04 21:42:34.183' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (153, N'Saudi Arabia', N'Kingdom of Saudi Arabia', N'SA', CAST(N'2010-10-04 21:42:34.183' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (154, N'Senegal', N'Republic of Senegal', N'SG', CAST(N'2010-10-04 21:42:34.183' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (155, N'Serbia', N'Republic of Serbia', N'RI', CAST(N'2010-10-04 21:42:34.183' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (156, N'Seychelles', N'Republic of Seychelles', N'SE', CAST(N'2010-10-04 21:42:34.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (157, N'Sierra Leone', N'Republic of Sierra Leone', N'SL', CAST(N'2010-10-04 21:42:34.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (158, N'Singapore', N'Republic of Singapore', N'SN', CAST(N'2010-10-04 21:42:34.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (159, N'Slovakia', N'Slovak Republic', N'LO', CAST(N'2010-10-04 21:42:34.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (160, N'Slovenia', N'Republic of Slovenia', N'SI', CAST(N'2010-10-04 21:42:34.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (161, N'Solomon Islands', N'Solomon Islands', N'BP', CAST(N'2010-10-04 21:42:34.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (162, N'Somalia', N'Somalia', N'SO', CAST(N'2010-10-04 21:42:34.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (163, N'South Africa', N'Republic of South Africa', N'SF', CAST(N'2010-10-04 21:42:34.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (164, N'Spain', N'Kingdom of Spain', N'SP', CAST(N'2010-10-04 21:42:34.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (165, N'Sri Lanka', N'Democratic Socialist Republic of Sri Lanka', N'CE', CAST(N'2010-10-04 21:42:34.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (166, N'Sudan', N'Republic of the Sudan', N'SU', CAST(N'2010-10-04 21:42:34.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (167, N'Suriname', N'Republic of Suriname', N'NS', CAST(N'2010-10-04 21:42:34.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (168, N'Swaziland', N'Kingdom of Swaziland', N'WZ', CAST(N'2010-10-04 21:42:34.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (169, N'Sweden', N'Kingdom of Sweden', N'SW', CAST(N'2010-10-04 21:42:34.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (170, N'Switzerland', N'Swiss Confederation', N'SZ', CAST(N'2010-10-04 21:42:34.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (171, N'Syria', N'Syrian Arab Republic', N'SY', CAST(N'2010-10-04 21:42:34.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (172, N'Tajikistan', N'Republic of Tajikistan', N'TI', CAST(N'2010-10-04 21:42:34.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (173, N'Tanzania', N'United Republic of Tanzania', N'TZ', CAST(N'2010-10-04 21:42:34.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (174, N'Thailand', N'Kingdom of Thailand', N'TH', CAST(N'2010-10-04 21:42:34.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (175, N'Timor-Leste', N'Democratic Republic of Timor-Leste', N'TT', CAST(N'2010-10-04 21:42:34.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (176, N'Togo', N'Togolese Republic', N'TO', CAST(N'2010-10-04 21:42:34.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (177, N'Tonga', N'Kingdom of Tonga', N'TN', CAST(N'2010-10-04 21:42:34.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (178, N'Trinidad and Tobago', N'Republic of Trinidad and Tobago', N'TD', CAST(N'2010-10-04 21:42:34.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (180, N'Tunisia', N'Tunisian Republic', N'TS', CAST(N'2010-10-04 21:42:34.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (181, N'Turkey', N'Republic of Turkey', N'TU', CAST(N'2010-10-04 21:42:34.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (182, N'Turkmenistan', N'Turkmenistan', N'TX', CAST(N'2010-10-04 21:42:34.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (183, N'Tuvalu', N'Tuvalu', N'TV', CAST(N'2010-10-04 21:42:34.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (184, N'Uganda', N'Republic of Uganda', N'UG', CAST(N'2010-10-04 21:42:34.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (185, N'Ukraine', N'Ukraine', N'UP', CAST(N'2010-10-04 21:42:34.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (186, N'United Arab Emirates', N'United Arab Emirates', N'AE', CAST(N'2010-10-04 21:42:34.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (187, N'United Kingdom', N'United Kingdom of Great Britain and Northern Ireland', N'UK', CAST(N'2010-10-04 21:42:34.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (188, N'United States', N'United States of America', N'US', CAST(N'2010-10-04 21:42:34.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (189, N'Uruguay', N'Oriental Republic of Uruguay', N'UY', CAST(N'2010-10-04 21:42:34.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (190, N'Uzbekistan', N'Republic of Uzbekistan', N'UZ', CAST(N'2010-10-04 21:42:34.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (191, N'Vanuatu', N'Republic of Vanuatu', N'NH', CAST(N'2010-10-04 21:42:34.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (192, N'Venezuela', N'Bolivarian Republic of Venezuela', N'VE', CAST(N'2010-10-04 21:42:34.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCountryOfOrigin] ([CountryID], [CountryAbbreviation], [CountryName], [FIPSCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (195, N'NA', N'NA', N'NA', CAST(N'2021-09-17 00:00:00.000' AS DateTime), N'ATG', NULL)
SET IDENTITY_INSERT [Person].[LUCountryOfOrigin] OFF
SET IDENTITY_INSERT [Person].[LUCounty] ON 

INSERT [Person].[LUCounty] ([CountyID], [CityID], [StateID], [CountyName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (1, 0, 45, N'Addison', CAST(N'2010-10-05 17:33:39.327' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCounty] ([CountyID], [CityID], [StateID], [CountyName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (2, 0, 45, N'Bennington', CAST(N'2010-10-05 17:33:39.327' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCounty] ([CountyID], [CityID], [StateID], [CountyName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (3, 0, 45, N'Caledonia', CAST(N'2010-10-05 17:33:39.327' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCounty] ([CountyID], [CityID], [StateID], [CountyName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (4, 0, 45, N'Chittenden', CAST(N'2010-10-05 17:33:39.327' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCounty] ([CountyID], [CityID], [StateID], [CountyName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (5, 0, 45, N'Essex', CAST(N'2010-10-05 17:33:39.327' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCounty] ([CountyID], [CityID], [StateID], [CountyName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (6, 0, 45, N'Franklin', CAST(N'2010-10-05 17:33:39.327' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCounty] ([CountyID], [CityID], [StateID], [CountyName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (7, 0, 45, N'GrandIsle', CAST(N'2010-10-05 17:33:39.327' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCounty] ([CountyID], [CityID], [StateID], [CountyName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (8, 0, 45, N'Lamoille', CAST(N'2010-10-05 17:33:39.327' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCounty] ([CountyID], [CityID], [StateID], [CountyName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (9, 0, 45, N'Orange', CAST(N'2010-10-05 17:33:39.327' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCounty] ([CountyID], [CityID], [StateID], [CountyName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (10, 0, 45, N'Orleans', CAST(N'2010-10-05 17:33:39.327' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCounty] ([CountyID], [CityID], [StateID], [CountyName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (11, 0, 45, N'Rutland', CAST(N'2010-10-05 17:33:39.327' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCounty] ([CountyID], [CityID], [StateID], [CountyName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (12, 0, 45, N'Washington', CAST(N'2010-10-05 17:33:39.330' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCounty] ([CountyID], [CityID], [StateID], [CountyName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (13, 0, 45, N'Windham', CAST(N'2010-10-05 17:33:39.330' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUCounty] ([CountyID], [CityID], [StateID], [CountyName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (14, 0, 45, N'Windsor', CAST(N'2010-10-05 17:33:39.330' AS DateTime), N'SSE', NULL)
SET IDENTITY_INSERT [Person].[LUCounty] OFF
SET IDENTITY_INSERT [Person].[LUEducationCategory] ON 

INSERT [Person].[LUEducationCategory] ([EducationCategoryID], [EducationLevel], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (6, N'Grade School', CAST(N'2011-03-14 16:01:53.630' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUEducationCategory] ([EducationCategoryID], [EducationLevel], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (7, N'Some High School', CAST(N'2011-03-14 16:01:53.640' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUEducationCategory] ([EducationCategoryID], [EducationLevel], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'High School Completed or GED', CAST(N'2011-03-14 16:01:53.647' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUEducationCategory] ([EducationCategoryID], [EducationLevel], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (9, N'Some College', CAST(N'2011-03-14 16:01:53.657' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUEducationCategory] ([EducationCategoryID], [EducationLevel], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (10, N'Associates Degree', CAST(N'2011-03-14 16:01:53.667' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUEducationCategory] ([EducationCategoryID], [EducationLevel], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (11, N'College Degree', CAST(N'2011-03-14 16:01:53.673' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUEducationCategory] ([EducationCategoryID], [EducationLevel], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (12, N'Technical School', CAST(N'2011-03-14 16:01:53.683' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUEducationCategory] ([EducationCategoryID], [EducationLevel], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (13, N'Work related training with certificate', CAST(N'2011-03-14 16:01:53.690' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUEducationCategory] ([EducationCategoryID], [EducationLevel], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (14, N'None Stated', CAST(N'2021-09-18 00:00:00.000' AS DateTime), N'ATG', NULL)
SET IDENTITY_INSERT [Person].[LUEducationCategory] OFF
SET IDENTITY_INSERT [Person].[LUEthnicity] ON 

INSERT [Person].[LUEthnicity] ([EthnicityID], [EthnicityAbbreviation], [EthnicityDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'Hispanic or Latino', N'Hispanic or Latino', CAST(N'2011-03-14 16:47:15.833' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUEthnicity] ([EthnicityID], [EthnicityAbbreviation], [EthnicityDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (3, N'Not Reported', N'Not Reported', CAST(N'2011-03-14 16:47:15.843' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUEthnicity] ([EthnicityID], [EthnicityAbbreviation], [EthnicityDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (7, N'Not Hispanic/Latino', N'Not Hispanic/Latino', CAST(N'2011-03-04 12:00:00.000' AS DateTime), N'SSE', NULL)
SET IDENTITY_INSERT [Person].[LUEthnicity] OFF
SET IDENTITY_INSERT [Person].[LUFamilyRelationship] ON 

INSERT [Person].[LUFamilyRelationship] ([FamilyRelationshipID], [RelationshipCode], [RelationshipDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (35, N'Head of household', N'Head of household', CAST(N'2011-03-14 16:08:36.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUFamilyRelationship] ([FamilyRelationshipID], [RelationshipCode], [RelationshipDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (36, N'Spouse', N'Spouse', CAST(N'2011-03-14 16:08:36.177' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUFamilyRelationship] ([FamilyRelationshipID], [RelationshipCode], [RelationshipDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (37, N'Child', N'Child', CAST(N'2011-03-14 16:08:36.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUFamilyRelationship] ([FamilyRelationshipID], [RelationshipCode], [RelationshipDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (38, N'Parent', N'Parent', CAST(N'2011-03-14 16:08:36.193' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUFamilyRelationship] ([FamilyRelationshipID], [RelationshipCode], [RelationshipDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (39, N'Other', N'Other', CAST(N'2011-03-14 16:08:36.203' AS DateTime), N'SSE', NULL)
SET IDENTITY_INSERT [Person].[LUFamilyRelationship] OFF
SET IDENTITY_INSERT [Person].[LUFamilyStatusType] ON 

INSERT [Person].[LUFamilyStatusType] ([FamilyStatusTypeID], [FamilyStatusType], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1, N'Single Person', N'SSE', CAST(N'2011-03-14 16:16:17.893' AS DateTime), NULL)
INSERT [Person].[LUFamilyStatusType] ([FamilyStatusTypeID], [FamilyStatusType], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (2, N'Single Parent', N'SSE', CAST(N'2011-03-14 16:16:17.907' AS DateTime), NULL)
INSERT [Person].[LUFamilyStatusType] ([FamilyStatusTypeID], [FamilyStatusType], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (3, N'Two Parent', N'SSE', CAST(N'2011-03-14 16:16:17.913' AS DateTime), NULL)
INSERT [Person].[LUFamilyStatusType] ([FamilyStatusTypeID], [FamilyStatusType], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (4, N'Two Adult/Couple', N'SSE', CAST(N'2011-03-14 16:16:17.920' AS DateTime), NULL)
INSERT [Person].[LUFamilyStatusType] ([FamilyStatusTypeID], [FamilyStatusType], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (5, N'Other', N'SSE', CAST(N'2011-03-14 16:16:17.930' AS DateTime), NULL)
INSERT [Person].[LUFamilyStatusType] ([FamilyStatusTypeID], [FamilyStatusType], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (6, N'Not Reported', N'ATG', CAST(N'2021-09-18 00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [Person].[LUFamilyStatusType] OFF
SET IDENTITY_INSERT [Person].[LUHousingStatus] ON 

INSERT [Person].[LUHousingStatus] ([HousingStatusID], [HousingStatus], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'Rent', CAST(N'2010-11-01 20:08:50.197' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUHousingStatus] ([HousingStatusID], [HousingStatus], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'Own', CAST(N'2010-11-01 20:08:57.473' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUHousingStatus] ([HousingStatusID], [HousingStatus], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (3, N'Homeless', CAST(N'2010-11-01 20:09:03.017' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUHousingStatus] ([HousingStatusID], [HousingStatus], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'Homeless w/Roof', CAST(N'2010-11-01 20:09:13.607' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUHousingStatus] ([HousingStatusID], [HousingStatus], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (5, N'Boarder', CAST(N'2010-11-01 20:09:27.713' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUHousingStatus] ([HousingStatusID], [HousingStatus], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (6, N'Other', CAST(N'2010-11-01 20:09:35.257' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUHousingStatus] ([HousingStatusID], [HousingStatus], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (7, N'Not Reported', CAST(N'2021-09-18 11:31:37.523' AS DateTime), N'ATG', NULL)
SET IDENTITY_INSERT [Person].[LUHousingStatus] OFF
SET IDENTITY_INSERT [Person].[LUIncomeSource] ON 

INSERT [Person].[LUIncomeSource] ([IncomeSourceID], [IncomeSourceAbbreviation], [IncomeSourceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'Unemployed', N'Unemployed', CAST(N'2010-12-07 15:23:15.313' AS DateTime), N'DanJohnston', NULL)
INSERT [Person].[LUIncomeSource] ([IncomeSourceID], [IncomeSourceAbbreviation], [IncomeSourceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'Part-time', N'Part-time', CAST(N'2010-12-07 15:23:15.313' AS DateTime), N'DanJohnston', NULL)
INSERT [Person].[LUIncomeSource] ([IncomeSourceID], [IncomeSourceAbbreviation], [IncomeSourceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (3, N'Full-time', N'Full-time', CAST(N'2010-12-07 15:23:15.313' AS DateTime), N'DanJohnston', NULL)
INSERT [Person].[LUIncomeSource] ([IncomeSourceID], [IncomeSourceAbbreviation], [IncomeSourceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'Self-Emp', N'Self-Employed', CAST(N'2010-12-07 15:26:15.963' AS DateTime), N'DanJohnston', NULL)
INSERT [Person].[LUIncomeSource] ([IncomeSourceID], [IncomeSourceAbbreviation], [IncomeSourceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (6, N'SSI/Disab.', N'SSI/Disability', CAST(N'2011-05-18 14:51:03.360' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUIncomeSource] ([IncomeSourceID], [IncomeSourceAbbreviation], [IncomeSourceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (7, N'Other', N'Other', CAST(N'2011-05-18 14:59:17.850' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUIncomeSource] ([IncomeSourceID], [IncomeSourceAbbreviation], [IncomeSourceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'Soc Sec', N'Social Security', CAST(N'2011-07-21 16:25:25.803' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUIncomeSource] ([IncomeSourceID], [IncomeSourceAbbreviation], [IncomeSourceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (9, N'Gen Assist', N'General Assistance', CAST(N'2011-07-21 16:25:25.850' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUIncomeSource] ([IncomeSourceID], [IncomeSourceAbbreviation], [IncomeSourceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (10, N'TANF', N'Temporary Assistance for Needy Families', CAST(N'2011-07-21 16:25:25.860' AS DateTime), N'SSE', NULL)
SET IDENTITY_INSERT [Person].[LUIncomeSource] OFF
SET IDENTITY_INSERT [Person].[LUInsuranceType] ON 

INSERT [Person].[LUInsuranceType] ([InsuranceTypeID], [InsuranceType], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (2, N'State/Federal', N'SSE', CAST(N'2011-03-14 15:52:48.137' AS DateTime), NULL)
INSERT [Person].[LUInsuranceType] ([InsuranceTypeID], [InsuranceType], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (3, N'From Employer', N'SSE', CAST(N'2011-03-14 15:53:06.940' AS DateTime), NULL)
INSERT [Person].[LUInsuranceType] ([InsuranceTypeID], [InsuranceType], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (4, N'Self Insured', N'SSE', CAST(N'2011-03-14 15:53:22.957' AS DateTime), NULL)
INSERT [Person].[LUInsuranceType] ([InsuranceTypeID], [InsuranceType], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (5, N'Veteran', N'SSE', CAST(N'2011-03-14 15:53:38.783' AS DateTime), NULL)
INSERT [Person].[LUInsuranceType] ([InsuranceTypeID], [InsuranceType], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (6, N'Did not specify', N'SSE', CAST(N'2011-03-14 15:54:02.637' AS DateTime), NULL)
INSERT [Person].[LUInsuranceType] ([InsuranceTypeID], [InsuranceType], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (7, N'None', N'SSE', CAST(N'2011-03-17 16:05:56.347' AS DateTime), NULL)
SET IDENTITY_INSERT [Person].[LUInsuranceType] OFF
SET IDENTITY_INSERT [Person].[LULanguage] ON 

INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'Chinese, Mandarin', CAST(N'2010-10-15 20:35:20.733' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'English', CAST(N'2010-10-15 20:35:20.733' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (3, N'Spanish', CAST(N'2010-10-15 20:35:20.733' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'Arabic', CAST(N'2010-10-15 20:35:20.733' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (5, N'Bengali', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (6, N'Hindi', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (7, N'Russian', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'Portuguese', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (9, N'Japanese', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (10, N'German', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (11, N'Chinese, Wu', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (12, N'Javanese', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (13, N'Korean', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (14, N'French', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (15, N'Turkish', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (16, N'Vietnamese', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (17, N'Telugu', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (18, N'Chinese,Yue(Cantonese)', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (19, N'Marathi', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (20, N'Tamil', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (21, N'Italian', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (22, N'Urdu', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (23, N'Chinese, Min Nan', CAST(N'2010-10-15 20:35:20.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (24, N'Chinese, Jinyu', CAST(N'2010-10-15 20:35:20.740' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (25, N'Gujarati', CAST(N'2010-10-15 20:35:20.740' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (26, N'Polish', CAST(N'2010-10-15 20:35:20.740' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (27, N'Ukrainian', CAST(N'2010-10-15 20:35:20.740' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (28, N'Persian', CAST(N'2010-10-15 20:35:20.740' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (29, N'Chinese, Xiang', CAST(N'2010-10-15 20:35:20.740' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (30, N'Malayalam', CAST(N'2010-10-15 20:35:20.740' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (31, N'Chinese, Hakka', CAST(N'2010-10-15 20:35:20.740' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (32, N'Kannada', CAST(N'2010-10-15 20:35:20.740' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (33, N'Oriya', CAST(N'2010-10-15 20:35:20.740' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (34, N'Panjabi, Western', CAST(N'2010-10-15 20:35:20.740' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (35, N'Sunda', CAST(N'2010-10-15 20:35:20.740' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (36, N'Panjabi, Eastern', CAST(N'2010-10-15 20:35:20.743' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (37, N'Romanian', CAST(N'2010-10-15 20:35:20.743' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (38, N'Bhojpuri', CAST(N'2010-10-15 20:35:20.743' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (39, N'Azerbaijani, South', CAST(N'2010-10-15 20:35:20.743' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (40, N'Maithili', CAST(N'2010-10-15 20:35:20.743' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (41, N'Hausa', CAST(N'2010-10-15 20:35:20.743' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (42, N'Burmese', CAST(N'2010-10-15 20:35:20.743' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (43, N'Serbo-Croatian', CAST(N'2010-10-15 20:35:20.743' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (44, N'Chinese, Gan', CAST(N'2010-10-15 20:35:20.743' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (45, N'Awadhi', CAST(N'2010-10-15 20:35:20.743' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (46, N'Thai', CAST(N'2010-10-15 20:35:20.743' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (47, N'Dutch', CAST(N'2010-10-15 20:35:20.743' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (48, N'Yoruba', CAST(N'2010-10-15 20:35:20.743' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (49, N'Sindhi', CAST(N'2010-10-15 20:35:20.743' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (50, N'Swahili', CAST(N'2010-10-15 20:35:20.743' AS DateTime), N'SSE', NULL)
INSERT [Person].[LULanguage] ([LanguageID], [LanguageName], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (51, N'Hebrew', CAST(N'2010-10-15 20:35:20.747' AS DateTime), N'SSE', NULL)
SET IDENTITY_INSERT [Person].[LULanguage] OFF
SET IDENTITY_INSERT [Person].[LUPersonType] ON 

INSERT [Person].[LUPersonType] ([PersonTypeID], [PersonType], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'Employee  ', CAST(N'2010-10-05 15:27:44.893' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPersonType] ([PersonTypeID], [PersonType], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'Volunteer ', CAST(N'2010-10-05 15:27:44.893' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPersonType] ([PersonTypeID], [PersonType], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (3, N'Client    ', CAST(N'2010-10-05 15:27:44.897' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPersonType] ([PersonTypeID], [PersonType], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'Donor     ', CAST(N'2010-10-05 15:27:44.897' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPersonType] ([PersonTypeID], [PersonType], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (5, N'Other     ', CAST(N'2010-10-05 15:27:44.897' AS DateTime), N'SSE', NULL)
SET IDENTITY_INSERT [Person].[LUPersonType] OFF
SET IDENTITY_INSERT [Person].[LUPhoneType] ON 

INSERT [Person].[LUPhoneType] ([PhoneTypeID], [PhoneType], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'Home      ', CAST(N'2010-10-05 18:46:04.063' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPhoneType] ([PhoneTypeID], [PhoneType], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'Work      ', CAST(N'2010-10-05 18:46:04.067' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPhoneType] ([PhoneTypeID], [PhoneType], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (3, N'Cell      ', CAST(N'2010-10-05 18:46:04.067' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPhoneType] ([PhoneTypeID], [PhoneType], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'Sattelite ', CAST(N'2010-10-05 18:46:04.067' AS DateTime), N'SSE', NULL)
SET IDENTITY_INSERT [Person].[LUPhoneType] OFF
SET IDENTITY_INSERT [Person].[LUPostalCode] ON 

INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (1, 245, N'05491      ', CAST(N'2010-10-06 19:06:47.820' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (2, 394, N'05820      ', CAST(N'2010-10-06 19:08:44.057' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (3, 394, N'05845      ', CAST(N'2010-10-06 19:09:00.687' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (4, 344, N'05440      ', CAST(N'2010-10-06 19:09:19.360' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (5, 466, N'05143      ', CAST(N'2010-10-06 19:09:45.060' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (6, 443, N'05143      ', CAST(N'2010-10-06 19:10:11.187' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (7, 314, N'05901      ', CAST(N'2010-10-06 19:10:29.303' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (8, 330, N'05441      ', CAST(N'2010-10-06 19:10:55.547' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (9, 467, N'05143      ', CAST(N'2010-10-06 19:11:19.780' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (10, 468, N'05031      ', CAST(N'2010-10-06 19:11:38.163' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (11, 281, N'05821      ', CAST(N'2010-10-06 19:11:56.723' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (12, 424, N'05641      ', CAST(N'2010-10-06 19:12:19.897' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (13, 424, N'05649      ', CAST(N'2010-10-06 19:13:00.967' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (14, 424, N'05670      ', CAST(N'2010-10-06 19:13:22.013' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (15, 423, N'05670      ', CAST(N'2010-10-06 19:13:28.070' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (16, 393, N'05822      ', CAST(N'2010-10-06 19:14:08.117' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (17, 393, N'05839      ', CAST(N'2010-10-06 19:14:17.780' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (18, 393, N'05875      ', CAST(N'2010-10-06 19:14:23.770' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (19, 349, N'05442      ', CAST(N'2010-10-06 19:14:42.280' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (20, 349, N'05492      ', CAST(N'2010-10-06 19:14:49.313' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (21, 422, N'05731      ', CAST(N'2010-10-06 19:15:13.473' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (22, 422, N'05743      ', CAST(N'2010-10-06 19:15:21.017' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (23, 331, N'05447      ', CAST(N'2010-10-06 19:15:48.127' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (24, 331, N'05450      ', CAST(N'2010-10-06 19:15:58.293' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (25, 425, N'05602      ', CAST(N'2010-10-06 19:16:18.340' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (26, 425, N'05641      ', CAST(N'2010-10-06 19:16:26.133' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (28, 469, N'05032      ', CAST(N'2010-10-06 19:17:46.623' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (29, 315, N'05905      ', CAST(N'2010-10-06 19:18:16.767' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (30, 298, N'05676      ', CAST(N'2010-10-06 19:18:36.087' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (31, 298, N'05477      ', CAST(N'2010-10-06 19:18:43.793' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (32, 359, N'05033      ', CAST(N'2010-10-06 19:19:04.210' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (33, 360, N'05060      ', CAST(N'2010-10-06 19:19:27.353' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (34, 421, N'05733      ', CAST(N'2010-10-06 19:19:46.960' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (35, 444, N'05301      ', CAST(N'2010-10-06 19:20:07.400' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (36, 444, N'05302      ', CAST(N'2010-10-06 19:20:10.560' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (37, 444, N'05303      ', CAST(N'2010-10-06 19:20:12.760' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (38, 444, N'05304      ', CAST(N'2010-10-06 19:20:14.767' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (39, 246, N'05734      ', CAST(N'2010-10-06 19:20:44.377' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (40, 470, N'05034      ', CAST(N'2010-10-06 19:21:03.270' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (41, 470, N'05035      ', CAST(N'2010-10-06 19:21:06.460' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (42, 316, N'05846      ', CAST(N'2010-10-06 19:21:28.827' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (43, 247, N'05443      ', CAST(N'2010-10-06 19:21:50.713' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (44, 361, N'05036      ', CAST(N'2010-10-06 19:22:15.587' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (45, 445, N'05345      ', CAST(N'2010-10-06 19:22:34.767' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (46, 392, N'05860      ', CAST(N'2010-10-06 19:22:52.590' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (47, 317, N'05905      ', CAST(N'2010-10-06 19:23:10.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (48, 282, N'05871      ', CAST(N'2010-10-06 19:23:32.223' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (49, 282, N'05832      ', CAST(N'2010-10-06 19:23:39.580' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (50, 299, N'05401      ', CAST(N'2010-10-06 19:23:58.363' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (51, 299, N'05402      ', CAST(N'2010-10-06 19:24:02.297' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (53, 299, N'05405      ', CAST(N'2010-10-06 19:24:08.467' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (54, 299, N'05406      ', CAST(N'2010-10-06 19:24:13.857' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (55, 299, N'05407      ', CAST(N'2010-10-06 19:24:15.663' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (56, 299, N'05408      ', CAST(N'2010-10-06 19:24:18.087' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (57, 426, N'05647      ', CAST(N'2010-10-06 19:24:39.030' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (58, 427, N'05648      ', CAST(N'2010-10-06 19:24:55.807' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (59, 350, N'05444      ', CAST(N'2010-10-06 19:25:13.007' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (60, 318, N'05901      ', CAST(N'2010-10-06 19:25:39.507' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (61, 318, N'05903      ', CAST(N'2010-10-06 19:25:42.887' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (62, 420, N'05735      ', CAST(N'2010-10-06 19:26:05.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (63, 471, N'05142      ', CAST(N'2010-10-06 19:26:22.170' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (64, 391, N'05872      ', CAST(N'2010-10-06 19:26:42.727' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (65, 300, N'05445      ', CAST(N'2010-10-06 19:26:55.943' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (66, 362, N'05038      ', CAST(N'2010-10-06 19:27:11.977' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (67, 472, N'05143      ', CAST(N'2010-10-06 19:27:29.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (68, 472, N'05144      ', CAST(N'2010-10-06 19:27:31.897' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (69, 419, N'05252      ', CAST(N'2010-10-06 19:27:57.197' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (70, 419, N'05737      ', CAST(N'2010-10-06 19:28:08.037' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (71, 418, N'05759      ', CAST(N'2010-10-06 19:28:22.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (72, 418, N'05777      ', CAST(N'2010-10-06 19:28:29.410' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (73, 301, N'05439      ', CAST(N'2010-10-06 19:29:28.270' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (74, 301, N'05446      ', CAST(N'2010-10-06 19:29:37.547' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (75, 301, N'05449      ', CAST(N'2010-10-06 19:29:45.617' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (76, 319, N'05824      ', CAST(N'2010-10-06 19:30:01.767' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (77, 363, N'05039', CAST(N'2010-10-06 19:30:19.067' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (78, 248, N'05753      ', CAST(N'2010-10-06 19:30:48.897' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (79, 390, N'05825      ', CAST(N'2010-10-06 19:31:03.557' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (80, 389, N'05826      ', CAST(N'2010-10-06 19:31:21.480' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (81, 389, N'05827      ', CAST(N'2010-10-06 19:31:24.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (82, 417, N'05739      ', CAST(N'2010-10-06 19:31:59.637' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (83, 283, N'05828      ', CAST(N'2010-10-06 19:32:25.003' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (84, 388, N'05829      ', CAST(N'2010-10-06 19:32:42.767' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (85, 388, N'05830      ', CAST(N'2010-10-06 19:32:46.653' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (86, 446, N'05341      ', CAST(N'2010-10-06 19:34:11.297' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (87, 446, N'05356      ', CAST(N'2010-10-06 19:34:20.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (88, 447, N'05301      ', CAST(N'2010-10-06 19:34:46.503' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (89, 428, N'05676      ', CAST(N'2010-10-06 19:35:08.357' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (90, 320, N'05837      ', CAST(N'2010-10-06 19:35:48.813' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (91, 429, N'05651      ', CAST(N'2010-10-06 19:36:13.273' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (92, 429, N'05602      ', CAST(N'2010-10-06 19:36:23.977' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (93, 351, N'05652      ', CAST(N'2010-10-06 19:36:50.113' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (94, 351, N'05653      ', CAST(N'2010-10-06 19:36:53.127' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (95, 352, N'05657      ', CAST(N'2010-10-06 19:37:14.073' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (96, 332, N'05450      ', CAST(N'2010-10-06 19:37:31.147' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (97, 302, N'05451      ', CAST(N'2010-10-06 19:37:44.367' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (98, 302, N'05452      ', CAST(N'2010-10-06 19:38:03.600' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (99, 302, N'05452      ', CAST(N'2010-10-06 19:38:04.347' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (100, 490, N'05451      ', CAST(N'2010-10-06 19:38:25.903' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (101, 490, N'05452      ', CAST(N'2010-10-06 19:38:28.603' AS DateTime), N'SSE', NULL)
GO
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (102, 490, N'05453      ', CAST(N'2010-10-06 19:38:31.233' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (103, 416, N'05743      ', CAST(N'2010-10-06 19:38:47.030' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (104, 333, N'05454      ', CAST(N'2010-10-06 19:39:05.443' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (105, 334, N'05455      ', CAST(N'2010-10-06 19:39:21.607' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (106, 334, N'05483      ', CAST(N'2010-10-06 19:39:30.057' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (107, 364, N'05045      ', CAST(N'2010-10-06 19:39:48.613' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (108, 430, N'05673      ', CAST(N'2010-10-06 19:40:07.143' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (109, 321, N'05905      ', CAST(N'2010-10-06 19:40:24.017' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (110, 249, N'05456      ', CAST(N'2010-10-06 19:40:41.487' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (111, 335, N'05444      ', CAST(N'2010-10-06 19:40:55.943' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (112, 336, N'05457      ', CAST(N'2010-10-06 19:41:22.870' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (113, 337, N'05454      ', CAST(N'2010-10-06 19:41:40.263' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (114, 337, N'05468      ', CAST(N'2010-10-06 19:41:47.143' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (115, 337, N'05478      ', CAST(N'2010-10-06 19:41:52.827' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (116, 267, N'0         ', CAST(N'2010-10-06 19:43:29.623' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (117, 387, N'05839      ', CAST(N'2010-10-06 19:44:10.957' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (118, 250, N'05733      ', CAST(N'2010-10-06 19:44:25.687' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (119, 448, N'05146      ', CAST(N'2010-10-06 19:44:43.547' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (120, 332, N'05840      ', CAST(N'2010-10-06 19:45:03.207' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (121, 332, N'05858      ', CAST(N'2010-10-06 19:45:11.657' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (122, 345, N'05458      ', CAST(N'2010-10-06 19:45:28.680' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (123, 251, N'05747      ', CAST(N'2010-10-06 19:45:46.393' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (124, 386, N'05841      ', CAST(N'2010-10-06 19:46:07.020' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (125, 386, N'05842      ', CAST(N'2010-10-06 19:46:16.610' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (126, 284, N'05046      ', CAST(N'2010-10-06 19:46:39.043' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (127, 323, N'05905      ', CAST(N'2010-10-06 19:46:54.923' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (128, 449, N'05301      ', CAST(N'2010-10-06 19:47:17.343' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (129, 450, N'05358      ', CAST(N'2010-10-06 19:47:34.560' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (130, 252, N'05748      ', CAST(N'2010-10-06 19:47:52.233' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (131, 285, N'05843      ', CAST(N'2010-10-06 19:48:08.417' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (132, 473, N'05047      ', CAST(N'2010-10-06 19:48:31.483' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (133, 474, N'05048      ', CAST(N'2010-10-06 19:48:46.927' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (134, 474, N'05049      ', CAST(N'2010-10-06 19:48:49.580' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (135, 338, N'05459      ', CAST(N'2010-10-06 19:49:14.490' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (136, 338, N'05460      ', CAST(N'2010-10-06 19:49:23.860' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (137, 303, N'05461      ', CAST(N'2010-10-06 19:49:40.773' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (138, 385, N'05830      ', CAST(N'2010-10-06 19:50:01.130' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (139, 415, N'05735      ', CAST(N'2010-10-06 19:50:18.233' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (140, 304, N'05462      ', CAST(N'2010-10-06 19:50:45.047' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (141, 353, N'05655      ', CAST(N'2010-10-06 19:51:03.270' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (142, 414, N'05777      ', CAST(N'2010-10-06 19:51:22.277' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (143, 384, N'05845      ', CAST(N'2010-10-06 19:51:39.643' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (144, 346, N'05463      ', CAST(N'2010-10-06 19:51:57.197' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (145, 451, N'05343      ', CAST(N'2010-10-06 19:52:16.697' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (146, 383, N'05859      ', CAST(N'2010-10-06 19:52:34.713' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (147, 305, N'05465      ', CAST(N'2010-10-06 19:52:58.013' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (148, 354, N'05656      ', CAST(N'2010-10-06 19:53:13.857' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (149, 413, N'05751      ', CAST(N'2010-10-06 19:53:35.277' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (150, 286, N'05824      ', CAST(N'2010-10-06 19:53:51.037' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (151, 268, N'05148      ', CAST(N'2010-10-06 19:54:12.793' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (152, 253, N'05733      ', CAST(N'2010-10-06 19:54:27.380' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (153, 324, N'05903      ', CAST(N'2010-10-06 19:54:47.590' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (154, 324, N'05905      ', CAST(N'2010-10-06 19:54:50.127' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (155, 325, N'0         ', CAST(N'2010-10-06 19:55:21.470' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (156, 254, N'05443      ', CAST(N'2010-10-06 19:55:49.123' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (157, 452, N'05148      ', CAST(N'2010-10-06 19:56:08.483' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (158, 382, N'05847      ', CAST(N'2010-10-06 19:56:24.360' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (159, 475, N'05149      ', CAST(N'2010-10-06 19:56:38.930' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (160, 326, N'05906      ', CAST(N'2010-10-06 19:56:56.207' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (161, 287, N'05849      ', CAST(N'2010-10-06 19:57:22.867' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (162, 287, N'05850      ', CAST(N'2010-10-06 19:57:27.967' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (163, 327, N'05905      ', CAST(N'2010-10-06 19:57:54.557' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (164, 269, N'05254      ', CAST(N'2010-10-06 19:58:18.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (165, 269, N'05255      ', CAST(N'2010-10-06 19:58:20.830' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (166, 453, N'05344      ', CAST(N'2010-10-06 19:58:37.660' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (167, 431, N'05658      ', CAST(N'2010-10-06 19:58:55.890' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (168, 412, N'05701      ', CAST(N'2010-10-06 19:59:15.593' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (169, 255, N'05753      ', CAST(N'2010-10-06 19:59:30.833' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (170, 432, N'05602      ', CAST(N'2010-10-06 19:59:49.113' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (171, 411, N'05143      ', CAST(N'2010-10-06 20:00:17.470' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (172, 411, N'05757      ', CAST(N'2010-10-06 20:00:31.923' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (173, 306, N'05468      ', CAST(N'2010-10-06 20:00:49.460' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (174, 256, N'05469      ', CAST(N'2010-10-06 20:01:11.703' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (175, 256, N'05473      ', CAST(N'2010-10-06 20:01:18.027' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (176, 339, N'05470      ', CAST(N'2010-10-06 20:01:45.377' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (177, 339, N'05471      ', CAST(N'2010-10-06 20:01:47.863' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (178, 438, N'05601      ', CAST(N'2010-10-06 20:02:05.857' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (179, 438, N'05602      ', CAST(N'2010-10-06 20:02:08.767' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (180, 438, N'05603      ', CAST(N'2010-10-06 20:02:17.087' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (181, 438, N'05604      ', CAST(N'2010-10-06 20:02:23.560' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (182, 438, N'05609      ', CAST(N'2010-10-06 20:02:25.500' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (183, 438, N'05620      ', CAST(N'2010-10-06 20:02:31.197' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (184, 438, N'05633      ', CAST(N'2010-10-06 20:02:40.630' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (185, 433, N'05660      ', CAST(N'2010-10-06 20:02:56.733' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (186, 381, N'05853      ', CAST(N'2010-10-06 20:03:15.110' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (187, 355, N'05661      ', CAST(N'2010-10-06 20:03:28.820' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (188, 409, N'05739      ', CAST(N'2010-10-06 20:03:49.760' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (189, 410, N'05758      ', CAST(N'2010-10-06 20:04:04.317' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (190, 257, N'05472      ', CAST(N'2010-10-06 20:04:23.633' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (191, 288, N'05871      ', CAST(N'2010-10-06 20:04:45.397' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (192, 365, N'05051      ', CAST(N'2010-10-06 20:05:05.747' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (193, 365, N'05069      ', CAST(N'2010-10-06 20:05:14.887' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (194, 454, N'05345      ', CAST(N'2010-10-06 20:05:33.100' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (195, 380, N'05855      ', CAST(N'2010-10-06 20:05:56.490' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (196, 379, N'05855      ', CAST(N'2010-10-06 20:06:11.240' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (197, 347, N'05474      ', CAST(N'2010-10-06 20:06:26.107' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (198, 434, N'05663      ', CAST(N'2010-10-06 20:06:51.040' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (199, 434, N'05664      ', CAST(N'2010-10-06 20:06:56.460' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (200, 328, N'05907      ', CAST(N'2010-10-06 20:07:12.670' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (201, 476, N'05055      ', CAST(N'2010-10-06 20:07:28.220' AS DateTime), N'SSE', NULL)
GO
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (202, 366, N'05641      ', CAST(N'2010-10-06 20:07:42.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (203, 258, N'05760     ', CAST(N'2010-10-06 20:09:58.377' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (204, 259, N'05491     ', CAST(N'2010-10-06 20:10:17.687' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (205, 408, N'05761     ', CAST(N'2010-10-06 20:10:35.903' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (206, 289, N'05862     ', CAST(N'2010-10-06 20:12:01.353' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (207, 270, N'05152     ', CAST(N'2010-10-06 20:12:19.233' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (208, 407, N'05762     ', CAST(N'2010-10-06 20:12:37.760' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (209, 406, N'05763     ', CAST(N'2010-10-06 20:12:55.370' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (210, 435, N'05650     ', CAST(N'2010-10-06 20:13:16.720' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (211, 435, N'05667     ', CAST(N'2010-10-06 20:13:24.030' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (212, 477, N'05056     ', CAST(N'2010-10-06 20:13:52.397' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (213, 478, N'05053     ', CAST(N'2010-10-06 20:14:30.100' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (214, 407, N'05741     ', CAST(N'2010-10-06 20:14:49.513' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (215, 407, N'05764     ', CAST(N'2010-10-06 20:14:55.487' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (216, 405, N'05764     ', CAST(N'2010-10-06 20:16:54.830' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (217, 405, N'05741     ', CAST(N'2010-10-06 20:17:00.857' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (218, 271, N'05261     ', CAST(N'2010-10-06 20:17:20.087' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (219, 404, N'05765     ', CAST(N'2010-10-06 20:17:34.280' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (220, 455, N'05346     ', CAST(N'2010-10-06 20:17:49.610' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (221, 367, N'05060     ', CAST(N'2010-10-06 20:18:07.383' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (222, 367, N'05061     ', CAST(N'2010-10-06 20:18:10.127' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (223, 479, N'05062     ', CAST(N'2010-10-06 20:18:29.293' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (224, 272, N'05350     ', CAST(N'2010-10-06 20:18:50.050' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (225, 272, N'05352     ', CAST(N'2010-10-06 20:18:52.650' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (226, 340, N'05476     ', CAST(N'2010-10-06 20:19:10.427' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (227, 307, N'05477     ', CAST(N'2010-10-06 20:19:24.273' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (228, 260, N'05766     ', CAST(N'2010-10-06 20:19:40.317' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (229, 480, N'05767     ', CAST(N'2010-10-06 20:19:53.487' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (230, 456, N'05101     ', CAST(N'2010-10-06 20:20:09.633' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (231, 436, N'05669     ', CAST(N'2010-10-06 20:20:26.383' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (232, 481, N'05068     ', CAST(N'2010-10-06 20:20:41.110' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (233, 273, N'05768     ', CAST(N'2010-10-06 20:21:00.780' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (234, 403, N'05701     ', CAST(N'2010-10-06 20:21:23.313' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (235, 403, N'05702     ', CAST(N'2010-10-06 20:21:25.897' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (236, 402, N'05701     ', CAST(N'2010-10-06 20:21:39.050' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (237, 290, N'05042     ', CAST(N'2010-10-06 20:21:59.097' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (238, 261, N'05769     ', CAST(N'2010-10-06 20:22:24.847' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (239, 274, N'05250     ', CAST(N'2010-10-06 20:22:41.113' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (240, 275, N'05363     ', CAST(N'2010-10-06 20:22:55.437' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (241, 276, N'05262     ', CAST(N'2010-10-06 20:23:10.890' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (242, 482, N'05065     ', CAST(N'2010-10-06 20:23:30.773' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (243, 291, N'05866     ', CAST(N'2010-10-06 20:23:58.197' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (244, 308, N'05482     ', CAST(N'2010-10-06 20:24:19.150' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (245, 341, N'05455     ', CAST(N'2010-10-06 20:24:37.697' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (246, 341, N'05483     ', CAST(N'2010-10-06 20:24:46.857' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (247, 341, N'05485     ', CAST(N'2010-10-06 20:24:54.927' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (248, 262, N'05770     ', CAST(N'2010-10-06 20:25:12.013' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (249, 401, N'05738     ', CAST(N'2010-10-06 20:25:29.667' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (250, 457, N'00000     ', CAST(N'2010-10-06 20:26:15.480' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (251, 348, N'05486     ', CAST(N'2010-10-06 20:26:44.783' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (252, 483, N'05150     ', CAST(N'2010-10-06 20:27:26.237' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (253, 483, N'05156     ', CAST(N'2010-10-06 20:27:44.213' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (254, 342, N'05478     ', CAST(N'2010-10-06 20:28:31.553' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (255, 342, N'05479     ', CAST(N'2010-10-06 20:28:34.067' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (256, 342, N'05481     ', CAST(N'2010-10-06 20:28:41.657' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (257, 292, N'05819     ', CAST(N'2010-10-06 20:28:59.263' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (258, 292, N'05863     ', CAST(N'2010-10-06 20:29:08.273' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (259, 309, N'05495     ', CAST(N'2010-10-06 20:29:22.717' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (260, 277, N'05352     ', CAST(N'2010-10-06 20:29:48.237' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (261, 293, N'05842     ', CAST(N'2010-10-06 20:30:07.157' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (262, 263, N'05487     ', CAST(N'2010-10-06 20:30:23.123' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (263, 484, N'05772     ', CAST(N'2010-10-06 20:30:39.223' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (264, 356, N'05672     ', CAST(N'2010-10-06 20:31:00.843' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (265, 368, N'05072     ', CAST(N'2010-10-06 20:31:19.057' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (266, 458, N'05360     ', CAST(N'2010-10-06 20:31:37.190' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (267, 458, N'05155     ', CAST(N'2010-10-06 20:31:45.110' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (268, 400, N'05733     ', CAST(N'2010-10-06 20:32:00.287' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (269, 278, N'05250     ', CAST(N'2010-10-06 20:32:18.360' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (270, 278, N'05252     ', CAST(N'2010-10-06 20:32:21.427' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (271, 294, N'867       ', CAST(N'2010-10-06 20:32:37.643' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (272, 343, N'05488     ', CAST(N'2010-10-06 20:33:11.320' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (273, 369, N'05074     ', CAST(N'2010-10-06 20:33:33.200' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (274, 369, N'05075     ', CAST(N'2010-10-06 20:33:38.120' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (275, 399, N'05773     ', CAST(N'2010-10-06 20:33:49.240' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (276, 370, N'05076     ', CAST(N'2010-10-06 20:34:06.217' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (277, 459, N'05353     ', CAST(N'2010-10-06 20:34:24.453' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (278, 459, N'05359     ', CAST(N'2010-10-06 20:34:27.173' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (279, 378, N'05868     ', CAST(N'2010-10-06 20:34:44.603' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (280, 371, N'05077     ', CAST(N'2010-10-06 20:34:59.797' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (281, 310, N'05489     ', CAST(N'2010-10-06 20:35:17.250' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (282, 310, N'05490     ', CAST(N'2010-10-06 20:35:20.083' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (283, 264, N'05491     ', CAST(N'2010-10-06 20:35:42.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (284, 460, N'05354     ', CAST(N'2010-10-06 20:35:58.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (285, 372, N'05079     ', CAST(N'2010-10-06 20:36:13.880' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (286, 329, N'05858     ', CAST(N'2010-10-06 20:36:28.997' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (287, 437, N'05673     ', CAST(N'2010-10-06 20:36:51.317' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (288, 295, N'05878     ', CAST(N'2010-10-06 20:37:09.140' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (289, 398, N'05773     ', CAST(N'2010-10-06 20:37:37.330' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (290, 265, N'05491     ', CAST(N'2010-10-06 20:37:53.010' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (291, 461, N'05355     ', CAST(N'2010-10-06 20:38:09.877' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (292, 439, N'05674     ', CAST(N'2010-10-06 20:38:27.653' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (293, 373, N'05675     ', CAST(N'2010-10-06 20:38:43.207' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (294, 440, N'05671     ', CAST(N'2010-10-06 20:39:00.367' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (295, 440, N'05676     ', CAST(N'2010-10-06 20:39:10.117' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (296, 440, N'05677     ', CAST(N'2010-10-06 20:39:17.910' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (297, 296, N'05819     ', CAST(N'2010-10-06 20:39:40.020' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (298, 357, N'05492     ', CAST(N'2010-10-06 20:39:57.717' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (299, 485, N'05151     ', CAST(N'2010-10-06 20:40:12.490' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (300, 485, N'05156     ', CAST(N'2010-10-06 20:40:17.443' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (301, 397, N'05774     ', CAST(N'2010-10-06 20:40:46.097' AS DateTime), N'SSE', NULL)
GO
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (302, 374, N'05083     ', CAST(N'2010-10-06 20:41:05.720' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (303, 396, N'05743     ', CAST(N'2010-10-06 20:41:24.030' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (304, 395, N'05777     ', CAST(N'2010-10-06 20:41:36.423' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (305, 486, N'05089     ', CAST(N'2010-10-06 20:41:53.957' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (306, 377, N'05874     ', CAST(N'2010-10-06 20:42:07.317' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (307, 311, N'05494     ', CAST(N'2010-10-06 20:42:22.953' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (308, 462, N'05158     ', CAST(N'2010-10-06 20:42:38.410' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (309, 462, N'05159     ', CAST(N'2010-10-06 20:42:40.860' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (310, 462, N'05346     ', CAST(N'2010-10-06 20:42:52.167' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (311, 376, N'05822     ', CAST(N'2010-10-06 20:43:15.143' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (312, 376, N'05860     ', CAST(N'2010-10-06 20:43:18.470' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (313, 487, N'05161     ', CAST(N'2010-10-06 20:43:34.813' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (314, 266, N'05753     ', CAST(N'2010-10-06 20:43:48.597' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (315, 297, N'05851     ', CAST(N'2010-10-06 20:44:11.707' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (316, 463, N'05361     ', CAST(N'2010-10-06 20:44:29.837' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (317, 375, N'05679     ', CAST(N'2010-10-06 20:44:44.977' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (318, 312, N'05495     ', CAST(N'2010-10-06 20:45:01.690' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (319, 464, N'05363     ', CAST(N'2010-10-06 20:45:19.577' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (320, 465, N'05359     ', CAST(N'2010-10-06 20:45:33.463' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (321, 488, N'05089     ', CAST(N'2010-10-06 20:45:46.833' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (322, 279, N'05340     ', CAST(N'2010-10-06 20:46:02.817' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (323, 313, N'05404     ', CAST(N'2010-10-06 20:46:12.153' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (324, 358, N'05680     ', CAST(N'2010-10-06 20:46:28.100' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (325, 441, N'05681     ', CAST(N'2010-10-06 20:46:41.980' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (326, 280, N'05201     ', CAST(N'2010-10-06 20:46:56.970' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (327, 489, N'05091     ', CAST(N'2010-10-06 20:47:13.203' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (328, 442, N'05682     ', CAST(N'2010-10-06 20:47:26.313' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUPostalCode] ([PostalCodeID], [CityID], [PostalCode], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (330, 494, N'05403', CAST(N'2010-11-04 20:22:58.337' AS DateTime), N'SSE', NULL)
SET IDENTITY_INSERT [Person].[LUPostalCode] OFF
SET IDENTITY_INSERT [Person].[LUProgramType] ON 

INSERT [Person].[LUProgramType] ([ProgramTypeID], [ProgramName], [ProgramDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'Weatherization', N'Weatherization', CAST(N'2010-10-05 17:27:40.183' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUProgramType] ([ProgramTypeID], [ProgramName], [ProgramDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'Micro Business', N'Micro Business', CAST(N'2010-10-05 17:27:40.183' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUProgramType] ([ProgramTypeID], [ProgramName], [ProgramDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (3, N'VT Tenants', N'VT Tenants', CAST(N'2010-10-05 17:27:40.183' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUProgramType] ([ProgramTypeID], [ProgramName], [ProgramDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'Food Shelf', N'Food Shelf', CAST(N'2010-10-05 17:27:40.183' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUProgramType] ([ProgramTypeID], [ProgramName], [ProgramDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (5, N'Community Action', N'CommunityAction', CAST(N'2010-10-05 17:27:40.183' AS DateTime), N'SSE', NULL)
SET IDENTITY_INSERT [Person].[LUProgramType] OFF
SET IDENTITY_INSERT [Person].[LURace] ON 

INSERT [Person].[LURace] ([RaceID], [RaceAbbreviation], [RaceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'White', N'White', CAST(N'2010-10-08 13:22:07.970' AS DateTime), N'SSE', NULL)
INSERT [Person].[LURace] ([RaceID], [RaceAbbreviation], [RaceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'Black', N'African American or Negro', CAST(N'2010-10-08 13:22:28.447' AS DateTime), N'SSE', NULL)
INSERT [Person].[LURace] ([RaceID], [RaceAbbreviation], [RaceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (3, N'American Indian', N'or Alaskan Native', CAST(N'2010-10-08 13:23:21.473' AS DateTime), N'SSE', NULL)
INSERT [Person].[LURace] ([RaceID], [RaceAbbreviation], [RaceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'Asian Indian', N'Asian Indian', CAST(N'2010-10-08 13:23:49.383' AS DateTime), N'SSE', NULL)
INSERT [Person].[LURace] ([RaceID], [RaceAbbreviation], [RaceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (5, N'Chinese', N'Chinese', CAST(N'2010-10-08 13:24:05.030' AS DateTime), N'SSE', NULL)
INSERT [Person].[LURace] ([RaceID], [RaceAbbreviation], [RaceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (6, N'Filipino', N'Filipino', CAST(N'2010-10-08 13:24:17.737' AS DateTime), N'SSE', NULL)
INSERT [Person].[LURace] ([RaceID], [RaceAbbreviation], [RaceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (7, N'Other Asian', N'Ex: Hmong, Laotian,Thai, Pakistani, Cambodian, etc', CAST(N'2010-10-08 13:24:50.643' AS DateTime), N'SSE', NULL)
INSERT [Person].[LURace] ([RaceID], [RaceAbbreviation], [RaceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'Japanese', N'Japanese', CAST(N'2010-10-08 13:25:09.083' AS DateTime), N'SSE', NULL)
INSERT [Person].[LURace] ([RaceID], [RaceAbbreviation], [RaceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (9, N'Korean', N'Korean', CAST(N'2010-10-08 13:25:22.667' AS DateTime), N'SSE', NULL)
INSERT [Person].[LURace] ([RaceID], [RaceAbbreviation], [RaceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (10, N'Vietnamese', N'Vietnamese', CAST(N'2010-10-08 13:25:36.977' AS DateTime), N'SSE', NULL)
INSERT [Person].[LURace] ([RaceID], [RaceAbbreviation], [RaceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (11, N'Native Hawaiian', N'Native Hawaiian', CAST(N'2010-10-08 13:25:54.817' AS DateTime), N'SSE', NULL)
INSERT [Person].[LURace] ([RaceID], [RaceAbbreviation], [RaceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (12, N'Guanamainan/Chamorro', N'or Chamorro', CAST(N'2010-10-08 13:26:11.393' AS DateTime), N'SSE', NULL)
INSERT [Person].[LURace] ([RaceID], [RaceAbbreviation], [RaceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (13, N'Samoan', N'Samoan', CAST(N'2010-10-08 13:26:23.903' AS DateTime), N'SSE', NULL)
INSERT [Person].[LURace] ([RaceID], [RaceAbbreviation], [RaceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (14, N'Other Pacif. Isl.', N'Ex: Fijian, Tongan, etc.', CAST(N'2010-10-08 13:26:51.333' AS DateTime), N'SSE', NULL)
INSERT [Person].[LURace] ([RaceID], [RaceAbbreviation], [RaceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (15, N'Other Race', N'Other Race', CAST(N'2011-03-14 16:41:27.953' AS DateTime), N'SSE', NULL)
INSERT [Person].[LURace] ([RaceID], [RaceAbbreviation], [RaceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (16, N'Any Two or More', N'Any Two or More of Above', CAST(N'2011-03-14 16:41:27.963' AS DateTime), N'SSE', NULL)
INSERT [Person].[LURace] ([RaceID], [RaceAbbreviation], [RaceDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (17, N'Not Reported', N'Not Reported', CAST(N'2011-03-14 16:41:27.970' AS DateTime), N'SSE', NULL)
SET IDENTITY_INSERT [Person].[LURace] OFF
SET IDENTITY_INSERT [Person].[LUState] ON 

INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (1, N'AL', N'Alabama', CAST(N'2010-10-05 15:18:17.527' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'AK', N'Alaska', CAST(N'2010-10-05 15:18:17.527' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (3, N'AZ', N'Arizona', CAST(N'2010-10-05 15:18:17.527' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (4, N'AR', N'Arkansas', CAST(N'2010-10-05 15:18:17.527' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (5, N'CA', N'California', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (6, N'CO', N'Colorado', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (7, N'CT', N'Connecticut', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (8, N'DE', N'Delaware', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (9, N'FL', N'Florida', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (10, N'GA', N'Georgia', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (11, N'HI', N'Hawaii', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (12, N'ID', N'Idaho', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (13, N'IL', N'Illinois', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (14, N'IN', N'Indiana', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (15, N'IA', N'Iowa', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (16, N'KS', N'Kansas', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (17, N'KY', N'Kentucky', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (18, N'LA', N'Louisiana', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (19, N'ME', N'Maine', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (20, N'MD', N'Maryland', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (21, N'MA', N'Massachusetts', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (22, N'MI', N'Michigan', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (23, N'MN', N'Minnesota', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (24, N'MS', N'Mississippi', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (25, N'MO', N'Missouri', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (26, N'MT', N'Montana', CAST(N'2010-10-05 15:18:17.530' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (27, N'NE', N'Nebraska', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (28, N'NV', N'Nevada', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (29, N'NH', N'New Hampshire', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (30, N'NJ', N'New Jersey', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (31, N'NM', N'New Mexico', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (32, N'NY', N'New York', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (33, N'NC', N'North Carolina', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (34, N'ND', N'North Dakota', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (35, N'OH', N'Ohio', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (36, N'OK', N'Oklahoma', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (37, N'OR', N'Oregon', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (38, N'PA', N'Pennsylvania', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (39, N'RI', N'Rhode Island', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (40, N'SC', N'South Carolina', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (41, N'SD', N'South Dakota', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (42, N'TN', N'Tennessee', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (43, N'TX', N'Texas', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (44, N'UT', N'Utah', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (45, N'VT', N'Vermont', CAST(N'2010-10-05 15:18:17.533' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (46, N'VA', N'Virginia', CAST(N'2010-10-05 15:18:17.537' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (47, N'WA', N'Washington', CAST(N'2010-10-05 15:18:17.537' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (48, N'WV', N'West Virginia', CAST(N'2010-10-05 15:18:17.537' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (49, N'WI', N'Wisconsin', CAST(N'2010-10-05 15:18:17.537' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (50, N'WY', N'Wyoming', CAST(N'2010-10-05 15:18:17.537' AS DateTime), N'SSE', NULL)
INSERT [Person].[LUState] ([StateID], [StateCode], [Name], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (51, N'DC', N'Washington DC', CAST(N'2010-10-05 15:18:17.537' AS DateTime), N'SSE', NULL)
SET IDENTITY_INSERT [Person].[LUState] OFF
SET IDENTITY_INSERT [Person].[Person] ON 

INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (186, N'Dr', N'Joe', N'', N'Johnston', N'', CAST(N'1962-05-15 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-05-19 13:47:20.840' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (187, NULL, N'Billly', N'', N'Johnston', NULL, CAST(N'1800-01-01 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-05-31 17:12:26.893' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (188, NULL, N'Sally', N'', N'Johnston', NULL, CAST(N'2010-04-03 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-08 13:38:27.470' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (189, NULL, N'Jimmy', N'', N'Johnston', NULL, CAST(N'2011-01-01 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-08 13:49:37.107' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (190, N'', N'Peter', N'', N'Andysu', N'', CAST(N'1943-03-04 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-04-09 11:56:16.667' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (191, N'', N'Peter', N'', N'Andy', N'', CAST(N'1932-02-04 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-04-09 11:58:54.213' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (192, N'', N'Buddy', N'', N'James', N'', CAST(N'2001-01-01 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-05-17 12:56:44.837' AS DateTime), N'gsavard', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (193, N'', N'Allan', N'', N'Johnston', N'', CAST(N'1928-01-04 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-05-16 09:37:15.810' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (194, N'', N'New', N'', N'Testee', N'', CAST(N'1928-04-01 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-04-20 09:36:01.037' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (195, N'', N'Anudda', N'', N'manda', N'', CAST(N'1920-02-03 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-04-20 09:37:12.723' AS DateTime), N'DanJohnston', 1)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (196, NULL, N'Jimmy', N'', N'jonsten', NULL, CAST(N'2011-01-01 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-29 14:27:21.937' AS DateTime), N'DanJohnston', 1)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (197, N'', N'Peter', N'', N'Graham', N'', CAST(N'1928-03-02 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-04-28 20:23:10.127' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (198, N'', N'Jane', N'', N'Murdough', N'', CAST(N'1992-04-02 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-04-28 20:25:41.213' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (199, N'', N'Peter', N'', N'Mann', N'', CAST(N'1928-03-01 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-04-28 20:27:22.143' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (200, N'', N'Alexander', N'', N'Bell', N'', CAST(N'1820-01-01 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-04-28 20:30:56.660' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (201, N'', N'Bell', N'', N'Graham', N'', CAST(N'1920-10-21 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-04-28 20:33:26.733' AS DateTime), N'DanJohnston', 1)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (202, N'', N'Frank', N'', N'Furter', N'', CAST(N'1982-03-01 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-04-28 20:35:26.497' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (203, N'', N'Betty', N'', N'Schwartz', N'', CAST(N'1928-02-03 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-04-28 20:55:03.580' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (204, N'', N'Alice', N'', N'Chains', N'', CAST(N'2010-10-10 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-04-28 20:59:35.183' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (205, NULL, N'Lona', N'', N'Ally', NULL, CAST(N'2011-01-02 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-28 20:59:59.867' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (206, NULL, N'Betty', N'', N'Raisin', NULL, CAST(N'2011-01-01 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-28 21:03:12.867' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (207, NULL, N'Joe', N'', N'Four', NULL, CAST(N'2002-02-02 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-28 21:05:26.333' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (208, NULL, N'Peter', N'', N'Ally', NULL, CAST(N'2012-01-01 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-29 14:27:31.950' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (209, NULL, N'Frank', N'', N'Schmidt', NULL, CAST(N'1982-01-02 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-29 14:27:41.023' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (210, NULL, N'Liam', N'', N'Thomas', NULL, CAST(N'1982-02-01 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-28 21:43:21.280' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (211, N'', N'Snark', N'', N'Plen', N'', CAST(N'1982-01-02 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-04-28 21:49:03.610' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (212, NULL, N'Frank', N'', N'Spank', NULL, CAST(N'2001-01-01 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-28 21:51:06.090' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (213, NULL, N'Blayne', N'', N'Blaze', NULL, CAST(N'1920-02-19 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-29 14:16:58.017' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (214, NULL, N'Frankie', N'', N'Smith', NULL, CAST(N'2010-01-01 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-28 22:18:26.253' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (215, NULL, N'Anudder', N'', N'Test', NULL, CAST(N'1982-02-02 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-29 13:58:02.867' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (216, N'', N'Peter', N'', N'Allison', N'', CAST(N'1923-01-02 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-04-28 22:28:34.733' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (217, NULL, N'Johnny', N'', N'Allison', NULL, CAST(N'2004-02-01 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-28 22:29:11.230' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (218, NULL, N'Sue', N'', N'Anerror', NULL, CAST(N'2008-04-05 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-28 22:32:14.317' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (219, N'Dr', N'Sandy', N'', N'Plaint', NULL, CAST(N'1980-07-14 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-28 22:43:25.123' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (220, NULL, N'Hardee', N'', N'Johns', NULL, CAST(N'1995-11-23 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-28 23:07:51.380' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (221, NULL, N'Yikes', N'', N'ALlen', NULL, CAST(N'2010-01-01 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-29 00:52:31.170' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (222, N'', N'Party', N'', N'Donne', N'', CAST(N'1982-02-02 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-04-28 23:52:27.883' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (223, NULL, N'Lil', N'', N'Donne', NULL, CAST(N'2002-02-02 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-28 23:52:49.310' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (224, NULL, N'Peter', N'', N'Pan', NULL, CAST(N'1927-02-18 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-29 09:15:47.087' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (225, NULL, N'Tinker', N'', N'Bell', NULL, CAST(N'1843-09-23 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-29 09:21:59.387' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (226, NULL, N'Hook', N'', N'Pirate', NULL, CAST(N'1909-04-19 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-29 09:26:04.937' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (227, NULL, N'Croc', N'', N'Odile', NULL, CAST(N'1850-09-20 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-29 09:27:30.400' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (228, NULL, N'Al', N'', N'Ligator', NULL, CAST(N'1928-08-09 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-29 12:11:32.317' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (229, NULL, N'Bol', N'', N'Oogna', NULL, CAST(N'1985-07-08 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-29 14:16:42.333' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (230, NULL, N'Graham', N'', N'Key', NULL, CAST(N'1854-01-14 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-29 13:27:18.880' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (231, N'', N'Fred', N'', N'Flintstone', N'', CAST(N'1834-05-01 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-04-29 14:29:49.677' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (232, NULL, N'Newton', N'', N'Client', NULL, CAST(N'2011-01-01 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-04-29 14:30:09.850' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (233, N'', N'arnold', N'', N'Hames', N'', CAST(N'1956-11-06 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-05-02 20:29:17.040' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (234, N'', N'billy', N'', N'joe', N'', CAST(N'2000-01-01 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-05-02 20:32:06.800' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (235, N'', N'Bernard', N'', N'Johnston', N'', CAST(N'2000-01-01 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-05-12 08:04:53.260' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (236, N'', N'Kelly', N'', N'Mistral', N'', CAST(N'2011-01-01 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-05-11 13:19:11.043' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (237, N'', N'John', N'', N'Wayne', N'', CAST(N'1920-02-02 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-05-17 12:58:30.757' AS DateTime), N'gsavard', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (238, N'', N'Abe', N'', N'Lincoln', N'', CAST(N'2000-01-01 00:00:00.000' AS DateTime), N'', 0, CAST(N'2011-05-18 16:44:48.047' AS DateTime), N'DanJohnston', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (244, N'', N'Bugs', N'', N'Jonsten', N'', CAST(N'2000-06-09 00:00:00.000' AS DateTime), NULL, 0, CAST(N'2011-06-20 15:01:03.183' AS DateTime), N'SSE', 0)
INSERT [Person].[Person] ([PersonID], [Title], [FirstName], [MiddleName], [LastName], [Suffix], [DateOfBirth], [EmailAddress], [EmailContactPreference], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (245, N'Dr', N'George', N'J', N'Jetson', N'', CAST(N'1985-01-15 00:00:00.000' AS DateTime), N'george@hotmail.com', 1, CAST(N'2021-08-31 19:55:52.327' AS DateTime), N'AG', 0)
SET IDENTITY_INSERT [Person].[Person] OFF
SET IDENTITY_INSERT [Person].[Phone] ON 

INSERT [Person].[Phone] ([PhoneID], [PersonID], [PhoneNumber], [PhoneExtension], [PhoneType], [ModifiedDate], [ModifiedBy]) VALUES (46, 186, N'8028994164', N'', 1, CAST(N'2011-05-19 13:47:20.840' AS DateTime), N'DanJohnston')
INSERT [Person].[Phone] ([PhoneID], [PersonID], [PhoneNumber], [PhoneExtension], [PhoneType], [ModifiedDate], [ModifiedBy]) VALUES (47, 186, N'8029999657', N'', 3, CAST(N'2011-05-19 13:47:20.840' AS DateTime), N'DanJohnston')
INSERT [Person].[Phone] ([PhoneID], [PersonID], [PhoneNumber], [PhoneExtension], [PhoneType], [ModifiedDate], [ModifiedBy]) VALUES (48, 193, N'', N'', 1, CAST(N'2011-05-16 09:37:15.810' AS DateTime), N'DanJohnston')
INSERT [Person].[Phone] ([PhoneID], [PersonID], [PhoneNumber], [PhoneExtension], [PhoneType], [ModifiedDate], [ModifiedBy]) VALUES (49, 193, N'', N'', 3, CAST(N'2011-05-16 09:37:15.810' AS DateTime), N'DanJohnston')
INSERT [Person].[Phone] ([PhoneID], [PersonID], [PhoneNumber], [PhoneExtension], [PhoneType], [ModifiedDate], [ModifiedBy]) VALUES (50, 194, N'', N'', 1, CAST(N'2011-04-20 09:36:01.037' AS DateTime), N'DanJohnston')
INSERT [Person].[Phone] ([PhoneID], [PersonID], [PhoneNumber], [PhoneExtension], [PhoneType], [ModifiedDate], [ModifiedBy]) VALUES (51, 194, N'', N'', 3, CAST(N'2011-04-20 09:36:01.037' AS DateTime), N'DanJohnston')
INSERT [Person].[Phone] ([PhoneID], [PersonID], [PhoneNumber], [PhoneExtension], [PhoneType], [ModifiedDate], [ModifiedBy]) VALUES (52, 195, N'', N'', 1, CAST(N'2011-04-20 09:37:12.723' AS DateTime), N'DanJohnston')
INSERT [Person].[Phone] ([PhoneID], [PersonID], [PhoneNumber], [PhoneExtension], [PhoneType], [ModifiedDate], [ModifiedBy]) VALUES (53, 195, N'', N'', 3, CAST(N'2011-04-20 09:37:12.723' AS DateTime), N'DanJohnston')
INSERT [Person].[Phone] ([PhoneID], [PersonID], [PhoneNumber], [PhoneExtension], [PhoneType], [ModifiedDate], [ModifiedBy]) VALUES (54, 235, N'', N'', 1, CAST(N'2011-05-12 08:04:53.260' AS DateTime), N'DanJohnston')
INSERT [Person].[Phone] ([PhoneID], [PersonID], [PhoneNumber], [PhoneExtension], [PhoneType], [ModifiedDate], [ModifiedBy]) VALUES (55, 235, N'', N'', 3, CAST(N'2011-05-12 08:04:53.260' AS DateTime), N'DanJohnston')
INSERT [Person].[Phone] ([PhoneID], [PersonID], [PhoneNumber], [PhoneExtension], [PhoneType], [ModifiedDate], [ModifiedBy]) VALUES (56, 236, N'', N'', 1, CAST(N'2011-05-11 13:19:11.043' AS DateTime), N'DanJohnston')
INSERT [Person].[Phone] ([PhoneID], [PersonID], [PhoneNumber], [PhoneExtension], [PhoneType], [ModifiedDate], [ModifiedBy]) VALUES (57, 236, N'', N'', 3, CAST(N'2011-05-11 13:19:11.043' AS DateTime), N'DanJohnston')
INSERT [Person].[Phone] ([PhoneID], [PersonID], [PhoneNumber], [PhoneExtension], [PhoneType], [ModifiedDate], [ModifiedBy]) VALUES (58, 192, N'', N'', 1, CAST(N'2011-05-17 12:56:44.837' AS DateTime), N'gsavard')
INSERT [Person].[Phone] ([PhoneID], [PersonID], [PhoneNumber], [PhoneExtension], [PhoneType], [ModifiedDate], [ModifiedBy]) VALUES (59, 192, N'', N'', 3, CAST(N'2011-05-17 12:56:44.837' AS DateTime), N'gsavard')
INSERT [Person].[Phone] ([PhoneID], [PersonID], [PhoneNumber], [PhoneExtension], [PhoneType], [ModifiedDate], [ModifiedBy]) VALUES (60, 237, N'9996667777', N'', 1, CAST(N'2011-05-17 12:58:30.757' AS DateTime), N'gsavard')
INSERT [Person].[Phone] ([PhoneID], [PersonID], [PhoneNumber], [PhoneExtension], [PhoneType], [ModifiedDate], [ModifiedBy]) VALUES (61, 238, N'', N'', 1, CAST(N'2011-05-18 16:44:48.050' AS DateTime), N'DanJohnston')
INSERT [Person].[Phone] ([PhoneID], [PersonID], [PhoneNumber], [PhoneExtension], [PhoneType], [ModifiedDate], [ModifiedBy]) VALUES (62, 238, N'', N'', 3, CAST(N'2011-05-18 16:44:48.050' AS DateTime), N'DanJohnston')
SET IDENTITY_INSERT [Person].[Phone] OFF
SET IDENTITY_INSERT [SSN].[SSN] ON 

INSERT [SSN].[SSN] ([SSNID], [PersonID], [SSN], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, N'009117788', CAST(N'2010-10-25 18:04:06.170' AS DateTime), N'SSE')
SET IDENTITY_INSERT [SSN].[SSN] OFF
SET IDENTITY_INSERT [Volunteer].[LUVolunteerDay] ON 

INSERT [Volunteer].[LUVolunteerDay] ([DayOfWeekID], [DayOfWeek]) VALUES (1, N'Sunday')
INSERT [Volunteer].[LUVolunteerDay] ([DayOfWeekID], [DayOfWeek]) VALUES (2, N'Monday')
INSERT [Volunteer].[LUVolunteerDay] ([DayOfWeekID], [DayOfWeek]) VALUES (3, N'Tuesday')
INSERT [Volunteer].[LUVolunteerDay] ([DayOfWeekID], [DayOfWeek]) VALUES (4, N'Wednesday')
INSERT [Volunteer].[LUVolunteerDay] ([DayOfWeekID], [DayOfWeek]) VALUES (5, N'Thursday')
INSERT [Volunteer].[LUVolunteerDay] ([DayOfWeekID], [DayOfWeek]) VALUES (6, N'Friday')
INSERT [Volunteer].[LUVolunteerDay] ([DayOfWeekID], [DayOfWeek]) VALUES (7, N'Saturday')
SET IDENTITY_INSERT [Volunteer].[LUVolunteerDay] OFF
SET IDENTITY_INSERT [Volunteer].[LUVolunteerJobType] ON 

INSERT [Volunteer].[LUVolunteerJobType] ([VolunteerJobTypeID], [JobType], [JobDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (2, N'Food', N'Hands Out Food', CAST(N'2021-10-07 00:00:00.000' AS DateTime), N'ATG', NULL)
INSERT [Volunteer].[LUVolunteerJobType] ([VolunteerJobTypeID], [JobType], [JobDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (3, N'People', N'Signs People In', CAST(N'2021-10-07 00:00:00.000' AS DateTime), N'ATG', NULL)
SET IDENTITY_INSERT [Volunteer].[LUVolunteerJobType] OFF
SET IDENTITY_INSERT [Volunteer].[LUVolunteerScheduleMonth] ON 

INSERT [Volunteer].[LUVolunteerScheduleMonth] ([MonthID], [MonthName]) VALUES (1, N'January')
INSERT [Volunteer].[LUVolunteerScheduleMonth] ([MonthID], [MonthName]) VALUES (2, N'February')
INSERT [Volunteer].[LUVolunteerScheduleMonth] ([MonthID], [MonthName]) VALUES (3, N'March')
INSERT [Volunteer].[LUVolunteerScheduleMonth] ([MonthID], [MonthName]) VALUES (4, N'April')
INSERT [Volunteer].[LUVolunteerScheduleMonth] ([MonthID], [MonthName]) VALUES (5, N'May')
INSERT [Volunteer].[LUVolunteerScheduleMonth] ([MonthID], [MonthName]) VALUES (6, N'June')
INSERT [Volunteer].[LUVolunteerScheduleMonth] ([MonthID], [MonthName]) VALUES (7, N'July')
INSERT [Volunteer].[LUVolunteerScheduleMonth] ([MonthID], [MonthName]) VALUES (8, N'August')
INSERT [Volunteer].[LUVolunteerScheduleMonth] ([MonthID], [MonthName]) VALUES (9, N'September')
INSERT [Volunteer].[LUVolunteerScheduleMonth] ([MonthID], [MonthName]) VALUES (10, N'October')
INSERT [Volunteer].[LUVolunteerScheduleMonth] ([MonthID], [MonthName]) VALUES (11, N'November')
INSERT [Volunteer].[LUVolunteerScheduleMonth] ([MonthID], [MonthName]) VALUES (12, N'December')
SET IDENTITY_INSERT [Volunteer].[LUVolunteerScheduleMonth] OFF
SET IDENTITY_INSERT [Volunteer].[LUVolunteerType] ON 

INSERT [Volunteer].[LUVolunteerType] ([VolunteerTypeID], [VolunteerType], [VolunteerTypeDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (3, N'Food', N'Helps with food', CAST(N'2021-09-30 00:00:00.000' AS DateTime), N'ATG', NULL)
INSERT [Volunteer].[LUVolunteerType] ([VolunteerTypeID], [VolunteerType], [VolunteerTypeDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (7, N'Housing', N'Helps with housing', CAST(N'2021-09-30 00:00:00.000' AS DateTime), N'ATG', NULL)
INSERT [Volunteer].[LUVolunteerType] ([VolunteerTypeID], [VolunteerType], [VolunteerTypeDescription], [ModifiedDate], [ModifiedBy], [IsDeleted]) VALUES (9, N'Driver', N'Delivers Things or People', CAST(N'2021-09-30 00:00:00.000' AS DateTime), N'ATG', NULL)
SET IDENTITY_INSERT [Volunteer].[LUVolunteerType] OFF
SET IDENTITY_INSERT [Volunteer].[VolunteerContactInformation] ON 

INSERT [Volunteer].[VolunteerContactInformation] ([ContactInformationID], [VolunteerPersonID], [ContactPersonID], [OrganizationID], [ContactFirstName], [ContactLastName], [ContactDOB], [ContactAddress1], [ContactAddress2], [ContactHomePhone], [ContactWorkPhone], [ContactCellPhone], [ContactPager], [ContactEmail], [VolunteerTypeID], [IsActive], [ModifiedDate], [ModifiedBy]) VALUES (11, 1, 1, NULL, N'Aaron', N'Gockley', NULL, N'1926 Bowmansville Rd', N'Mohnton, PA 19540', NULL, NULL, N'17174668885', NULL, N'aaron.gockley@mymail.champlain.edu', 3, 1, CAST(N'2021-09-16 00:00:00.000' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerContactInformation] ([ContactInformationID], [VolunteerPersonID], [ContactPersonID], [OrganizationID], [ContactFirstName], [ContactLastName], [ContactDOB], [ContactAddress1], [ContactAddress2], [ContactHomePhone], [ContactWorkPhone], [ContactCellPhone], [ContactPager], [ContactEmail], [VolunteerTypeID], [IsActive], [ModifiedDate], [ModifiedBy]) VALUES (33, 2, 2, NULL, N'Joseph', N'Queen', NULL, N'16 West Liberty St', NULL, NULL, NULL, N'11111111111', NULL, N'test@test.com', 3, 1, CAST(N'2021-10-01 19:16:30.053' AS DateTime), N'ATG')
SET IDENTITY_INSERT [Volunteer].[VolunteerContactInformation] OFF
SET IDENTITY_INSERT [Volunteer].[VolunteerEmergencyContact] ON 

INSERT [Volunteer].[VolunteerEmergencyContact] ([VolunteerEmergencyContactID], [VolunteerPersonID], [ContactInformation], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, N'17172835886', CAST(N'2021-09-30 20:27:08.627' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerEmergencyContact] ([VolunteerEmergencyContactID], [VolunteerPersonID], [ContactInformation], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, N'Lamar Gockley (717) 283-5886', CAST(N'2021-10-01 19:06:48.260' AS DateTime), N'ATG')
SET IDENTITY_INSERT [Volunteer].[VolunteerEmergencyContact] OFF
SET IDENTITY_INSERT [Volunteer].[VolunteerJobs] ON 

INSERT [Volunteer].[VolunteerJobs] ([VolunteerJobsID], [VolunteerScheduleDayTimeID], [Job], [ModifiedDate], [ModifiedBy]) VALUES (7, 1, 2, CAST(N'2021-10-08 00:00:00.000' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerJobs] ([VolunteerJobsID], [VolunteerScheduleDayTimeID], [Job], [ModifiedDate], [ModifiedBy]) VALUES (8, 2, 2, CAST(N'2021-10-08 00:00:00.000' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerJobs] ([VolunteerJobsID], [VolunteerScheduleDayTimeID], [Job], [ModifiedDate], [ModifiedBy]) VALUES (9, 3, 2, CAST(N'2021-10-08 00:00:00.000' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerJobs] ([VolunteerJobsID], [VolunteerScheduleDayTimeID], [Job], [ModifiedDate], [ModifiedBy]) VALUES (10, 4, 3, CAST(N'2021-10-08 00:00:00.000' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerJobs] ([VolunteerJobsID], [VolunteerScheduleDayTimeID], [Job], [ModifiedDate], [ModifiedBy]) VALUES (11, 5, 3, CAST(N'2021-10-08 00:00:00.000' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerJobs] ([VolunteerJobsID], [VolunteerScheduleDayTimeID], [Job], [ModifiedDate], [ModifiedBy]) VALUES (12, 6, 2, CAST(N'2021-10-08 00:00:00.000' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerJobs] ([VolunteerJobsID], [VolunteerScheduleDayTimeID], [Job], [ModifiedDate], [ModifiedBy]) VALUES (13, 7, 2, CAST(N'2021-10-08 00:00:00.000' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerJobs] ([VolunteerJobsID], [VolunteerScheduleDayTimeID], [Job], [ModifiedDate], [ModifiedBy]) VALUES (14, 8, 2, CAST(N'2021-10-08 00:00:00.000' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerJobs] ([VolunteerJobsID], [VolunteerScheduleDayTimeID], [Job], [ModifiedDate], [ModifiedBy]) VALUES (15, 9, 2, CAST(N'2021-10-08 21:16:22.500' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerJobs] ([VolunteerJobsID], [VolunteerScheduleDayTimeID], [Job], [ModifiedDate], [ModifiedBy]) VALUES (16, 10, 2, CAST(N'2021-10-08 21:18:09.323' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerJobs] ([VolunteerJobsID], [VolunteerScheduleDayTimeID], [Job], [ModifiedDate], [ModifiedBy]) VALUES (17, 11, 2, CAST(N'2021-10-08 21:19:21.507' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerJobs] ([VolunteerJobsID], [VolunteerScheduleDayTimeID], [Job], [ModifiedDate], [ModifiedBy]) VALUES (18, 12, 2, CAST(N'2021-10-08 21:21:22.780' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerJobs] ([VolunteerJobsID], [VolunteerScheduleDayTimeID], [Job], [ModifiedDate], [ModifiedBy]) VALUES (19, 13, 2, CAST(N'2021-10-08 21:23:02.757' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerJobs] ([VolunteerJobsID], [VolunteerScheduleDayTimeID], [Job], [ModifiedDate], [ModifiedBy]) VALUES (20, 14, 2, CAST(N'2021-10-08 21:25:46.633' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerJobs] ([VolunteerJobsID], [VolunteerScheduleDayTimeID], [Job], [ModifiedDate], [ModifiedBy]) VALUES (21, 15, 3, CAST(N'2021-10-08 21:28:42.930' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerJobs] ([VolunteerJobsID], [VolunteerScheduleDayTimeID], [Job], [ModifiedDate], [ModifiedBy]) VALUES (22, 16, 2, CAST(N'2021-10-08 21:31:05.800' AS DateTime), N'ATG')
SET IDENTITY_INSERT [Volunteer].[VolunteerJobs] OFF
SET IDENTITY_INSERT [Volunteer].[VolunteerScheduleDayTime] ON 

INSERT [Volunteer].[VolunteerScheduleDayTime] ([VolunteerScheduleDayTimeID], [VolunteerScheduleWeekID], [DayOfWeek], [AvailableBeginTime], [AvailableEndTime], [IsNoShow], [ActualHoursTotal], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, 3, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, CAST(10 AS Numeric(18, 0)), CAST(N'2021-09-16 21:50:30.990' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleDayTime] ([VolunteerScheduleDayTimeID], [VolunteerScheduleWeekID], [DayOfWeek], [AvailableBeginTime], [AvailableEndTime], [IsNoShow], [ActualHoursTotal], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, 2, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, CAST(3 AS Numeric(18, 0)), CAST(N'2021-09-25 10:24:46.623' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleDayTime] ([VolunteerScheduleDayTimeID], [VolunteerScheduleWeekID], [DayOfWeek], [AvailableBeginTime], [AvailableEndTime], [IsNoShow], [ActualHoursTotal], [ModifiedDate], [ModifiedBy]) VALUES (3, 1, 3, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, CAST(5 AS Numeric(18, 0)), CAST(N'2021-09-25 10:25:01.367' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleDayTime] ([VolunteerScheduleDayTimeID], [VolunteerScheduleWeekID], [DayOfWeek], [AvailableBeginTime], [AvailableEndTime], [IsNoShow], [ActualHoursTotal], [ModifiedDate], [ModifiedBy]) VALUES (4, 1, 4, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, CAST(3 AS Numeric(18, 0)), CAST(N'2021-09-25 10:25:11.597' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleDayTime] ([VolunteerScheduleDayTimeID], [VolunteerScheduleWeekID], [DayOfWeek], [AvailableBeginTime], [AvailableEndTime], [IsNoShow], [ActualHoursTotal], [ModifiedDate], [ModifiedBy]) VALUES (5, 3, 4, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, CAST(4 AS Numeric(18, 0)), CAST(N'2021-09-25 15:26:28.633' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleDayTime] ([VolunteerScheduleDayTimeID], [VolunteerScheduleWeekID], [DayOfWeek], [AvailableBeginTime], [AvailableEndTime], [IsNoShow], [ActualHoursTotal], [ModifiedDate], [ModifiedBy]) VALUES (6, 4, 4, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, CAST(5 AS Numeric(18, 0)), CAST(N'2021-09-29 21:42:28.077' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleDayTime] ([VolunteerScheduleDayTimeID], [VolunteerScheduleWeekID], [DayOfWeek], [AvailableBeginTime], [AvailableEndTime], [IsNoShow], [ActualHoursTotal], [ModifiedDate], [ModifiedBy]) VALUES (7, 5, 1, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, CAST(4 AS Numeric(18, 0)), CAST(N'2021-10-01 18:43:59.947' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleDayTime] ([VolunteerScheduleDayTimeID], [VolunteerScheduleWeekID], [DayOfWeek], [AvailableBeginTime], [AvailableEndTime], [IsNoShow], [ActualHoursTotal], [ModifiedDate], [ModifiedBy]) VALUES (8, 6, 1, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, CAST(4 AS Numeric(18, 0)), CAST(N'2021-10-01 18:44:37.183' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleDayTime] ([VolunteerScheduleDayTimeID], [VolunteerScheduleWeekID], [DayOfWeek], [AvailableBeginTime], [AvailableEndTime], [IsNoShow], [ActualHoursTotal], [ModifiedDate], [ModifiedBy]) VALUES (9, 7, 6, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, CAST(4 AS Numeric(18, 0)), CAST(N'2021-10-08 21:16:22.497' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleDayTime] ([VolunteerScheduleDayTimeID], [VolunteerScheduleWeekID], [DayOfWeek], [AvailableBeginTime], [AvailableEndTime], [IsNoShow], [ActualHoursTotal], [ModifiedDate], [ModifiedBy]) VALUES (10, 8, 6, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, CAST(4 AS Numeric(18, 0)), CAST(N'2021-10-08 21:18:09.323' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleDayTime] ([VolunteerScheduleDayTimeID], [VolunteerScheduleWeekID], [DayOfWeek], [AvailableBeginTime], [AvailableEndTime], [IsNoShow], [ActualHoursTotal], [ModifiedDate], [ModifiedBy]) VALUES (11, 9, 6, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, CAST(4 AS Numeric(18, 0)), CAST(N'2021-10-08 21:19:21.503' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleDayTime] ([VolunteerScheduleDayTimeID], [VolunteerScheduleWeekID], [DayOfWeek], [AvailableBeginTime], [AvailableEndTime], [IsNoShow], [ActualHoursTotal], [ModifiedDate], [ModifiedBy]) VALUES (12, 10, 6, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, CAST(4 AS Numeric(18, 0)), CAST(N'2021-10-08 21:21:22.780' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleDayTime] ([VolunteerScheduleDayTimeID], [VolunteerScheduleWeekID], [DayOfWeek], [AvailableBeginTime], [AvailableEndTime], [IsNoShow], [ActualHoursTotal], [ModifiedDate], [ModifiedBy]) VALUES (13, 11, 6, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, CAST(4 AS Numeric(18, 0)), CAST(N'2021-10-08 21:23:02.757' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleDayTime] ([VolunteerScheduleDayTimeID], [VolunteerScheduleWeekID], [DayOfWeek], [AvailableBeginTime], [AvailableEndTime], [IsNoShow], [ActualHoursTotal], [ModifiedDate], [ModifiedBy]) VALUES (14, 12, 6, CAST(N'09:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, CAST(4 AS Numeric(18, 0)), CAST(N'2021-10-08 21:25:46.633' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleDayTime] ([VolunteerScheduleDayTimeID], [VolunteerScheduleWeekID], [DayOfWeek], [AvailableBeginTime], [AvailableEndTime], [IsNoShow], [ActualHoursTotal], [ModifiedDate], [ModifiedBy]) VALUES (15, 13, 3, CAST(N'09:00:00' AS Time), CAST(N'18:00:00' AS Time), 0, CAST(3 AS Numeric(18, 0)), CAST(N'2021-10-08 21:28:42.930' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleDayTime] ([VolunteerScheduleDayTimeID], [VolunteerScheduleWeekID], [DayOfWeek], [AvailableBeginTime], [AvailableEndTime], [IsNoShow], [ActualHoursTotal], [ModifiedDate], [ModifiedBy]) VALUES (16, 11, 5, CAST(N'09:00:00' AS Time), CAST(N'14:00:00' AS Time), 0, CAST(2 AS Numeric(18, 0)), CAST(N'2021-10-08 21:31:05.800' AS DateTime), N'ATG')
SET IDENTITY_INSERT [Volunteer].[VolunteerScheduleDayTime] OFF
SET IDENTITY_INSERT [Volunteer].[VolunteerScheduleMonth] ON 

INSERT [Volunteer].[VolunteerScheduleMonth] ([VolunteerScheduleMonthID], [VolunteerPersonID], [Month], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, 5, CAST(N'2021-09-16 21:38:07.443' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleMonth] ([VolunteerScheduleMonthID], [VolunteerPersonID], [Month], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, 3, CAST(N'2021-09-25 10:22:35.467' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleMonth] ([VolunteerScheduleMonthID], [VolunteerPersonID], [Month], [ModifiedDate], [ModifiedBy]) VALUES (3, 1, 2, CAST(N'2021-09-25 15:26:28.633' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleMonth] ([VolunteerScheduleMonthID], [VolunteerPersonID], [Month], [ModifiedDate], [ModifiedBy]) VALUES (4, 1, 6, CAST(N'2021-09-29 21:42:28.070' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleMonth] ([VolunteerScheduleMonthID], [VolunteerPersonID], [Month], [ModifiedDate], [ModifiedBy]) VALUES (8, 1, 12, CAST(N'2021-10-01 18:43:59.943' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleMonth] ([VolunteerScheduleMonthID], [VolunteerPersonID], [Month], [ModifiedDate], [ModifiedBy]) VALUES (9, 1, 12, CAST(N'2021-10-01 18:44:37.183' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleMonth] ([VolunteerScheduleMonthID], [VolunteerPersonID], [Month], [ModifiedDate], [ModifiedBy]) VALUES (12, 2, 4, CAST(N'2021-10-08 21:16:22.497' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleMonth] ([VolunteerScheduleMonthID], [VolunteerPersonID], [Month], [ModifiedDate], [ModifiedBy]) VALUES (13, 2, 4, CAST(N'2021-10-08 21:18:09.323' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleMonth] ([VolunteerScheduleMonthID], [VolunteerPersonID], [Month], [ModifiedDate], [ModifiedBy]) VALUES (14, 2, 4, CAST(N'2021-10-08 21:19:21.503' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleMonth] ([VolunteerScheduleMonthID], [VolunteerPersonID], [Month], [ModifiedDate], [ModifiedBy]) VALUES (15, 2, 4, CAST(N'2021-10-08 21:21:22.780' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleMonth] ([VolunteerScheduleMonthID], [VolunteerPersonID], [Month], [ModifiedDate], [ModifiedBy]) VALUES (16, 1, 4, CAST(N'2021-10-08 21:23:02.753' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleMonth] ([VolunteerScheduleMonthID], [VolunteerPersonID], [Month], [ModifiedDate], [ModifiedBy]) VALUES (17, 2, 4, CAST(N'2021-10-08 21:25:46.630' AS DateTime), N'ATG')
SET IDENTITY_INSERT [Volunteer].[VolunteerScheduleMonth] OFF
SET IDENTITY_INSERT [Volunteer].[VolunteerScheduleWeek] ON 

INSERT [Volunteer].[VolunteerScheduleWeek] ([VolunteerScheduleWeekID], [VolunteerScheduleMonthID], [Week], [ModifiedDate], [ModifiedBy]) VALUES (1, 1, 1, CAST(N'2021-09-16 21:44:29.747' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleWeek] ([VolunteerScheduleWeekID], [VolunteerScheduleMonthID], [Week], [ModifiedDate], [ModifiedBy]) VALUES (2, 1, 2, CAST(N'2021-09-25 10:23:17.667' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleWeek] ([VolunteerScheduleWeekID], [VolunteerScheduleMonthID], [Week], [ModifiedDate], [ModifiedBy]) VALUES (3, 3, 2, CAST(N'2021-09-25 15:26:28.633' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleWeek] ([VolunteerScheduleWeekID], [VolunteerScheduleMonthID], [Week], [ModifiedDate], [ModifiedBy]) VALUES (4, 4, 2, CAST(N'2021-09-29 21:42:28.073' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleWeek] ([VolunteerScheduleWeekID], [VolunteerScheduleMonthID], [Week], [ModifiedDate], [ModifiedBy]) VALUES (5, 8, 1, CAST(N'2021-10-01 18:43:59.947' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleWeek] ([VolunteerScheduleWeekID], [VolunteerScheduleMonthID], [Week], [ModifiedDate], [ModifiedBy]) VALUES (6, 9, 1, CAST(N'2021-10-01 18:44:37.183' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleWeek] ([VolunteerScheduleWeekID], [VolunteerScheduleMonthID], [Week], [ModifiedDate], [ModifiedBy]) VALUES (7, 12, 2, CAST(N'2021-10-08 21:16:22.497' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleWeek] ([VolunteerScheduleWeekID], [VolunteerScheduleMonthID], [Week], [ModifiedDate], [ModifiedBy]) VALUES (8, 13, 2, CAST(N'2021-10-08 21:18:09.323' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleWeek] ([VolunteerScheduleWeekID], [VolunteerScheduleMonthID], [Week], [ModifiedDate], [ModifiedBy]) VALUES (9, 14, 2, CAST(N'2021-10-08 21:19:21.503' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleWeek] ([VolunteerScheduleWeekID], [VolunteerScheduleMonthID], [Week], [ModifiedDate], [ModifiedBy]) VALUES (10, 15, 2, CAST(N'2021-10-08 21:21:22.780' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleWeek] ([VolunteerScheduleWeekID], [VolunteerScheduleMonthID], [Week], [ModifiedDate], [ModifiedBy]) VALUES (11, 16, 2, CAST(N'2021-10-08 21:23:02.757' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleWeek] ([VolunteerScheduleWeekID], [VolunteerScheduleMonthID], [Week], [ModifiedDate], [ModifiedBy]) VALUES (12, 17, 2, CAST(N'2021-10-08 21:25:46.633' AS DateTime), N'ATG')
INSERT [Volunteer].[VolunteerScheduleWeek] ([VolunteerScheduleWeekID], [VolunteerScheduleMonthID], [Week], [ModifiedDate], [ModifiedBy]) VALUES (13, 15, 2, CAST(N'2021-10-08 21:28:42.930' AS DateTime), N'ATG')
SET IDENTITY_INSERT [Volunteer].[VolunteerScheduleWeek] OFF
/****** Object:  Index [UK_FoodShelfCertification]    Script Date: 10/8/2021 11:21:40 PM ******/
ALTER TABLE [Foodshelf].[FoodShelfCertification] ADD  CONSTRAINT [UK_FoodShelfCertification] UNIQUE NONCLUSTERED 
(
	[FoodShelfCertificationID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_FoodTypeGiven]    Script Date: 10/8/2021 11:21:40 PM ******/
ALTER TABLE [Foodshelf].[FoodTypeGiven] ADD  CONSTRAINT [UK_FoodTypeGiven] UNIQUE NONCLUSTERED 
(
	[FoodTypeGivenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_FoodTypeGivenRecord]    Script Date: 10/8/2021 11:21:40 PM ******/
ALTER TABLE [Foodshelf].[FoodTypeGiven] ADD  CONSTRAINT [UK_FoodTypeGivenRecord] UNIQUE NONCLUSTERED 
(
	[FoodTypeGivenID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_Signature]    Script Date: 10/8/2021 11:21:40 PM ******/
ALTER TABLE [Foodshelf].[Signature] ADD  CONSTRAINT [UK_Signature] UNIQUE NONCLUSTERED 
(
	[SignatureID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_FamilyRelationships]    Script Date: 10/8/2021 11:21:40 PM ******/
ALTER TABLE [Person].[FamilyRelationships] ADD  CONSTRAINT [UK_FamilyRelationships] UNIQUE NONCLUSTERED 
(
	[ClientPersonID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_IncomeSource]    Script Date: 10/8/2021 11:21:40 PM ******/
ALTER TABLE [Person].[Income] ADD  CONSTRAINT [UK_IncomeSource] UNIQUE NONCLUSTERED 
(
	[IncomeSourceRowID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_LUCounty]    Script Date: 10/8/2021 11:21:40 PM ******/
ALTER TABLE [Person].[LUCounty] ADD  CONSTRAINT [UK_LUCounty] UNIQUE NONCLUSTERED 
(
	[CountyID] ASC,
	[CityID] ASC,
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_ProgramService]    Script Date: 10/8/2021 11:21:40 PM ******/
ALTER TABLE [Person].[ProgramServicesUsed] ADD  CONSTRAINT [PK_ProgramService] UNIQUE NONCLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_ProgramServicesUsed]    Script Date: 10/8/2021 11:21:40 PM ******/
ALTER TABLE [Person].[ProgramServicesUsed] ADD  CONSTRAINT [UK_ProgramServicesUsed] UNIQUE NONCLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_Signature]    Script Date: 10/8/2021 11:21:40 PM ******/
ALTER TABLE [Signature].[Signature] ADD  CONSTRAINT [UK_Signature] UNIQUE NONCLUSTERED 
(
	[SignatureID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_Signatures]    Script Date: 10/8/2021 11:21:40 PM ******/
ALTER TABLE [Signature].[Signatures] ADD  CONSTRAINT [UK_Signatures] UNIQUE NONCLUSTERED 
(
	[SignaturesID] ASC,
	[PersonID] ASC,
	[SignatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_SSN]    Script Date: 10/8/2021 11:21:40 PM ******/
ALTER TABLE [SSN].[SSN] ADD  CONSTRAINT [UK_SSN] UNIQUE NONCLUSTERED 
(
	[SSN] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Person].[LanguagesSpoken] ADD  CONSTRAINT [DF_LanguagesSpoken_rowid]  DEFAULT (newid()) FOR [rowid]
GO
ALTER TABLE [Person].[LUContactType] ADD  CONSTRAINT [DF_ContactType_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[GuidelinesByProgram]  WITH CHECK ADD  CONSTRAINT [FK_GuidelinesByProgram_LUStateFederalProgram] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[LUStateFederalProgram] ([StateFederalProgramID])
GO
ALTER TABLE [dbo].[GuidelinesByProgram] CHECK CONSTRAINT [FK_GuidelinesByProgram_LUStateFederalProgram]
GO
ALTER TABLE [dbo].[GuidelinesByProgram]  WITH CHECK ADD  CONSTRAINT [FK_GuidelinesByProgram_ProgramGuidelines] FOREIGN KEY([GuidelinesID])
REFERENCES [dbo].[ProgramGuidelines] ([ProgramGuidelinesID])
GO
ALTER TABLE [dbo].[GuidelinesByProgram] CHECK CONSTRAINT [FK_GuidelinesByProgram_ProgramGuidelines]
GO
ALTER TABLE [Foodshelf].[FoodShelfCertification]  WITH CHECK ADD  CONSTRAINT [FK_FoodShelfCertification_Person] FOREIGN KEY([PersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Foodshelf].[FoodShelfCertification] CHECK CONSTRAINT [FK_FoodShelfCertification_Person]
GO
ALTER TABLE [Foodshelf].[FoodTypeGiven]  WITH CHECK ADD  CONSTRAINT [FK_FoodTypeGiven_Person] FOREIGN KEY([PersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Foodshelf].[FoodTypeGiven] CHECK CONSTRAINT [FK_FoodTypeGiven_Person]
GO
ALTER TABLE [Foodshelf].[HouseholdNotes]  WITH CHECK ADD  CONSTRAINT [FK_HouseholdNotes_Person] FOREIGN KEY([ClientPersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Foodshelf].[HouseholdNotes] CHECK CONSTRAINT [FK_HouseholdNotes_Person]
GO
ALTER TABLE [Foodshelf].[Signature]  WITH CHECK ADD  CONSTRAINT [FK_Signature_FoodShelfCertification] FOREIGN KEY([FoodShelfCertificationID], [PersonID])
REFERENCES [Foodshelf].[FoodShelfCertification] ([FoodShelfCertificationID], [PersonID])
GO
ALTER TABLE [Foodshelf].[Signature] CHECK CONSTRAINT [FK_Signature_FoodShelfCertification]
GO
ALTER TABLE [Person].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_LUAddressType] FOREIGN KEY([AddressTypeID])
REFERENCES [Person].[LUAddressType] ([AddressTypeID])
GO
ALTER TABLE [Person].[Address] CHECK CONSTRAINT [FK_Address_LUAddressType]
GO
ALTER TABLE [Person].[Demographics]  WITH CHECK ADD  CONSTRAINT [FK_Demographics_LUCountryOfOrigin] FOREIGN KEY([CountryOfOrigin])
REFERENCES [Person].[LUCountryOfOrigin] ([CountryID])
GO
ALTER TABLE [Person].[Demographics] CHECK CONSTRAINT [FK_Demographics_LUCountryOfOrigin]
GO
ALTER TABLE [Person].[Demographics]  WITH CHECK ADD  CONSTRAINT [FK_Demographics_LUEducationCategory] FOREIGN KEY([EducationCategoryID])
REFERENCES [Person].[LUEducationCategory] ([EducationCategoryID])
GO
ALTER TABLE [Person].[Demographics] CHECK CONSTRAINT [FK_Demographics_LUEducationCategory]
GO
ALTER TABLE [Person].[Demographics]  WITH CHECK ADD  CONSTRAINT [FK_Demographics_LUEthnicity] FOREIGN KEY([Ethnicity])
REFERENCES [Person].[LUEthnicity] ([EthnicityID])
GO
ALTER TABLE [Person].[Demographics] CHECK CONSTRAINT [FK_Demographics_LUEthnicity]
GO
ALTER TABLE [Person].[Demographics]  WITH CHECK ADD  CONSTRAINT [FK_Demographics_LUFamilyStatusType] FOREIGN KEY([FamilyStatusType])
REFERENCES [Person].[LUFamilyStatusType] ([FamilyStatusTypeID])
GO
ALTER TABLE [Person].[Demographics] CHECK CONSTRAINT [FK_Demographics_LUFamilyStatusType]
GO
ALTER TABLE [Person].[Demographics]  WITH CHECK ADD  CONSTRAINT [FK_Demographics_LUHousingStatus] FOREIGN KEY([HousingStatus])
REFERENCES [Person].[LUHousingStatus] ([HousingStatusID])
GO
ALTER TABLE [Person].[Demographics] CHECK CONSTRAINT [FK_Demographics_LUHousingStatus]
GO
ALTER TABLE [Person].[Demographics]  WITH CHECK ADD  CONSTRAINT [FK_Demographics_LUInsuranceType] FOREIGN KEY([InsuranceType])
REFERENCES [Person].[LUInsuranceType] ([InsuranceTypeID])
GO
ALTER TABLE [Person].[Demographics] CHECK CONSTRAINT [FK_Demographics_LUInsuranceType]
GO
ALTER TABLE [Person].[Demographics]  WITH CHECK ADD  CONSTRAINT [FK_Demographics_LURace] FOREIGN KEY([Race])
REFERENCES [Person].[LURace] ([RaceID])
GO
ALTER TABLE [Person].[Demographics] CHECK CONSTRAINT [FK_Demographics_LURace]
GO
ALTER TABLE [Person].[Demographics]  WITH CHECK ADD  CONSTRAINT [FK_Deomographics_Person] FOREIGN KEY([PersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Person].[Demographics] CHECK CONSTRAINT [FK_Deomographics_Person]
GO
ALTER TABLE [Person].[FamilyRelationships]  WITH CHECK ADD  CONSTRAINT [FK_FamilyRelationships_LUFamilyRelationship] FOREIGN KEY([RelationshipID])
REFERENCES [Person].[LUFamilyRelationship] ([FamilyRelationshipID])
GO
ALTER TABLE [Person].[FamilyRelationships] CHECK CONSTRAINT [FK_FamilyRelationships_LUFamilyRelationship]
GO
ALTER TABLE [Person].[FamilyRelationships]  WITH CHECK ADD  CONSTRAINT [FK_FamilyRelationships_Person] FOREIGN KEY([ClientPersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Person].[FamilyRelationships] CHECK CONSTRAINT [FK_FamilyRelationships_Person]
GO
ALTER TABLE [Person].[Income]  WITH CHECK ADD  CONSTRAINT [FK_Income_LUIncomeSource] FOREIGN KEY([IncomeSourceID])
REFERENCES [Person].[LUIncomeSource] ([IncomeSourceID])
GO
ALTER TABLE [Person].[Income] CHECK CONSTRAINT [FK_Income_LUIncomeSource]
GO
ALTER TABLE [Person].[LanguagesSpoken]  WITH CHECK ADD  CONSTRAINT [FK_LanguagesSpoken_LULanguage] FOREIGN KEY([LanguagesSpokenID])
REFERENCES [Person].[LULanguage] ([LanguageID])
GO
ALTER TABLE [Person].[LanguagesSpoken] CHECK CONSTRAINT [FK_LanguagesSpoken_LULanguage]
GO
ALTER TABLE [Person].[LanguagesSpoken]  WITH CHECK ADD  CONSTRAINT [FK_LanguagesSpoken_Person] FOREIGN KEY([PersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Person].[LanguagesSpoken] CHECK CONSTRAINT [FK_LanguagesSpoken_Person]
GO
ALTER TABLE [Person].[LUCity]  WITH CHECK ADD  CONSTRAINT [FK_LUCity_LUCounty] FOREIGN KEY([CountyID])
REFERENCES [Person].[LUCounty] ([CountyID])
GO
ALTER TABLE [Person].[LUCity] CHECK CONSTRAINT [FK_LUCity_LUCounty]
GO
ALTER TABLE [Person].[LUCounty]  WITH CHECK ADD  CONSTRAINT [FK_LUCounty_LUState] FOREIGN KEY([StateID])
REFERENCES [Person].[LUState] ([StateID])
GO
ALTER TABLE [Person].[LUCounty] CHECK CONSTRAINT [FK_LUCounty_LUState]
GO
ALTER TABLE [Person].[LUPostalCode]  WITH CHECK ADD  CONSTRAINT [FK_LUPostalCode_LUCity] FOREIGN KEY([CityID])
REFERENCES [Person].[LUCity] ([CityID])
GO
ALTER TABLE [Person].[LUPostalCode] CHECK CONSTRAINT [FK_LUPostalCode_LUCity]
GO
ALTER TABLE [Person].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_HouseholdNotes_Person] FOREIGN KEY([PersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Person].[Notes] CHECK CONSTRAINT [FK_HouseholdNotes_Person]
GO
ALTER TABLE [Person].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddresses_Address] FOREIGN KEY([AddressID])
REFERENCES [Person].[Address] ([AddressID])
GO
ALTER TABLE [Person].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddresses_Address]
GO
ALTER TABLE [Person].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddresses_Person] FOREIGN KEY([PersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Person].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddresses_Person]
GO
ALTER TABLE [Person].[Phone]  WITH CHECK ADD  CONSTRAINT [FK_Phone_LUPhoneType] FOREIGN KEY([PhoneType])
REFERENCES [Person].[LUPhoneType] ([PhoneTypeID])
GO
ALTER TABLE [Person].[Phone] CHECK CONSTRAINT [FK_Phone_LUPhoneType]
GO
ALTER TABLE [Person].[Phone]  WITH CHECK ADD  CONSTRAINT [FK_Phone_Person] FOREIGN KEY([PersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Person].[Phone] CHECK CONSTRAINT [FK_Phone_Person]
GO
ALTER TABLE [Person].[Programs]  WITH CHECK ADD  CONSTRAINT [FK_Programs_Person] FOREIGN KEY([PersonID])
REFERENCES [Person].[Person] ([PersonID])
GO
ALTER TABLE [Person].[Programs] CHECK CONSTRAINT [FK_Programs_Person]
GO
ALTER TABLE [Person].[ProgramServicesUsed]  WITH CHECK ADD  CONSTRAINT [FK_ProgramServicesUsed_Programs] FOREIGN KEY([PersonID], [ProgramID])
REFERENCES [Person].[Programs] ([PersonID], [ProgramID])
GO
ALTER TABLE [Person].[ProgramServicesUsed] CHECK CONSTRAINT [FK_ProgramServicesUsed_Programs]
GO
ALTER TABLE [Signature].[Signatures]  WITH CHECK ADD  CONSTRAINT [FK_Signatures_Signature1] FOREIGN KEY([SignatureID], [PersonID])
REFERENCES [Signature].[Signature] ([SignatureID], [PersonID])
GO
ALTER TABLE [Signature].[Signatures] CHECK CONSTRAINT [FK_Signatures_Signature1]
GO
ALTER TABLE [Volunteer].[VolunteerContactInformation]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerContactInformation_LUVolunteerType] FOREIGN KEY([VolunteerTypeID])
REFERENCES [Volunteer].[LUVolunteerType] ([VolunteerTypeID])
GO
ALTER TABLE [Volunteer].[VolunteerContactInformation] CHECK CONSTRAINT [FK_VolunteerContactInformation_LUVolunteerType]
GO
ALTER TABLE [Volunteer].[VolunteerContactInformation]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerContactInformation_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organization] ([OrganizationID])
GO
ALTER TABLE [Volunteer].[VolunteerContactInformation] CHECK CONSTRAINT [FK_VolunteerContactInformation_Organization]
GO
ALTER TABLE [Volunteer].[VolunteerEmergencyContact]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerEmergencyContact_VolunteerContactInformation] FOREIGN KEY([VolunteerPersonID])
REFERENCES [Volunteer].[VolunteerContactInformation] ([VolunteerPersonID])
GO
ALTER TABLE [Volunteer].[VolunteerEmergencyContact] CHECK CONSTRAINT [FK_VolunteerEmergencyContact_VolunteerContactInformation]
GO
ALTER TABLE [Volunteer].[VolunteerJobs]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerJobs_LUVolunteerJobType] FOREIGN KEY([Job])
REFERENCES [Volunteer].[LUVolunteerJobType] ([VolunteerJobTypeID])
GO
ALTER TABLE [Volunteer].[VolunteerJobs] CHECK CONSTRAINT [FK_VolunteerJobs_LUVolunteerJobType]
GO
ALTER TABLE [Volunteer].[VolunteerJobs]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerJobs_VolunteerScheduleDayTime] FOREIGN KEY([VolunteerScheduleDayTimeID])
REFERENCES [Volunteer].[VolunteerScheduleDayTime] ([VolunteerScheduleDayTimeID])
GO
ALTER TABLE [Volunteer].[VolunteerJobs] CHECK CONSTRAINT [FK_VolunteerJobs_VolunteerScheduleDayTime]
GO
ALTER TABLE [Volunteer].[VolunteerNotes]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerNotes_VolunteerContactInformation] FOREIGN KEY([VolunteerPersonID])
REFERENCES [Volunteer].[VolunteerContactInformation] ([VolunteerPersonID])
GO
ALTER TABLE [Volunteer].[VolunteerNotes] CHECK CONSTRAINT [FK_VolunteerNotes_VolunteerContactInformation]
GO
ALTER TABLE [Volunteer].[VolunteerScheduleDayTime]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerScheduleDayTime_LUVolunteerDay] FOREIGN KEY([DayOfWeek])
REFERENCES [Volunteer].[LUVolunteerDay] ([DayOfWeekID])
GO
ALTER TABLE [Volunteer].[VolunteerScheduleDayTime] CHECK CONSTRAINT [FK_VolunteerScheduleDayTime_LUVolunteerDay]
GO
ALTER TABLE [Volunteer].[VolunteerScheduleDayTime]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerScheduleDayTime_VolunteerScheduleWeek] FOREIGN KEY([VolunteerScheduleWeekID])
REFERENCES [Volunteer].[VolunteerScheduleWeek] ([VolunteerScheduleWeekID])
GO
ALTER TABLE [Volunteer].[VolunteerScheduleDayTime] CHECK CONSTRAINT [FK_VolunteerScheduleDayTime_VolunteerScheduleWeek]
GO
ALTER TABLE [Volunteer].[VolunteerScheduleMonth]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerScheduleMonth_LUVolunteerScheduleMonth] FOREIGN KEY([Month])
REFERENCES [Volunteer].[LUVolunteerScheduleMonth] ([MonthID])
GO
ALTER TABLE [Volunteer].[VolunteerScheduleMonth] CHECK CONSTRAINT [FK_VolunteerScheduleMonth_LUVolunteerScheduleMonth]
GO
ALTER TABLE [Volunteer].[VolunteerScheduleMonth]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerScheduleMonth_VolunteerContactInformation] FOREIGN KEY([VolunteerPersonID])
REFERENCES [Volunteer].[VolunteerContactInformation] ([VolunteerPersonID])
GO
ALTER TABLE [Volunteer].[VolunteerScheduleMonth] CHECK CONSTRAINT [FK_VolunteerScheduleMonth_VolunteerContactInformation]
GO
ALTER TABLE [Volunteer].[VolunteerScheduleWeek]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerScheduleWeek_VolunteerScheduleMonth] FOREIGN KEY([VolunteerScheduleMonthID])
REFERENCES [Volunteer].[VolunteerScheduleMonth] ([VolunteerScheduleMonthID])
GO
ALTER TABLE [Volunteer].[VolunteerScheduleWeek] CHECK CONSTRAINT [FK_VolunteerScheduleWeek_VolunteerScheduleMonth]
GO
/****** Object:  StoredProcedure [dbo].[GetPersonAddressByType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPersonAddressByType] (@PersonID int, @AddressType int, @Address Nvarchar(200) output)
AS
BEGIN

	SELECT @Address = AddressLine1 + ' ' + City + ' ' + State FROM Person.Address
	WHERE PersonID = @PersonID AND AddressTypeID = @AddressType

END
GO
/****** Object:  StoredProcedure [dbo].[pDeleteAddress]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Address
Description: Delete data from Address table.This table has the possibility of duplicate rows because
	persons can have more than one address. Make sure that delete haplpens based on AddressID PersonId as extra
	precaution
Revisions:
**************************************************************************************************/

create PROCEDURE [dbo].[pDeleteAddress](
	@AddressID int,
	@PersonID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempAddressID int,
	@TempPersonID int
	
	
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempAddressID =0;
	SET @TempAddressID = 0;
		



		BEGIN TRY
		  BEGIN TRANSACTION;
			
		/****************************************************************************/	
		  
		SELECT @TempAddressID = @AddressID
			FROM Person.Address
				WHERE
					AddressID = @AddressID AND PersonID = @PersonID
		
		IF @TempAddressID = 0 OR @TempAddressID IS NULL
			BEGIN
				SELECT @ErrorStatus='-7015 PersonID/AddressID combo doesnt exist in Address';
				SET @Success =0;
				RAISERROR(@ErrorStatus,16,1);
	
			END			
					
		IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-7000';
				SET @Success = 0;
				RAISERROR (@ErrorStatus,16,1);
			END
			
			  DELETE FROM Person.Address WHERE AddressID = @AddressID and PersonID = @PersonID;
				
				
				set @success =1;
				set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
			 --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SET @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
			 
			 SELECT @ErrorStatus =@ErrorStatus + ' -7001' +' Delete Failed';
			 SET @Success =0;
			 
			 RAISERROR(@ErrorStatus, 16, 1);
			 	 
		
		END CATCH
		
	
END











GO
/****** Object:  StoredProcedure [dbo].[pDeleteAddressType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUAddressType
Description: Deletes from LUAddressType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteAddressType](
	@AddressTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempAddressTypeID int
	
	SET @TempAddressTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@AddressTypeID = 0) OR (@AddressTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6015 AddressTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempAddressTypeID =@AddressTypeID
				  FROM person.LUAddressType
					 WHERE  AddressTypeID= @AddressTypeID
			
								 
				IF ((@TempAddressTypeID=0) OR (@TempAddressTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6018 AddressTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUAddressType
					 WHERE AddressTypeID = @AddressTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6013 DELETE Fail AddressType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteCity]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUCity
Description: Deletes from LUCity
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteCity](
	@CityID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempCityID int
	
	SET @TempCityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@CityID = 0) OR (@CityID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60055 CityID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempCityID =@CityID
				  FROM person.LUCity
					 WHERE  CityID= @CityID
			
								 
				IF ((@TempCityID=0) OR (@TempCityID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60058 CityID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60050';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUCity
					 WHERE CityID = @CityID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60053 DELETE Fail City';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteClient]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[pDeleteClient](
	@PersonID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
		@TempPersonID int	
		SET @TempPersonID =0;	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			IF (@PersonID = 0) or (@PersonID) = NULL --Must have a person id to know the person
				BEGIN
					SELECT @ErrorStatus =  '-60055 PersonID cannot be 0 or null';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
	
/****************************************************************************/
			--Check to see if the person exists
			SELECT @TempPersonID = PersonID
				FROM person.person
					WHERE PersonID = @PersonID
					
	     		If (@TempPersonID = NULL) OR (@TempPersonID= 0) 
					BEGIN
						SET @ErrorStatus = ' -60052 PersonID Doesnt Exist in Person table.'; 
						RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
		
					END	

/****************************************************************************/	          

			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60050';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
			 --StateID is not updated because that should not change!
			  UPDATE Person.Person
				SET IsDeleted = 1
				WHERE
					PersonID = @PersonID;
					
			  	set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			   --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60051 Delete Failed on Person ';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END

GO
/****** Object:  StoredProcedure [dbo].[pDeleteContactType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUContactType
Description: Deletes from LUContactType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteContactType](
	@ContactTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempContactTypeID int
	
	SET @TempContactTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@ContactTypeID = 0) OR (@ContactTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60025 ContactTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempContactTypeID =ContactTypeID
				  FROM person.LUContactType
					 WHERE  ContactTypeID= @ContactTypeID
			
								 
				IF ((@TempContactTypeID=0) OR (@TempContactTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60028 ContactTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60020';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUContactType
					 WHERE ContactTypeID = @ContactTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60023 DELETE Fail ContactType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteDemographics]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Demographics
Description: Deletes from Demographics
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteDemographics](
	@DemographicsID int,
	@PersonID int,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempDemographicsID int,
	@TempPersonID int
	
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempDemographicsID =0;		

	
		
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@DemographicsID = 0) OR (@DemographicsID IS NULL)) OR  ((@PersonID = 0) OR (@PersonID IS NULL))
				  BEGIN
					SELECT @ErrorStatus = '2005 DemographicsID/PersonID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				--Check to see that the IDs match.. paranoid? NO! Have had worse things happen....Data integrity can fail!
				--Could use count but that has some optimization and indexing problems....
				SELECT @TempPersonID = PersonID, @TempDemographicsID = DemographicsID 
				  FROM person.Demographics
					 WHERE PersonID = @PersonID AND DemographicsID = @DemographicsID
			
								 
				IF ((@TempDemographicsID=0) OR (@TempDemographicsID IS  NULL))OR ((@TempPersonID =0) OR (@TempPersonID IS NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -2008 DemographicsID/PersonID combo does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -2000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.Demographics
					 WHERE DemographicsID = @DemographicsID AND PersonID = @PersonID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-2001 DELETE Fail Demographics';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteEducationCategory]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUEducationCategory
Description: Deletes from LUEducationCategory
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteEducationCategory](
	@EducationCategoryID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempEducationCategoryID int

	
	SET @TempEducationCategoryID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@EducationCategoryID = 0) OR (@EducationCategoryID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60065 EducationCategoryID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempEducationCategoryID = EducationCategoryID 
				  FROM person.LUEducationCategory
					 WHERE EducationCategoryID = @TempEducationCategoryID
			
								 
				IF ((@TempEducationCategoryID=0) OR (@TempEducationCategoryID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60078 EducationCategoryID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -2000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUEducationCategory
					 WHERE EducationCategoryID = @EducationCategoryID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60073 DELETE Fail EducationCategory';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteEthnicity]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUEthnicity
Description: Deletes from LUEthicity
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteEthnicity](
	@EthnicityID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempEthnicityID int
	
	SET @TempEthnicityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@EthnicityID = 0) OR (@EthnicityID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60085 EthnicityID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempEthnicityID =EthnicityID  
				  FROM person.LUEthnicity
					 WHERE EthnicityID = @TempEthnicityID
			
								 
				IF ((@TempEthnicityID=0) OR (@TempEthnicityID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60088 EthnicityID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -2000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUEthnicity
					 WHERE EthnicityID = @EthnicityID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60083 DELETE Fail Ethnicity';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteFamilyMember]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************
*
*Author: Gary Savard
*Date: 15 April 2011
*
Description: This SP covers the instances where a family member is deleted from a household. It assumes that if the 
person is the head of the old household, that another person has been promoted to head of that household already. It will also delete 
an entire household, if requested.

REV: 25 July 11. Commented out delete entire household per Carol Paul's request

THIS SP IS NOT BEING USED !!! MAY RETURN IN THE FUTURE!
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteFamilyMember](
	@DeletePersonID int,--The person/Household,
	@HeadofHouseholdPersonID int, --Might be the same as @DeletePersonID if it is the head of household!
	--@NewHeadOfHouseholdPersonID int, --Only filled if the person to be deleted is currently the head of household
	--@IsHouseholdDelete bit,--This set to 1 will delete the entire household
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

--	DECLARE
--	@ErrNo INT,
--	@LogMsg NVarchar(50),
--	@journalSuccess BIT,
--	@JournalErrorStatus NVarchar(50)
	
	
--	SET @Success = 0;
--	SET @ErrorStatus ='';
--	SET @ErrNo =0;	
--	SET @LogMsg ='Deleted from household. IsHouseholdDelete: '+ CONVERT(NVarchar(50),@ISHouseholdDelete)

	
	           
--BEGIN TRY
	-- BEGIN TRANSACTION;
	----Place a record in the Journal Table with the appropriate information before making the change. 
	----Update the Relationship table with the new household's client ID and the new relationship
	----Make update to demographics table for new family status. 
	
	--			 EXEC dbo.pInsertJournalClientFamilyChanges @DeletePersonID,
	--														@HeadofHouseholdPersonID,
	--														@NewHeadOfHouseholdPersonID,
	--														@LogMsg,
	--														'',--Notes Field blank for now
	--														@ModifiedBy,
	--														@JournalSuccess,--we don't care about the return values of this and error status for time being
	--														@JournalErrorStatus
															
					
						
	
		--IF @IsHouseholdDelete =1
		----cursors are evil so we will use a temp table. This assum that the family as a whole is to be deleted.
		--	BEGIN
		--		--We need to retrieve the entire family from the FamilyRelationships table. Using temp table because
		--		--cursors are not very efficient. Do this to isolate this family's records from the main tables to help avoid
		--		--problems with batch updates in main system
							
		--		 DECLARE
		--			@RowCount int,
		--			@NumberRecs int,
		--			@tmpPersonID int,
		--			@tmpClientPersonID int
					
		--			SET @tmpClientPersonID = @HeadOfHouseholdPersonID
					
					
		--			SET @RowCount =1
					
		--		 CREATE TABLE #tempfamily
		--			(RowID int identity(1,1), PersID int)
					
		--			INSERT #tempfamily
					
		--			SELECT PersonID
		--				FROM Person.FamilyRelationships 
		--				WHERE ClientPersonID=@HeadOfHouseholdPersonID
						
		--				SET @NumberRecs = @@ROWCOUNT --How many did we insert into #tempFamily
						
		--				WHILE @RowCount <=@NumberRecs
		--					BEGIN
		--						SELECT @tmpPersonID =PersID 
		--							FROM #tempfamily
		--							WHERE RowID =@Rowcount
							
		--					UPDATE Person.Person
		--						SET IsDeleted =1
		--						WHERE PersonID =@TmpPersonID
								
		--						SELECT @ErrNo =@@ERROR 
								
		--						 SET @RowCount = @RowCount + 1
								
		--					END --End While
					
					--IF @ErrNo<>0
					--	BEGIN
					--		SET @ErrorStatus ='Failed on Delete Family Member PersonID: ' + CONVERT(NVarchar(50),@TmpPersonID)
					--		RAISERROR(@ErrorStatus,16,0)
					
					--	END--IF@ErrNO
							
					
						
					--	--Finally, delete the client
					--	UPDATE person.Person
					--		SET IsDeleted =1
					--		WHERE PersonID =@HeadOfHouseholdPersonID
					--	SELECT @ErrNo =@@ERROR 
					
					--IF @ErrNo<>0
					--	BEGIN
					--		SET @ErrorStatus ='Failed on Delete PersonID: ' + CONVERT(NVarchar(50),@HeadOfHouseholdPersonID)
					--		RAISERROR(@ErrorStatus,16,0)
					
					--	END--@Errno
															
					
				--DROP TABLE #tempfamily
								
			--END
			
			----ELSE IF	 @IsHouseholdDelete =0
			--	BEGIN
			--		--Delete the client
			--		UPDATE Person.Person 
			--			SET IsDeleted =1
			--			WHERE PersonID =@HeadOfHouseholdPersonID
						
			--	SELECT @ErrNo =@@ERROR 
					
			--		IF @ErrNo<>0
			--			BEGIN
			--				SET @ErrorStatus ='Failed on Client Delete'
			--				RAISERROR(@ErrorStatus,16,0)
					
			--			END--@errNO=...
				--END--Else IF
					
				
						
	/******************************************************************************************************
	
	 
	
	--*******************************************************************************************************/
	--	COMMIT TRANSACTION;
	
	--	END TRY

	--	BEGIN CATCH
	--		  ROLLBACK TRANSACTION;
	--		  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
	--			--We only care if the error was not raised by SSE
	--			IF @@ERROR <> 50000
	--				BEGIN
	--					SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @ErrNo);
	--				END
	--		  SET @Success =0;
	--		  SET @ErrorStatus=  @ErrorStatus + '-1001';
	--		  RAISERROR(@ErrorStatus, 15, 1);
		
			  
	--	END CATCH
		
















GO
/****** Object:  StoredProcedure [dbo].[pDeleteFamilyStatusType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*************************************************************************************************

*Author: Gary Savard
*Date: 14 March 11
*Table Name: LUFamilyStatusType
Description: Deletes from LUFamilyStatusType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteFamilyStatusType](
	@FamilyStatusTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempFamilyStatusTypeID int
	
	SET @FamilyStatusTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@FamilyStatusTypeID = 0) OR (@FamilyStatusTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '600015 FamilyStatusTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @FamilyStatusTypeID =FamilySTatusTypeID  
				  FROM person.LUFamilyStatusType
					 WHERE FamilyStatusTypeID = @FamilyStatusTypeID
			
								 
				IF ((@TempFamilyStatusTypeID=0) OR (@TempFamilyStatusTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -600018 FamilySTatusTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -600010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUFamilyStatusType
					 WHERE FamilyStatusTypeID = @FamilyStatusTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600013 DELETE Fail LuFamilyStatusType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END














GO
/****** Object:  StoredProcedure [dbo].[pDeleteFoodTypeGiven]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: FoodTypeGiven
Description: Deletes from FoodTypeGiven. A person may have 1 to may records here. Deletes only one based
on input ID.
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteFoodTypeGiven](
	@PersonID int,
	@FoodTypeGivenID int, --This is the key. 
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempFoodTypeGivenID int
	
	SET @TempFoodTypeGivenID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@FoodTypeGivenID = 0) OR (@FoodTypeGivenID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '600005 FoodTypeGiven cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				  
				  IF ((@PersonID = 0) OR (@PersonID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6000006 PersonID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				--This just avoids deleting a FoodTypeGivenID if it is associated with a different PersonID
				SELECT @TempFoodTypeGivenID =  FoodTypeGivenID
				  FROM Foodshelf.FoodTypeGiven
					 WHERE  PersonID= @PersonID AND FoodTypeGivenID = @FoodTypeGivenID
			
								 
				IF ((@TempFoodTypeGivenID=0) OR (@TempFoodTypeGivenID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -600008 FoodTypeGivenID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -600010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM Foodshelf.FoodTypeGiven
					 WHERE FoodTypeGivenID = @FoodTypeGivenID AND PersonID = @PersonID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600013 DELETE Fail FoodTypeGiven';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteHouseholdTransferOptions]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 22 April 11
*Table Name: HouseholdTransferOptions
Description: Deletes from HouseholdTransferOptions. Since the fields are free format in this table,
we only take in the ID for deletion
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteHouseholdTransferOptions](
	@ActionToTakeID  int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempActionToTakeID int
	
	SET @TempActionToTakeID  =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@ActionToTakeID = 0) OR (@ActionToTakeID  IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6015 ActionToTakeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempActionToTakeID =@ActionToTakeID 
				  FROM dbo.LUHouseholdTransferOptions
					 WHERE  HouseholdTransferActionID= @ActionToTakeID
			
								 
				IF ((@TempActionToTakeID=0) OR (@TempActionToTakeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6018 ActionToTakeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  dbo.LUHouseholdTransferOptions
					 WHERE HouseholdTransferActionID = @TempActionToTakeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6013 DELETE Fail LUHouseholdTransferOptions';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [dbo].[pDeleteHousingStatus]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUHousingStatus
Description: Deletes from LUHousingStatus
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteHousingStatus](
	@HousingStatusID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempHousingStatusID int
	
	SET @TempHousingStatusID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@HousingStatusID = 0) OR (@HousingStatusID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60085 HousingStatusID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempHousingStatusID =HousingStatusID
				  FROM person.LUHousingStatus
					 WHERE  HousingStatusID= @HousingStatusID
			
								 
				IF ((@TempHousingStatusID=0) OR (@TempHousingStatusID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60088 HousingStatusID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60080';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUHousingStatus
					 WHERE HousingStatusID = @HousingStatusID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60083 DELETE Fail HousingStatus';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteIncomeSource]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUIncomeSource
Description: Deletes from LUIncomeSource
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteIncomeSource](
	@IncomeSourceID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempIncomeSourceID int
	
	SET @TempIncomeSourceID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@IncomeSourceID = 0) OR (@IncomeSourceID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60095 IncomeSourceID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempIncomeSourceID = IncomeSourceID 
				  FROM person.LUIncomeSource
					 WHERE IncomeSourceID = @IncomeSourceID
			
								 
				IF ((@TempIncomeSourceID=0) OR (@TempIncomeSourceID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60098 IncomeSourceID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -2000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUIncomeSource
					 WHERE IncomeSourceID = @IncomeSourceID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60093 DELETE Fail IncomeSource';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteInsuranceType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 14 March 11
*Table Name: LUInsuranceType
Description: Deletes from LUInsuranceType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteInsuranceType](
	@InsuranceTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempInsuranceTypeID int
	
	SET @InsuranceTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@InsuranceTypeID = 0) OR (@InsuranceTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '600015 InsuranceTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @InsuranceTypeID =InsuranceTypeID  
				  FROM person.LUInsuranceType
					 WHERE InsuranceTypeID = @InsuranceTypeID
			
								 
				IF ((@TempInsuranceTypeID=0) OR (@TempInsuranceTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -600018 InsuranceTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -600010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUInsuranceType
					 WHERE InsuranceTypeID = @InsuranceTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600013 DELETE Fail LuInsuranceType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [dbo].[pDeleteLanguage]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LULanguage
Description: Deletes from LULanguage
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteLanguage](
	@LanguageID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempLanguageID int
	
	SET @TempLanguageID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@LanguageID = 0) OR (@LanguageID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60065 LanguageID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempLanguageID = LanguageID 
				  FROM person.LULanguage
					 WHERE LanguageID = @LanguageID
			
								 
				IF ((@TempLanguageID=0) OR (@TempLanguageID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60068 LanguageID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LULanguage
					 WHERE LanguageID = @LanguageID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60063 DELETE Fail Language';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteLanguagesSpoken]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LanguagesSpoken
Description: Deletes from LanguagesSpoken. A person may have 1 to may records here. Deletes only one based
on input ID.
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteLanguagesSpoken](
	@PersonID int,
	@LanguagesSpokenID int, --This is the key. do not confuse with LanguageID
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempLanguagesSpokenID int
	
	SET @TempLanguagesSpokenID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@LanguagesSpokenID = 0) OR (@LanguagesSpokenID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '11005 LanguagesSpokenID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				  
				  IF ((@PersonID = 0) OR (@PersonID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '11006 PersonID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				--This just avoids deleting a LanguagesSpokenID if it is associated with a different PersonID
				SELECT @TempLanguagesSpokenID =  LanguagesSpokenID
				  FROM person.LanguagesSpoken
					 WHERE  PersonID= @PersonID AND LanguagesSpokenID = @LanguagesSpokenID
			
								 
				IF ((@TempLanguagesSpokenID=0) OR (@TempLanguagesSpokenID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -11008 LanguagesSpokenID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -11010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LanguagesSpoken
					 WHERE LanguagesSpokenID = @LanguagesSpokenID AND PersonID = @PersonID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-11013 DELETE Fail LanguagesSpoken';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteLUFamilyRelationship]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUFamilyRelationship
Description: Deletes from LUFamilyRelationship
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteLUFamilyRelationship](
	@FamilyRelationshipID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempFamilyRelationshipID int
	
	SET @TempFamilyRelationshipID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@FamilyRelationshipID = 0) OR (@FamilyRelationshipID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60045 FamilyRelationshipID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempFamilyRelationshipID =FamilyRelationshipID
				  FROM person.LUFamilyRelationship
					 WHERE  FamilyRelationshipID= @FamilyRelationshipID
			
								 
				IF ((@TempFamilyRelationshipID=0) OR (@TempFamilyRelationshipID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60048 FamilyRelationshipID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60040';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUFamilyRelationship
					 WHERE FamilyRelationshipID = @FamilyRelationshipID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60043 DELETE Fail FamilyRelationship';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeletePersonType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUPersonType
Description: Deletes from LUPersonType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeletePersonType](
	@PersonTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempPersonTypeID int
	
	SET @TempPersonTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@PersonTypeID = 0) OR (@PersonTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '600015 PersonTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempPersonTypeID =PersonTypeID  
				  FROM person.LUPersonType
					 WHERE PersonTypeID = @PersonTypeID
			
								 
				IF ((@TempPersonTypeID=0) OR (@TempPersonTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -600018 PersonTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -600010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUPersonType
					 WHERE PersonTypeID = @PersonTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600013 DELETE Fail PersonType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeletePhoneType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUPhoneType
Description: Deletes from LUPhoneType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeletePhoneType](
	@PhoneTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempPhoneTypeID int
	
	SET @TempPhoneTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@PhoneTypeID = 0) OR (@PhoneTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '600085 PhoneTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempPhoneTypeID =PhoneTypeID  
				  FROM person.LUPhoneType
					 WHERE PhoneTypeID = @PhoneTypeID
			
								 
				IF ((@TempPhoneTypeID=0) OR (@TempPhoneTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -600088 PhoneTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -600080';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUPhoneType
					 WHERE PhoneTypeID = @PhoneTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600083 DELETE Fail PhoneType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeletePostalCode]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUPostalCode
Description: Deletes from LUPostalCode
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeletePostalCode](
	@PostalCodeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempPostalCodeID int
	
	SET @TempPostalCodeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@PostalCodeID = 0) OR (@PostalCodeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6075 PostalCodeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempPostalCodeID =PostalCodeID
				  FROM person.LUPostalCode
					 WHERE  PostalCodeID= @PostalCodeID
			
								 
				IF ((@TempPostalCodeID=0) OR (@TempPostalCodeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6078 PostalCodeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6070';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUPostalCode
					 WHERE PostalCodeID = @PostalCodeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6073 DELETE Fail PostalCode';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteProgramServiceType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUProgramServiceType
Description: Deletes from LUProgramServiceType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteProgramServiceType](
	@ProgramServiceTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempProgramServiceTypeID int
	
	SET @TempProgramServiceTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@ProgramServiceTypeID = 0) OR (@ProgramServiceTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6055 ProgramServiceTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempProgramServiceTypeID =ProgramServiceTypeID
				  FROM person.LUProgramServiceType
					 WHERE  ProgramServiceTypeID= @ProgramServiceTypeID
			
								 
				IF ((@TempProgramServiceTypeID=0) OR (@TempProgramServiceTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6058 ProgramServiceTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6050';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUProgramServiceType
					 WHERE ProgramServiceTypeID = @ProgramServiceTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6053 DELETE Fail ProgramServiceType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteProgramType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUProgramType
Description: Deletes from LUProgramType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteProgramType](
	@ProgramTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempProgramTypeID int
	
	SET @TempProgramTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@ProgramTypeID = 0) OR (@ProgramTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6045 ProgramTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempProgramTypeID =ProgramTypeID
				  FROM person.LUProgramType
					 WHERE  ProgramTypeID= @ProgramTypeID
			
								 
				IF ((@TempProgramTypeID=0) OR (@TempProgramTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6048 ProgramTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6040';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUProgramType
					 WHERE ProgramTypeID = @ProgramTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6043 DELETE Fail PostalCode';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteRace]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LURace
Description: Deletes from LURace
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteRace](
	@RaceID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempRaceID int
	
	SET @TempRaceID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@RaceID = 0) OR (@RaceID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6025 RaceID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempRaceID =RaceID
				  FROM person.LURace
					 WHERE  RaceID= @RaceID
			
								 
				IF ((@TempRaceID=0) OR (@TempRaceID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6028 RaceID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6020';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LURace
					 WHERE RaceID = @RaceID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6023 DELETE Fail Race';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteState]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUState
Description: Deletes from LUState
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pDeleteState](
	@StateID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempStateID int
	
	SET @TempStateID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@StateID = 0) OR (@StateID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6035 StateID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempStateID =StateID
				  FROM person.LUState
					 WHERE  StateID= @StateID
			
								 
				IF ((@TempStateID=0) OR (@TempStateID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6038 StateID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6030';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 DELETE FROM  Person.LUState
					 WHERE StateID = @StateID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6033 DELETE Fail State';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pDeleteVolunteerContactInformation]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[pDeleteVolunteerContactInformation] @VolunteerPersonID INT
AS

SET NOCOUNT ON
--Deletes data from VolunteerContactInformation Table on the ID matching the ID.
DELETE FROM Volunteer.VolunteerContactInformation
WHERE @VolunteerPersonID = VolunteerPersonID

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[pDeleteVolunteerJobs]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[pDeleteVolunteerJobs] @VolunteerJobsID INT
AS

SET NOCOUNT ON
--Deletes data from VolunteerJobs Table on the ID matching the ID.
DELETE FROM Volunteer.VolunteerJobs
WHERE @VolunteerJobsID = VolunteerJobsID

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[pDeleteVolunteerScheduleDayTime]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Deletes data from the VolunteerScheduleDayTime Table. 
CREATE PROCEDURE [dbo].[pDeleteVolunteerScheduleDayTime] @VolunteerScheduleDayTimeID INT
AS
SET NOCOUNT ON

DELETE FROM Volunteer.VolunteerScheduleDayTime
WHERE @VolunteerScheduleDayTimeID = VolunteerScheduleDayTimeID

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[pDeleteVolunteerScheduleMonth]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Deletes data from the VolunteerScheduleMonth Table. 
CREATE PROCEDURE [dbo].[pDeleteVolunteerScheduleMonth] @VolunteerScheduleMonthID INT
AS
SET NOCOUNT ON
DELETE FROM Volunteer.VolunteerScheduleMonth
WHERE @VolunteerScheduleMonthID = VolunteerScheduleMonthID

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[pDeleteVolunteerScheduleWeek]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Deletes data from the VolunteerScheduleWeek Table. 
CREATE PROCEDURE [dbo].[pDeleteVolunteerScheduleWeek] @VolunteerScheduleWeekID INT
AS
SET NOCOUNT ON

DELETE FROM Volunteer.VolunteerScheduleWeek
WHERE @VolunteerScheduleWeekID = VolunteerScheduleWeekID

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[pInsertAddress]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/*************************************************************************************************
* Stored Procedure Template. Change XXX in name to the name of the table that will get the insert. This is to be used
*for single table inserts only. 
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Address
Description: Inserts data to Address table.This table has the possibility of duplicate rows because
	persons can have more than one address. We can check to see if an address is a duplicate, but that will have
	limited use since we would have to count on a combination of free-format fields since it is possible to have more than
	one address in the same city, zipcode, state, county, etc.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertAddress](
	@PersonID int,
	@AddressLine1 Nvarchar(60),
	@AddressLine2 Nvarchar(60) = NULL,
	@City NVarchar(30),
	@County NVarchar(30),
	@State NVarchar(2),
	@PostalCode NVarchar(10) ,
	@AddressTypeID int,
	@ModifiedBy Name,
	@NewAddressID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempAddressTypeID int,
	@TempPersonID int,
	@TempAddressID int
	
	SET @TempAddressTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempAddressID =0;
	SET @TempAddressID = 0;		



		BEGIN TRY
		  BEGIN TRANSACTION;
				/****************************************************************************/
			--This is a bit different than some procedures because there is a lookup table associated with 
			--the address, so we need to be sure that the data matches an address type before continuing.
			SELECT @TempAddressTypeID = AddressTypeID 
			  FROM person.LUAddressType
				 WHERE AddressTypeID = (@AddressTypeID)
			
			If @TempAddressTypeID = 0
			BEGIN
				SET @ErrorStatus = ' -7002 Address Type does not existLUAddressType'; --Failed in lookup table
				RAISERROR(@ErrorStatus,15,1);--Could use WITH LOG for event log
				
			END	
		/****************************************************************************/	          

			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-7000';
				SET @Success = 0;
				RAISERROR (@ErrorStatus,16,1);
			END
			
			  INSERT Person.Address(PersonID,AddressLine1,AddressLine2,City,County,Address.State,PostalCode,AddressTypeID,ModifiedDate, ModifiedBy)
					VALUES (@PersonID, @AddressLine1, @AddressLine2,@City,@County,@State,@PostalCode,@AddressTypeID,SYSDATETIME(),@ModifiedBy)
				
				set @NewAddressID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
			 --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SET @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
			 
			 SELECT @ErrorStatus =@ErrorStatus + ' -7001' +' Insert Failed';
			 SET @Success =0;
			 
			 RAISERROR(@ErrorStatus, 16, 1);
			 	 
		
		END CATCH
		
	
END











GO
/****** Object:  StoredProcedure [dbo].[pInsertAddressType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUAddressType
Description: Inserts data to LUAddressType. This table matches the address with an address type
Revisions:
G.S. - 20 Oct 10. Fixed problem with error handler not firing on preliminary lookup.
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pInsertAddressType](
	@AddressType Nvarchar(10),
	@ModifiedBy Name,
	@NewAddressTypeID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

BEGIN
	DECLARE
	@TempAddressTypeID int
	
	SET @TempAddressTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

		
	

		BEGIN TRY
			BEGIN TRANSACTION;
		
			/****************************************************************************/
				--Avoid Duplicate Rows! However, a typo on input such as 'Hmoe' instead of 'Home' will do an isert.
				--Can't avoid finger problems!
				
			SELECT @TempAddressTypeID = AddressTypeID 
			  FROM person.LUAddressType
				 WHERE AddressType = Rtrim(Ltrim(@AddressType)) --Be a bit paranoid and trim the input for white spaces
			If @TempAddressTypeID <> 0 --Already Exists
				BEGIN
					SELECT @ErrorStatus = '-7015 AddressType Already Exists';
					SET @Success =0;
					RAISERROR(@ErrorStatus, 16, 1);
				END

			/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = Convert (nVarchar(50),@@ERROR) + ' -6010';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16, 1);
	END
	 
			
			  INSERT Person.LUAddressType(AddressType,ModifiedDate, ModifiedBy)
					VALUES (@AddressType,SYSDATETIME(),@ModifiedBy)
				
				set @NewAddressTypeID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus ='';
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SET @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
		
			  SET @Success =0;
			  SELECT  @ErrorStatus = @ErrorStatus + 'Rollback -6011';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			 
		END CATCH
		

END








GO
/****** Object:  StoredProcedure [dbo].[pInsertCertificationText]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








/*************************************************************************************************
*Author: Gary Savard
*Date: 03/29/2011
*Table Name: LuCertificationText
Description: Inserts data to LUCertificationText.
The text inserted into this table shall not be deleted because the text history must be assoicated with signature history. No
delete SP will be created for this table.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertCertificationText](
	@CertificationText NVarchar(MAX),
	@GuidelinesText NVarchar(MAX),
	@ModifiedBy Name,
	@NewCertificationTextID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempCertificationTextID int
	
	SET @TempCertificationTextID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
		
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			

			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60050';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
			  INSERT Foodshelf.LUCertificationText(CertificationText,GuidelinesText, ModifiedDate,ModifiedBy)
					VALUES (@CertificationText,@GuidelinesText,SYSDATETIME(),@ModifiedBy)
				
				set @NewCertificationTextID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			   --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60051 Insert Failed on LUCertificationText ';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END













GO
/****** Object:  StoredProcedure [dbo].[pInsertCity]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUCity
Description: Inserts data to LUCity.
Ideally we would have information on the county as well as the state before we add the city. However, 
we cannot assume that we have a county, so we will have it to default to 0, if no value is entered.
Revisions:
GS 20 Oct fixed failure in error handler due to implicit conversion of @@Error, worked intermittantly 
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertCity](
	@CityName NVarchar(30),
	@CityAbbreviation Nvarchar(30) ='',
	@StateID int,
	@CountyID int = 0,--Default countyID to 0 just in case it comes in later. 
	@PostalCodeID int =0, --Will come later, just a place holder
	@ModifiedBy Name,
	@NewCityID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempCityID int
	
	SET @TempCityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
		
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			IF @StateID = 0 --Must have a state before we can have a city!
				BEGIN
					SELECT @ErrorStatus =  '-60055 StateID cant be NULL or 0';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
	
/****************************************************************************/

			SELECT @TempCityID = CityID 
				FROM person.LUCity
					WHERE CityName = Rtrim(Ltrim(@CityName)) and StateID = @StateID
	     		If @TempCityID <>0 
					BEGIN
						SET @ErrorStatus = ' -60052 City exists in LUCity'; 
						RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
		
					END	

/****************************************************************************/	          

			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60050';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
			  INSERT Person.LUCity(StateID,CountyID,PostalCodeID,CityName,CityAbbreviation, ModifiedDate,ModifiedBy)
					VALUES (@StateID,@CountyID,@PostalCodeID,@CityName,@CityAbbreviation,SYSDATETIME(),@ModifiedBy)
				
				set @NewCityID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			   --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60051 Insert Failed on City ';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END











GO
/****** Object:  StoredProcedure [dbo].[pInsertClientFamilyRecord]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Gary Savard
-- Create date: 26 Oct 2010
-- Description:	This is the main stored procedure to save a new family member for a client
-- into the system. It calls several other stored procedures to do inserts into 
-- selected parts of the DB. Clients and Family members of clients have similar data, but 
--will use separate stored procedures for clarity.
--FOOD. Same idea with the rest of the programs.
--IDs that are important such as 'address type' from that lookup table need to be passed in here since they
--were selected by the user. No need to try to figure them out in the SP
--Certification has its own button so we have a separate stored procedure to deal with that functionality and the same for 
--family members since they do not have some of the information that we need for the client. 

--Revisions: 4 Nov 10- Added Client notes insert procedure call
--15 March 11. Modified to remove address, phone, email and number in household for family members. The version with all of these parameters
--exists in a new stored procedure called pInsertFamilyRecordWithAddress, if ever needed. It is the same sp as this one before these edits.
--5 April remove @numberInHousehold, @HomeboundDelivery,@ISPrimaryLanguage,@LanguageId,@Title,@Suffix
--19 July 2011 Added LTRIM,RTRIM for @Firstname, @MiddleName, @LastName
-- =============================================
CREATE PROCEDURE [dbo].[pInsertClientFamilyRecord] (
	@RecordSource NVarchar(8),
	@ClientPersonID int,
  	@FirstName Name,
	@MiddleName Name = NULL,
	@LastName Name,
	@DateOfBirth DateTime,
	@RelationshipID int =39,
	@RelationshipDescription NVarchar(50)='',
	@HousingStatus int =7,
	@FamilyStatusType int =6,
	@Disability NoYesMaybe =0,
	@Gender NVarchar(2)='',--Foodshelf and WX may leave blank
	@CSFP NoYesMaybe = 0,
	@Veteran NoYesMaybe=0,
	@HealthInsurance NoYesMaybe =0 ,
	@InsuranceType int =6,
	@FoodStamps NoYesMaybe =0,--Three squares
	@EducationCategoryID int =14, --Not required for Food shelf
	@CountryOfOrigin int =0, --Not required for food shelf
	@Race int =17,
	@Ethnicity int =3, 
	@IncomeSourceID int =0,
	@Notes NVarchar(MAX)=NULL,--A single person may have many notes. The notes will be specific to a particular program, so we will not have a single notes table
	@ModifiedBy Name,
	@NewPersonIDout int Output,
	@NewFamilyRelationshipID int output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
	

SET NOCOUNT ON;
	DECLARE
	@ValidSource int,
	@NewPersonID int,
	@NewAddressID int,
	@NewPhoneID int,
	@Succ bit,
	@ErrorMsg NVarchar(50),
	@NewDemographicsID int, --Not using here, just a place holder!
	@NewFoodTypeGivenID int, -- We don't do anything with this. Just receives SP output for now.
	@NewClientNotesID int,
	@TempClientPersonID int,
	@DummyNumberInHousehold int, --just place holder with default of 0
	@DummyHomeboundDelivery int,
	@DummyIsPrimaryLanguage bit,
	@DummyLanguageID int,
	@DummyTitle NVarchar(8),
	@DummySuffix NVarchar(10)
		
	
	SET @ValidSource =0;
	SET @NewPersonID =0;
	SET @NewAddressID =0;
	SET @NewPhoneID = 0;
	SET @NewDemographicsID =0;
	SET @NewFoodTypeGivenID =0;
	SET @NewClientNotesID =0;
	SET @Succ =0;
	SET @ErrorMsg ='';
	SET @TempClientPersonID =0;
	SET @DummyNumberInHousehold =0;
	SET @DummyHomeboundDelivery=2;--This is set to N/A
	SET @DummyIsPrimaryLanguage=0;
	SET @DummyLanguageID=0;
	SET @DummyTitle = NULL;
	SET @DummySuffix = NULL;
	SET @FirstName = LTRIM(rtrim(@firstname));
	SET @MiddleName = LTRIM(RTRIM(@MiddleName));
	SET @LastName = LTRIM(RTRIM(@LastName));
		
 BEGIN TRY
	BEGIN TRANSACTION;
	
	--The family member must be associated with a ClientPersonID or we bail.
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
		IF @ClientPersonID = 0 OR @ClientPersonID IS NULL
			BEGIN  --IF @ClientPersonID = 0 OR 
				SET @Success =0;
				SET @ErrorStatus = '-17500 ClientPersonID cannot be null or 0';
				RAISERROR(@ErrorStatus,16,1);
			
			END	--IF @ClientPersonID = 0 OR 
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++				
		SELECT @TempClientPersonID = @ClientPersonID
			FROM Person.Person
				WHERE PersonID = @ClientPersonID
				
		IF @TempClientPersonID = 0 OR @TempClientPersonID IS NULL--the client must exist to have a family member!
			BEGIN --IF @TempClientPersonID = 0 OR
				SET @Success=0;
				SET @ErrorStatus = '-17501 ClientPersonID does not exist in person';
				RAISERROR (@ErrorStatus,16,1);
			END  --IF @TempClientPersonID = 0 OR
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++				
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++		
	--Take the return value and throw error if 0 because we cannot proceed of we don't know
	--which set of sps to call.
	SET @ValidSource = DBO.ValidateDataSource(@RecordSource);
	
	IF @ValidSource =0
		BEGIN --IF @ValidSource =0
			SET @Success =0;
			SELECT @ErrorStatus = '-17100 Invalid Record source';
			RAISERROR(@ErrorStatus,16,1);
			--Raise Error Here because the source is unknown.
		END --IF @ValidSource =0
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++					
	
	BEGIN --Insert into Person and take the new personID for further use. Email address NULL and Email Contact 0 hard coded for family members	
		EXEC DBO.pInsertPerson @DummyTitle,@FirstName,@MiddleName,@LastName,@DummySuffix, @DateOfBirth,NULL,0,@ModifiedBy,@NewPersonID Output,@Succ Output, @ErrorMsg Output;
		SET @NewPersonIDout = @NewPersonID;--Fix this in future!
		
		
		IF @Succ =0 -- Failure!
			BEGIN  --IF @Succ =0 -- Failure!
				SET @Success = @Succ;
				SELECT @ErrorStatus = '-17200 Sub Pro pInsertPerson Fail'+ @ErrorMsg;
				RAISERROR(@ErrorStatus,16,1);
			END --IF @Succ =0 -- Failure!
		SET @Success =1;
		SET @ErrorStatus='';	
	END --Insert into Person and take the new personID for further use.	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
IF @NewPersonID > 0 AND @NewPersonID IS NOT NULL 
  BEGIN --IF @NewPersonID > 0 AND @NewPersonID IS NOT NULL 
			
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++		
	--Insert Demographics
		BEGIN --Insert Demographics. Number in household hard coded to 0 for family members
			EXEC dbo.pInsertDemographics @NewPersonID,@EducationCategoryID ,@HousingStatus,@DummyNumberInHousehold,@Gender,@Race,@CountryOfOrigin,@Ethnicity,@Disability,@CSFP,@Veteran,@HealthInsurance,@FamilyStatusType,@InsuranceType,@FoodStamps,@DummyHomeboundDelivery,@ModifiedBy,@NewDemographicsID OUTPUT,@Succ OUTPUT, @ErrorMsg OUTPUT; 
		
				IF @Succ = 0
					BEGIN --IF @Succ = 0
						SET @Success =0;
						SELECT @ErrorStatus ='-13200 Sub proc Demographics returned fail' + @ErrorMsg;
						RAISERROR(@ErrorStatus,16,1);
						
					END --IF @Succ = 0
				END --Insert Demographics
			
			--Insert income source. This may take multiple entries in the future so we have not created an SP yet.	
			IF @IncomeSourceID <> 0
				BEGIN	
					INSERT INTO PERSON.Income (IncomeSourceID,PersonID,ModifiedBy,ModifiedDate) Values (@IncomeSourceID,@NewPersonID,@ModifiedBy,SYSDATETIME())
					
				END	
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SET @ErrorStatus = 'Fail on Insert Income';
					RAISERROR (@ErrorSTatus,16,1) with log;
				END	
		
			--Insert Client Notes if they exist. This insert procedure is for the client, so we do not have
			--A value for HouseholdMemberPersonID so we hard code it to 0.
				IF LTRIM(RTRIM(@notes))<>'' AND @Notes IS NOT NULL
					BEGIN --IF LTRIM(RTRIM(@notes))<>''
						EXEC DBO.pInsertHouseholdNotes @ClientPersonID, @NewPersonID,@Notes,@ModifiedBy,@NewClientNotesID OUTPUT,@Succ OUTPUT,@ErrorMsg OUTPUT;
						IF @Succ =0
							BEGIN --IF @Succ =0
								SET @Success =0
								SET @ErrorStatus = '-17001 Insert Failed Notes' + @ErrorMsg;
								RAISERROR(@ErrorStatus,16,1);
							END --IF @Succ =0
					
					END --IF LTRIM(RTRIM(@notes))<>''
		
	--We have everything except for the relationship to the client, so we do that last.
	 
		
			EXEC DBO.pInsertFamilyRelationship @NewPersonIDout, @ClientPersonID,@RelationshipID,@RelationshipDescription,@ModifiedBy, @NewFamilyRelationshipID OUTPUT, @Succ OUTPUT, @ErrorMsg OUTPUT; 
			IF @Succ =0
				BEGIN --IF @Succ =0
					SET @Success =0;
					SET @ErrorStatus ='-17001 Insert Failed Family Relationship'+ @ErrorMsg
					RAISERROR(@ErrorStatus,16,1);
				END	--IF @Succ =0
					
	--We are using nested transactions to make sure one exists in case 
	--of a rollback in subordinate Stored Procedure
	IF @@TRANCOUNT > 0 
		BEGIN --IF @@TRANCOUNT > 0 
		 SET @Success =1;
		 SET @ErrorStatus ='';
			COMMIT TRANSACTION;
		END --IF @@TRANCOUNT > 0 
END --IF @NewPersonID > 0 AND @NewPersonID IS NOT NULL 
END TRY
	
BEGIN CATCH
	IF @@TRANCOUNT >0
		BEGIN
		SET @Success =0
		SET @ErrorStatus =@ErrorStatus + '  ' +@@Error
			ROLLBACK TRANSACTION;
			
		RAISERROR(@ErrorStatus,16,1);
		END
END CATCH

 
    
	

















GO
/****** Object:  StoredProcedure [dbo].[pInsertClientFamilyRecordWithAddress]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











-- =============================================
-- Author:		Gary Savard
-- Create date: 26 Oct 2010
-- Description:	This is the main stored procedure to save a new family member for a client
-- into the system. It calls several other stored procedures to do inserts into 
-- selected parts of the DB. Clients and Family members of clients have similar data, but 
--will use separate stored procedures for clarity.
--FOOD. Same idea with the rest of the programs.
--IDs that are important such as 'address type' from that lookup table need to be passed in here since they
--were selected by the user. No need to try to figure them out in the SP
--Certification has its own button so we have a separate stored procedure to deal with that functionality and the same for 
--family members since they do not have some of the information that we need for the client. 

--Revisions: 4 Nov 10- Added Client notes insert procedure call

-- 16 March 11. This stored procedure has been renamed from pInsertClientFamilyRecord to pInsertClientFamilyRecordWithAddress
--Champlain Charity does not want to collect addresses of family members other than the client. The new pInsertClientFamilyRecord does not collect that data. This 
--is kept in case future clients want to capture that data.


-- =============================================
CREATE PROCEDURE [dbo].[pInsertClientFamilyRecordWithAddress] (
	@RecordSource NVarchar(8),
	@ClientPersonID int,
    @Title NVarchar(8) =NULL,
	@FirstName Name,
	@MiddleName Name = NULL,
	@LastName Name,
	@Suffix NVarchar(10) = NULL,
	@DateOfBirth DateTime,
	@RelationshipID int,
	@RelationshipDescription NVarchar(50)='',
	@Address1 NVarchar(60) =NULL,--Only for Foodshelf!!
	@Address2 NVarchar(60) = NULL,
	@City	NVarchar(30),
	@County NVarchar(30) = NULL,
	@State NVarchar(2),
	@PostalCode NVarchar(10),
	@AddressTypeID int =0,--From the Lookup based on user input. May not need if Foodshelf
	@EmailAddress Nvarchar(50) = NULL,--May not need for foodshelf
	@EmailContactPreference NoYes =0,
	@PhoneNumber Phone ='',
	@PhoneExtension Nvarchar(8) ='', --may not be implemented yet
	@PhoneTypeID int =0, --0 default, Food shelf again!
	@HousingStatus nVarchar(50),--The TEXT value from the lookup table. Saves having to query by ID later
	@NumberInHousehold int,
	@Disability NoYesMaybe =0,
	@Gender NVarchar(2)='',--Foodshelf and WX may leave blank
	@CSFP NoYesMaybe = 0,
	@Veteran NoYesMaybe=0,
	@HealthInsurance NoYesMaybe =0 ,
	@FoodStamps NoYesMaybe =0,--Three squares
	@HomeboundDelivery NoYesMaybe =0,
	@LanguageID int =0,--This is only important for volunteers and that funtionality has not been developed yet.
	@IsPrimaryLanguage bit =0,
	@EducationCategoryID int =0, --Not required for Food shelf
	@CountryOfOrigin int=0, --Not required for food shelf
	@Race int = 17,
	@Ethnicity int = 3, 
	@IncomeSourceID int =0,
	@Notes NVarchar(MAX)=NULL,--A single person may have many notes. The notes will be specific to a particular program, so we will not have a single notes table
	@ModifiedBy Name,
	@NewPersonIDout int Output,
	@NewFamilyRelationshipID int out,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
	

SET NOCOUNT ON;
	DECLARE
	@ValidSource int,
	@NewPersonID int,
	@NewAddressID int,
	@NewPhoneID int,
	@Succ bit,
	@ErrorMsg NVarchar(50),
	@NewDemographicsID int, --Not using here, just a place holder!
	@NewFoodTypeGivenID int, -- We don't do anything with this. Just receives SP output for now.
	@NewClientNotesID int,
	@TempClientPersonID int
		
	
	SET @ValidSource =0;
	SET @NewPersonID =0;
	SET @NewAddressID =0;
	SET @NewPhoneID = 0;
	SET @NewDemographicsID =0;
	SET @NewFoodTypeGivenID =0;
	SET @NewClientNotesID =0;
	SET @Succ =0;
	SET @ErrorMsg ='';
	SET @TempClientPersonID =0;
	SET @FirstName =LTRIM(RTRIM(@FirstName));
	SET @MiddleName = LTRIM(RTRIM(@MiddleName));
	SET @LastName = LTRIM(RTRIM(@LastName));
		
 BEGIN TRY
	BEGIN TRANSACTION;
	
	--The family member must be associated with a ClientPersonID or we bail.
	
		IF @ClientPersonID = 0 OR @ClientPersonID IS NULL
			BEGIN
				SET @Success =0;
				SET @ErrorStatus = '-17500 ClientPersonID cannot be null or 0';
				RAISERROR(@ErrorStatus,16,1);
			
			END	
			
		SELECT @TempClientPersonID = @ClientPersonID
			FROM Person.Person
				WHERE PersonID = @ClientPersonID
				
		IF @TempClientPersonID = 0 OR @TempClientPersonID IS NULL--the client must exist to have a family member!
			BEGIN
				SET @Success=0;
				SET @ErrorStatus = '-17501 ClientPersonID does not exist in person';
				RAISERROR (@ErrorStatus,16,1);
			END
			
	
	--Take the return value and throw error if 0 because we cannot proceed of we don't know
	--which set of sps to call.
	SET @ValidSource = DBO.ValidateDataSource(@RecordSource);
	
	IF @ValidSource =0
		BEGIN
			SET @Success =0;
			SELECT @ErrorStatus = '-17100 Invalid Record source';
			RAISERROR(@ErrorStatus,16,1);
			--Raise Error Here because the source is unknown.
		END
				
	--Insert into Person and take the new personID for further use.	
	BEGIN
		EXEC DBO.pInsertPerson @Title,@FirstName,@MiddleName,@LastName,@Suffix, @DateOfBirth,@EmailAddress,@EmailContactPreference,@ModifiedBy,@NewPersonID Output,@Succ Output, @ErrorMsg Output;
		SET @NewPersonIDout = @NewPersonID;
		
		
		IF @Succ =0 -- Failure!
			BEGIN
				SET @Success = @Succ;
				SELECT @ErrorStatus = '-17200 Sub Pro Fail'+ @ErrorMsg;
				RAISERROR(@ErrorStatus,16,1);
			END
		SET @Success =1;
		SET @ErrorStatus='';	
	END
	
	--IF the source is from Food Shelf we cannot assume that we will need to call the address or phone SPs because they 
	--are not required to take that information.
	--IF we have a good PersonID returned, we continue to Address
	
	--The address should be the same as that of the client, but we will add it anyway because this person
	--may eventually become a client and we will already have an AddressID that we can use and modify the location.

		IF @NewPersonID > 0 AND @NewPersonID IS NOT NULL 
		BEGIN
			IF ((@RecordSource <> 'FOOD') AND (LTRIM(RTRIM(@Address1)) ='') OR (LTRIM(RTRIM(@Address1)) IS NULL) )--This is a problem because address is required
				BEGIN
					SET @Succ =0;
					SET @ErrorStatus ='-17300 Address Required for Non foodshelf intake.';
					RAISERROR(@ErrorStatus,16,1);
				END
		IF ((LTRIM(RTRIM(@Address1)) <> '') AND (@Address1 IS NOT NULL)) OR @RecordSource = 'FOOD'
		 BEGIN	
			EXEC DBO.pInsertAddress @NEWPersonID, @Address1,@Address2, @City,@County,@State,@PostalCOde,@AddressTypeID,@ModifiedBy, @NewAddressID Output,@Succ Output, @ErrorMsg Output ;	
			
			IF @Succ =0 --Failed, Rollback!
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-17200 Sub proc call returned error' + @ErrorMsg;
					RAISERROR (@ErrorSTatus, 16,1);
				END
				
		END

	
	--Insert Phone Number
	--We allow phone number since they may have a cell.
	BEGIN
		IF ((@RecordSource <> 'FOOD') AND (LTRIM(RTRIM(@PhoneNumber)) ='') OR (LTRIM(RTRIM(@PhoneNumber)) IS NULL) )--This is a problem because Phone Number is required
			BEGIN
						SET @Succ =0;
						SET @ErrorStatus ='-17400 Phone Number Required for Non foodshelf intake.';
						RAISERROR(@ErrorStatus,16,1);
			END
			
		IF (LTRIM(RTRIM(@PhoneNumber))<>'' AND @PhoneNumber IS NOT NULL)
			BEGIN
				EXEC DBO.pInsertPhone @NewPersonID,@PhoneNumber, @PhoneExtension,@PhoneTypeID,@ModifiedBy,@NewPhoneID output, @Succ output, @ErrorMsg output ;
			END
			
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc Phone returned fail' + @ErrorMsg;
					RAISERROR(@ErrorStatus, 16,1);
				END
	END
	
	--Insert Demographics
	BEGIN
		EXEC dbo.pInsertDemographics @NewPersonID,@EducationCategoryID ,@HousingStatus,@NumberInHousehold,@Gender,@Race,@CountryOfOrigin,@Ethnicity,@Disability,@CSFP,@Veteran,@HealthInsurance,@FoodStamps,@HomeboundDelivery,@ModifiedBy,@NewDemographicsID OUTPUT,@Succ OUTPUT, @ErrorMsg OUTPUT; 
		
		IF @Succ = 0
			BEGIN
				SET @Success =0;
				SELECT @ErrorStatus ='-13200 Sub proc Demographics returned fail' + @ErrorMsg;
				RAISERROR(@ErrorStatus,16,1);
				
			END
		END
		
	--Insert Client Notes if they exist. This insert procedure is for the client, so we do not have
	--A value for HouseholdMemberPersonID so we hard code it to 0.
		IF LTRIM(RTRIM(@notes))<>'' AND @Notes IS NOT NULL
			BEGIN
				EXEC DBO.pInsertHouseholdNotes @ClientPersonID, @NewPersonID,@Notes,@ModifiedBy,@NewClientNotesID OUTPUT,@Succ OUTPUT,@ErrorMsg OUTPUT;
				IF @Succ =0
				BEGIN
					SET @Success =0
					SET @ErrorStatus = '-17001 Insert Failed Notes' + @ErrorMsg;
					RAISERROR(@ErrorStatus,16,1);
				END
			
			END
		
	--We have everything except for the relationship to the client, so we do that last.
	 
		
			EXEC DBO.pInsertFamilyRelationship @NewPersonIDout, @ClientPersonID,@RelationshipID,@RelationshipDescription,@ModifiedBy, @NewFamilyRelationshipID OUTPUT, @Succ OUTPUT, @ErrorMsg OUTPUT; 
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SET @ErrorStatus ='-17001 Insert Failed Family Relationship'+ @ErrorMsg
					RAISERROR(@ErrorStatus,16,1);
				END	
		
			
	

		
	--We are using nested transactions to make sure one exists in case 
	--of a rollback in subordinate Stored Procedure
	IF @@TRANCOUNT > 0 
		BEGIN
		 SET @Success =1;
		 SET @ErrorStatus ='';
			COMMIT TRANSACTION;
		END
END
END TRY
	
BEGIN CATCH
	IF @@TRANCOUNT >0
		BEGIN
		SET @Success =0
		SET @ErrorStatus =@ErrorStatus + '  ' +@@Error
		Set @ErrorStatus = @ErrorStatus + 'Failure in pInsertClientFamilyRecordWithAddress'
		ROLLBACK TRANSACTION;
			
		RAISERROR(@ErrorStatus,16,1);
		END
END CATCH

 
    
	














GO
/****** Object:  StoredProcedure [dbo].[pInsertClientRecord]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
















-- =============================================
-- Author:		Gary Savard
-- Create date: 26 Oct 2010
-- Description:	This is the main stored procedure to save a new client
-- into the system. It calls several other stored procedures to do inserts into 
-- selected parts of the DB. Clients and Family members of clients have similar data, but 
--will use separate stored procedures for clarity.
--@RecordSource can be FOOD,WX,MICRO,TENANT,COMMACT,ADMIN. This will be used to only execute parts of the 
--SP relevant to the client intake data brought in. For example, Foodshelf requires that a record be 
--set for the type of food taken, but this is not required elsewhere so we only execute that SP If things come from 
--FOOD. Same idea with the rest of the programs.
--IDs that are important such as 'address type' from that lookup table need to be passed in here since they
--were selected by the user. No need to try to figure them out in the SP
--Certification has its own button so we have a separate stored procedure to deal with that functionality and the same for 
--family members since they do not have some of the information that we need for the client. 

--Revisions: 4 Nov 10- Added Client notes insert procedure call

---14 March 11 Added functionality for Cell Phone, Mailing Address, FamilyStatus, InsuranceType
--19 April, Add @IsUpdateBreadGroceries parameter to avoid inserting bread/produce, groceries if this is not required.
--3 May 11, fixed mail address blank records.
--11 July 11, Added LTrim,RTRIM @FIRSTNAME, @MiddleName, @LastName
-- =============================================
CREATE PROCEDURE [dbo].[pInsertClientRecord] (
	@RecordSource NVarchar (8), --This allows for the sub sp's to be executed or skipped based on what data is to be saved
	@Title NVarchar(8) =NULL,
	@FirstName Name,
	@MiddleName Name = NULL,
	@LastName Name,
	@Suffix NVarchar(10) = NULL,
	@Gender NVarchar(2) ='',--May not need everywhere
	@DateOfBirth DateTime,
	@PhysicalAddress1 NVarchar(60) =NULL,--Only for Foodshelf!!
	@PhysicalAddress2 NVarchar(60) = NULL,
	@PhysicalCity	NVarchar(30),
	@PhysicalCounty NVarchar(30) = NULL,
	@PhysicalState NVarchar(2),
	@PhysicalPostalCode NVarchar(10),
	@PhysicalAddressTypeID int=0,--This is just addressTypeID, but this name is used to make distinctive in parameters list
	@MailAddress1 NVarchar(60) = NULL,
	@MailAddress2 NVarchar(60)= NULL,
	@MailCity NVarchar(30)=NULL,
	@MailCounty NVarchar(30)=NULL,
	@MailState NVarchar(2) =NULL,
	@MailPostalCode NVarchar(10)=NULL,
	@MailAddressTypeID int =0,--From the Lookup based on user input. May not need if Foodshelf
	@EmailAddress Nvarchar(50) = NULL,
	@EmailContactPreference NoYes =0,
	@PhoneNumber Phone ='',
	@PhoneExtension Nvarchar(8) ='', --may not be implemented yet
	@PhoneTypeID int =0, --Food shelf again!
	@PhoneNumber2 Phone ='',
	@PhoneExtension2 Nvarchar(8)='',
	@PhoneTypeID2 int =0,
	@FamilyStatusType int =6, 
	@HousingStatus int =7,
	@Disability NoYesMaybe =0,
	@CSFP NoYesMaybe = 0,
	@Veteran NoYesMaybe=0,
	@HealthInsurance NoYesMaybe =0 ,
	@InsuranceType int =6,
	@FoodStamps NoYesMaybe =0,--Three squares
	@HomeboundDelivery NoYesMaybe =0,
	@LanguageID int =0,--This is only important for volunteers and that funtionality has not been developed yet.
	@IsPrimaryLanguage bit =0,
	@EducationCategoryID int =14, 
	@CountryOfOrigin int =0, 
	@Race int =17,
	@Ethnicity int =3, 
	@NumberInHousehold int,
	@IncomeSourceID int =0,
	@Notes NVarchar(MAX)=NULL,--A single person may have many notes. The notes will be specific to a particular program, so we will not have a single notes table
	@FoodGiven FoodShelf.GroceryOrBreadProduce,
	@FoodReceivedDate DateTime,
	@IsUpdateBreadGroceries bit, --This is 1 if there is an update for the record and bread/produce, groceries.
	@ModifiedBy Name,
	@NewPersonIDout int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
	

SET NOCOUNT ON;
	DECLARE
	@ValidSource int,
	@NewPersonID int,
	@NewPhysicalAddressID int,
	@NewMailAddressID int,
	@NewPhoneID int,
	@NewPhoneID2 int,
	@Succ bit,
	@ErrorMsg NVarchar(50),
	@NewDemographicsID int, --Not using here, just a place holder!
	@NewFoodTypeGivenID int, -- We don't do anything with this. Just receives SP output for now.
	@NewClientNotesID int,
	@NewIncomeSourceID int
	
	SET @ValidSource =0;
	SET @NewPersonID =0;
	SET @NewPhysicalAddressID =0;
	SET @NewMailAddressID =0;
	SET @NewPhoneID = 0;
	SET @NewPhoneID2 =0;
	SET @NewDemographicsID =0;
	SET @NewFoodTypeGivenID =0;
	SET @NewClientNotesID =0;
	SET @NewIncomeSourceId =0;	
	SET @Succ =0;
	SET @ErrorMsg ='';
	SET @FirstName = LTRIM(RTRIM(@FirstName));
	SET @MiddleName = LTRIM(RTRIM(@MiddleName));
	SET @LastName = LTRIM(RTRIM(@LastName));
	
BEGIN		
 BEGIN TRY
	BEGIN TRANSACTION;
	
	
	--Take the return value and throw error if 0 because we cannot proceed of we don't know
	--which set of sps to call.
	SET @ValidSource = DBO.ValidateDataSource(@RecordSource);
	
	IF @ValidSource =0
		BEGIN
			SET @Success =0;
			SELECT @ErrorStatus = '-13100 Invalid Record source';
			RAISERROR(@ErrorStatus,16,1) with log;
			--Raise Error Here because the source is unknown.
		END
		
	--Insert into Person and take the new personID for further use.	
	BEGIN
		EXEC DBO.pInsertPerson @Title,@FirstName,@MiddleName,@LastName,@Suffix, @DateOfBirth,@EmailAddress,@EmailContactPreference,@ModifiedBy,@NewPersonID Output,@Succ Output, @ErrorMsg Output;
		SET @NewPersonIDout = @NewPersonID;
		IF @Succ =0 -- Failure!
			BEGIN
				SET @Success = @Succ;
				SELECT @ErrorStatus = '-13200 Sub Pro Fail'+ @ErrorMsg;
				RAISERROR(@ErrorStatus,16,1) with log;
			END
	END
	
	--IF the source is from Food Shelf we cannot assume that we will need to call the address or phone SPs because they 
	--are not required to take that information.
	--IF we have a good PersonID returned, we continue to Address
	

		IF @NewPersonID > 0 AND @NewPersonID IS NOT NULL 
		BEGIN
			IF (@RecordSource <> 'FOOD') AND ((LTRIM(RTRIM(@PhysicalAddress1)) ='') OR (LTRIM(RTRIM(@PhysicalAddress1)) IS NULL)) --This is a problem because address is required
				BEGIN
					SET @Succ =0;
					SET @ErrorStatus ='-13300 Address Required for Non foodshelf intake.';
					RAISERROR(@ErrorStatus,16,1) with log;
				END
		
		IF (((LTRIM(RTRIM(@PhysicalAddress1)) <> '') AND (@PhysicalAddress1 IS NOT NULL))) OR @RecordSource = 'FOOD'
		 BEGIN	
			EXEC DBO.pInsertAddress @NewPersonID, @PhysicalAddress1,@PhysicalAddress2, @PhysicalCity,@PhysicalCounty,@PhysicalState,@PhysicalPostalCOde,@PhysicalAddressTypeID,@ModifiedBy, @NewPhysicalAddressID Output,@Succ Output, @ErrorMsg Output ;	
		
			IF @Succ =0 --Failed, Rollback!
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc PhyAddr call returned error' + @ErrorMsg;
					RAISERROR (@ErrorSTatus, 16,1) with log;
				END
					
		END
		
		IF (((LTRIM(RTRIM(@MailAddress1)) <> '') AND (@MailAddress1 IS NOT NULL))) /*OR @RecordSource = 'FOOD' Removed. Not necessary*/
		 BEGIN	
			EXEC DBO.pInsertAddress @NewPersonID, @MailAddress1,@MailAddress2, @MailCity,@MailCounty,@MailState,@MailPostalCOde,@MailAddressTypeID,@ModifiedBy, @NewMailAddressID Output,@Succ Output, @ErrorMsg Output ;	
		
			IF @Succ =0 --Failed, Rollback!
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc MailAddr call returned error' + @ErrorMsg;
					RAISERROR (@ErrorSTatus, 16,1) with log;
				END
					
		END
		
		--We now need to check for a mailing address
		

	
	--Insert Phone Number
	BEGIN
		IF ((@RecordSource <> 'FOOD') AND (LTRIM(RTRIM(@PhoneNumber)) ='') OR (LTRIM(RTRIM(@PhoneNumber)) IS NULL) )--This is a problem because Phone Number is required
			BEGIN
						SET @Succ =0;
						SET @ErrorStatus ='-13400 Phone Number Required for Non foodshelf intake.';
						RAISERROR(@ErrorStatus,16,1) with log;
			END
			
		IF (LTRIM(RTRIM(@PhoneNumber))<>'' AND @PhoneNumber IS NOT NULL)
			BEGIN
				EXEC DBO.pInsertPhone @NewPersonID,@PhoneNumber, @PhoneExtension,@PhoneTypeID,@ModifiedBy,@NewPhoneID output, @Succ output, @ErrorMsg output ;
			END
			
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc Insert phone returned fail' + @ErrorMsg;
					RAISERROR(@ErrorStatus, 16,1) with log;
				END
	END
	
	--Insert Cell Phone. This is not a required field so we do not do the same checks as with regular phone.
	IF (LTRIM(RTRIM(@PhoneNumber2))<>'' AND @PhoneNumber2 IS NOT NULL)
			BEGIN
				EXEC DBO.pInsertPhone @NewPersonID,@PhoneNumber2, @PhoneExtension2,@PhoneTypeID2,@ModifiedBy,@NewPhoneID output, @Succ output, @ErrorMsg output ;
			END
			
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc Insert Phone returned fail' + @ErrorMsg;
					RAISERROR(@ErrorStatus, 16,1) with log;
				END
	
	--Insert Demographics
	BEGIN
	  
		EXEC dbo.pInsertDemographics @NewPersonID,@EducationCategoryID ,@HousingStatus,@NumberInHousehold,@Gender,@Race,@CountryOfOrigin,@Ethnicity,@Disability,@CSFP,@Veteran,@HealthInsurance,@FamilyStatusType,@InsuranceType,@FoodStamps,@HomeboundDelivery,@ModifiedBy,@NewDemographicsID OUTPUT,@Succ OUTPUT, @ErrorMsg OUTPUT; 
		
		IF @Succ = 0
			BEGIN
				SET @Success =0;
				SELECT @ErrorStatus = '-2021 Insert Failed Demographics' + @ErrorMsg;
				RAISERROR(@ErrorStatus,16,1) with log;
				
			END
		END
		
	--Insert Income Source. We are doing this directly but it could be put into a stored procedure. This may be modified for multiple entry later on but we assume 1 to 1 relationship a this point
	IF @IncomeSourceID <> 0
		BEGIN	
			INSERT INTO PERSON.Income (IncomeSourceID,PersonID,ModifiedBy,ModifiedDate) Values (@IncomeSourceID,@NewPersonID,@ModifiedBy,SYSDATETIME())
			
		END	
	IF @Succ =0
		BEGIN
			SET @Success =0;
			SET @ErrorStatus = 'Fail on Insert Income';
			RAISERROR (@ErrorSTatus,16,1) with log;
		END	
	--Insert Client Notes if they exist. This insert procedure is for the client, so we do not have
	--A value for HouseholdMemberPersonID so we hard code it to 0.
		IF LTRIM(RTRIM(@notes))<>'' AND @Notes IS NOT NULL
			BEGIN
				EXEC DBO.pInsertHouseholdNotes @NewPersonID, 0,@Notes,@ModifiedBy,@NewClientNotesID OUTPUT,@Succ OUTPUT,@ErrorMsg OUTPUT;
				IF @Succ =0
				BEGIN
					SET @Success =0
					SET @ErrorStatus = '-14001 Insert Failed Notes' + @ErrorMsg;
					RAISERROR(@ErrorStatus,16,1) with log;
				END
			
			END
		
	--IF source is foodshelf, we need to capture whether they were in for bread/produce or groceries 
	
	IF @RecordSource ='FOOD' and @IsUpdateBreadGroceries = 1
		BEGIN
			EXEC DBO.pInsertFoodTypeGiven @NewPersonID,@FoodReceivedDate,@FoodGiven,@ModifiedBy,@NewFoodTypeGivenID OUTPUT, @Succ OUTPUT, @ErrorMsg OUTPUT;
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus ='-600021 Insert FoodType fail' + @ErrorMsg;
					RAISERROR (@ErrorStatus,16,1) with log;
				END	
	END
		

		
	--We are using nested transactions to make sure one exists in case 
	--of a rollback in subordinate Stored Procedure
	IF @@TRANCOUNT > 0 
		BEGIN
			SET @Success = 1;
			COMMIT TRANSACTION;
		END
END
END TRY
	
BEGIN CATCH
	IF @@TRANCOUNT >0
		BEGIN
		SET @Success = 0
		SET @ErrorStatus =@ErrorStatus + '  ' +@@Error
			ROLLBACK TRANSACTION;
			
		RAISERROR(@ErrorStatus,16,1) with log;
		END
END CATCH

    -- Insert statements for procedure here
    END
    
	



















GO
/****** Object:  StoredProcedure [dbo].[pInsertContactType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUContactType
Description: Inserts data to LUContactType.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertContactType](
	@Name Nvarchar(50) ,
	@ModifiedBy Name,
	@NewContactTypeID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempNewContactID int
	
	SET @TempNewContactID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
/****************************************************************************/

			
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			SELECT @TempNewContactID = ContactTypeID 
			  FROM person.LUContactType
			     WHERE Name = Rtrim(Ltrim(@Name)) 
	     			If @TempNewContactID <>0 
				    	BEGIN
					     	SET @ErrorStatus = ' -60022 Contact Type already exists in LUContactType'; 
							RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
								
						END	
			 
/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60020';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16,1);
	END
	 
			  INSERT Person.LUContactType(Name,ModifiedDate,ModifiedBy)
					VALUES (@Name,SYSDATETIME(),@ModifiedBy)
				
				set @NewContactTypeID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-60021 Insert Failed on LUContactType';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END










GO
/****** Object:  StoredProcedure [dbo].[pInsertCountryOfOrigin]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUCountryOfOrigin
Description: Inserts data to LUCountryOfOrigin.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertCountryOfOrigin](
	@CountryAbbreviation Nvarchar(30) ='',
	@CountryName Nvarchar(50),
	@FIPSCode NVarchar(2)='',
	@ModifiedBy Name,
	@NewCountryID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempNewCountryID int
	
	SET @TempNewCountryID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
/****************************************************************************/

	 
		
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
		    SELECT @TempNewCountryID = CountryID 
			  FROM person.LUCountryOfOrigin
				 WHERE CountryName = Rtrim(Ltrim(@CountryName)) 
	     			If @TempNewCountryID <>0 
						BEGIN
							SET @ErrorStatus = ' -60032 Country already exists in LUCountryOfOrigin'; 
								RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
							
						END	
 
/****************************************************************************/	          

						IF @@Error <> 0 
						BEGIN
							SELECT @ErrorStatus = @@ERROR + '-60030';
							SET @Success = 0;
							RAISERROR(@ErrorStatus, 16,1);
						END
				  INSERT Person.LUCountryOfOrigin(CountryAbbreviation,CountryName,FIPSCode,ModifiedDate,ModifiedBy)
						VALUES (@CountryAbbreviation,@CountryName,@FIPSCode,SYSDATETIME(),@ModifiedBy)
					
					set @NewCountryID =@@IDENTITY;
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			   --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-60031 Insert Failed Rollback';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END











GO
/****** Object:  StoredProcedure [dbo].[pInsertCounty]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUCounty
Description: Inserts data to LUCounty. 
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertCounty](
	@CountyName NVarchar(20),
	@StateID int,
	@CityID int = 0,--Default cityID to 0 just in case it comes in later. 
	@ModifiedBy Name,
	@NewCountyID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempCountyID int
	
	SET @TempCountyID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
		
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			IF @StateID = 0 --Must have a state before we can have a county!
				BEGIN
					SELECT @ErrorStatus = '-60065 StateID cant be NULL or 0';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
	
/****************************************************************************/

				SELECT @TempCountyID = CountyID 
				  FROM person.LUCounty
					 WHERE CountyName = Rtrim(Ltrim(@CountyName)) and StateID = @StateID
	     				If @TempCountyID <>0 
							BEGIN
								SET @ErrorStatus = ' -60062 County exists in LUCounty'; 
									RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
								
							END	

/****************************************************************************/	          

				IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60060';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
				 
			  INSERT Person.LUCounty(StateID,CityID,CountyName, ModifiedDate,ModifiedBy)
					VALUES (@StateID,@CityID,@CountyName,SYSDATETIME(),@ModifiedBy)
				
				set @NewCountyID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60061 Insert Failed LUCounty ';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END











GO
/****** Object:  StoredProcedure [dbo].[pInsertDailyWorkHistory]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pInsertDailyWorkHistory] 
@VolunteerScheduleWeekID int, 
@DayOfWeek int, 
@AvailableBeginTime time(7), 
@AvailableEndTime time(7), 
@IsNoShow bit, 
@ActualHoursTotal numeric(18,0),
@Job int, 
@ModifiedBy NVARCHAR(50),
@Error NVarchar(50) Output,
@ErrorNo int output,
@SUCCESS BIT OUTPUT
	
AS 

SET NOCOUNT ON;

DECLARE

@ErrNo int =0,
@ErrMsg Nvarchar(50)= ''

BEGIN TRY

BEGIN TRANSACTION	
BEGIN
--Ditto previous comment. 
EXEC dbo.pInsertVolunteerScheduleDayTime @VolunteerScheduleWeekID, @DayOfWeek, 
	@AvailableBeginTime, @AvailableEndTime, @IsNoShow, @ActualHoursTotal, @ModifiedBy
--If there is an error, it breaks.
SELECT @ErrNo = @@ERROR
IF @ErrNo <>0
	
	BEGIN
		RAISERROR (@ErrNo, 16, 0)
	END
	SET @SUCCESS =1

END

BEGIN 

EXEC dbo.pInsertVolunteerJobs @VolunteerScheduleDayTimeID = @@IDENTITY, @Job = @Job, @ModifiedBy = @ModifiedBy
SELECT @ErrNo = @@ERROR
IF @ErrNo <>0
	
	BEGIN
		RAISERROR (@ErrNo, 16, 0)
	END
	SET @SUCCESS =1

COMMIT TRANSACTION
END
END TRY
--Rolls the transaction back if there is an error. 
BEGIN CATCH
	ROLLBACK TRANSACTION
	SET @SUCCESS = 0;
	--I am using Print Error_Message as I was having issues with one of the included SPs
	--it was printing errors, but had next to no information on what was causing the error,
	--which made figuring it out a mess.
	PRINT ERROR_MESSAGE();

END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[pInsertDemographics]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





















/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Demographics
Description: Inserts data to Demographics table
Revisions:1 Nov 10. Added housing status to demographics table and altered stored procedures accordingly.
14 December 10. Added Country of Origin. GS
14 March 11. Added FamilyStatusType and Insurance Type GS
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pInsertDemographics](
	@PersonID int,
	@EducationCategoryID int =14,
	@HousingStatus int =7,
	@NumberInHousehold int,
	@Gender NVarchar(2) ='',
	@Race int = 17,
	@CountryOfOrigin int =195,--This could have used an ID, but keeping it simple since end users will be doing own crystal reports.
	@Ethnicity int =3,
	@Disability NoYesMaybe =0,
	@CSFP NoYesMaybe = 0,
	@Veteran NoYesMaybe=0,
	@HealthInsurance NoYesMaybe=0 ,
	@FamilyStatusType int =6,
	@InsuranceType int =6,
	@FoodStamps NoYesMaybe =0,
	@HomeboundDelivery NoYesMaybe =0,
	@ModifiedBy Name,
	@NewDemographicsID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempDemographicsID int,
	@TempPersonId int
	
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempDemographicsID =0;		

	
		
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				SELECT @TempDemographicsID = DemographicsID 
				  FROM person.Demographics
					 WHERE PersonID = @PersonID
					 
				IF @TEMPDemographicsID <> 0 --If not zero then already exists. 
				   BEGIN
					SELECT @ErrorStatus = '-2005 DemogID already exists for PersonID';
					SET @ErrorStatus =0;
					RAISERROR(@ErrorStatus,16,1);
				   END        

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(20),@@ERROR) + ' -1000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				  INSERT Person.Demographics(PersonID,
											EducationCategoryID,
											HousingStatus,
											NumberInHousehold,
											Gender,
											Race,
											CountryOfOrigin,
											Ethnicity, 
											Disability,
											CSFP,
											Veteran, 
											HealthInsurance, 
											FamilyStatusType,
											InsuranceType,
											FoodStamps,
											HomeboundDelivery, 
											ModifiedDate, 
											ModifiedBy)
						VALUES				(@PersonID,
											@EducationCategoryID,
											@HousingStatus,
											@NumberInHousehold,
											@Gender, 
											@Race,
											@CountryOfOrigin,
											@Ethnicity,
											@Disability,
											@CSFP,
											@Veteran,
											@HealthInsurance,
											@FamilyStatusType,
											@InsuranceType,
											@FoodStamps,
											@HomeboundDelivery,SYSDATETIME(),@ModifiedBy)
					
					set @NewDemographicsID =@@IDENTITY;
					set @success =1;
					set @ErrorStatus ='';
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = Convert (Nvarchar(20),@@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-2001 Insert Fail Demographics';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END
END






















GO
/****** Object:  StoredProcedure [dbo].[pInsertEducationCategory]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUEducationCategory
Description: Inserts data to LUEducationCategory. 
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertEducationCategory](
	@EducationLevel NVarchar(50),
	@ModifiedBy Name,
	@NewEducationCategoryID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempEducationCategoryID int
	
	SET @TempEducationCategoryID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
/****************************************************************************/

	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
		  
				SELECT @TempEducationCategoryID = EducationCategoryID 
				  FROM person.LUEducationCategory
					 WHERE EducationLevel = Rtrim(Ltrim(@EducationLevel))
	     				If @TempEducationCategoryID <>0 
							BEGIN
								SET @ErrorStatus = ' -60072 Education Catgory aready exists in LUEducationCategory'; 
									RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
								
							END	

/****************************************************************************/	          

					IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60070';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16,1);
					END
			  INSERT Person.LUEducationCategory(EducationLevel, ModifiedDate,ModifiedBy)
					VALUES (@EducationLevel,SYSDATETIME(),@ModifiedBy)
				
				set @NewEducationCategoryID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			   --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-60071 Insert Failed Education Category';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END











GO
/****** Object:  StoredProcedure [dbo].[pInsertEthnicity]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUEthnicity
Description: Inserts data to LUEthnicity. 
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pInsertEthnicity](
	@EthnicityAbbreviation NVarchar(10),
	@EthnicityDescription NVarchar(50),
	@ModifiedBy Name,
	@NewEthnicityID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempEthnicityID int
	
	SET @TempEthnicityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
/****************************************************************************/

	
		
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
				SELECT @TempEthnicityID = EthnicityID 
				  FROM person.LUEthnicity
					 WHERE EthnicityAbbreviation = Rtrim(Ltrim(@EthnicityAbbreviation)) --Be a bit paranoid and trim the input for white spaces
				If @TempEthnicityID <>0 
					BEGIN
						SET @ErrorStatus = ' -60082 Ethnicity already exists'; --Failed in lookup table
						RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
						
					END	

/****************************************************************************/	          

				IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60080';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
				 
			  INSERT Person.LUEthnicity(EthnicityAbbreviation,EthnicityDescription, ModifiedDate,ModifiedBy)
					VALUES (@EthnicityAbbreviation,@EthnicityDescription,SYSDATETIME(),@ModifiedBy)
				
				set @NewEthnicityID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			    --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60081 Insert Failed Ethnicity';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END











GO
/****** Object:  StoredProcedure [dbo].[pInsertFamilyRelationship]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: FamilyRelationships
Description: Inserts data to FamilyRelationships. Do not confuse with the sp that inserts to the
family relationship LU table! This stored procedure is not called directly and its superior sps do the validation, so it is left out
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertFamilyRelationship](
	@PersonID int, 
	@ClientPersonID int ,
	@RelationshipID int,
	@RelationshipDescription nVarchar(50)='',
	@ModifiedBy Name, 
	@NewFamilyRelationshipID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempFamilyRelationshipID int
	
	SET @TempFamilyRelationshipID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
/****************************************************************************/
--This stored procedure is not called directly and its superior sps do the validation, so it is left out
	
	BEGIN TRY
	  BEGIN TRANSACTION;
		
 
			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-60040';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
		
	
			BEGIN
		
			  INSERT Person.FamilyRelationships(PersonId,ClientPersonID,RelationshipID,RelationDescription,ModifiedDate,ModifiedBy)
					VALUES (@PersonID,@ClientPersonID,@RelationshipID,@RelationshipDescription,SYSDATETIME(),@ModifiedBy)
				
				set @NewFamilyRelationshipID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
				COMMIT TRANSACTION;
			END
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus  +'-18001 Insert Failed on FamilyRelationships';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [dbo].[pInsertFamilyStatusType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 14 March 11
*Table Name: LUFamilyStatusType
Description: Inserts data to pInsertFamilyStatusType
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertFamilyStatusType](
	@FamilyStatusType Nvarchar(50) ,
	@ModifiedBy Name,
	@NewFamilyStatusTypeID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempNewFamilyStatusTypeID int
	
	SET @TempNewFamilyStatusTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
/****************************************************************************/

			
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			SELECT @NewFamilyStatusTypeID = FamilyStatusTypeID 
			  FROM person.LUFamilyStatusType
			     WHERE FamilyStatusType = Rtrim(Ltrim(@FamilyStatusType)) 
	     			If @TempNewFamilyStatusTypeID <>0 
				    	BEGIN
					     	SET @ErrorStatus = ' -60022 Insurance Type already exists in LUFamilyStatusType'; 
							RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
								
						END	
			 
/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60020';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16,1);
	END
	 
			  INSERT Person.LUFamilyStatusType(FamilyStatusType,ModifiedDate,ModifiedBy)
					VALUES (@FamilyStatusType,SYSDATETIME(),@ModifiedBy)
				
				set @NewFamilyStatusTypeID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-60021 Insert Failed on LUFamilyStatusType';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END











GO
/****** Object:  StoredProcedure [dbo].[pInsertFoodshelfCertification]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery6.sql|0|0|C:\Users\gSavard.WIN-QGO8QRSVG73\AppData\Local\Temp\3\~vs5A24.sql












/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Foodshelf.Certification, Foodshelf.Signature
Description: Inserts Food Shelf Certifications
Revisions: 28 March 11. Added CertificationTextID as a parameter
1 April 2011 Added Paper Certification Logic
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pInsertFoodshelfCertification](
	@PersonID int,
	@CertificationDate DateTime,
	@Signature NVarchar(MAX),
	@ModifiedBy Name,
	@CertificationTextID int =0,--Default to this because paper certification does not have an id
	@IsPaperCertification bit,
	@PaperCertificationDate DateTime,
	@NewFoodShelfCertificationID int Output,
	@NewSignatureID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonId int
	
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
			
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
										 
					--IF @TempPersonID = 0 OR @TempPersonID IS NULL--Person Does Not Exist, Bail!
					--   BEGIN
					--	SET @Success = 0;
					--	SET @ErrorStatus ='-16005 PersonID cant be null/0';
					--	RAISERROR(@ErrorStatus,16,1);
					--   END        
				
				SELECT @TempPersonID = PersonID 
				  FROM person.Person
					 WHERE PersonID = @PersonID
					 
				IF @TempPersonID = 0 OR @TempPersonID IS NULL
					BEGIN
						SET @Success =0;
						SET @ErrorStatus ='-16008 PersonID does not exist in Person';
						RAISERROR (@ErrorStatus,16,1);
					END
					
				--IF @CertificationTextID =0 OR @CertificationTExtID IS NULL
					--BEGIN
					--	SET @Success =0;
					--	SET @ErrorStatus ='CertificationTextID is mandatory';
					--	RAISERROR (@ErrorStatus, 16, 1)
					--END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -16000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END
/*IF this is a paper certification then we will have a CertificationTextID of 0*/
				  INSERT Foodshelf.FoodShelfCertification (PersonID,CertificationTextID,LastCertificationDate,IsPaperCertification,PaperCertificationDate,ModifiedDate,ModifiedBy)
					VALUES (@PersonID,@CertificationTextID,@CertificationDate,@IsPaperCertification,@PaperCertificationDate,SYSDATETIME(),@ModifiedBy);
					
					IF @@Error <> 0 
						BEGIN
							SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -16001 insert Failed FoodShelfCertification';
							SET @Success = 0;
							RAISERROR(@ErrorStatus, 16, 1);
						END
					
					set @NewFoodshelfCertificationID =@@IDENTITY;
					set @success =1;
					set @ErrorStatus ='';
			--We only call Foodshelf.Signature if this is an electronic certification
			If @IsPaperCertification =0
				Begin	
				 INSERT Foodshelf.Signature (PersonID,FoodShelfCertificationID,Signature,ModifiedDate, ModifiedBy) 
					VALUES (@PersonID,@NewFoodshelfCertificationID,@Signature,SYSDATETIME(),@ModifiedBy);
				END	
					
					IF @@Error <> 0 
						BEGIN
							SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -16001 insert Failed Signature';
							SET @Success = 0;
							RAISERROR(@ErrorStatus, 16, 1);
						END	
					SET @NewSignatureID = @@IDENTITY;
					SET @Success =1;
					SET @ErrorStatus ='';
					
				
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-16001 Insert Fail Certification ';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END
END













GO
/****** Object:  StoredProcedure [dbo].[pInsertFoodTypeGiven]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: FoodTypeGiven
Description: Inserts data to FoodTypeGiven. This SP requires PersonID, to be valid on input
in order to capture the appropriate information. ReceivedDate should also be a valid date/time since we need to be able
to return up to 90 days history for each client in reports. This date is not tested since we have to assume
that the record may have been input on paper for some reason, so we cannot use system date to test validity.
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pInsertFoodTypeGiven](
	@PersonID int ,
	@ReceivedDate DateTime,
	@FoodGiven FoodShelf.GroceryOrBreadProduce,
	@ModifiedBy Name,
	@NewFoodTypeGivenID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonID int

	SET @TempPersonID =0;
			
	SET @Success = 0;
	SET @ErrorStatus ='';
/****************************************************************************/

	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
		  --Make sure that we do not have bad data
		  IF (@PersonID = 0) OR (@PersonID IS NULL) 
			BEGIN
				SELECT @ErrorStatus = ' -600011 PersonID/ not valid';
				SET @Success = 0;
				RAISERROR(@ErrorStatus,16,1);
			END
		  
		  --We now have a valid range for each ID, but need to be sure that they exist in the database before trying the insert. We check the PersonProgramServicesUsed
		  --table since that ties the three IDs together. We have to assume that the record has already been insert to this table since this
		  --is a child of that table
			SELECT @TempPersonID = PersonID 
			  FROM person.Person
			     WHERE  PersonID=@PersonID   
	     			
	     			IF (@TempPersonID =0) OR (@TempPersonID IS NULL) 
				    	BEGIN
					     	SET @ErrorStatus = ' -600014 Person record does not exist in Person'; 
							RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
								
						END	
			 
/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-600010';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16,1);
	END
	 
			  INSERT Foodshelf.FoodTypeGiven(PersonID,ReceivedDate,FoodGiven,ModifiedDate,ModifiedBy)
					VALUES (@PersonID,@ReceivedDate,@FoodGiven,SYSDATETIME(),@ModifiedBy)
				
				set @NewFoodTypeGivenID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-600011 Insert Failed on FoodTypeGiven';
			  RAISERROR(@ErrorStatus, 16, 1);
		
		END CATCH
	END
END



GO
/****** Object:  StoredProcedure [dbo].[pInsertFullWorkHistory]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pInsertFullWorkHistory] 
@VolunteerPersonID int, 
@Month int, 
@Week int, 
@DayOfWeek int, 
@AvailableBeginTime time(7), 
@AvailableEndTime time(7), 
@IsNoShow bit, 
@ActualHoursTotal numeric(18,0),
@Job int,  
@ModifiedBy NVARCHAR(50),
@Error NVarchar(50) Output,
@ErrorNo int output,
@SUCCESS BIT OUTPUT
	
AS 

SET NOCOUNT ON;

DECLARE

@ErrNo int =0,
@ErrMsg Nvarchar(50)= ''

BEGIN TRY

BEGIN TRANSACTION	

BEGIN
--This will enter data into all three Volunteer Time Tables
EXEC dbo.pInsertVolunteerScheduleMonth @VolunteerPersonID, @Month, @ModifiedBy
--If there is an error, it breaks. 
SELECT @ErrNo = @@ERROR
IF @ErrNo <>0
	
	BEGIN
		RAISERROR (@ErrNo, 16, 0)
	END
	SET @SUCCESS =1


END

BEGIN
--Currently using @@Identity as it is the only way I can figure out how to return the identity from the previous insert.
--I am aware it only works for one insert at a time. 
EXEC dbo.pInsertVolunteerScheduleWeek @VolunteerScheduleMonthID = @@IDENTITY, @Week = @Week, @ModifiedBy = @Modifiedby
--If there is an error, it breaks.
SELECT @ErrNo = @@ERROR
IF @ErrNo <>0
	
	BEGIN
		RAISERROR (@ErrNo, 16, 0)
	END
	SET @SUCCESS =1


END

BEGIN
--Ditto previous comment. 
EXEC dbo.pInsertVolunteerScheduleDayTime @VolunteerScheduleWeekID = @@IDENTITY, @DayOfWeek = @DayOfWeek, 
	@AvailableBeginTime = @AvailableBeginTime, @AvailableEndTime = @AvailableEndTime, @IsNoShow = @IsNoShow,
	@ActualHoursTotal = @ActualHoursTotal, @ModifiedBy = @ModifiedBy
--If there is an error, it breaks.
SELECT @ErrNo = @@ERROR
IF @ErrNo <>0
	
	BEGIN
		RAISERROR (@ErrNo, 16, 0)
	END
	SET @SUCCESS =1

END

BEGIN 

EXEC dbo.pInsertVolunteerJobs @VolunteerScheduleDayTimeID = @@IDENTITY, @Job = @Job, @ModifiedBy = @ModifiedBy

SELECT @ErrNo = @@ERROR
IF @ErrNo <>0
	
	BEGIN
		RAISERROR (@ErrNo, 16, 0)
	END
	SET @SUCCESS =1
END

COMMIT TRANSACTION
END TRY
--Rolls the transaction back if there is an error. 
BEGIN CATCH
	ROLLBACK TRANSACTION
	SET @SUCCESS = 0;
	--I am using Print Error_Message as I was having issues with one of the included SPs
	--it was printing errors, but had next to no information on what was causing the error,
	--which made figuring it out a mess.
	PRINT ERROR_MESSAGE();

END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[pInsertHouseholdNotes]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO














/*************************************************************************************************
*Author: Gary Savard
*Date: 2 NOV 10
*Table Name: FoodShelf.Household Notes
Description: Inserts data to FoodShelf.HouseHoldNotes table.This table is for the notes associated with the
food shelf intake screens. There are 3 ID fields, the HouseholdNotesID is the identity. ClientPersonID
is the PersonID of the individual on which the note was written. The HouseholdMemberPersonID is optional, and
If this person is not the client, but a household member, this value will be the Client's personID. We 
may not need this field, but it is added for potential future functionality
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertHouseholdNotes](
	@ClientPersonID int,
	@HouseholdMemberPersonID int,
	@Notes Nvarchar(MAX),
	@ModifiedBy Name,
	@NewHouseholdNotesID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempHouseholdNotesID int,
	@TempClientPersonID int,
	@TempHouseholdMemberPersonID int
	
	SET @TempHouseholdNotesID =0;
	SET @TempClientPersonID = 0;	
	SET @Success = 0;
	SET @ErrorStatus ='';
	



		BEGIN TRY
		  BEGIN TRANSACTION;
				/****************************************************************************/
			--Validate both IDs coming in. Only the ClientPersonID is mandatory, so we check the HouseholdMemberPersonID only if it is not
			--0 or NULL
			SELECT @TempClientPersonID = PersonID 
			  FROM person.Person
				 WHERE PersonID = @ClientPersonID
			
			If @TempClientPersonID = 0 or @TempClientPersonID IS NULL
			BEGIN
				SET @ErrorStatus = ' -14032 ClientPersonID does not exist in Person'; --Failed in person table
				SET @Success =0;
				RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
				
			END	
		
		--Since this is an optional field, we only check it if it has a value other than 0 or NULL	
		IF @HouseholdMemberPersonID <> 0 AND @HouseholdMemberPersonID IS NOT NULL	
		 BEGIN
			SELECT @TempHouseholdMemberPersonID = @HouseholdMemberPersonID
				FROM Person.Person
					WHERE PersonID = @HouseholdMemberPersonID
		
			IF @TempHouseholdMemberPersonID = 0 OR @TempHouseholdMemberPersonID IS NULL
				BEGIN
					SET @ErrorStatus =' -14016 HouseholdMemberPersonID does not exist, though not NULL/0';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1);
				END
		 END			
				
		/****************************************************************************/	          

			
			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-14000';
				SET @Success = 0;
				RAISERROR (@ErrorStatus,16,1);
			END
			
			  INSERT Foodshelf.HouseholdNotes (ClientPersonID, HouseholdMemberPersonID, Notes,ModifiedBy, ModifiedDate)
					Values(@ClientPersonID,@HouseholdMemberPersonID,@Notes,@ModifiedBy,SYSDATETIME());
				
				SET @NewHouseholdNotesID =@@IDENTITY;
				SET @success =1;
				SET @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
			 --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SET @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
			 
			 SELECT @ErrorStatus =@ErrorStatus + ' -14001' +' Insert Failed HouseholdNotes';
			 SET @Success =0;
			 
			 RAISERROR(@ErrorStatus, 16, 1);
			 	 
		
		END CATCH
		
	
END















GO
/****** Object:  StoredProcedure [dbo].[pInsertHouseholdTransferOptions]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*************************************************************************************************
*Author: Gary Savard
*Date: 22 April 11
*Table Name: LUInsertHouseholdTransferOptions
Description: Inserts data to LUInsertHouseholdTransferOptions. This is a free format input so there is
a strong possibility that we will have duplicates, but those should be easily eliminated by the maintenance screens.
Revisions:

**************************************************************************************************/
CREATE PROCEDURE [dbo].[pInsertHouseholdTransferOptions](
	@ActionToTake Nvarchar(50),
	@ActionToTakeDescription NVarchar(MAX),
	@ModifiedBy Name,
	@NewActionToTakeID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

BEGIN
	DECLARE
	@TempActionToTakeID int
	
	SET @TempActionToTakeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

		
	

		BEGIN TRY
			BEGIN TRANSACTION;
		
			/****************************************************************************/
				--Avoid Duplicate Rows! However, a typo on input such as 'Hmoe' instead of 'Home' will do an isert.
				--Can't avoid finger problems!
				
			SELECT @TempActionToTakeID = HouseholdTransferActionID 
			  FROM dbo.LUHouseholdTransferOptions
				 WHERE ActionToTake = Rtrim(Ltrim(@ActionToTake)) --Be a bit paranoid and trim the input for white spaces
			If @TempActionToTakeID <> 0 --Already Exists
				BEGIN
					SELECT @ErrorStatus = '-7015 Action Already Exists';
					SET @Success =0;
					RAISERROR(@ErrorStatus, 16, 1);
				END

			/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = Convert (nVarchar(50),@@ERROR) + ' -6010';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16, 1);
	END
	 
			
			  INSERT dbo.LUHouseholdTransferOptions(ActionToTake,ActionToTakeDescription,ModifiedDate, ModifiedBy)
					VALUES (@ActionToTake,@ActionToTakeDescription,SYSDATETIME(),@ModifiedBy)
				
				set @NewActionToTakeID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus ='';
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SET @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
		
			  SET @Success =0;
			  SELECT  @ErrorStatus = @ErrorStatus + 'Rollback -6011';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			 
		END CATCH
		

END









GO
/****** Object:  StoredProcedure [dbo].[pInsertHousingStatus]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUHousingStatus
Description: Inserts data to LUHousingStatus. 
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertHousingStatus](
	@HousingStatus NVarchar(20),
	@ModifiedBy Name,
	@NewHousingStatusID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempHousingStatusID int
	
	SET @TempHousingStatusID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

	 
	BEGIN TRY
		BEGIN TRANSACTION;
			/****************************************************************************/

			SELECT @NewHousingStatusID = HousingStatusID 
			  FROM person.LUHousingStatus
				 WHERE HousingStatus = Rtrim(Ltrim(@HousingStatus)) --Be a bit paranoid and trim the input for white spaces
			If @TempHousingStatusID <>0 
				BEGIN
					SET @ErrorStatus = ' -60092 already exists LUHousingStatus'; --Failed in lookup table
					RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
					
				END	

			/****************************************************************************/	          

				IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60020';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
			
				BEGIN
		
		 			INSERT Person.LUHousingStatus(HousingStatus, ModifiedDate,ModifiedBy)
						VALUES (@HousingStatus,SYSDATETIME(),@ModifiedBy)
				
					set @NewHousingStatusID =@@IDENTITY;
					set @success =1;
					set @ErrorStatus =0;
					COMMIT TRANSACTION;
				END
		
	
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + +'-60021 Insert Failed Housing Status';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
END









GO
/****** Object:  StoredProcedure [dbo].[pInsertIncomeSource]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Address
Description: Inserts data to LUIncomeSource table.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertIncomeSource](
	@IncomeSourceAbbreviation NVarchar(10),
	@IncomeSourceDescription Nvarchar(50),
	@ModifiedBy Name,
	@NewIncomeSourceID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempIncomeSourceID int
	
	SET @TempIncomeSourceID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		

/****************************************************************************/
	
		
	BEGIN TRY
	  BEGIN TRANSACTION;
			--the address, so we need to be sure that the data matches an address type before continuing.
		SELECT @TempIncomeSourceID = IncomeSourceID 
		  FROM person.LUIncomeSource
			 WHERE IncomeSourceAbbreviation = Rtrim(Ltrim(@IncomeSourceAbbreviation)) --Be a bit paranoid and trim the input for white spaces
				
				If @TempIncomeSourceID <> 0
				BEGIN
					SET @ErrorStatus = ' -6092 Income Source exists in LUIncomeSource'; --Failed in lookup table
					RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
					
				END	
/****************************************************************************/	          

					IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = @@ERROR + '-6090';
						SET @Success = 0;
						RAISERROR (@ErrorStatus,16,1);
					END
	 
		
		
			  INSERT Person.LUIncomeSource(IncomeSourceAbbreviation,IncomeSourceDescription,ModifiedDate, ModifiedBy)
					VALUES (@IncomeSourceAbbreviation, @IncomeSourceDescription, SYSDATETIME(),@ModifiedBy)
				
				set @NewIncomeSourceID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
				--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			 SELECT @ErrorStatus =@ErrorStatus + ' -6091' +' Insert Failed LUIncomeSource';
			 SET @Success =0;
			 
			 RAISERROR(@ErrorStatus, 16, 1);
			 	 
		
		END CATCH
		
	
END











GO
/****** Object:  StoredProcedure [dbo].[pInsertInsuranceType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 14 March 11
*Table Name: LUInsuranceType
Description: Inserts data to pInsertInsuranceType
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertInsuranceType](
	@InsuranceType Nvarchar(50) ,
	@ModifiedBy Name,
	@NewInsuranceTypeID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempNewInsuranceTypeID int
	
	SET @TempNewInsuranceTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
/****************************************************************************/

			
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			SELECT @NewInsuranceTypeID = InsuranceTypeID 
			  FROM person.LUInsuranceType
			     WHERE InsuranceType = Rtrim(Ltrim(@InsuranceType)) 
	     			If @TempNewInsuranceTypeID <>0 
				    	BEGIN
					     	SET @ErrorStatus = ' -60022 Insurance Type already exists in LUInsuranceType'; 
							RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
								
						END	
			 
/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60020';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16,1);
	END
	 
			  INSERT Person.LUInsuranceType(InsuranceType,ModifiedDate,ModifiedBy)
					VALUES (@InsuranceType,SYSDATETIME(),@ModifiedBy)
				
				set @NewInsuranceTypeID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-60021 Insert Failed on LUInsuranceType';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END











GO
/****** Object:  StoredProcedure [dbo].[pInsertJournalClientFamilyChanges]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











/*************************************************************************************************
*Author: Gary Savard
*Date: 25 April 2011
*Table Name: JournalClientFamilyChanges
Description: Inserts data to journal requested changes to a family  member's household. A volunteer doing intake
may find that a household member potentially exists under a different client. The volunteer checks an appropriate box
for investigation, changes. The request is stored here along with the previous and new client's ID, if appropriate since
there may be reason to delete one of the persons involved.

13 July 11 - Temporarily removed check for @PreviousClientID
**************************************************************************************************/



CREATE PROCEDURE [dbo].[pInsertJournalClientFamilyChanges](
	@HouseholdMembersID int , 
	@PreviousClientsID int ,
	@NewClientsID int,
	@ActionTaken nVarchar(50),
	@Notes       nVarchar(MAX),
	@ModifiedBy Name, 
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;

BEGIN
	
			
--	SET @Success =0;
--	SET @ErrorStatus ='';
	
	
/****************************************************************************/

	BEGIN TRY
	  BEGIN TRANSACTION;
		
 
			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-60040';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
			
			--Checking for some things that have to have a value
			IF @HouseholdMembersID =0 OR @HouseholdMembersID IS NULL
				BEGIN
					SELECT @ErrorStatus ='Household Member ID cannot be null or 0';
					SET @Success =0;
					RAISERROR (@Errorstatus,16,1);
				END
			--Do them individually instead of one big IF statement for clarity	
			--IF @PreviousClientsID = 0 or @PreviousClientsID IS NULL
			--	BEGIN
			--		SELECT @ErrorStatus ='PreviousClientsID cannot be null or 0';
			--		SET @Success =0;
			--		RAISERROR(@ErrorSTatus,16,1);
			--	END
-- This could be a delete request so we do not care if @NewClientsID is null or 0
--			

--Must have an action
			IF @ActionTaken IS NULL or @ActionTaken =''
				BEGIN
					SELECT @ErrorStatus ='Action taken must have a value';
					SET @Success =0;
					RAISERROR(@ErrorSTatus,16,1);
				END
				
				
			BEGIN
		
			  --Add the entry
					INSERT dbo.JournalClientFamilyChanges
								(
									HouseholdMembersID,
									PreviousClientsID,
									NewClientsID,
									ActionTaken,
									Notes,
									ModifiedBy,
									ModifiedDate
								)
						VALUES
								(
									@HouseholdMembersID,
									@PreviousClientsID,
									@NewClientsID,
									@ActionTaken,
									@Notes,
									@ModifiedBy,
									SYSDATETIME()
													
								)
								
				
				SET @success =1;
				SET @ErrorStatus ='';
				COMMIT TRANSACTION;
			END
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus  +'-18001 Insert Failed on JournalClientFamilyChanges';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END

















GO
/****** Object:  StoredProcedure [dbo].[pInsertJournalLookupTableChanges]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












/*************************************************************************************************
*Author: Gary Savard
*Date: 25 April 2011
*Table Name: JournalLookupTableChanges
Description: Inserts data to journal requested changes to Lookup tables.. 
**************************************************************************************************/


CREATE PROCEDURE [dbo].[pInsertJournalLookupTableChanges](
	@LUChangeTable LUTableChanges READONLY,
	@ModifiedBy Name

	)
AS
SET NOCOUNT ON;

BEGIN
DECLARE
@ROWCOUNT int,
@LoopCount int

SET @ROWCOUNT=0;
SET @LoopCount =1;
			
	
	
/****************************************************************************/

	BEGIN TRY
	  BEGIN TRANSACTION;
		--How many records do we process
 		SELECT @ROWCOUNT = (SELECT COUNT(*) FROM @LUChangeTable)
				
			BEGIN
			
						--WHILE  @LoopCount<=@RowCount
						--	BEGIN
							
									
					--Add the entry
					INSERT INTO dbo.JournalLookupTableChanges
								(
									TableName,
									ActionTaken,
									OldValue,
									OldLUTableID,
									NewValue,
									ModifiedBy,
									ModifiedDate
								)
					SELECT t.TableName, t.ActionTaken, t.OldValue,t.OldLUTableID, t.NewValue,@ModifiedBy,SYSDATETIME() from @LUChangeTable as t
						--VALUES
						--		(
						--		    @TableName,
						--			@ActionTaken,
						--			@OldValue,
						--			@OldLUTableID,
						--			@NewValue,
						--			@ModifiedBy,
						--			SYSDATETIME()
						--		)
					--	SET @LoopCount =@LoopCount +1
					--END--End While @Rowcount
								
					
				
				COMMIT TRANSACTION;
			END
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			--Not doing error handling in this sp. Not needed other than rollback		
			
			
		END CATCH
		
	END


















GO
/****** Object:  StoredProcedure [dbo].[pInsertLanguage]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/*************************************************************************************************
*Author: Gary Savard
*Date: 15 Oct 10
*Table Name: LULanguage
Description: Inserts data to LULangage. This table Contains the most common languages and dialects in the world.Dialects
are comma demlmited. Example: Chinese, Mandarin.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertLanguage](
	@LanguageName Nvarchar(50),
	@ModifiedBy Name,
	@NewLanguageID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempLanguageID int
	
	SET @TempLanguageID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

		BEGIN TRY
		  BEGIN TRANSACTION;
		  /****************************************************************************/
			--Since some languages are comma delimited by dialect, we will use Soundex to test if the language already exists
			--in the db
			SELECT @TempLanguageID = LanguageID 
			  FROM person.LULanguage
				 WHERE LanguageName = Soundex(Rtrim(Ltrim(@LanguageName))) --Be a bit paranoid and trim the input for white spaces


			/****************************************************************************/	          
			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '  -6060';
					SET @Success = 0;
					RAISERROR(@ErrorStatus,16,1);
				END
			 
				
				IF @TempLanguageID = 0 --If they don't exist in the database then
					BEGIN
					
						INSERT Person.LULanguage (LanguageName,ModifiedDate, ModifiedBy)
									VALUES (@LanguageName,SYSDATETIME(),@ModifiedBy)
								
								set @NewLanguageID =@@IDENTITY;
								set @success =1;
								set @ErrorStatus =0;
						COMMIT TRANSACTION;
					END		
				
			END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT  @ErrorStatus= @ErrorStatus + 'LULanguage-6061';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			  
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pInsertLanguagesSpoken]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/*************************************************************************************************
*Author: Gary Savard
*Date: 15 Oct 10
*Table Name: LanguagesSpoken
Description: Inserts data to LanguagesSpoken. An individual may speak more than one language so this is assumed to
be one to many. We need to check to ensure the languageID exists in the language lookup table.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertLanguagesSpoken](
	@LanguageID int,
	@PersonID int,
	@IsPrimaryLanguage bit,
	@ModifiedBy Name,
	@NewLanguagesSpokenID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempLanguageID int,
	@TempPersonID int,
	@TempLanguagesSpokenID int
	
	SET @TempLanguageID =0;
	SET @TempPersonId =0;
	SET @TempLanguagesSpokenID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

		BEGIN TRY
		  BEGIN TRANSACTION;
		  /****************************************************************************/
			IF ((@PersonID = 0) OR (@PersonID IS NULL)) OR ((@LanguageID =0) OR (@LanguageID IS NULL))
				BEGIN	
					SELECT @ErrorStatus = '-11005 PersonID/LanguageID cant be 0/NULL';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1); 
				END
			
			SELECT @TempLanguageID = LanguageID 
			  FROM person.LULanguage
				 WHERE LanguageID = @LanguageID
			
			SELECT @TempPersonID = PersonID
				FROM Person.Person
					Where PersonID = @PersonID
					
			IF @TempLanguageID = 0 OR @TempLanguageID IS NULL
				BEGIN
					SELECT @ErrorStatus ='-11008 LanguageID does not exist in LULanguage';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1);
				END		
			IF @TempPersonID = 0 OR @TempPersonID IS NULL
				BEGIN
					SELECT @ErrorStatus ='-11008 PersonID does not exist in Person';
					SET @Success=0;
					RAISERROR(@ErrorStatus,16,1);
				END	

			--Final check to be sure this is not a duplicate
			
			SELECT @TempLanguagesSpokenID = LanguagesSpokenID 
				FROM Person.LanguagesSpoken
					WHERE LanguageID = @LanguageID AND PersonID =@PersonID
			
			IF @TempLanguagesSpokenID <> 0 
				--This already exists! Duplicate Row Error
				BEGIN
					SELECT @ErrorStatus = '-11009 Duplicate Row Exists';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1);
				END
				


			/****************************************************************************/	          
			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '  -6060';
					SET @Success = 0;
					RAISERROR(@ErrorStatus,16,1);
				END
			 
				
				--If they don't exist in the database then
				
					
						INSERT Person.LanguagesSpoken(LanguageID,PersonID,IsPrimaryLanguage,ModifiedDate, ModifiedBy)
									VALUES (@LanguageID,@PersonID,@IsPrimaryLanguage,SYSDATETIME(),@ModifiedBy)
								
								set @NewLanguagesSpokenID =@@IDENTITY;
								set @success =1;
								set @ErrorStatus =0;
						COMMIT TRANSACTION;
						
				
			END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT  @ErrorStatus= @ErrorStatus + 'Languages Spoken -11001';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pInsertLUfamilyRelationships]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUFamilyRelationships
Description: Inserts data to LUFamilyRelationships.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertLUfamilyRelationships](
	@RelationshipCode Nvarchar(30),
	@RelationshipDescription Nvarchar(50) ='',
	@ModifiedBy Name,
	@NewFamilyRelationshipID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempFamilyRelationshipID int
	
	SET @TempFamilyRelationshipID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
/****************************************************************************/

	
	BEGIN TRY
	  BEGIN TRANSACTION;
		 SELECT @TempFamilyRelationshipID = FamilyRelationshipID 
			  FROM person.LUFamilyRelationship
				WHERE RelationshipCode = Rtrim(Ltrim(@RelationshipCode)) 
	     IF @TempFamilyRelationshipID <>0 
				BEGIN
					SET @ErrorStatus = ' -60042 Relationship exists in LUFamilyRelationship'; 
						RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
					
				END	
 
			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-60040';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
		
	IF @TempFamilyRelationshipID = 0 -- Don't really need this with the above raise error, but for clarity.If they don't exist in the database then
		BEGIN
		
			  INSERT Person.LUFamilyRelationship(RelationshipCode,RelationshipDescription,ModifiedDate,ModifiedBy)
					VALUES (@RelationshipCode,@RelationshipDescription,SYSDATETIME(),@ModifiedBy)
				
				set @NewFamilyRelationshipID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
				COMMIT TRANSACTION;
			END
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus  +'-60041 Insert Failed on LUFamilyRelationship';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pInsertPerson]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/*************************************************************************************************
*Lookup Table Stored Procedure Template. Change XXX in name to the name of the table that will get the insert. This is to be used
*for single table inserts only. 
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Person
Description: Iserts data to Person table
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pInsertPerson](
	@Title NVarchar(8) =NULL,
	@FirstName Name,
	@MiddleName Name = Null,
	@LastName Name,
	@Suffix NVarchar(10) = Null,
	@DateOfBirth DateTime,
	@EmailAddress Nvarchar(50) = Null,
	@EmailContactPreference NoYes =0,
	@ModifiedBy Name,
	@NewPersonID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonID int,
	@PersonID int;
	
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempPersonID =0;		

	
	           
BEGIN TRY
	 BEGIN TRANSACTION;
	
	 SELECT @TempPersonID = PersonID 
	  FROM person.Person
	     WHERE Firstname = @FirstName AND LastName = @LastName AND
	           DateOfBirth =@DateOfBirth
		IF @TempPersonID <>0
			BEGIN
				SELECT @ErrorStatus =  'Person Already Exists -1017';
				SET @Success = 0;
				RAISERROR(@ErrorStatus,16,1);
			END
		
		IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-1000';
				SET @Success = 0;
				RAISERROR(@ErrorStatus,16,1);
			END
		 
			
			  INSERT Person.Person(Title,FirstName,MiddleName,LastName, Suffix,DateOfBirth, EmailAddress, EmailContactPreference, ModifiedDate, ModifiedBy, IsDeleted)
					VALUES (@Title, @FirstName, @MiddleName,@LastName,@Suffix,@DateOfBirth,@EmailAddress,@EmailContactPreference,SYSDATETIME(),@ModifiedBy, 0)
				
				set @NewPersonID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
	
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SET @ErrorStatus=  @ErrorStatus + '-1001';
			  RAISERROR(@ErrorStatus, 15, 1);
		
			  
		END CATCH
		
	END









GO
/****** Object:  StoredProcedure [dbo].[pInsertPersonType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUPersonType
Description: Inserts data to LUPersonType. 
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertPersonType](
	@PersonType NVarchar(20),
	@ModifiedBy Name,
	@NewPersonTypeID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonTypeID int
	
	SET @TempPersonTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

BEGIN TRY
	BEGIN TRANSACTION;
	/****************************************************************************/
	--Does it already exist? If so, don't insert it.
	SELECT @TempPersonTypeID = PersonTypeID  
	  FROM person.LUPersonType
	     WHERE PersonType = Rtrim(Ltrim(@PersonType)) 

/****************************************************************************/	          
		IF @TempPersonTypeID <> 0
			BEGIN
				SELECT @ErrorStatus = @@ERROR + '-600007 PersonType already exists';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	
		IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = @@ERROR + '-600000';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
		 
		
	
		BEGIN
		
			  INSERT Person.LUPersonType(PersonType,ModifiedDate,ModifiedBy)
					VALUES (@PersonType,SYSDATETIME(),@ModifiedBy)
				
				set @NewPersonTypeID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		END
END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600001 Insert Failed Person Type';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pInsertPhone]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Phone
Description: Inserts data to phone table. The row is tied to the person.personid. This Stored proc/table does not directly
access the LUPhoneType table. The type is selected by the user from a dropdown and we just store the ID from the dropdown behind the scenes  
 for simplicity
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertPhone](
	@PersonID int,
	@PhoneNumber Phone,
	@PhoneExtension NVarchar(8),
	@PhoneType int,
	@ModifiedBy Name,
	@PhoneID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempPhoneID int,
	@TempPersonID int
	
	SET @TempPhoneID =0;
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
    BEGIN TRY
		  BEGIN TRANSACTION;
			IF @PersonID = 0 OR @PersonID IS NULL -- This has to be valid or we bail out!
				BEGIN
					SET @Success =0;
					SET @ErrorStatus = '8008: PersonID must be valid';
						
					RAISERROR(@ErrorStatus,16,1);
				END
				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = @@ERROR + '-8030';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

	 	
			  INSERT Person.Phone(PersonID,PhoneNumber,PhoneExtension, PhoneType,ModifiedDate, ModifiedBy)
					VALUES (@PersonID,@PhoneNumber,@PhoneExtension, @PhoneType,SYSDATETIME(),@ModifiedBy)
				
				set @PhoneID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
				
		  COMMIT TRANSACTION;
			
	END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
			--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
				
	  	    SELECT @ErrorStatus= @ErrorStatus + '8001';
		    RAISERROR(@ErrorStatus, 16, 1);
		    SET @Success =0;
			 
			
		END CATCH

		














GO
/****** Object:  StoredProcedure [dbo].[pInsertPhoneType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************

*Author: Gary Savard
*Date: 12 Oct 10
*Table Name: LUPhoneType
Description: Inserts Phone Type to the LUPhoneType table.The data in this table could easily become
poor if the user does not take care when inserting phone types. A mis-spelling can cause unintential duplicate
records.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertPhoneType](
	@PhoneType int,
	@ModifiedBy Name,
	@NewPhoneTypeID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPhoneTypeID int
	
	SET @TempPhoneTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	


		 
BEGIN TRY
  BEGIN TRANSACTION;	
  /****************************************************************************/
	--Check to be sure that the Phone Type doesn't already exist.
	SELECT @TempPhoneTypeID = PhoneTypeID
	  FROM person.LUPhoneType
		 WHERE PhoneType = ltrim(rtrim(@PhoneType))	 
	
	IF @TempPhoneTypeID <> 0
	BEGIN
	SET @ErrorStatus = '-6082' + ' PhoneType exists in LUPhoneType' ; --Failed in lookup table
		RAISERROR(@ErrorStatus,15,1);--Could use WITH LOG for event log
		
	END	
       

	IF @@Error <> 0 
		BEGIN
			SET @ErrorStatus = '-6080';
			SET @Success = 0;
			RAISERROR (@ErrorStatus,16,1);
		END
	   	
	  	  INSERT Person.LUPhoneType(PhoneType,ModifiedDate, ModifiedBy)
				VALUES (@PhoneType, SYSDATETIME(),@ModifiedBy)
				
			set @NewPhoneTypeID =@@IDENTITY;
			set @success =1;
			set @ErrorStatus ='';
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
		--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			 
			  SET @ErrorStatus= @Errorstatus + ' -6081' +'Insert Failed on Phone Type';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			  ROLLBACK TRANSACTION;
		END CATCH
		

END









GO
/****** Object:  StoredProcedure [dbo].[pInsertPostalCode]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








/*************************************************************************************************

*Author: Gary Savard
*Date: 12 Oct 10
*Table Name: Address
Description: Inserts Postal Code to the Postal Code table.This requires that the CityID be passed in as a
paramter. It is unlikely that a new city will be build, requiring a new postal code, but it is very likely
that a new postal code will be needed in a city.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertPostalCode](
	@CityID int,
	@PostalCode Nvarchar(10),
	@ModifiedBy Name,
	@NewPostalCodeID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempCityID int
	
	
	SET @TempCityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	


		
BEGIN TRY
	BEGIN TRANSACTION;	 
	/****************************************************************************/
	--Check to be sure that the city does exist in the city table before we go on.
	SELECT @TempCityID = CityID
	  FROM person.LUCity
		 WHERE CityID = @CityID
	
	IF @TempCityID = 0
		BEGIN
			SET @ErrorStatus = '-6072' + ' CityID doesnt exist LUCity, cant insert PostalCode' ; --Failed in lookup table
			RAISERROR(@ErrorStatus,15,1);--Could use WITH LOG for event log
			
		END	
/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SET @ErrorStatus = '-6070';
		SET @Success = 0;
		RAISERROR (@ErrorStatus,16,1);
	END
	 
		
		  INSERT Person.LUPostalCode(CityID,PostalCode,ModifiedDate, ModifiedBy)
					VALUES (@CityID, @PostalCode, SYSDATETIME(),@ModifiedBy)
				
				set @NewPostalCodeID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus ='';
				COMMIT TRANSACTION;
		
END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
			--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SET @ErrorStatus='-6071' +'Insert Failed on PostalCode';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			  
		END CATCH
		

END









GO
/****** Object:  StoredProcedure [dbo].[pInsertPrograms]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Programs
Description: Inserts data to Programs table. This table creates the one to many relationship between a person and programs. Each person
may use 0 or more programs. If they are not using a program, we will not do an insert to this table.
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pInsertPrograms](
	@PersonID int,
	@ProgramID int,
	@ModifiedBy Name,
	@NewProgramsID int output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempProgramID int,
	@TempPersonID int
	
	SET @TempPersonID =0;
	SET @TempProgramID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
			
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
			IF (((@PersonID = 0)OR (@PersonID IS NULL)) OR ((@ProgramID =0) OR (@ProgramID IS NULL)))
				BEGIN
					SELECT @ErrorStatus =' -9005 PersonID/ProgramID Cant be 0/NULL';
					SET @Success =0;
					RAISERROR (@ErrorStatus,16,1);
				END
			
			
			--Are these valid ids? 
				SELECT @TempPersonID = PersonID 
				  FROM person.Person
					 WHERE PersonID = @PersonID
					 
				SELECT @TempProgramID = @ProgramID
				  FROM Person.LUProgramType
					  WHERE ProgramTypeID = @ProgramID
					 
				IF @TempPersonID = 0 OR @TempPersonID IS NULL--Cant have these! 
				   BEGIN
					SELECT @ErrorStatus = '-9005 PersonID doesnt exist';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1);
				   END        
				   
				 IF @TempProgramID = 0 OR @TempProgramID IS NULL 
					BEGIN
						SELECT @ErrorStatus = '-9006 ProgramID doesnt exist';
						SET @Success =0;
						RAISERROR (@ErrorStatus,16,1);
					END  

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -1000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				  INSERT Person.Programs(PersonID,ProgramID,ModifiedDate, ModifiedBy)
						VALUES (@PersonID, @ProgramID, SYSDATETIME(),@ModifiedBy)
					
					SET @NewProgramsID = @@IDENTITY;
					SET @success =1;
					SET @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-9011 Insert Fail Programs';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END
END










GO
/****** Object:  StoredProcedure [dbo].[pInsertProgramServicesUsed]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: ProgramServicesUsed
Description: Inserts data to child of Services.The IDs (PersonID,ProgramID,ProgramServiceID) must all be correct to do an insert.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertProgramServicesUsed](
	@ProgramServiceID int,
	@PersonID int,
	@ProgramID int,
	@ModifiedBy Name,
	@NewProgramServiceUsedID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempProgramServiceID int,
	@TempPersonID int,
	@TempProgramID int
	
	SET @TempProgramServiceID =0;
	SET @TempPersonID =0;
	SET @TempProgramID=0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
         
BEGIN TRY
	  BEGIN TRANSACTION;
	  --All have to be valid
	  IF (@PersonID = 0 OR @PersonID IS NULL) OR (@ProgramID =0 OR @ProgramID IS NULL) OR (@ProgramServiceID = 0 OR @ProgramServiceID IS NULL)
		BEGIN
			SELECT @ErrorStatus ='-10005 PersonId,ProgramID,ProgramServiceID cant be 0/NULL';
			SET @Success =0;
			RAISERROR(@ErrorStatus,16,1);
		END	
			
	--Now check to see that each ID exists in the appropriate table
	
		SELECT @TempPersonID = PersonID
			FROM Person.Person
				WHERE PersonID = @PersonID
				
		SELECT @TempProgramID = ProgramTypeID
			FROM Person.LUProgramType
				WHERE ProgramTypeID = @ProgramID
				
		SELECT @TempProgramServiceID = ProgramServiceTypeID
			FROM Person.LUProgramServiceType
				WHERE ProgramServiceTypeID = @ProgramServiceID 
				
	 IF (@TempPersonID = 0 OR @TempPersonID IS NULL) OR (@TempProgramID =0 OR @TempProgramID IS NULL) OR (@TempProgramServiceID = 0 OR @TempProgramServiceID IS NULL)
		BEGIN
			SELECT @ErrorStatus ='-10008 PersonId,ProgramID or ProgramServiceID does not exist';
			SET @Success =0;
			RAISERROR(@ErrorStatus,16,1);
		END	
				
				
					
			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6040';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
		 
		
	  BEGIN
			  INSERT Person.ProgramServicesUsed(PersonID,ProgramID,ProgramServiceID,ModifiedDate, ModifiedBy)
					VALUES (@PersonID,@ProgramID,@ProgramServiceID,SYSDATETIME(),@ModifiedBy)
				
				set @NewProgramServiceUsedID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			 COMMIT TRANSACTION;
		END
		
	END TRY

		BEGIN CATCH
			--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  ROLLBACK TRANSACTION;
			  SET @Success =0;
			  SET @ErrorStatus=@@ERROR +@ErrorStatus+ '-10001';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			 
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pInsertProgramServiceType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUProgramServiceType
Description: Inserts data to LUProgramServiceType. This table matches the Program with the service being
used by the client.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertProgramServiceType](
	@ServiceCode Nvarchar(20),
	@ServiceDescription NVarchar(50),
	@ModifiedBy Name,
	@NewProgramTypeID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempProgramServiceTypeID int
	
	SET @TempProgramServiceTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
/****************************************************************************/
	
	SELECT @TempProgramServiceTypeID = ProgramServiceTypeID 
	  FROM person.LUProgramServiceType
	     WHERE ServiceCode = Rtrim(Ltrim(@ServiceCode)) --Be a bit paranoid and trim the input for white spaces
	 

/****************************************************************************/	          
BEGIN TRY
	  BEGIN TRANSACTION;
			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6040';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
		 
		
	IF @TempProgramServiceTypeID = 0 --If they don't exist in the database then
	  BEGIN
		
			  INSERT Person.LUProgramServiceType(ServiceCode,ServiceDescription,ModifiedDate, ModifiedBy)
					VALUES (@ServiceCode,@ServiceDescription,SYSDATETIME(),@ModifiedBy)
				
				set @TempProgramServiceTypeID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			 COMMIT TRANSACTION;
		END
		
	END TRY

		BEGIN CATCH
			--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  ROLLBACK TRANSACTION;
			  SET @Success =0;
			  SET @ErrorStatus=@@ERROR +@ErrorStatus+ '-6051';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			 
		END CATCH
		
	END










GO
/****** Object:  StoredProcedure [dbo].[pInsertProgramType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUProgramType
Description: Inserts data to LUProgramType. This table matches the Program with the user.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertProgramType](
	@ProgramName Nvarchar(20),
	@ProgramDescription NVarchar(50),
	@ModifiedBy Name,
	@NewProgramTypeID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempProgramTypeID int
	
	SET @TempProgramTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

BEGIN TRY
	BEGIN TRANSACTION;
	/****************************************************************************/
	--This is a bit different than some procedures because there is a lookup table associated with 
	--the address, so we need to be sure that the data matches a program type before continuing.
	SELECT @TempProgramTypeID = ProgramTypeID 
	  FROM person.LUProgramType
	     WHERE ProgramName = Rtrim(Ltrim(@ProgramName)) --Be a bit paranoid and trim the input for white spaces
 

/****************************************************************************/	          
		IF @@Error <> 0 
		BEGIN
			SELECT @ErrorStatus = @@ERROR + ' -6040';
			SET @Success = 0;
		END
		 
		
	IF @TempProgramTypeID = 0 --If they don't exist in the database then
	  BEGIN
		
			  INSERT Person.LUProgramType(ProgramName,ProgramDescription,ModifiedDate, ModifiedBy)
					VALUES (@ProgramName,@ProgramDescription,SYSDATETIME(),@ModifiedBy)
				
				set @NewProgramTypeID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
	  END
		
		END TRY

		BEGIN CATCH
		  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
			--We only care if the error was not raised by SSE
			IF @@ERROR <> 50000
				BEGIN
					SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
				END
			  ROLLBACK TRANSACTION;
			  SET @Success =0;
			  SET @ErrorStatus= @ErrorStatus +' -6041 Insert Failed on Program Type';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			 
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pInsertRace]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LURace
Description: Inserts data to LURace. This table matches the Race with a U.S Census race category
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertRace](
	@RaceAbbreviation NVarchar(10),
	@RaceDescription NVarchar(50),
	@ModifiedBy Name,
	@NewRaceID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempRaceID int
	
	SET @TempRaceID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	          
BEGIN TRY
	BEGIN TRANSACTION;
/****************************************************************************/
	--This is a bit different than some procedures because there is a lookup table associated with 
	--the race, so we need to be sure that the data matches a race type before continuing. Hopefully, the
	--abbreviations will be consistent so that we do not have duplicates. There is no sure way to code this.
	--White, Black(AA or Negro).American Indian or Alaskan native.,Asian Indian,Chinese,Filipino, Other Asian, Japanese,
	--Korean, Vietnamese, Native Hawaiian, Guanamanian or Chamorro, Samoan, Other pacific Islander.
	SELECT @TempRaceID = RaceID 
	  FROM person.LURace
	     WHERE RaceAbbreviation = Rtrim(Ltrim(@RaceAbbreviation)) --Be a bit paranoid and trim the input for white spaces


/****************************************************************************/	
		IF @@Error <> 0 
		BEGIN
			SELECT @ErrorStatus = @@ERROR + '-6020';
			SET @Success = 0;
			RAISERROR(@ErrorStatus, 16,1);
		END
		 
		
	IF @TempRaceID = 0 --If they don't exist in the database then
		BEGIN
		
			  INSERT Person.LURace(RaceAbbreviation,RaceDescription, ModifiedDate,ModifiedBy)
					VALUES (@RaceAbbreviation,@RaceDescription,SYSDATETIME(),@ModifiedBy)
				
				set @NewRaceID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		END
END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6021 Insert Failed Race Type';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END










GO
/****** Object:  StoredProcedure [dbo].[pInsertSSN]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/*************************************************************************************************
*Author: Gary Savard
*Date: 15 Oct 10
*Table Name: SSN.SSN
Description: Inserts data to SSN. Only Certain federal programs require that SSN be captured, so we only want to
use this sparingly.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertSSN](
	@PersonID int,
	@SSN NVarchar(9),
	@ModifiedBy Name,
	@NewSSNID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonID int,
	@TempSSNID int
	
	SET @TempPersonId =0;
	SET @TempSSNID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

		BEGIN TRY
		  BEGIN TRANSACTION;
		  SELECT @SSN = ltrim(rtrim(@SSN)); --Get rid of spaces before we begin!
		  /****************************************************************************/
			IF ((@PersonID = 0) OR (@PersonID IS NULL)) 
				BEGIN	
					SELECT @ErrorStatus = '-12005 PersonID cant be 0/NULL';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1); 
					
				END
			IF ((LEN(@SSN)<9) OR (@SSN IS NULL))
				BEGIN	
					SELECT @ErrorStatus = '-11006 Invalid SSN';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1); 
				
				END
			
			
			SELECT @TempPersonID = PersonID
				FROM Person.Person
					Where PersonID = @PersonID
					
			
			IF @TempPersonID = 0 OR @TempPersonID IS NULL
				BEGIN
					SELECT @ErrorStatus ='-12008 PersonID does not exist in Person';
					SET @Success=0;
					RAISERROR(@ErrorStatus,16,1);
				END	

			--Final check to be sure this is not a duplicate
			
			SELECT @TempSSNID = SSNID 
				FROM SSN.SSN
					WHERE PersonID = @PersonID AND SSN =@SSN
								
			IF @TempSSNID <> 0 
				--This already exists! Duplicate Row Error
				BEGIN
					SELECT @ErrorStatus = '-12009 Duplicate Row Exists';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1);
				END
				


			/****************************************************************************/	          
			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '  -6060';
					SET @Success = 0;
					RAISERROR(@ErrorStatus,16,1);
				END
			 
				
				--If they don't exist in the database then
				
					
						INSERT SSN.SSN (PersonID,SSN,ModifiedDate, ModifiedBy)
							VALUES (@PersonID,@SSN,SYSDATETIME(),@ModifiedBy)
								
								SET @NewSSNID =@@IDENTITY;
								SET @success =1;
								SET @ErrorStatus =0;
								
						COMMIT TRANSACTION;
						
				
			END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT  @ErrorStatus= @ErrorStatus + 'SSN -12001';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pInsertState]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUState
Description: Inserts data to LUState. This table matches the State with a State ID for ties to County, City and Zip Code.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertState](
	@StateCode Nvarchar(2),
	@Name Nvarchar(50),
	@ModifiedBy Name,
	@NewStateID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempStateID int
	
	SET @TempStateID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

BEGIN TRY
	 BEGIN TRANSACTION;
	 /****************************************************************************/
	--This is a bit different than some procedures because we do not want duplicates in the table associated with 
	--the state, so we need to be sure that the data matches a state before continuing.
	SELECT @TempStateID = StateID 
	  FROM person.LUState
	     WHERE StateCode = Rtrim(Ltrim(@StateCode)) --Be a bit paranoid and trim the input for white spaces

/****************************************************************************/	          
		IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-6030';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16, 1);
			END
		IF @TempStateID <>0
			BEGIN
				SELECT @ErrorStatus = 'State Already exists -6037'
				SET @Success =0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
		
			  INSERT Person.LUState(StateCode,Name,ModifiedDate, ModifiedBy)
					VALUES (@StateCode,@Name,SYSDATETIME(),@ModifiedBy)
				
				set @NewStateID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
			 COMMIT TRANSACTION;
	
			
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  SET @Success =0;
			  SET @ErrorStatus= @ErrorStatus + @@ERROR + '-6031 Insert Failed on State';--6030-6039 is for this table
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			  
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pInsertUpdateFoodShelfCertification]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Foodshelf.FoodShelfCertification
Description: Inserts  OR updates data to Foodshelf.FoodShelfCertification. This procedure sets the last date of client
	certification using the passed in PersonID. If the PersonID already exists in the Table, then the 
	SP will update that row to the "LastCertificationDate", Else it will Insert a new row.
	This stored procedure should only be called if the person needs to certify or recertify.
Revisions:28 March 11. GS added CertificationTextID
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pInsertUpdateFoodShelfCertification](
	@PersonID int,
	@LastCertificationDate Date,
	@CertificationTextID int,
	@ModifiedBy Name,
	@NewFoodShelfCertificationID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS

Set NoCount ON;


	DECLARE
	@TempFoodShelfCertificationID int;
	
	SET @TempFoodShelfCertificationID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
         


BEGIN TRY
/****************************************************************************/
	
	SELECT @TempFoodShelfCertificationID = FoodshelfCertificationID
	  FROM Foodshelf.FoodShelfCertification
	     WHERE Foodshelf.FoodShelfCertification.PersonID = @PersonID 

/****************************************************************************/	 
		
	IF @TempFoodShelfCertificationID = 0 --If they don't exist in the database then
	 
	   BEGIN
	  
	 	BEGIN TRANSACTION;
	 				IF @CertificationTextID = 0 or @CertificationTextID IS NULL
	 					BEGIN
	 						SET @Success = 0;
							SET @ErrorStatus ='-16005 CertificationTextID cannot be null/0';
							RAISERROR(@ErrorStatus,16,1);
	 					END
					IF @@Error <> 0 
						BEGIN
							SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-6040';
							SET @Success = 0;
							RAISERROR (@Errorstatus, 16,1);
						END
			
				INSERT Foodshelf.FoodShelfCertification(PersonID,CertificationTextID,LastCertificationDate,ModifiedDate, ModifiedBy)
					VALUES (@PersonID,@CertificationTextID,@LastCertificationDate,SYSDATETIME(),@ModifiedBy)
				
				set @TempFoodShelfCertificationID =@@IDENTITY;
				set @success =1;
				set @ErrorStatus =0;
				COMMIT TRANSACTION;
			
		  
		END
	ELSE --The person exists so Update to the new certification date and verbiage.	
		BEGIN	
				IF @CertificationTextID = 0 or @CertificationTextID IS NULL
	 					BEGIN
	 						SET @Success = 0;
							SET @ErrorStatus ='-16005 CertificationTextID cannot be null/0';
							RAISERROR(@ErrorStatus,16,1);
	 					END
			
				BEGIN TRANSACTION;
						
					UPDATE Foodshelf.FoodShelfCertification
						SET LastCertificationDate = @LastCertificationDate,
							CertificationTextID = @CertificationTextID
						WHERE PersonID = @PersonID AND FoodShelfCertificationID = @TempFoodShelfCertificationID
				COMMIT TRANSACTION;
		END
	END TRY
	

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			   --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus = @ErrorStatus + ' -8001 Insert Fail ProgramSvcType';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			  
		END CATCH

		
	
















GO
/****** Object:  StoredProcedure [dbo].[pInsertVolunteerContactInformation]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Gary Savard
-- Create date: 06/01/2011
-- Description:	Inserts volunteer contact information
-- =============================================
CREATE PROCEDURE [dbo].[pInsertVolunteerContactInformation] 
	-- Add the parameters for the stored procedure here
	@ContactFirstName Name,
	@ContactLastName Name,
	@ContactPersonID int,
	@ContactAddress1 NVarchar(50),
	@ContactAddress2 NVarchar(50)=NULL,
	@ContactHomePhone Phone,
	@ContactWorkPhone Phone,
	@ContactCellPhone Phone,
	@ContactPager Nvarchar(20),
	@ContactEmail NVarchar(50),
	@VolunteerTypeID int,
	@IsActive bit,
	@ModifiedBy Name,
	@VolunteerPersonID int,
	@Error NVarchar(50) Output,
	@ErrorNo int output,
	@Success bit Output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE 

@ErrNo int =0,
@ErrMsg NVarchar(50)=''

BEGIN TRY

   	
	--Data is Valid, start the transaction
	BEGIN TRANSACTION
	
		INSERT INTO Volunteer.VolunteerContactInformation(
						VolunteerPersonID,
						ContactPersonID,
						ContactFirstName,
						ContactLastName,
						ContactAddress1,
						ContactAddress2,
						ContactEmail,
						ContactHomePhone,
						ContactCellPhone,
						ContactWorkPhone,
						ContactPager,
						VolunteerTypeID,
						IsActive,
						ModifiedBy,
						ModifiedDate)
				
					VALUES
					(@VolunteerPersonID,
					 @ContactPersonID,
					 @ContactFirstName,
					 @ContactLastName,
					 @ContactAddress1,
					 @ContactAddress2,
					 @ContactEmail,
					 @ContactHomePhone,
					 @ContactCellPhone,
					 @ContactWorkPhone,
					 @ContactPager,
					 @VolunteerTypeID,
					 @IsActive,
					 @ModifiedBy,					
					 SYSDATETIME()
					 )
					 
			SELECT @ErrNo = @@ERROR
			
			IF @ErrNo <>0--<> Error!
				BEGIN
					RAISERROR(@ErrNo,16,0)
				END
			SET @Success =1;
			
			COMMIT TRANSACTION
			
			SELECT @VolunteerPersonID
				
	
	
	END TRY
	
	BEGIN CATCH
		ROLLBACK TRANSACTION
		--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				
			  SET @Success =0;
			  
			 IF RTRIM(LTRIM(@errmsg)) =''
				 BEGIN
					SELECT @Error ='Failure in InsertPersonContactInformation Rollback'
				 END
			 ELSE
				BEGIN
					SELECT @Error = @ErrMsg
				END
			 
			 SET @ErrorNo = @ErrNo
			  
	END CATCH
   
END





GO
/****** Object:  StoredProcedure [dbo].[pInsertVolunteerEmergencyContactInformation]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gary Savard
-- Create date: 06/01/2011
-- Description:	Inserts volunteer emergency contact information
-- =============================================
create PROCEDURE [dbo].[pInsertVolunteerEmergencyContactInformation] 
	-- Add the parameters for the stored procedure here
	@VolunteerPersonID int,
	@ContactInformation NVARCHAR(MAX),
	@ModifiedBy Name,
	@EmergencyContactInformationID int Output,
	@Error NVarchar(50) Output,
	@ErrorNo int output,
	@Success bit Output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE 

@ErrNo int =0,
@ErrMsg NVarchar(50)=''

BEGIN TRY

   		
	--Data is Valid, start the transaction
	BEGIN TRANSACTION
	
		IF @VolunteerPersonID =0 OR @VolunteerPersonID IS NULL
			BEGIN
				SELECT @ErrNo =999999
				SELECT @ErrMsg='VolunteerPersonID cannot be 0 or NULL'
				RAISERROR(@ErrNo,16,0)
			END
	
		INSERT  Volunteer.VolunteerEmergencyContact(
						VolunteerPersonID,
						ContactInformation,
						ModifiedBy,
						ModifiedDate)
				
					VALUES
					(@VolunteerPersonID,
					 @ContactInformation,
					 @ModifiedBy,					
					 SYSDATETIME()
					 )
					 
			SELECT @ErrNo = @@ERROR
			
			IF @ErrNo <>0--<> Error!
				BEGIN
					RAISERROR(@ErrNo,16,0)
				END
			SET @Success =1;
			
			COMMIT TRANSACTION
			
			SELECT @VolunteerPersonID = @@IDENTITY
				
	
	
	END TRY
	
	BEGIN CATCH
		ROLLBACK TRANSACTION
		--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				
			  SET @Success =0;
			  
			 IF RTRIM(LTRIM(@errmsg)) =''
				 BEGIN
					SELECT @Error ='Failure in InsertVolEmergencyContactInfo Rollback'
				 END
			 ELSE
				BEGIN
					SELECT @Error = @ErrMsg
				END
			 
			 SET @ErrorNo = @ErrNo
			  
	END CATCH
   
END

GO
/****** Object:  StoredProcedure [dbo].[pInsertVolunteerJobs]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pInsertVolunteerJobs] @VolunteerScheduleDayTimeID INT, @Job INT, @ModifiedBy Name 

AS

SET NOCOUNT ON

INSERT INTO Volunteer.VolunteerJobs
(VolunteerScheduleDayTimeID,
Job,
ModifiedDate,
ModifiedBy)

VALUES
(@VolunteerScheduleDayTimeID,
@Job,
SYSDATETIME(),
@ModifiedBy)

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[pInsertVolunteerNotes]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gary Savard
-- Create date: 06/01/2011
-- Description:	Inserts volunteer Notes
-- =============================================
create PROCEDURE [dbo].[pInsertVolunteerNotes] 
	-- Add the parameters for the stored procedure here
	@VolunteerPersonID int,
	@Notes NVARCHAR(MAX),
	@ModifiedBy Name,
	@EmergencyContactInformationID int Output,
	@Error NVarchar(50) Output,
	@ErrorNo int output,
	@Success bit Output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE 

@ErrNo int =0,
@ErrMsg NVarchar(50)=''

BEGIN TRY

   		
	--Data is Valid, start the transaction
	BEGIN TRANSACTION
	
		IF @VolunteerPersonID =0 OR @VolunteerPersonID IS NULL
			BEGIN
				SELECT @ErrNo =999999
				SELECT @ErrMsg='VolunteerPersonID cannot be 0 or NULL'
				RAISERROR(@ErrNo,16,0)
			END
	
		INSERT  Volunteer.VolunteerNotes(
						VolunteerPersonID,
						Note,
						ModifiedBy,
						ModifiedDate)
				
					VALUES
					(@VolunteerPersonID,
					 @Notes,
					 @ModifiedBy,					
					 SYSDATETIME()
					 )
					 
			SELECT @ErrNo = @@ERROR
			
			IF @ErrNo <>0--<> Error!
				BEGIN
					RAISERROR(@ErrNo,16,0)
				END
			SET @Success =1;
			
			COMMIT TRANSACTION
			
			SELECT @VolunteerPersonID = @@IDENTITY
				
	
	
	END TRY
	
	BEGIN CATCH
		ROLLBACK TRANSACTION
		--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				
			  SET @Success =0;
			  
			 IF RTRIM(LTRIM(@errmsg)) =''
				 BEGIN
					SELECT @Error ='Failure in InsertVolNotes Rollback'
				 END
			 ELSE
				BEGIN
					SELECT @Error = @ErrMsg
				END
			 
			 SET @ErrorNo = @ErrNo
			  
	END CATCH
   
END

GO
/****** Object:  StoredProcedure [dbo].[pInsertVolunteerScheduleDayTime]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pInsertVolunteerScheduleDayTime] @VolunteerScheduleWeekID INT, @DayOfWeek INT, @AvailableBeginTime TIME(7),
	@AvailableEndTime TIME(7), @IsNoShow BIT, @ActualHoursTotal NUMERIC(18,0), @ModifiedBy NAME

AS

SET NOCOUNT ON

INSERT INTO Volunteer.VolunteerScheduleDayTime
(VolunteerScheduleWeekID,
[DayOfWeek],
AvailableBeginTime,
AvailableEndTime,
IsNoShow,
ActualHoursTotal,
ModifiedDate,
ModifiedBy)

VALUES
(@VolunteerScheduleWeekID,
@DayOfWeek,
@AvailableBeginTime,
@AvailableEndTime,
@IsNoShow,
@ActualHoursTotal,
SYSDATETIME(),
@ModifiedBy)

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[pInsertVolunteerScheduleMonth]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pInsertVolunteerScheduleMonth] @VolunteerPersonID INT, @Month INT, @ModifiedBy Name 

AS

SET NOCOUNT ON

INSERT INTO Volunteer.VolunteerScheduleMonth
(VolunteerPersonID,
[Month],
ModifiedDate,
ModifiedBy)

VALUES
(@VolunteerPersonID,
@Month,
SYSDATETIME(),
@ModifiedBy)

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[pInsertVolunteerScheduleWeek]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pInsertVolunteerScheduleWeek] @VolunteerScheduleMonthID INT, @Week INT, @ModifiedBy NAME

AS

SET NOCOUNT ON

INSERT INTO Volunteer.VolunteerScheduleWeek
(VolunteerScheduleMonthID,
[Week],
ModifiedDate,
ModifiedBy)

VALUES
(@VolunteerScheduleMonthID,
@Week,
SYSDATETIME(),
@ModifiedBy)

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[pInsertWeeklyWorkHistory]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pInsertWeeklyWorkHistory] 
@VolunteerScheduleMonthID int,
@Week int, 
@DayOfWeek int, 
@AvailableBeginTime time(7), 
@AvailableEndTime time(7), 
@IsNoShow bit, 
@ActualHoursTotal numeric(18,0), 
@Job int,
@ModifiedBy NVARCHAR(50),
@Error NVarchar(50) Output,
@ErrorNo int output,
@SUCCESS BIT OUTPUT
	
AS 

SET NOCOUNT ON;

DECLARE

@ErrNo int =0,
@ErrMsg Nvarchar(50)= ''

BEGIN TRY

BEGIN TRANSACTION	
BEGIN
--Currently using @@Identity as it is the only way I can figure out how to return the identity from the previous insert.
--I am aware it only works for one insert at a time. 
--This will be called when you know the Month ID you want to use. This will generate a week ID and then insert data
--into the daily and jobs tables.
EXEC dbo.pInsertVolunteerScheduleWeek @VolunteerScheduleMonthID, @Week, @ModifiedBy
--If there is an error, it breaks.
SELECT @ErrNo = @@ERROR
IF @ErrNo <>0
	
	BEGIN
		RAISERROR (@ErrNo, 16, 0)
	END
	SET @SUCCESS =1


END

BEGIN
--Ditto previous comment. 
EXEC dbo.pInsertVolunteerScheduleDayTime @VolunteerScheduleWeekID = @@IDENTITY, @DayOfWeek = @DayOfWeek, 
	@AvailableBeginTime = @AvailableBeginTime, @AvailableEndTime = @AvailableEndTime, @IsNoShow = @IsNoShow,
	@ActualHoursTotal = @ActualHoursTotal, @ModifiedBy = @ModifiedBy
--If there is an error, it breaks.
SELECT @ErrNo = @@ERROR
IF @ErrNo <>0
	
	BEGIN
		RAISERROR (@ErrNo, 16, 0)
	END
	SET @SUCCESS =1

END

BEGIN 

EXEC dbo.pInsertVolunteerJobs @VolunteerScheduleDayTimeID = @@IDENTITY, @Job = @Job, @ModifiedBy = @ModifiedBy
SELECT @ErrNo = @@ERROR
IF @ErrNo <>0
	
	BEGIN
		RAISERROR (@ErrNo, 16, 0)
	END
	SET @SUCCESS =1

COMMIT TRANSACTION
END
END TRY
--Rolls the transaction back if there is an error. 
BEGIN CATCH
	ROLLBACK TRANSACTION
	SET @SUCCESS = 0;
	--I am using Print Error_Message as I was having issues with one of the included SPs
	--it was printing errors, but had next to no information on what was causing the error,
	--which made figuring it out a mess.
	PRINT ERROR_MESSAGE();

END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[pUpdateAddress]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Address
Description: Updates data to Address table.This table has the possibility of duplicate rows because
	persons can have more than one address. We can check to see if an address is a duplicate, but that will have
	limited use since we would have to count on a combination of free-format fields since it is possible to have more than
	one address in the same city, zipcode, state, county, etc.
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pUpdateAddress](
	@PersonID int =0,--Having a default may seem strange for a mandatory field but it is here only to deal with NULL, if one should occur. 
	@AddressID int =0,--Having a default may seem strange for a mandatory field but it is here only to deal with NULL, if one should occur.
	@AddressLine1 Nvarchar(60),
	@AddressLine2 Nvarchar(60) = NULL,
	@City NVarchar(30),
	@County NVarchar(30),
	@State NVarchar(2),
	@PostalCode NVarchar(10) ,
	@AddressTypeID int,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempAddressTypeID int,
	@TempPersonID int,
	@TempAddressID int
	
	SET @TempAddressTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempAddressID =0;
	SET @TempAddressID = 0;		
/*The personID and AddressID must be non-zero because they are needed to update the row. If either is zero, we
exit the update*/
BEGIN TRY
	BEGIN TRANSACTION;
	IF ((@PersonID = 0) OR (@PersonID IS NULL)) OR ((@AddressID =0) OR (@AddressID IS NULL))
		BEGIN
			SET @ErrorStatus = ' -7014. PersonID, AddressID cannot be zero or null for update';
			RAISERROR(@ErrorStatus, 16,1);
		END



/****************************************************************************/
	--This is a bit different than some procedures because there is a lookup table associated with 
	--the address, so we need to be sure that the data matches an address type before continuing.
	SELECT @TempAddressTypeID = AddressTypeID 
	  FROM person.LUAddressType
		 WHERE AddressTypeID = @AddressTypeID --Be a bit paranoid and trim the input for white spaces
	
	If @TempAddressTypeID = 0
	BEGIN
		SET @ErrorStatus = ' -7002 Address Type does not exist in LUAddressType, Cannot Update'; --Failed in lookup table
		RAISERROR(@ErrorStatus,15,1);--Could use WITH LOG for event log
		
	END	
	

/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = @@ERROR + '-7000 pUpdateAddress';
		SET @Success = 0;
		RAISERROR (@ErrorStatus,16,1);
	END
	 
		
	
			  Update Person.Address
					SET PersonID = @PersonID,
						AddressLine1 = @AddressLine1,
						AddressLine2 =@AddressLine2,
						City = @City,
						State = @State,
						PostalCode = @PostalCode,
						AddressTypeID = @AddressTypeID,
						ModifiedDate = SYSDATETIME(),
						ModifiedBy = @ModifiedBy
					WHERE
						PersonID= @PersonID AND AddressID = @AddressID;
								
				set @success =1;
				set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
			 SELECT @ErrorStatus =@ErrorStatus + ' -7012' +' Update Failed on Address';
			 SET @Success =0;
			 
			 RAISERROR(@ErrorStatus, 16, 1);
			 	 
		
		END CATCH
		
	
END










GO
/****** Object:  StoredProcedure [dbo].[pUpdateAddressType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUAddressType
Description: Update data to LUAddressType. This table matches the address with an address type
Revisions:
G.S. - 20 Oct 10. Fixed problem with error handler not firing on preliminary lookup.
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pUpdateAddressType](
	@AddressTypeID int,
	@AddressType Nvarchar(10),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

BEGIN
	DECLARE
	@TempAddressTypeID int
	
	SET @TempAddressTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

		
	

		BEGIN TRY
			BEGIN TRANSACTION;
		
			/****************************************************************************/
				--Avoid Duplicate Rows! However, a typo on input such as 'Hmoe' instead of 'Home' will do an isert.
				--Can't avoid finger problems!
				
			SELECT @TempAddressTypeID = AddressTypeID 
			  FROM person.LUAddressType
				 WHERE AddressTypeID = @AddressTypeID 
				 
			If @TempAddressTypeID = 0 --Cant Update if it doesnt exist
				BEGIN
					SELECT @ErrorStatus = '-6015 Address Type Does Not Exists';
					SET @Success =0;
					RAISERROR(@ErrorStatus, 16, 1);
				END

			/****************************************************************************/	          

			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = Convert (nVarchar(50),@@ERROR) + ' -6010';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16, 1);
				END
	 
			
			 UPDATE Person.LUAddressType
				SET AddressType = @AddressType,
					ModifiedBy = @ModifiedBy,
					ModifiedDate = SYSDATETIME()
				WHERE 
					AddressTypeID =@AddressTypeID;
					
			
				
				set @success =1;
				set @ErrorStatus ='';
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SET @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
		
			  SET @Success =0;
			  SELECT  @ErrorStatus = @ErrorStatus + 'Update Failed Rollback -6011';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			 
		END CATCH
		

END









GO
/****** Object:  StoredProcedure [dbo].[pUpdateCertificationText]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/*************************************************************************************************
*Author: Gary Savard
*Date: 3/29/2011
*Table Name: LUertificationText
Description: Update data to LUCertificationText.
This updates the LUCertificationText table. The updates should only be done to correct errors and only by an 
ageny designated representative.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateCertificationText](
	@CertificationTextID int,
	@CertificationText NVarchar(MAX),
	@GuidelinesText NVarchar(MAX),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempCertificationTextID int
	
	SET @TempCertificationTextID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			IF (@CertificationTextID =0) --Must have a non zero value!
				BEGIN
					SELECT @ErrorStatus =  '-60055 CertificationTextID cannot be NULL or 0';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
	
/****************************************************************************/
			--Double check to see that we can find it in the LUCertificationText table before changing things
			SELECT @CertificationTextID = CertificationTextID 
				FROM Foodhself.LUCertificationText
					WHERE CertificationTextID = @CertificationTextID
					
	     		If (@TempCertificationTextID = NULL) OR (@TempCertificationTextID= 0) 
					BEGIN
						SET @ErrorStatus = ' -60052 CertificationTextID Doesnot Exist in LUCertificationText'; 
						RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
		
					END	

/****************************************************************************/	          

			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60050';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
			 --StateID is not updated because that should not change!
			  UPDATE Foodshelf.LUCertificationText
				SET CertificationText = @CertificationText,
					GuidelinesText = @GuidelinesText,
					ModifiedBy = @ModifiedBy,
					ModifiedDate = SYSDATETIME()
				WHERE
					CertificationTextID = @CertificationTextID 					
			  	set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			   --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60051 Update Failed on CertificationText ';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END












GO
/****** Object:  StoredProcedure [dbo].[pUpdateCity]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUCity
Description: Update data to LUCity.
The CityID and StateID must not be 0 when passed in. Both are needed to make the tie.
Ideally we would have information on the county as well as the state before we add the city. However, 
we cannot assume that we have a county, so we will have it to default to 0, if no value is entered.
Revisions:
GS 20 Oct fixed failure in error handler due to implicit conversion of @@Error, worked intermittantly 
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateCity](
	@CityID int,
	@CityName NVarchar(30),
	@CityAbbreviation Nvarchar(30) ='',
	@StateID int,
	@CountyID int = 0,--Default countyID to 0 just in case it comes in later. 
	@PostalCodeID int =0,--Might be Zero..
	@ModifiedBy Name,
	@NewCityID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempCityID int
	
	SET @TempCityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			IF (@CityID =0) or (@StateID) = 0 --Must have a state AND city to update!
				BEGIN
					SELECT @ErrorStatus =  '-60055 StateID/CityID cant be NULL or 0';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
	
/****************************************************************************/
			--Double check to see that we can find it in the LUCity table before changing things
			SELECT @TempCityID = CityID 
				FROM person.LUCity
					WHERE CityID = @CityID and StateID = @StateID
					
	     		If (@TempCityID = NULL) OR (@TempCityID= 0) 
					BEGIN
						SET @ErrorStatus = ' -60052 City Doesnt Exist in LUCity'; 
						RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
		
					END	

/****************************************************************************/	          

			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60050';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
			 --StateID is not updated because that should not change!
			  UPDATE Person.LUCity
				SET CountyID = @CountyID,
					PostalCodeID = @PostalCodeID,
					CityName = @CityName,
					CityAbbreviation= @CityAbbreviation,
					ModifiedBy = @ModifiedBy,
					ModifiedDate = SYSDATETIME()
				WHERE
					STATEID = @StateID and CITYID = @CityID--Could just use City ID
					
			  	set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			   --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60051 Update Failed on City ';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END
END










GO
/****** Object:  StoredProcedure [dbo].[pUpdateClientFamilyRecord]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		Gary Savard
-- Create date: 26 Oct 2010
-- Description:	This is the main stored procedure to update a  family member for a client
-- in the system. It calls several other stored procedures to do updates into 
-- selected parts of the DB. Clients and Family members of clients have similar data, but 
--will use separate stored procedures for clarity. A note can either be a new note or an update to an exising one. If it is a new note, then
--the IsNewNoteflag must be passed in with 1 as value.
--FOOD. Same idea with the rest of the programs.
--IDs that are important such as 'address type' from that lookup table need to be passed in here since they
--were selected by the user. No need to try to figure them out in the SP
--Certification has its own button so we have a separate stored procedure to deal with that functionality and the same for 
--family members since they do not have some of the information that we need for the client. 

--Revisions: 4 Nov 10- Added Client notes insert procedure call
--          13 Dec 10- Added Gender to Update Demographics call
--			1 April 11 - Removed some fields based on Champlain Charity requirements. Added some fields.
--          5 April remove @numberInHousehold, @HomeboundDelivery,@ISPrimaryLanguage,@LanguageId,@Title,@Suffix,@AddressId,@PhoneID 
--			11 July 11, Added RTRIM, LTRIM to client's name
-- =============================================
CREATE PROCEDURE [dbo].[pUpdateClientFamilyRecord] (
	@RecordSource NVarchar(8),
	@FamilyRelationshipID int,--This is how we know whicy person is being updated, we do not want dupes in the system. A person should be in the familyRelationship table 0to1 times
	@PersonID int, --This is the family member that we will be updating
	@ClientPersonID int,--This is the client to whom the family member belongs
    @DemographicsID int,
    @NotesID int =0,
   	@FirstName Name,
	@MiddleName Name = NULL,
	@LastName Name,
	@DateOfBirth DateTime,
	@RelationshipID int,
	@RelationshipDescription NVarchar(50)='',
	@FamilyStatusType NVarchar(50),
	@HousingStatus nVarchar(50),--The TEXT value from the lookup table. Saves having to query by ID later
	@Disability NoYesMaybe =0,
	@Gender NVarchar(2)='',--Foodshelf and WX may leave blank
	@CSFP NoYesMaybe = 0,
	@Veteran NoYesMaybe=0,
	@HealthInsurance NoYesMaybe =0 ,
	@InsuranceType NVarchar(50),
	@FoodStamps NoYesMaybe =0,--Three squares
	@EducationCategoryID int =0, --Not required for Food shelf
	@CountryOfOrigin nVarchar(70)='', --Not required for food shelf
	@Race NVarchar(20) =NULL,
	@Ethnicity NVarchar(20) =NULL, 
	@IncomeSourceID int =0,
	@IsNewNote bit=0,
	@Notes NVarchar(MAX)=NULL,--A single person may have many notes. The notes will be specific to a particular program, so we will not have a single notes table
	@ModifiedBy Name,
	@NewHouseholdNotesID int Output,--This is only used if there is a new note sent in with the record.
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
	

SET NOCOUNT ON;
	DECLARE
	@ValidSource int,
	@TempPersonID int,
	@Succ bit,
	@ErrorMsg NVarchar(50),
	@NewClientNotesID int,
	@TempClientPersonID int,
	@TempFamilyRelationshipID int,
	@TempIncomeSourceCount int,
	@TempIncomeSourceID int,
	
	@DummyNumberInHousehold int, --just place holder with default of 0
	@DummyHomeboundDelivery int,
	@DummyIsPrimaryLanguage bit,
	@DummyLanguageID int,
	@DummyTitle NVarchar(8),
	@DummySuffix NVarchar(10),
	@DummyEmailAddress NVarchar(50),
	@DummyEmailContactPreference bit,
	@DummyAddress1 NVarchar (60),
	@DummyAddress2 NVarchar (60),
	@DummyCity NVarchar (30),
	@DummyState NVarchar(2),
	@DummyPostalCode NVarchar(10),
	@DummyAddressTypeID int,
	@DummyPhoneNumber Phone,
	@DummyPhoneExtension Nvarchar(8),
	@DummyPhoneTypeID int
	
	
			
	
	SET @ValidSource =0;
	SET @TempPersonID =0;
	SET @NewClientNotesID =0;
	SET @Succ =0;
	SET @ErrorMsg ='';
	SET @TempClientPersonID =0;
	SET @TempFamilyRelationshipID =0;
	SET @TempIncomeSourceCount =0;
	SET @TempIncomeSourceID =0;
	
	
	SET @DummyNumberInHousehold =0;
	SET @DummyHomeboundDelivery=2;--This is set to N/A
	SET @DummyIsPrimaryLanguage=0;
	SET @DummyLanguageID=0;
	SET @DummyTitle = NULL;
	SET @DummySuffix = NULL;
	SET @DummyEmailAddress =NULL;
	SET @DummyEmailContactPreference =0;
	SET @DummyAddress1 =NULL;
	SET @DummyAddress2 =NULL;
	SET @DummyCity = NULL;
	SET @DummyState =NULL;
	SET @DummyPostalCode =NULL;
	SET @DummyAddressTypeID =0;
	SET @DummyPhoneNumber =NULL;
	SET @DummyPhoneExtension =NULL;
	SET @DummyPhoneTypeID =0;
	SET @FirstName = LTRIM(RTRIM(@FirstName));
	SET @MiddleName = LTRIM(RTRIM(@MiddleName));
	SET @LastName = LTRIM(RTRIM(@LastName));
		
 BEGIN TRY
	BEGIN TRANSACTION;
	
	
	--Take the return value and throw error if 0 because we cannot proceed of we don't know
	--which set of sps to call.
	SET @ValidSource = DBO.ValidateDataSource(@RecordSource);
	
	IF @ValidSource =0
		BEGIN
			SET @Success =0;
			SELECT @ErrorStatus = '-18100 Invalid Record source';
			RAISERROR(@ErrorStatus,16,1);
			--Raise Error Here because the source is unknown.
		END
	
	
	
	--The family member must be associated with a ClientPersonID or we bail.
	
		IF @FamilyRelationshipID =0 OR @FamilyRelationshipID IS NULL--Can't update if this is not valid!
			BEGIN
				SET @Success =0;
				SET @ErrorStatus ='-185002 FamilyRelationshipID cant be 0/NULL';
				RAISERROR (@ErrorStatus,16,1);
			END
		
		SELECT @TempFamilyRelationshipID = FamilyRelationshipID	
			FROM Person.FamilyRelationships
				WHERE FamilyRelationshipID = @FamilyRelationshipID
				
		IF @TempFamilyRelationshipID = 0 OR @TempFamilyRelationshipID IS NULL
			BEGIN
				SET @Success =0
				SET @ErrorStatus ='-185003 Record not found FamilyRelationships';
				RAISERROR (@ErrorStatus,16,1);
				
			END
		IF @PersonID =0 or @PersonID IS NULL
			BEGIN
				SET @Success =0;
				SET @ErrorStatus = '-185004 PersonID cant be 0/NULL';
				RAISERROR(@ErrorStatus,16,1);
			END
			
		SELECT @TempPersonID = @PersonID
			FROM Person.Person
				WHERE PersonID = @PersonID
		
		IF @TempPersonID = 0 OR @TempPersonID IS NULL
			BEGIN
				SET @Success = 0;
				SET @ErrorStatus = '-185005 Person Doesnt exist in Person';
				RAISERROR(@ErrorStatus,16,1);
			END
	
			IF @ClientPersonID = 0 OR @ClientPersonID IS NULL
			BEGIN
				SET @Success =0;
				SET @ErrorStatus = '-18500 Client does not exist in Person';
				RAISERROR(@ErrorStatus,16,1);
			
			END	
			
			SELECT	@TempClientPersonID = PersonID
				FROM Person.Person
					WHERE PersonID = @PersonID
					
			IF @TempClientPersonID = 0 OR @TempClientPersonID IS NULL
			BEGIN
				SET @Success = 0;
				SET @ErrorStatus = '-185005 Person Doesnt exist in Person';
				RAISERROR(@ErrorStatus,16,1);
			END
					
					
	
				
	--Update Person.	
	BEGIN
		EXEC DBO.pUpdatePerson @PersonID,@DummyTitle,@FirstName,@MiddleName,@LastName,@DummySuffix,@DateOfBirth,@DummyEmailAddress,@DummyEmailContactPreference,@ModifiedBy,@Succ OUTPUT,@ErrorMsg OUTPUT;
				
		IF @Succ =0 -- Failure!
			BEGIN
				SET @Success = @Succ;
				SELECT @ErrorStatus = '-18200 Sub Pro UpdatePerson Fail'+ @ErrorMsg;
				RAISERROR(@ErrorStatus,16,1);
			END
		SET @Success =1;
		SET @ErrorStatus='';	
	END
	
	--IF the source is from Food Shelf we cannot assume that we will need to call the address or phone SPs because they 
	--are not required to take that information. We will consider a NULL or 0 ID in AddressID to mean that this is a Foodshelf
	
	
	--The address should be the same as that of the client, but we will add it anyway because this person
	--may eventually become a client and we will already have an AddressID that we can use and modify the location.

		
		BEGIN
			--Commented out because this needs some thought as we go into alpha testing
			--IF ((@RecordSource <> 'FOOD') AND (LTRIM(RTRIM(@Address1)) ='') OR (LTRIM(RTRIM(@Address1)) IS NULL) )--This is a problem because address is required
			--	BEGIN
			--		SET @Succ =0;
			--		SET @ErrorStatus ='-18300 Address Required for Non foodshelf intake.';
			--		RAISERROR(@ErrorStatus,16,1);
			--	END
		--The family member is at the same address as the client so we do not put them in the address table. Query them from the family relationship
		--IF ((@AddressID <>0) AND (@AddressID IS NOT NULL))
		-- BEGIN	
		--	EXEC DBO.pUpdateAddress @PersonID,@AddressID,@DummyAddress1,@DummyAddress2,@DummyCity,@DummyCounty,@DummyState,@DummyPostalCode,@DummyAddressTypeID,@ModifiedBy, @Succ Output, @ErrorMsg Output ;	
			
		--	IF @Succ =0 --Failed, Rollback!
		--		BEGIN
		--			SET @Success =0;
		--			SELECT @ErrorStatus = '-18200 Sub proc Update Address returned error' + @ErrorMsg;
		--			RAISERROR (@ErrorSTatus, 16,1);
		--		END
				
		--END

	--This has been removed because Champlain Charity does not collect family member phone numbers
	--Insert Phone Number
	--We allow phone number since they may have a cell.
	--BEGIN
	--	--May need in future
	--	--IF ((@RecordSource <> 'FOOD') AND (LTRIM(RTRIM(@PhoneNumber)) ='') OR (LTRIM(RTRIM(@PhoneNumber)) IS NULL) )--This is a problem because Phone Number is required
	--	--	BEGIN
	--	--				SET @Succ =0;
	--	--				SET @ErrorStatus ='-17400 Phone Number Required for Non foodshelf intake.';
	--	--				RAISERROR(@ErrorStatus,16,1);
	--	--	END
			
	--	IF (@PhoneID<>0) AND (@PhoneID IS NOT NULL)
	--		BEGIN
	--			EXEC DBO.pUPdatePhone @PhoneID,@PersonID,@PhoneNumber,@PhoneExtension,@PhoneTypeID,@ModifiedBy, @Succ output, @ErrorMsg output ;
	--		END
			
	--		IF @Succ =0
	--			BEGIN
	--				SET @Success =0;
	--				SELECT @ErrorStatus = '-18200 Sub proc Update Phone returned fail' + @ErrorMsg;
	--				RAISERROR(@ErrorStatus, 16,1);
	--			END
	--END
	
	--Insert Demographics
	BEGIN
		EXEC dbo.pUpdateDemographics @DemographicsID,@PersonID,@EducationCategoryID ,@HousingStatus,@DummyNumberInHousehold,@Gender,@Race,@CountryOfOrigin,@Ethnicity,@Disability,@CSFP,@Veteran,@HealthInsurance,@InsuranceType,@FamilyStatusType,@FoodStamps,@DummyHomeboundDelivery,@ModifiedBy,@Succ OUTPUT, @ErrorMsg OUTPUT; 
		
		IF @Succ = 0
			BEGIN
				SET @Success =0;
				SELECT @ErrorStatus ='-18200 Sub proc Update Demographics returned fail' + @ErrorMsg;
				RAISERROR(@ErrorStatus,16,1);
				
			END
		END
		
		--Income source may could possibly be ID 0 which would not be updated since that indicates no selection. This will require a sp at some point
		--because there may be >1 income source. For now, we have a 1 to 1 relationship between person and income source. Yup, using a table scan for the
		--aggregate, but this will be chaning with future sp
		IF EXISTS(SELECT * from Person.Income WHERE PersonID=@PersonID) AND (@IncomeSourceID>0)--Assuming that a good IncomeSourceID is passed in.
			BEGIN
				Update Person.Income 
						SET IncomeSourceID = @IncomeSourceID,
							ModifiedBy = @ModifiedBy,
							ModifiedDate = SYSDATETIME()
						WHERE PersonID = @PersonID;
				IF @@ERROR >0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus ='-18200 Sub proc insert income returned fail' + @ErrorMsg;
					RAISERROR(@ErrorStatus,16,1);
				END	
			END--End IF
			
		ELSE
			BEGIN
				IF (@IncomeSourceID >0)--Only insert if there is a valid IncomeSourceId coming in --only works if we have 1 to 1 relationship and that is all we have for now
				BEGIN
					INSERT INTO PERSON.Income (IncomeSourceID, PersonID, ModifiedBy, ModifiedDate) VALUES (@IncomeSourceID,@PersonID,@ModifiedBy,SYSDATETIME());
				END
				
			IF @@ERROR >0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus ='-18200 Sub proc insert income returned fail' + @ErrorMsg;
					RAISERROR(@ErrorStatus,16,1);
				END	
			END--End else
			
		
		
	--Insert Client Notes if they exist. This insert procedure is for the client, so we do not have
	--A value for HouseholdMemberPersonID so we hard code it to 0.
		
		IF (@IsNewNote =1) AND LTRIM(RTRIM(@Notes)) <> ''
		BEGIN
			EXEC DBO.pInsertHouseholdNotes @ClientPersonID,@PersonID, @Notes,@ModifiedBy,@NewHouseholdNotesID,@Succ OUTPUT,@ErrorMsg OUTPUT;
			 IF @Succ =0
			 BEGIN
				SET @Success =0;
				SET @ErrorStatus ='-18001 New Note Insert Failed';
				RAISERROR(@ErrorStatus,16,1);
			 END
			 SET @Success =1;
			 SET @ErrorStatus ='';
		
		END
		
		IF (@IsNewNote = 0) AND (@NotesID)<>0 AND @NotesID IS NOT NULL
			BEGIN
				EXEC DBO.pUpdateHouseholdNotes @NotesID,@ClientPersonID,@PersonID,@Notes,@ModifiedBy,@Succ OUTPUT,@ErrorMsg OUTPUT;
				IF @Succ =0
				BEGIN
					SET @Success =0
					SET @ErrorStatus = '-18200 Update Failed Notes' + @ErrorMsg;
					RAISERROR(@ErrorStatus,16,1);
				END
			
			END
		
	--We have everything except for the relationship to the client, so we do that last.
	 
		
			EXEC DBO.pUpdateFamilyRelationship @FamilyRelationshipID,@PersonID, @ClientPersonID,@RelationshipID,@RelationshipDescription,@ModifiedBy,  @Succ OUTPUT, @ErrorMsg OUTPUT; 
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SET @ErrorStatus ='-17001 Insert Failed Family Relationship'+ @ErrorMsg
					RAISERROR(@ErrorStatus,16,1);
				END	
		
			
	

		
	--We are using nested transactions to make sure one exists in case 
	--of a rollback in subordinate Stored Procedure
	IF @@TRANCOUNT > 0 
		BEGIN
			SET @Success =1;
			SET @ErrorStatus='';
			COMMIT TRANSACTION;
		END
END
END TRY
	
BEGIN CATCH
	IF @@TRANCOUNT >0
		BEGIN
		SET @Success =0
		SET @ErrorStatus =@ErrorStatus + '  ' +@@Error
			ROLLBACK TRANSACTION;
			
		RAISERROR(@ErrorStatus,16,1);
		END
END CATCH

 
    
	















GO
/****** Object:  StoredProcedure [dbo].[pUpdateClientRecord]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Gary Savard
-- Create date: 26 Oct 2010
-- Description:	This is the main stored procedure to Update a new client
-- into the system. It calls several other stored procedures to do Updates into 
-- selected parts of the DB. Clients and Family members of clients have similar data, but 
--will use separate stored procedures for clarity.
--When updating we have to make some assumptions for food shelf.IF the client is in and their address has changed,
--we have to assume that the input FoodTypeGiven is for the current visit, so we do not update that. Instead, we insert a new
--row for the current visit.
--@RecordSource can be FOOD,WX,MICRO,TENANT,COMMACT,ADMIN. This will be used to only execute parts of the 
--SP relevant to the client intake data brought in. For example, Foodshelf requires that a record be 
--set for the type of food taken, but this is not required elsewhere so we only execute that SP If things come from 
--FOOD. Same idea with the rest of the programs.
--IDs that are important such as 'address type' from that lookup table need to be passed in here since they
--were selected by the user. No need to try to figure them out in the SP
--Certification has its own button so we have a separate stored procedure to deal with that functionality and the same for 
--family members since they do not have some of the information that we need for the client. 
--4 April 2011. Added multiple addresses, FamilyStatusType, Insurance Type,Changed AddressTypeID to int
--19 April 2011 - Addes @IsUpdateBreadGroceries. If this is 1 then that SP is executed.
--19 July 2011- Added RTRIM, LTRIM to client name.
CREATE PROCEDURE [dbo].[pUpdateClientRecord] (
	@PersonID int,
	@HouseHoldPersonID int =0,--This will be null or zero on input if this is a client and not a family member
	@PhysicalAddressID int,
	@MailAddressID int,
	@DemographicsID int,
	@PhoneID1 int,
	@PhoneID2 int,	
	@RecordSource NVarchar (8), --This allows for the sub sp's to be executed or skipped based on what data is to be saved
	@Title NVarchar(8) =NULL,
	@FirstName Name,
	@MiddleName Name = NULL,
	@LastName Name,
	@Suffix NVarchar(10) = NULL,
	@Gender NVarchar(2) = NULL,
	@DateOfBirth DateTime,
	@PhysicalAddress1 NVarchar(60) =NULL,--Only for Foodshelf!!
	@PhysicalAddress2 NVarchar(60) = NULL,
	@PhysicalCity	NVarchar(30),
	@PhysicalCounty NVarchar(30) = NULL,
	@PhysicalState NVarchar(2),
	@PhysicalPostalCode NVarchar(10),
	@PhysicalAddressTypeID  int,--From the Lookup based on user input. May not need if Foodshelf
	@MailAddress1 NVarchar(60) =NULL,--Only for Foodshelf!!
	@MailAddress2 NVarchar(60) = NULL,
	@MailCity	NVarchar(30),
	@MailCounty NVarchar(30) = NULL,
	@MailState NVarchar(2),
	@MailPostalCode NVarchar(10),
	@MailAddressTypeID  int,
	@EmailAddress Nvarchar(50) = NULL,
	@EmailContactPreference NoYes =0,
	@PhoneNumber Phone ='',
	@PhoneExtension Nvarchar(8) ='', --may not be implemented yet
	@PhoneTypeID int =0, --Food shelf again!
	@PhoneNumber2 Phone ='',
	@PhoneExtension2 Nvarchar(8) ='',
	@PhoneTypeID2	 int =0,
	@FamilyStatusType NVarchar(50),
	@HousingStatus nVarchar(50),--The TEXT value from the lookup table. Saves having to query by ID later
	@Disability NoYesMaybe =0,
	@CSFP NoYesMaybe = 0,
	@Veteran NoYesMaybe=0,
	@HealthInsurance NoYesMaybe =0 ,
	@InsuranceType NVarchar(50),
	@FoodStamps NoYesMaybe =0,--Three squares
	@HomeboundDelivery NoYesMaybe =0,
	@LanguageID int =0,--This is only important for volunteers and that funtionality has not been developed yet.
	@IsPrimaryLanguage bit =0,
	@EducationCategoryID int =0, 
	@CountryOfOrigin nVarchar(70)='', 
	@Race NVarchar(20) =NULL,
	@Ethnicity NVarchar(20) =NULL, 
	@NumberInHousehold int,
	@IncomeSourceID int =0,
	@HouseholdNotesID int=0, --Necessary if this is an existing note. Default to 0 if new note to avoid NULLs
	@Notes NVarchar(MAX)=NULL,--A single person may have many notes. The notes will be specific to a particular program, so we will not have a single notes table
	@IsNewNote bit,
	@FoodGiven FoodShelf.GroceryOrBreadProduce,
	@FoodReceivedDate DateTime,
	@IsUpdateBreadGroceries int,--Only if the client came in for these items
	@ModifiedBy Name,
	@NewPhysicalAddressID int Output,
	@NewMailAddressID int Output,
	@NewPhoneID int Output,
	@NewPhoneID2 int Output,
	@NewHouseholdNotesID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
	

SET NOCOUNT ON;
	DECLARE
	@ValidSource int,
	@CheckPersonID int,
	@CheckAddressID int,
	@CheckPhoneID int,
	@Succ bit,
	@ErrorMsg NVarchar(50),
	@CheckDemographicsID int, --Not using here, just a place holder!
	@NewFoodTypeGivenID int -- We don't do anything with this. Just receives SP output for now.
	
	SET @ValidSource =0;
	SET @CheckPersonID =0;
	SET @CheckAddressID =0;
	SET @CheckPhoneID = 0;
	SET @CheckDemographicsID =0;
	SET @NewFoodTypeGivenID =0;
	SET @Succ =0;	
	SET @Success =1;
	SET @ErrorMsg ='';
	SET @FirstName = LTRIM(RTRIM(@FirstName));
	SET @MiddleName = LTRIM(RTRIM(@MiddleName));
	SET @LastName = LTRIM(RTRIM(@LastName));
	
BEGIN		
 BEGIN TRY
	BEGIN TRANSACTION;
	
	
	--Take the return value and throw error if 0 because we cannot proceed of we don't know
	--which set of sps to call.
	SET @ValidSource = DBO.ValidateDataSource(@RecordSource);
	
	IF @ValidSource =0
		BEGIN
			SET @Success =0;
			SELECT @ErrorStatus = '-13100 Invalid Record source';
			RAISERROR(@ErrorStatus,16,1);
			--Raise Error Here because the source is unknown.
		END
		
	--Check to see if the person is in the DB. IF not, we are going to bail!
	BEGIN
		SELECT @CheckPersonID = PersonID
			FROM Person.Person
				WHERE PersonID = @PersonID
		IF @CheckPersonID = 0 OR @CheckPersonID IS NULL -- Not Good! Bail out!
			BEGIN
				SET @Success = 0;
				SET @ErrorStatus = '-1005 PersonId cant be 0/Null';
				RAISERROR(@ErrorStatus,16,1);
			END
					
		EXEC DBO.pUpdatePerson @PersonID,@Title,@FirstName,@MiddleName,@LastName,@Suffix, @DateOfBirth,@EmailAddress,@EmailContactPreference,@ModifiedBy,@Succ Output, @ErrorMsg Output;
		
		IF @Succ =0 -- Failure!
			BEGIN
				SET @Success = @Succ;
				SELECT @ErrorStatus = '-13200 Sub Pro update person Fail'+ @ErrorMsg;
				RAISERROR(@ErrorStatus,16,1);
			END
	END
	
	--IF the source is from Food Shelf we cannot assume that we will need to call the address or phone SPs because they 
	--are not required to take that information.
	--IF we have a good PersonID returned, we continue to Address
	

		--The record we are updating may have been originally from FoodShelf so we may not have an address. If the AddressID is 0
		--and the @address1 is not blank, we will insert an address. If We have an AddressID that is > 0, we will continue with 
		--an update and not an insert.
		IF  (@PhysicalAddressID = 0 OR @PhysicalAddressID IS NULL) AND ((LTRIM(RTRIM(@PhysicalAddress1)) <> '') AND (@PhysicalAddress1 IS NOT NULL))
		 BEGIN	
			EXEC DBO.pInsertAddress @PersonID, @PhysicalAddress1,@PhysicalAddress2, @PhysicalCity,@PhysicalCounty,@PhysicalState,@PhysicalPostalCode,@PhysicalAddressTypeID,@ModifiedBy, @NewPhysicalAddressID Output,@Succ Output, @ErrorMsg Output ;	
			
			IF @Succ =0 --Failed, Rollback!
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc call Insert PhysAddress returned error' + @ErrorMsg;
					RAISERROR (@ErrorSTatus, 16,1);
				END
			
		END
			
	   ELSE IF @PhysicalAddressID >0 --Slam the record in if it exists.
	          BEGIN
					SELECT @CheckAddressID = AddressID
						FROM Person.Address
							WHERE
								AddressID = @PhysicalAddressID
								
					IF @CheckAddressID = 0 OR @CheckAddressID IS NULL --Something is wrong! Bail!
					  BEGIN
						SET @Success =0;
						SET @ErrorStatus = '-7014 Invalid PhysicalAddressID update failed';
						RAISERROR(@ErrorStatus,16,1);
					  END			
								
								
				EXEC DBO.pUpdateAddress @PersonId, @PhysicalAddressID, @PhysicalAddress1, @PhysicalAddress2, @PhysicalCity,@PhysicalCounty,@PhysicalState,@PhysicalPostalCode,@PhysicalAddressTypeID,@ModifiedBy,@Succ output,@ErrorMsg output;
			
				IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc call Update PhysAddress returned error' + @ErrorMsg;
					RAISERROR (@ErrorSTatus, 16,1);
				END
			END
	--One more time through this logic for mailing address
		IF  (@MailAddressID = 0 OR @MailAddressID IS NULL) AND ((LTRIM(RTRIM(@MailAddress1)) <> '') AND (@MailAddress1 IS NOT NULL))
		 BEGIN	
			EXEC DBO.pInsertAddress @PersonID, @MailAddress1,@MailAddress2, @MailCity,@MailCounty,@MailState,@MailPostalCode,@MailAddressTypeID,@ModifiedBy, @NewMailAddressID Output,@Succ Output, @ErrorMsg Output ;	
			
			IF @Succ =0 --Failed, Rollback!
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc call Insert Address returned error' + @ErrorMsg;
					RAISERROR (@ErrorSTatus, 16,1);
				END
			
		END
			
	   ELSE IF @MailAddressID >0 --Slam the record in if it exists.
	          BEGIN
					SELECT @CheckAddressID = AddressID
						FROM Person.Address
							WHERE
								AddressID = @MailAddressID
								
					IF @CheckAddressID = 0 OR @CheckAddressID IS NULL --Something is wrong! Bail!
					  BEGIN
						SET @Success =0;
						SET @ErrorStatus = '-7014 Invalid MailAddressID update failed';
						RAISERROR(@ErrorStatus,16,1);
					  END			
								
								
				EXEC DBO.pUpdateAddress @PersonId, @MailAddressID, @MailAddress1, @MailAddress2, @MailCity,@MailCounty,@MailState,@MailPostalCode,@MailAddressTypeID,@ModifiedBy,@Succ output,@ErrorMsg output;
			
				IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc call Update Address returned error' + @ErrorMsg;
					RAISERROR (@ErrorSTatus, 16,1);
				END
			END

	--Insert or update Phone Number same rules as for Address
		IF @PhoneID1 = 0 OR @PhoneID1 IS NULL AND (LTRIM(RTRIM(@PhoneNumber))<>'' AND @PhoneNumber IS NOT NULL)
			BEGIN
				EXEC DBO.pInsertPhone @PersonID,@PhoneNumber, @PhoneExtension,@PhoneTypeID,@ModifiedBy,@NewPhoneID output, @Succ output, @ErrorMsg output ;
			
			  IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc InsertPhone fail' + @ErrorMsg;
					RAISERROR(@ErrorStatus, 16,1);
				END
				
			
			END
		ELSE IF @PhoneID1 >0
		  BEGIN
			SELECT @CheckPhoneID = PhoneID	
				From Person.Phone
					WHERE 
						PhoneID = @PhoneID1
			 IF @CheckPhoneID = 0 OR @CheckPhoneID IS NULL --Something is wrong! Bail!
					  BEGIN
						SET @Success =0;
						SET @ErrorStatus = '-8008 Invalid PhoneID update failed';
						RAISERROR(@ErrorStatus,16,1);
					  END
						
			BEGIN
				EXEC DBO.pUpdatePhone @PhoneID1,@PersonID,@PhoneNumber, @PhoneExtension,@PhoneTypeID,@ModifiedBy,@Succ output, @ErrorMsg output;
			END
			
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc updatephone fail' + @ErrorMsg;
					RAISERROR(@ErrorStatus, 16,1);
				END
		 END
	--One more time for second phone
	SET @CheckPhoneID =0;--Reset to use again
	IF @PhoneID2 = 0 OR @PhoneID2 IS NULL AND (LTRIM(RTRIM(@PhoneNumber2))<>'' AND @PhoneNumber2 IS NOT NULL)
			BEGIN
				EXEC DBO.pInsertPhone @PersonID,@PhoneNumber2, @PhoneExtension2,@PhoneTypeID2,@ModifiedBy,@NewPhoneID2 output, @Succ output, @ErrorMsg output ;
			
			  IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc InsertPhone fail' + @ErrorMsg;
					RAISERROR(@ErrorStatus, 16,1);
				END
						
			END
		ELSE IF @PhoneID2 >0
		  BEGIN
			SELECT @CheckPhoneID = PhoneID	
				From Person.Phone
					WHERE 
						PhoneID = @PhoneID2
			 IF @CheckPhoneID = 0 OR @CheckPhoneID IS NULL --Something is wrong! Bail!
					  BEGIN
						SET @Success =0;
						SET @ErrorStatus = '-8008 Invalid PhoneID update failed';
						RAISERROR(@ErrorStatus,16,1);
					  END
						
			BEGIN
				EXEC DBO.pUpdatePhone @PhoneID2,@PersonID,@PhoneNumber2, @PhoneExtension2,@PhoneTypeID2,@ModifiedBy,@Succ output, @ErrorMsg output;
			END
			
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-13200 Sub proc updatephone fail' + @ErrorMsg;
					RAISERROR(@ErrorStatus, 16,1);
				END
		 END	 

	
	--Update Demographics... Everyone needs demographics in the basic record, so no problems here with inserts.
	BEGIN
		SELECT @CheckDemographicsID = DemographicsID	
			FROM Person.Demographics
				WHERE
					DemographicsID = @DemographicsID
				IF @DemographicsID = 0 OR @DemographicsID IS NULL --Something is wrong! Bail!
					  BEGIN
						SET @Success =0;
						SET @ErrorStatus = '-2021 Invalid DemographicsID update failed';
						RAISERROR(@ErrorStatus,16,1);
				 END
		EXEC dbo.pUpdateDemographics @DemographicsID, @PersonID,@EducationCategoryID ,@HousingStatus,@NumberInHousehold,@Gender,@Race,@CountryOfOrigin,@Ethnicity,@Disability,@CSFP,@Veteran,@HealthInsurance,@InsuranceType,@FamilyStatusType,@FoodStamps,@HomeboundDelivery,@ModifiedBy,@Succ OUTPUT, @ErrorMsg OUTPUT; 
		
		IF @Succ = 0
			BEGIN
				SET @Success =0;
				SELECT @ErrorStatus = '-2021 sub proc Update Demographics fail' + @ErrorMsg;
				RAISERROR(@ErrorStatus,16,1);
				
			END
		END
	--Check Income Source, If we find that this source  is any value, including zero we update. This will have to be modified in the future
	--to cope with multiple values on input. Question, If someone has multiple income sources on one visit and then selects only 1 on the next, does that mean that the others are gone?
		IF @IncomeSourceID <>0
			BEGIN
				UPDATE Person.Income SET 
						IncomeSourceID = @IncomeSourceID, 
						ModifiedBy = @ModifiedBy,
						ModifiedDate = SYSDATETIME()
						WHERE PersonID = @PersonID
								
			END 	
		
	--This is where we check household notes input to see if it is a new note or an update to an existing one.
		IF @HouseholdNotesID = 0 AND @IsNewNote =0 AND LTRIM(RTRIM(@Notes)) <>''--We have a problem! No such thing as an old note with 0 ID! Bail out!
			BEGIN
				SET @Success =0;
				SET @ErrorStatus ='-14008 HouseoldNoteID cant be 0 for update';
				RAISERROR(@ErrorStatus,16,1); 
			END
			
	
		IF (@IsNewNote =0 AND @HouseholdNotesID <> 0)--Update! We will assume that even a blank note is an update. Don't want to second guess the user!
			BEGIN
				EXEC dbo.pUpdateHouseholdNotes @HouseholdNotesID,@PersonID,@HouseHoldPersonID, @Notes,@ModifiedBy,@Success,@ErrorStatus;
					IF @Success =0
						BEGIN
							SET @Success =0; --redundant :)
							SET @ErrorStatus = @ErrorStatus + ' -1350 Update Client Record Failed';
							RAISERROR (@ErrorStatus,16,1);
						END 
			END
		ELSE IF LTRIM(RTRIM(@Notes)) <> '' -- Insert New Record
			BEGIN
				EXEC dbo.pInsertHouseholdNotes @PersonID,@HouseHoldPersonID,@Notes,@ModifiedBy,@NewHouseholdNotesID,@Success,@ErrorStatus;
					IF @Success =0
						BEGIN
							SET @Success =0;--Redundant
							SET @ErrorStatus = @ErrorStatus + ' -14001 Insert HouseholdNotes Failed';
							RAISERROR(@ErrorStatus,16,1);
						END
			END
			
		
		
	--This is the same as the pInsertClientRecord procedure
	--IF source is foodshelf, we need to capture whether they were in for bread/produce or groceries 
	
	IF @RecordSource ='FOOD' AND @IsUpdateBreadGroceries =1 --This is not just an update, but a foodshelf update so we make this call.
		BEGIN
			EXEC DBO.pInsertFoodTypeGiven @PersonID,@FoodReceivedDate,@FoodGiven,@ModifiedBy,@NewFoodTypeGivenID OUTPUT, @Succ OUTPUT, @ErrorMsg OUTPUT;
			IF @Succ =0
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus ='-600021 Insert FoodType fail' + @ErrorMsg;
					RAISERROR (@ErrorStatus,16,1);
				END	
	END
		

		
	--We are using nested transactions to make sure one exists in case 
	--of a rollback in subordinate Stored Procedure
	IF @@TRANCOUNT > 0 
		BEGIN
		SET @Success =1;
		SET @ErrorStatus='';
	
			COMMIT TRANSACTION;
		END

END TRY
	
BEGIN CATCH
	IF @@TRANCOUNT >0
		BEGIN
		SET @Success =0
		SET @ErrorStatus =@ErrorStatus + '  ' +@@Error
			ROLLBACK TRANSACTION;
			
		RAISERROR(@ErrorStatus,16,1);
		END
END CATCH

    
   END
    
	










GO
/****** Object:  StoredProcedure [dbo].[pUpdateContactType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUContactType
Description: Update data to LUContactType.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateContactType](
	@ContactTypeID int,
	@Name Nvarchar(50) ,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempNewContactID int
	
	SET @TempNewContactID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
				
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
		  
		   IF (@ContactTypeID = 0) OR (@ContactTypeID IS NULL)
			BEGIN
				SET @ErrorStatus = ' -60022 Contact Type already exists in LUContactType'; 
				RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
			END
		  
			SELECT @TempNewContactID = ContactTypeID 
			  FROM person.LUContactType
			     WHERE ContactTypeID = @ContactTypeID
			      
	     	IF @TempNewContactID =0 
			  BEGIN
			    SET @ErrorStatus = ' -60028 Contact Type doesnt exist in LUContactType'; 
				RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
			  END	
			 
          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60020';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16,1);
	END
	 
			  UPDATE Person.LUContactType
			     SET  Name = @Name,
					  ModifiedDate = SYSDATETIME(),
					  ModifiedBy = @ModifiedBy
				 WHERE ContactTypeID = @ContactTypeID
				
								
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-60021 Update Failed on LUContactType';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pUpdateCountryOfOrigin]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUCountryOfOrigin
Description: Updates data to LUCountryOfOrigin.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateCountryOfOrigin](
	@CountryID int,
	@CountryAbbreviation Nvarchar(30) ='',
	@CountryName Nvarchar(50),
	@FIPSCode NVarchar(2)='',
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempNewCountryID int
	
	SET @TempNewCountryID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
/****************************************************************************/

	 
		
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
		   IF (@CountryID = 0) OR (@CountryID IS NULL)
			 BEGIN
				SET @ErrorStatus = ' -60035 CountryID Cant be 0/NULL'; 
				RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
			 END
		  
		    SELECT @TempNewCountryID = CountryID 
			  FROM person.LUCountryOfOrigin
				 WHERE CountryID = @CountryID
				 
	     	IF @TempNewCountryID =0 
				BEGIN
					SET @ErrorStatus = ' -60038 Country doesnt exists in LUCountryOfOrigin'; 
					RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
							
				END	
 
/****************************************************************************/	          

					IF @@Error <> 0 
						BEGIN
							SELECT @ErrorStatus = @@ERROR + '-60030';
							SET @Success = 0;
							RAISERROR(@ErrorStatus, 16,1);
						END
						
				 UPDATE Person.LUCountryOfOrigin
					SET CountryAbbreviation = @CountryAbbreviation,
						CountryName = @CountryName,
						FIPSCode = @FIPSCode,
						ModifiedDate = SYSDATETIME(),
						ModifiedBy = @ModifiedBy
					WHERE CountryID = @CountryID
					
					
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			   --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-60031 Update Failed Rollback';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		END













GO
/****** Object:  StoredProcedure [dbo].[pUpdateCounty]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUCounty
Description: UPdates data to LUCounty. 
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateCounty](
	@CountyID int,
	@CountyName NVarchar(20),
	@StateID int,
	@CityID int = 0,--Default cityID to 0 just in case it comes in later. 
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempCountyID int
	
	SET @TempCountyID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
		
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
		  --The county must be tied to a state so we need to have non 0's and non-nulls in both. If one
		  --is found and not the other, it is an orphaned record. This error could be made more granular
		  --in the future, if we are concerned with orphaned records.
		  IF ((@CountyID = 0) or (@CountyID  IS NULL)) OR ((@StateID = 0) OR (@StateID IS NULL)) 
			
				BEGIN
					SELECT @ErrorStatus = '-60065 StateID/CountyID cant be NULL or 0';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
	
/****************************************************************************/
				--Check to see if the number passed in is really in the table
				SELECT @TempCountyID = CountyID 
				  FROM person.LUCounty
					 WHERE CountyID = @CountyID and StateID = @StateID
	     				If (@TempCountyID =0) OR (@TempCountyID IS NULL) 
							BEGIN
								SET @ErrorStatus = ' -60068 County Does not exist LUCounty'; 
									RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
								
							END	

/****************************************************************************/	          

				IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60060';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
				 
			  UPDATE Person.LUCounty
				  SET CityID = @CityID,
					  CountyName = @CountyName, 
					  ModifiedDate = SYSDATETIME(),
					  ModifiedBy = @ModifiedBy
					
				
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY
	

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60061 Update Failed LUCounty ';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
	END
		
	













GO
/****** Object:  StoredProcedure [dbo].[pUpdateDemographics]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO















/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Demographics
Description: Updates data to Demographics table
Revisions: 1 Nov 10. Modified to include housing status as nvarchar(50)
			1 April 11. Added @InsuranceType and @FamilyStatusType
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pUpdateDemographics](
	@DemographicsID int,
	@PersonID int,
	@EducationCategoryID int,
	@HousingStatus NVarchar(50) = NULL,
	@NumberInHousehold int,
	@Gender NVarchar(2) = NULL,
	@Race Nvarchar(20) = NULL,
	@CountryOfOrigin NVarchar(70) =NULL,
	@Ethnicity Nvarchar(20) = Null,
	@Disability NoYesMaybe =0,
	@CSFP NoYesMaybe = 0,
	@Veteran NoYesMaybe=0,
	@HealthInsurance NoYesMaybe =0 ,
	@InsuranceType NVarchar(50),
	@FamilyStatusType Nvarchar(50),
	@FoodStamps NoYesMaybe =0,
	@HomeboundDelivery NoYesMaybe =0,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempDemographicsID int,
	@TempPersonID int
	
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempDemographicsID =0;		

	
		
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@DemographicsID = 0) OR (@DemographicsID IS NULL)) OR  ((@PersonID = 0) OR (@PersonID IS NULL))
				  BEGIN
					SELECT @ErrorStatus = '2005 DemographicsID/PersonID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				--Check to see that the IDs match.. paranoid? NO! Have had worse things happen....Data integrity can fail!
				--Could use count but that has some optimization and indexing problems....
				SELECT @TempPersonID = PersonID, @TempDemographicsID = DemographicsID 
				  FROM person.Demographics
					 WHERE PersonID = @PersonID AND DemographicsID = @DemographicsID
			
								 
				IF ((@TempDemographicsID=0) OR (@TempDemographicsID IS NULL)) OR ((@TempPersonID =0) OR (@TempPersonID IS NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -2008 DemographicsID/PersonID combo does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -2000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				  UPDATE Person.Demographics
					 SET EducationCategoryID = @EducationCategoryID,
						 NumberInHousehold = @NumberInHousehold,
						 Gender = @Gender,
						 Race = @Race,
						 CountryOfOrigin = @CountryOfOrigin,
						 HousingStatus = @HousingStatus,
						 Ethnicity = @Ethnicity,
						 Disability = @Disability,
						 CSFP = @CSFP,
						 Veteran = @Veteran,
						 HealthInsurance = @HealthInsurance,
						 FamilyStatusType = @FamilyStatusType,
						 InsuranceType = @InsuranceType,
						 FoodStamps = @FoodStamps,
						 HomeboundDelivery = @HomeboundDelivery,
						 ModifiedDate = SYSDATETIME(),
						 ModifiedBy = @ModifiedBy
					 WHERE DemographicsID = @DemographicsID AND PersonID = @PersonID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-2001 Update Fail Demographics';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END

















GO
/****** Object:  StoredProcedure [dbo].[pUpdateEthnicity]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUEthnicity
Description: Update data to LUEthnicity. 
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pUpdateEthnicity](
	@EthnicityID int,
	@EthnicityAbbreviation NVarchar(10),
	@EthnicityDescription NVarchar(50),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempEthnicityID int
	
	SET @TempEthnicityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
/****************************************************************************/

	
		
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
			IF (@EthnicityID = 0) OR (@EthnicityID IS NULL)
				BEGIN
					SET @ErrorStatus = ' -60065 EthnicityID Cant be 0/NULL'; 
					RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
				END 
				
				SELECT @TempEthnicityID = EthnicityID 
				  FROM person.LUEthnicity
					 WHERE EthnicityID =@EthnicityID 
					 
				If @TempEthnicityID =0 --Double check to see if ID exists in db.
					BEGIN
						SET @ErrorStatus = ' -60082 Ethnicity already exists'; --Failed in lookup table
						RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
						
					END	

/****************************************************************************/	          

				IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60080';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
				 
			 UPDATE Person.LUEthnicity
				SET EthnicityAbbreviation = @EthnicityAbbreviation,
					EthnicityDescription = @EthnicityDescription,
					ModifiedDate = SYSDATETIME(),
					ModifiedBy = @ModifiedBy
				WHERE
					EthnicityID= @EthnicityID
					
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			    --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60081 Update Failed Ethnicity';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pUpdateFamilyRelationship]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: FamilyRelationships
Description: Updates data to FamilyRelationships. Do not confuse with the sp that inserts to the
family relationship LU table! This stored procedure is not called directly and its superior sps do the validation, so it is left out
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateFamilyRelationship](
	@FamilyRelationshipID int,
	@PersonID int, 
	@ClientPersonID int ,
	@RelationshipID int,
	@RelationshipDescription nVarchar(50)='',
	@ModifiedBy Name, 
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempFamilyRelationshipID int
	
	SET @TempFamilyRelationshipID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
/****************************************************************************/
--This stored procedure is not called directly and its superior sps do the validation, so it is left out
	
	BEGIN TRY
	  BEGIN TRANSACTION;
		
		IF @FamilyRelationshipID = 0 OR @FamilyRelationshipID IS NULL
		  BEGIN
			SELECT @ErrorStatus =  '-17501 FamilyRelationshipID cant be 0/NULL';
			SET @Success = 0;
			RAISERROR(@ErrorStatus, 16,1);
		  END
 
		IF @PersonID =0 OR @PersonID IS NULL
	      BEGIN
			SELECT @ErrorStatus =  '-17503 PersonID cant be 0/NULL';
			SET @Success = 0;
			RAISERROR(@ErrorStatus, 16,1);
	      END
	      
	     IF @ClientPersonID =0 OR @ClientPersonID IS NULL 
		   BEGIN
			SELECT @ErrorStatus =  '-17500 PersonID cant be 0/NULL';
			SET @Success = 0;
			RAISERROR(@ErrorStatus, 16,1);
	       END
		
			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-17540 Update Failed';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
		
	
			BEGIN
		
				UPDATE Person.FamilyRelationships
					SET RelationshipID = @RelationshipID,
						RelationDescription =@RelationshipDescription,
						ModifiedDate = SYSDATETIME(),
						ModifiedBy = @ModifiedBy
					WHERE FamilyRelationshipID = @FamilyRelationshipID;
					
			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-17540 Update Failed';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
			
				
				SET @Success =1;
				SET @ErrorStatus =0;
				COMMIT TRANSACTION;
			END
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus  +'-18001 Update Failed on FamilyRelationships';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [dbo].[pUpdateFamilyStatusType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 15 March 11
*Table Name: LUFamilySTatusType
Description: Update data to LUFamilySTatusType.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateFamilyStatusType](
	@FamilyStatusTypeID int,
	@FamilySTatusType Nvarchar(50) ,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempNewFamilyStatusTypeID int
	
	SET @TempNewFamilyStatusTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
				
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
		  
		   IF (@FamilyStatusTypeID = 0) OR (@FamilyStatusTypeID IS NULL)
			BEGIN
				SET @ErrorStatus = ' -60022 FamilyStatusType already exists in LUFamilyStatusType'; 
				RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
			END
		  
			SELECT @TempNewFamilyStatusTypeID = FamilyStatusTypeID 
			  FROM person.LUFamilyStatusType
			     WHERE FamilyStatusTypeID = FamilyStatusTypeID
			      
	     	IF @TempNewFamilyStatusTypeID =0 
			  BEGIN
			    SET @ErrorStatus = ' -60028 FamilyStatusType doesnt exist in LUFamilyStatusType'; 
				RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
			  END	
			 
          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60020';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16,1);
	END
	 
			  UPDATE Person.LUFamilyStatusType
			     SET FamilyStatusType = @FamilyStatusType,
					  ModifiedDate = SYSDATETIME(),
					  ModifiedBy = @ModifiedBy
				 WHERE FamilyStatusTypeID = @FamilyStatusTypeID
				
								
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-60021 Update Failed on LUFamilyStatusType';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pUpdateFoodTypeGiven]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: FoodTypeGiven
Description: Update data to FoodTypeGiven. This SP requires PersonID, to be valid on input
in order to capture the appropriate information. ReceivedDate should also be a valid date/time since we need to be able
to return up to 90 days history for each client in reports. This date is not tested since we have to assume
that the record may have been input on paper for some reason, so we cannot use system date to test validity.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateFoodTypeGiven](
	@FoodTypeGivenID int,
	@PersonID int ,
	@ReceivedDate DateTime,
	@FoodGiven FoodShelf.GroceryOrBreadProduce,
	@ModifiedBy Name,
	@NewFoodTypeGivenID int Output,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempFoodTypeGivenID int

	
	SET @TempFoodTypeGivenID =0;
			
	SET @Success = 0;
	SET @ErrorStatus ='';
/****************************************************************************/

	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
		  --Make sure that we do not have bad data
		  IF ((@FoodTypeGivenID=0) OR (@FoodTypeGivenID IS NULL)) OR((@PersonID = 0) OR (@PersonID IS NULL))
			BEGIN
				SELECT @ErrorStatus = ' -600011 @FoodTypeGivenID/PersonID/ProgramID/ServiceId not valid';
				SET @Success = 0;
				RAISERROR(@ErrorStatus,16,1);
			END
		  
		  --We now have a valid range for each ID, but need to be sure that they exist in the database before trying the Update. 
			SELECT @TempFoodTypeGivenID =  FoodTypeGivenID
			  FROM Foodshelf.FoodTypeGiven
			     WHERE  FoodTypeGivenID = @FoodTypeGivenID AND PersonID = @PersonID 
	     		  --The above could use just @FoodTypeGiven in the WHERE clause, but this is just more validation.	
	     			IF @TempFoodTypeGivenID =0 
				    	BEGIN
					     	SET @ErrorStatus = ' -600008 Record does not exist'; 
							RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
								
						END	
			 
/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-600010';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16,1);
	END
	 
			UPDATE Foodshelf.FoodTypeGiven
			   SET PersonID = @PersonID,
				   ReceivedDate = @ReceivedDate,
				   FoodGiven = @FoodGiven,
				   ModifiedDate = SYSDATETIME(),
				   ModifiedBy = @ModifiedBy
				WHERE FoodTypeGivenID = @FoodTypeGivenID
				   
					
				SET @success =1;
				SET @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-600011 Insert Failed on FoodTypeGiven';
			  RAISERROR(@ErrorStatus, 16, 1);
		
		END CATCH
	END
END



GO
/****** Object:  StoredProcedure [dbo].[pUpdateHouseholdNotes]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO













/*************************************************************************************************
*Author: Gary Savard
*Date: 2 NOV 10
*Table Name: FoodShelf.Household Notes
Description: Updates data to FoodShelf.HouseHoldNotes table.This table is for the notes associated with the
food shelf intake screens. There are 3 ID fields, the HouseholdNotesID is the identity. ClientPersonID
is the PersonID of the individual on which the note was written. The HouseholdMemberPersonID is optional, and
If this person is not the client, but a household member, this value will be the Client's personID. We 
may not need this field, but it is added for potential future functionality
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateHouseholdNotes](
	@HouseholdNotesID int,
	@ClientPersonID int,
	@HouseholdMemberPersonID int,
	@Notes Nvarchar(MAX),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempHouseholdNotesID int,
	@TempClientPersonID int,
	@TempHouseholdMemberPersonID int
	
	SET @TempHouseholdNotesID =0;
	SET @TempClientPersonID = 0;	
	SET @Success = 0;
	SET @ErrorStatus ='';
	



		BEGIN TRY
		  BEGIN TRANSACTION;
				/****************************************************************************/
			--Validate  IDs coming in. Only the HouseholdNotesID and ClientPersonID are mandatory, 
			
			SELECT @TempHouseholdNotesID = @HouseholdNotesID
				FROM Foodshelf.HouseholdNotes	
					WHERE HouseholdNotesID = @HouseholdNotesID
			
			IF @TempHouseholdNotesID = 0 OR @TempHouseholdNotesID IS NULL
				BEGIN
					SET @ErrorStatus ='-14008 Record does not exist';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1); 
				END		
			
			SELECT @TempClientPersonID = PersonID 
			  FROM person.Person
				 WHERE PersonID = @ClientPersonID
			
			If @TempClientPersonID = 0 or @TempClientPersonID IS NULL
			BEGIN
				SET @ErrorStatus = ' -14008 ClientPersonID does not exist in Person'; --Failed in person table
				SET @Success =0;
				RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
				
			END	
		
		--Since this is an optional field, we only check it if it has a value other than 0 or NULL	
		IF @HouseholdMemberPersonID <> 0 AND @HouseholdMemberPersonID IS NOT NULL	
		 BEGIN
			SELECT @TempHouseholdMemberPersonID = @HouseholdMemberPersonID
				FROM Person.Person
					WHERE PersonID = @HouseholdMemberPersonID
		
			IF @TempHouseholdMemberPersonID = 0 OR @TempHouseholdMemberPersonID IS NULL
				BEGIN
					SET @ErrorStatus =' -14016 HouseholdMemberPersonID does not exist, though not NULL/0';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1);
				END			
		END
		/****************************************************************************/	          

			
			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-14000';
				SET @Success = 0;
				RAISERROR (@ErrorStatus,16,1);
			END
			
			  UPDATE Foodshelf.HouseholdNotes 
				 SET ClientPersonID = @ClientPersonID, 
					 HouseholdMemberPersonID = @HouseholdMemberPersonID, 
					 Notes = @Notes,
					 ModifiedBy = @ModifiedBy, 
					 ModifiedDate = SYSDATETIME()
				 WHERE HouseholdNotesID = @HouseholdNotesID  --Don't bother with other Ids here since this is the identity for the row.
				
				
				SET @success =1;
				SET @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
			 --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SET @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
			 
			 SELECT @ErrorStatus =@ErrorStatus + ' -14000' +' Update Failed HouseholdNotes';
			 SET @Success =0;
			 
			 RAISERROR(@ErrorStatus, 16, 1);
			 	 
		
		END CATCH
		
	
END














GO
/****** Object:  StoredProcedure [dbo].[pUpdateHousingStatus]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUHousingStatus
Description: Updates data to LUHousingStatus. 
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateHousingStatus](
	@HousingStatusID int,
	@HousingStatus NVarchar(20),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempHousingStatusID int
	
	SET @TempHousingStatusID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

	 
	BEGIN TRY
		BEGIN TRANSACTION;
			/****************************************************************************/

			SELECT @TempHousingStatusID = HousingStatusID 
			  FROM person.LUHousingStatus
				 WHERE HousingStatusID = @HousingStatusID
				 
			If (@TempHousingStatusID =0) OR (@TempHousingStatusID IS NULL) 
				BEGIN
					SET @ErrorStatus = ' -60098 Does not exist in LUHousingStatus'; --Failed in lookup table
					RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
					
				END	

			/****************************************************************************/	          

				IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60020';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
			
				BEGIN
		
		 			UPDATE Person.LUHousingStatus
		 				SET HousingStatus = @HousingStatus,
		 					ModifiedDate = SYSDATETIME(),
		 					ModifiedBy = @ModifiedBy
						WHERE
							HousingStatusID = @HousingStatusID
				
					
					set @success =1;
					set @ErrorStatus =0;
					COMMIT TRANSACTION;
				END
		
	
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + +'-60021 Insert Failed Housing Status';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
END










GO
/****** Object:  StoredProcedure [dbo].[pUpdateIncomeSource]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Address
Description: Update data to LUIncomeSource table.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateIncomeSource](
	@IncomeSourceID int,
	@IncomeSourceAbbreviation NVarchar(10),
	@IncomeSourceDescription Nvarchar(50),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempIncomeSourceID int
	
	SET @TempIncomeSourceID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		


	
	BEGIN TRY
			BEGIN TRANSACTION;
			/****************************************************************************/
	
		--the address, so we need to be sure that the data matches an address type before continuing.
	SELECT @TempIncomeSourceID = IncomeSourceID 
	  FROM person.LUIncomeSource
		 WHERE IncomeSourceID = @IncomeSourceID 
			
				IF (@IncomeSourceID = 0) OR (@IncomeSourceID IS NULL)
				  BEGIN
				    SET @ErrorStatus = ' -6095 Income Source exists in LUIncomeSource'; --Failed in lookup table
					RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
				END
			
				IF @TempIncomeSourceID = 0
				   BEGIN
					 SET @ErrorStatus = ' -6098 Income Source  doesnt exist LUIncomeSource'; --Failed in lookup table
					 RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
					
				END	 
/****************************************************************************/	          

				IF @@Error <> 0 
				   BEGIN
						SELECT @ErrorStatus = @@ERROR + '-6090';
						SET @Success = 0;
						RAISERROR (@ErrorStatus,16,1);
				    END
	 
		
		
			  UPDATE Person.LUIncomeSource
				 SET IncomeSourceAbbreviation = @IncomeSourceAbbreviation,
				     IncomeSourceDescription = @IncomeSourceDescription,
				     ModifiedDate = SYSDATETIME(), 
				     ModifiedBy = @ModifiedBy
					
				
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
				--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			 SELECT @ErrorStatus =@ErrorStatus + ' -6091' +' Update Failed LUIncomeSource';
			 SET @Success =0;
			 
			 RAISERROR(@ErrorStatus, 16, 1);
			 	 
		
		END CATCH
		
	
END












GO
/****** Object:  StoredProcedure [dbo].[pUpdateInsuranceType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 15 March 11
*Table Name: LUInsuranceType
Description: Update data to LUInsuranceType.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateInsuranceType](
	@InsuranceTypeID int,
	@InsuranceType Nvarchar(50) ,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempNewInsuranceTypeID int
	
	SET @TempNewInsuranceTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
				
	
	BEGIN
		BEGIN TRY
		  BEGIN TRANSACTION;
		  
		   IF (@InsuranceTypeID = 0) OR (@InsuranceTypeID IS NULL)
			BEGIN
				SET @ErrorStatus = ' -60022 Insurance Type already exists in LUInsuranceType'; 
				RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
			END
		  
			SELECT @TempNewInsuranceTypeID = InsuranceTypeID 
			  FROM person.LUInsuranceType
			     WHERE InsuranceTypeID = @InsuranceTypeID
			      
	     	IF @TempNewInsuranceTypeID =0 
			  BEGIN
			    SET @ErrorStatus = ' -60028 Insurance Type doesnt exist in LUInsuranceType'; 
				RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
			  END	
			 
          

	IF @@Error <> 0 
	BEGIN
		SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-60020';
		SET @Success = 0;
		RAISERROR(@ErrorStatus, 16,1);
	END
	 
			  UPDATE Person.LUInsuranceType
			     SET  InsuranceType = @InsuranceType,
					  ModifiedDate = SYSDATETIME(),
					  ModifiedBy = @ModifiedBy
				 WHERE InsuranceTypeID = @InsuranceTypeID
				
								
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus + '-60021 Update Failed on LUInsuranceType';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pUpdateLanguage]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/*************************************************************************************************
*Author: Gary Savard
*Date: 15 Oct 10
*Table Name: LULanguage
Description: Updates data to LULangage. This table Contains the most common languages and dialects in the world.Dialects
are comma demlmited. Example: Chinese, Mandarin.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateLanguage](
	@LanguageID int,
	@LanguageName Nvarchar(50),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempLanguageID int
	
	SET @TempLanguageID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

		BEGIN TRY
		  BEGIN TRANSACTION;
		  /****************************************************************************/
			--Double check to see that we do have a correct languageID before trying to update
			SELECT @TempLanguageID = LanguageID 
				FROM person.LULanguage
				WHERE LanguageID = @LanguageID

		  /****************************************************************************/	          
			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '  -6060';
					SET @Success = 0;
					RAISERROR(@ErrorStatus,16,1);
				END
			 IF (@TempLanguageID = 0) or (@TempLanguageID IS NULL)
				BEGIN
					SELECT @ErrorStatus = '-6068 Language does not exist in db';
					SET @Success =0;
					RAISERROR(@ErrorStatus, 16,1);
				END
				
				IF @TempLanguageID <> 0 --Don't really need this, but... it exists in the database then
					BEGIN
					
						UPDATE Person.LULanguage
							SET LanguageName = @LanguageName,
								ModifiedDate = SYSDATETIME(),
								ModifiedBy = @ModifiedBy
							WHERE
								LanguageID = @LanguageID
								
							
								set @success =1;
								set @ErrorStatus =0;
						COMMIT TRANSACTION;
					END		
				
			END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT  @ErrorStatus= @ErrorStatus + 'LULanguage-6061';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pUpdateLUFamilyRelationships]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUFamilyRelationships
Description: Updates data to LUFamilyRelationships.
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateLUFamilyRelationships](
	@FamilyRelationshipID int, 
	@RelationshipCode Nvarchar(30),
	@RelationshipDescription Nvarchar(50) ='',
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempFamilyRelationshipID int
	
	SET @TempFamilyRelationshipID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	
/****************************************************************************/

	
	BEGIN TRY
		 BEGIN TRANSACTION;
			IF (@FamilyRelationshipID =0) OR (@FamilyRelationshipID IS NULL)
				BEGIN
					SELECT @ErrorStatus = ' -60045 FamilyRelationshipID cant be 0/NULL';
					SET @Success =0;
					RAISERROR(@ErrorStatus, 16,1);
				END 
		 
		 
			SELECT @TempFamilyRelationshipID = FamilyRelationshipID 
			   FROM person.LUFamilyRelationship
			   WHERE FamilyRelationshipID = @FamilyRelationshipID 
			   
	     	If @TempFamilyRelationshipID =0 
				BEGIN
					SET @ErrorStatus = ' -60048 RelationshipID doesnt exist  LUFamilyRelationship'; 
					RAISERROR(@ErrorStatus,16,1);--Could use WITH LOG for event log
					
				END	
 
			IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = Convert(nVarchar(50),@@ERROR) + '-60040';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
		
	
		BEGIN
		
			  UPDATE Person.LUFamilyRelationship
				  SET RelationshipCode = @RelationshipCode,
					  RelationshipDescription = @RelationshipDescription,
					  ModifiedDate = SYSDATETIME(),
					  ModifiedBy = @ModifiedBy
				   WHERE FamilyRelationshipID = @FamilyRelationshipID
					
				
			
				set @success =1;
				set @ErrorStatus =0;
				COMMIT TRANSACTION;
			END
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus  +'-60041 Update Failed LUFamilyRelationship';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pUpdatePerson]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Person
Description: Update data to Person table
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [dbo].[pUpdatePerson](
	@PersonID int,
	@Title NVarchar(8) =NULL,
	@FirstName Name,
	@MiddleName Name = Null,
	@LastName Name,
	@Suffix NVarchar(10) = Null,
	@DateOfBirth DateTime,
	@EmailAddress Nvarchar(50) = Null,
	@EmailContactPreference NoYes =0,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonID int

	
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempPersonID =0;		


	           
BEGIN TRY
	 BEGIN TRANSACTION;
	 
		IF ((@PersonID = 0) OR (@PersonID IS NULL))
			BEGIN
				SELECT @ErrorStatus = 'Person ID cant be 0 or NULL -1005';
				SET @Success = 0;
				RAISERROR (@ErrorStatus,16,1);
			END
		BEGIN
			SELECT @TempPersonID = PersonID from Person.Person
				WHERE
					PersonID = @PersonID
			IF @TempPersonID =0 OR @TempPersonID IS NULL
				BEGIN
					SET @Success =0;
					SELECT @ErrorStatus = '-1008 Person does not exist';
					RAISERROR(@ErrorStatus,16,1);
				END
		END	
		
		IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-1000';
				SET @Success = 0;
			END
		 
			
			 UPDATE Person.Person
				SET Title = @Title,
				    FirstName = @FirstName,
					MiddleName = @MiddleName,
					LastName = @LastName,
					Suffix = @Suffix,
					DateOfBirth = @DateOfBirth, 
					EmailAddress = @EmailAddress,
					EmailContactPreference = @EmailContactPreference,
					ModifiedDate = SYSDATETIME(),
					ModifiedBy = @ModifiedBy
				WHERE PersonID = @PersonID
					
				
				
				SET @success =1;
				SET @ErrorStatus =0;
			COMMIT TRANSACTION;
	
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SET @ErrorStatus=  @ErrorStatus + 'Update Person Failed -1001';
			  RAISERROR(@ErrorStatus, 15, 1);
		
			  
		END CATCH
		
	END








GO
/****** Object:  StoredProcedure [dbo].[pUpdatePersonType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LUPersonType
Description: Updates data to LUPersonType. 
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdatePersonType](
	@PersonTypeID int,
	@PersonType NVarchar(20),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonTypeID int
	
	SET @TempPersonTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

BEGIN TRY
	BEGIN TRANSACTION;
	/****************************************************************************/
	--Does it already exist? If not, then do not try to update!
	SELECT @TempPersonTypeID = PersonTypeID  
	  FROM person.LUPersonType
	     WHERE PersonTypeID = @PersonType

/****************************************************************************/	          
		IF (@TempPersonTypeID = 0) OR (@TempPersonTypeID IS NULL)
			BEGIN
				SELECT @ErrorStatus = @@ERROR + '-600008 PersonType does not exists';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	
		IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = @@ERROR + '-600000';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
		 
		
	
		BEGIN
		
			  UPDATE Person.LUPersonType
				 SET PersonType = @PersonType,
					 ModifiedDate = SYSDATETIME(),
					 ModifiedBy = @ModifiedBy
				 WHERE PersonTypeID = @PersonTypeID
					
				
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		END
END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600001 Update Failed Person Type';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pUpdatePhone]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Phone
Description: Update data to phone table. The row is tied to the person.personid. This Stored proc/table does not directly
access the LUPhoneType table. The type is selected by the user from a dropdown and we just store the ID from the dropdown behind the scenes  
 for simplicity
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdatePhone](
	@PhoneID int,
	@PersonID int,
	@PhoneNumber Phone,
	@PhoneExtension NVarchar(8),
	@PhoneType int,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempPhoneID int,
	@TempPersonID int
	
	SET @TempPhoneID =0;
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';


    BEGIN TRY
		  BEGIN TRANSACTION;
			IF ((@PersonID = 0) OR (@PersonID IS NULL) OR (@PhoneID = 0) OR (@PhoneID IS NULL)) -- This has to be valid or we bail out!
				BEGIN
					SET @Success =0;
					SET @ErrorStatus = '-8005: PersonID/PhoneID must be valid';
						
					RAISERROR(@ErrorStatus,16,1);
				END
				
			BEGIN
				SELECT @TempPersonID = PersonID, @TempPhoneID = @PhoneID
					FROM Person.Phone
						WHERE
							PersonID =@PersonID AND @PhoneID = @PhoneID
							
				IF ((@TempPersonID = 0) OR (@TempPersonID IS NULL)) OR ((@TempPhoneID = 0) OR (@TempPhoneID IS NULL))	
					BEGIN
						SET @ErrorStatus ='-8008 PersonID or PhoneID not valid';
						SET @Success =0;
						RAISERROR (@ErrorStatus, 16, 1);
					END		
			
				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = @@ERROR + '-8030';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END
			END
	 	
			 UPDATE Person.Phone
				SET PersonID = @PersonID,
					PhoneNumber = @PhoneNumber,
					PhoneExtension = @PhoneExtension,
					PhoneType = @PhoneType,
					ModifiedDate = SYSDATETIME(),
					ModifiedBy = @ModifiedBy
				WHERE PhoneID = @PhoneID
			 
					
				SET @success =1;
				SET @ErrorStatus =0;
				
		  COMMIT TRANSACTION;
			
	END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
			--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
				
	  	    SELECT @ErrorStatus= @ErrorStatus + '8001 Update Failed';
		    RAISERROR(@ErrorStatus, 16, 1);
		    SET @Success =0;
			 
			
		END CATCH

		















GO
/****** Object:  StoredProcedure [dbo].[pUpdatePhoneType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************

*Author: Gary Savard
*Date: 12 Oct 10
*Table Name: LUPhoneType
Description: Updage Phone Type to the LUPhoneType table.The data in this table could easily become
poor if the user does not take care when inserting phone types. A mis-spelling can cause unintential duplicate
records.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdatePhoneType](
	@PhoneTypeID int,
	@PhoneType int,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPhoneTypeID int
	
	SET @TempPhoneTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	


	
		 
BEGIN TRY
  BEGIN TRANSACTION;	
	IF (@PhoneTypeID = 0) OR (@PhoneTypeID IS NULL)
		BEGIN
			SET @ErrorStatus = '-6085' + ' PhoneTypeID Cant be 0/NULL' ; 
			 RAISERROR(@ErrorStatus,15,1);--Could use WITH LOG for event log
		END
		
	SELECT @TempPhoneTypeID = PhoneTypeID
	  FROM person.LUPhoneType
		 WHERE PhoneTypeID = @PhoneTypeID
  	 
	
	IF @TempPhoneTypeID = 0
	BEGIN
	SET @ErrorStatus = '-6088' + ' PhoneType doesnt exists LUPhoneType' ; --Failed in lookup table
		RAISERROR(@ErrorStatus,15,1);--Could use WITH LOG for event log
		
	END	
       

	IF @@Error <> 0 
		BEGIN
			SET @ErrorStatus = '-6080';
			SET @Success = 0;
			RAISERROR (@ErrorStatus,16,1);
		END
	   	
	  	 UPDATE Person.LUPhoneType
	  		SET PhoneType = @PhoneType,
	  			ModifiedDate= SYSDATETIME(), 
	  			ModifiedBy = @ModifiedBy
	  		WHERE PhoneTypeID = @PhoneTypeID
				
			set @success =1;
			set @ErrorStatus ='';
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
		--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			 
			  SET @ErrorStatus= @Errorstatus + ' -6081' +'Insert Failed on Phone Type';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			  ROLLBACK TRANSACTION;
		END CATCH
		

END









GO
/****** Object:  StoredProcedure [dbo].[pUpdatepHouseholdTransferOptions]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************
*Author: Gary Savard
*Date: 22 April 11
*Table Name: LUHouseholdTransferOptions
Description: Update data to LUHouseholdTransferOptions. 
Revisions:

**************************************************************************************************/
CREATE PROCEDURE [dbo].[pUpdatepHouseholdTransferOptions](
	@ActionToTakeID int,
	@ActionToTake Nvarchar(50),
	@ActionToTakeDescription NVarchar(MAX),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

BEGIN
	DECLARE
	@TempActionToTakeID int
	
	SET @TempActionToTakeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

		
	

		BEGIN TRY
			BEGIN TRANSACTION;
		
			/****************************************************************************/
				
				
			SELECT @TempActionToTakeID = HouseholdTransferActionID 
			  FROM dbo.LUHouseholdTransferOptions
				 WHERE HouseholdTransferActionID = @ActionToTakeID 
				 
			If @TempActionToTakeID = 0 --Cant Update if it doesnt exist
				BEGIN
					SELECT @ErrorStatus = '-6015 Action Type Does Not Exists';
					SET @Success =0;
					RAISERROR(@ErrorStatus, 16, 1);
				END

			/****************************************************************************/	          

			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = Convert (nVarchar(50),@@ERROR) + ' -6010';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16, 1);
				END
	 
			
			 UPDATE dbo.LUHouseholdTransferOptions
				SET ActionToTake = @ActionToTake,
					ActionToTakeDescription = @ActionToTakeDescription,
					ModifiedBy = @ModifiedBy,
					ModifiedDate = SYSDATETIME()
				WHERE 
					HouseholdTransferActionID =@ActionToTakeID;
					
			
				
				set @success =1;
				set @ErrorStatus ='';
			COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SET @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			   	
		
			  SET @Success =0;
			  SELECT  @ErrorStatus = @ErrorStatus + 'Update Failed Rollback -6011';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			 
		END CATCH
		

END










GO
/****** Object:  StoredProcedure [dbo].[pUpdatePostalCode]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








/*************************************************************************************************

*Author: Gary Savard
*Date: 12 Oct 10
*Table Name: LUPostalCode
Description: Inserts Postal Code to the Postal Code table.This requires that the CityID be passed in as a
paramter. It is unlikely that a new city will be build, requiring a new postal code, but it is very likely
that a new postal code will be needed in a city.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdatePostalCode](
	@PostalCodeID int,
	@CityID int,
	@PostalCode Nvarchar(10),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempCityID int,
	@TempPostalCodeID int
	
	SET @TempPostalCodeID = 0;
	SET @TempCityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	


	
		
BEGIN TRY
	BEGIN TRANSACTION;	 
	
	IF ((@TempPostalCodeID = 0)OR (@TempPostalCodeID IS NULL)) AND ((@TempCityID =0) OR (@TempCityID IS NULL)) 
		BEGIN
			SET @ErrorStatus = '-6075' + ' PostalCodeId/CityID cant be 0/NULL' ;
			RAISERROR(@ErrorStatus,15,1);--Could use WITH LOG for event log
		END
	
	/****************************************************************************/
	--Check to be sure that the city ID and PostalCode ID does exist in the city table before we go on. We could
	--just use postal code ,but adding CityID allows for updates to mistakes in city when entered.
		
	
	SELECT @TempCityID = CityID
	  FROM person.LUCity
		 WHERE CityID = @CityID
		
	SELECT @TempPostalCodeID = PostalCodeID
	  FROM Person.LUPostalCode
		WHERE PostalCodeID = @PostalCodeID
	
	If @TempCityID = 0 OR @TempPostalCodeID = 0
		BEGIN
			SET @ErrorStatus = '-6072' + ' CityID or PostalCodeID doesnt exist in LUtables, cant Update PostalCode' ; --Failed in lookup table
			RAISERROR(@ErrorStatus,15,1);--Could use WITH LOG for event log
			
		END	
/****************************************************************************/	          

	IF @@Error <> 0 
	BEGIN
		SET @ErrorStatus = '-6070';
		SET @Success = 0;
		RAISERROR (@ErrorStatus,16,1);
	END
	 
		
		  UPDATE Person.LUPostalCode
			 SET CityID =@CityID,--Do this in case there was a mistake in original insert
				 PostalCode = @PostalCode,
				 ModifiedDate = SYSDATETIME(),
				 ModifiedBy = @ModifiedBy
			 WHERE PostalCodeID = @PostalCodeID
				
				
				set @success =1;
				set @ErrorStatus ='';
				COMMIT TRANSACTION;
		
END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION;
			--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SET @ErrorStatus='-6071' +'Update Failed on PostalCode';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			  
		END CATCH
		

END









GO
/****** Object:  StoredProcedure [dbo].[pUpdateProgramServiceType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUprogramServiceType
Description: Update data to LUProgramServiceType. This table matches the Program with the service being
used by the client.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateProgramServiceType](
	@ProgramServiceTypeID int,
	@ServiceCode Nvarchar(20),
	@ServiceDescription NVarchar(50),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempProgramServiceTypeID int
	
	SET @TempProgramServiceTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
BEGIN        
  BEGIN TRY
	  BEGIN TRANSACTION;
		IF ((@ProgramServiceTypeID = 0) OR (@ProgramServiceTypeID IS NULL))
			BEGIN
				SELECT @ErrorStatus = '-6055 ProgramServiceTypeID cant be 0 or NULL';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16,1);
			END
			
		SELECT @TempProgramServiceTypeID = ProgramServiceTypeID
				FROM Person.LUProgramServiceType
				WHERE ProgramServiceTypeID = @ProgramServiceTypeID	
				
		IF (@TempProgramServiceTypeID = 0) OR (@TempProgramServiceTypeID IS NULL) 
				BEGIN
					SELECT @ErrorStatus = '-6058 ProgramServiceTypeID cant be 0 or NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END

			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6040';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				END
		 
		
	
	  BEGIN
		
			  UPDATE Person.LUProgramServiceType
				 SET ServiceCode = @ServiceCode,
					 ServiceDescription = @ServiceDescription,
					 ModifiedDate = SYSDATETIME(),
					 ModifiedBy = @ModifiedBy
				 WHERE ProgramServiceTypeID = @ProgramServiceTypeID
				
				set @success =1;
				set @ErrorStatus =0;
			 COMMIT TRANSACTION;
		END
		
	END TRY

		BEGIN CATCH
			--We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  ROLLBACK TRANSACTION;
			  SET @Success =0;
			  SET @ErrorStatus=@ErrorStatus+ 'Update failed Rollback -6051';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			 
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pUpdateProgramType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUProgramType
Description: Update data to LUProgramType. This table matches the Program with the user.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateProgramType](
	@ProgramTypeID int,
	@ProgramName Nvarchar(20),
	@ProgramDescription NVarchar(50),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempProgramTypeID int
	
	SET @TempProgramTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

BEGIN TRY
	BEGIN TRANSACTION;
		IF(@ProgramTypeID = 0) OR (@ProgramTypeID IS NULL)
			BEGIN
				SELECT @ErrorStatus = '-6045 ProgramTypeID cant be 0/null';
				SET @Success =0;
				RAISERROR(@ErrorStatus,16,1);
			END
		BEGIN	
		SELECT ProgramTypeID = @ProgramTypeID
			FROM Person.LUProgramType
			  WHERE ProgramTypeID = @ProgramTypeID
		
		    IF(@ProgramTypeID = 0) OR (@ProgramTypeID IS NULL)
				BEGIN
					SELECT @ErrorStatus = '-6048 ProgramType does not exist';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1);
				END
		
		END	  	
		
		IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = @@ERROR + ' -6040';
				SET @Success = 0;
			END
		 
		

	  BEGIN
		
			  UPDATE Person.LUProgramType
				 SET ProgramName = @ProgramName,
					 ProgramDescription = @ProgramDescription,
					 ModifiedDate = SYSDATETIME(), 
					 ModifiedBy = @ModifiedBy
				 WHERE
					ProgramTypeID = @ProgramTypeID
					
				SET @success =1;
				SET @ErrorStatus =0;
			COMMIT TRANSACTION;
	 END	
	 
		
		END TRY

		BEGIN CATCH
		  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
			--We only care if the error was not raised by SSE
			IF @@ERROR <> 50000
				BEGIN
					SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
				END
			  ROLLBACK TRANSACTION;
			  SET @Success =0;
			  SET @ErrorStatus= @ErrorStatus +' -6041 Update Failed on Program Type';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			 
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pUpdateRace]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/*************************************************************************************************
*Author: Gary Savard
*Date: 9 Oct 10
*Table Name: LURace
Description: Update data to LURace. This table matches the Race with a U.S Census race category
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateRace](
	@RaceID int,
	@RaceAbbreviation NVarchar(10),
	@RaceDescription NVarchar(50),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus NVarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempRaceID int
	
	SET @TempRaceID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	
	          
BEGIN TRY
	BEGIN TRANSACTION;
	/****************************************************************************/
	--Check to see if the RaceID Exists in the DB. Validates the Race ID Input
	--White, Black(AA or Negro).American Indian or Alaskan native.,Asian Indian,Chinese,Filipino, Other Asian, Japanese,
	--Korean, Vietnamese, Native Hawaiian, Guanamanian or Chamorro, Samoan, Other pacific Islander.
	SELECT @TempRaceID = RaceID 
	  FROM person.LURace
	     WHERE RaceID = @RaceID --Be a bit paranoid and trim the input for white spaces


/****************************************************************************/
		IF @@Error <> 0 
		BEGIN
			SELECT @ErrorStatus = @@ERROR + '-6020';
			SET @Success = 0;
			RAISERROR(@ErrorStatus, 16,1);
			
		END
		IF (@TempRaceID = NULL) or (@TempRaceID =0) -- can't update if doesnt exist
			SELECT @ErrorStatus ='-6028 Does not exist in DB';
			SET @Success = 0;
			RAISERROR (@ErrorStatus,16,1);
			 
		 
		
	IF @TempRaceID <> 0 --If they exist in the database then
		BEGIN
		
			  UPDATE Person.LURace
			  SET RaceAbbreviation = @RaceAbbreviation,
				  RaceDescription = @RaceDescription,
				  ModifiedDate = SYSDATETIME(),
				  ModifiedBy =@ModifiedBy
			  WHERE
				  RaceID = @RaceID;
			  			
				set @success =1;
				set @ErrorStatus =0;
			COMMIT TRANSACTION;
		END
END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6021 Update Failed Race Type';
			  RAISERROR(@ErrorStatus, 16, 1);
			
			
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [dbo].[pUpdateSSN]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/*************************************************************************************************
*Author: Gary Savard
*Date: 15 Oct 10
*Table Name: SSN.SSN
Description: Updates data to SSN. Only Certain federal programs require that SSN be captured, so we only want to
use this sparingly.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateSSN](
	@SSNID int,
	@PersonID int,
	@SSN NVarchar(9),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonID int,
	@TempSSNID int
	
	SET @TempPersonID =0;
	SET @TempSSNID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

		BEGIN TRY
		  BEGIN TRANSACTION;
		  SELECT @SSN = ltrim(rtrim(@SSN)); --Get rid of spaces before we begin!
		  /****************************************************************************/
			IF ((@PersonID = 0) OR (@PersonID IS NULL)) 
				BEGIN	
					SELECT @ErrorStatus = '-12005 PersonID cant be 0/NULL';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1); 
					
				END
			IF ((LEN(@SSN)<9) OR (@SSN IS NULL))
				BEGIN	
					SELECT @ErrorStatus = '-11006 Invalid SSN Null or <9 Characters';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1); 
				
				END
			
			IF (@SSNID = 0 OR @SSNID IS NULL)
				BEGIN
					SELECT @ErrorStatus ='-12006 SSNID Cant be 0/NULL';
					SET @Success =0;
					RAISERROR (@ErrorStatus,16,1);
				END
		

			--Final check to be sure this is not a duplicate
			
			SELECT @TempSSNID = SSNID 
				FROM SSN.SSN
					WHERE PersonID = @PersonID AND SSNID =@SSNID
								
			IF @TempSSNID = 0 
				--No Record, Cant update! 
				BEGIN
					SELECT @ErrorStatus = '-12008 Record Does not Exist';
					SET @Success =0;
					RAISERROR(@ErrorStatus,16,1);
				END
				


			/****************************************************************************/	          
			IF @@Error <> 0 
				BEGIN
					SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '  -12001';
					SET @Success = 0;
					RAISERROR(@ErrorStatus,16,1);
				END
			 
				
				
				
					
						UPDATE SSN.SSN 
						    SET PersonID = @PersonID,
								SSN = @SSN,
								ModifiedDate = SYSDATETIME(),
							    ModifiedBy = @ModifiedBy
								 
							WHERE SSNID = @SSNID
								
							
								SET @success =1;
								SET @ErrorStatus =0;
								
						COMMIT TRANSACTION;
						
				
			END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT  @ErrorStatus= @ErrorStatus + 'SSN -12001';
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[pUpdateState]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUState
Description: Update data to LUState. This table matches the State with a State ID for ties to County, City and Zip Code.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [dbo].[pUpdateState](
	@StateID int,
	@StateCode Nvarchar(2),
	@Name Nvarchar(50),
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempStateID int
	
	SET @TempStateID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	

BEGIN TRY
	 BEGIN TRANSACTION;
	 /****************************************************************************/
--This could go after the test for @StateId =0 but will leave here
	SELECT @TempStateID = StateID 
	  FROM person.LUState
	     WHERE StateID = @StateID

/****************************************************************************/	          
		IF (@TempStateId = NULL) OR (@TempStateID = 0)
			BEGIN
				SELECT @ErrorStatus = 'State does not exist -6038';
				SET @Success =0;
				RAISERROR(@ErrorStatus, 16,1);
			END
			
		IF @@Error <> 0 
			BEGIN
				SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + '-6030';
				SET @Success = 0;
				RAISERROR(@ErrorStatus, 16, 1);
			END
		
			
		IF @StateID = 0
			BEGIN
				SELECT @ErrorStatus = '@StateID cant be 0 -6035';
				SET @Success =0;
				RAISERROR(@ErrorStatus, 16,1);
			END
	 
		
			  UPDATE Person.LUState
				SET StateCode = @StateCode,
					Name = @Name,
					ModifiedBy = @ModifiedBy,
					ModifiedDate = SYSDATETIME()
				WHERE
					StateID = @StateID;
			 
							
				set @success =1;
				set @ErrorStatus =0;
			 COMMIT TRANSACTION;
	
			
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  SET @Success =0;
			  SET @ErrorStatus= @ErrorStatus + @@ERROR + '-6031 Update Failed on State';--6030-6039 is for this table
			  RAISERROR(@ErrorStatus, 16, 1);
			 
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [dbo].[spInsertJournalClientFamilyChanges]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Gary Savard
-- Create date: 6 JUNE 11
-- Description:	This sp inserts a row in the journaling table for recordkeeping of admin functions.
-- 
-- =============================================
CREATE PROCEDURE [dbo].[spInsertJournalClientFamilyChanges]
(
	@HouseholdMembersID int,
	@PreviousClientsID int,
	@NewClientsID int,
	@ActionTaken NVarchar(50),
	@Notes NVarchar(MAX),
	@ModifiedBy Name
			
)

AS
BEGIN
BEGIN TRANSACTION
--No Error handling used because we do not want to affect the main sp with problems here.
	
		INSERT dbo.JournalClientFamilyChanges 
				(HouseholdMembersID,
				PreviousClientsID,
				NewClientsID,
				ActionTaken,
				Notes,
				ModifiedBy,
				ModifiedDate)
		VALUES
				(@HouseholdMembersID,
				@PreviousClientsID,
				@NewClientsID,
				@ActionTaken,
				@Notes,
				@ModifiedBy,
				SYSDATETIME())
				
				
IF @@ROWCOUNT >0
	COMMIT TRANSACTION
ELSE
	ROLLBACK TRANSACTION
END




GO
/****** Object:  StoredProcedure [dbo].[VolunteerGetWorkHistory]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--This stored procedure will generate the work history of a Volunteer Persons ID. 
--It will use a CTE to get a list of WeekIDs for a particular PersonID, so that we get a list of hours per day.
--Not a total amount of hours worked. 
CREATE PROCEDURE [dbo].[VolunteerGetWorkHistory] (@VolunteerPersonID int)
AS
BEGIN

WITH VolunteerWorkHistory (ActualHoursTotal, [Week], [Month], [Day], [JobType], [JobDescription], FullName, IsActive)
AS
(SELECT g.*, CONCAT(c.ContactFirstName, ' ', c.ContactLastName) AS FullName, c.IsActive
FROM GetWorkHistory(@VolunteerPersonID) AS g
INNER JOIN Volunteer.VolunteerContactInformation AS c
ON @VolunteerPersonID = c.VolunteerPersonID
)
SELECT * FROM VolunteerWorkHistory

END


GO
/****** Object:  StoredProcedure [dbo].[VolunteerWorkHistory]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VolunteerWorkHistory] (@VolunteerPersonID int)
AS
BEGIN

WITH WorkHistory (MonthID, WeekID, DayID, [Hours], PersonID)
AS (SELECT m.[Month], w.[Week], d.[DayOfWeek], COUNT(d.ActualHoursTotal) AS [Hours], m.VolunteerPersonID
FROM Volunteer.VolunteerScheduleMonth AS m
INNER JOIN Volunteer.VolunteerScheduleWeek AS w
ON m.VolunteerScheduleMonthID = w.VolunteerScheduleMonthID
INNER JOIN Volunteer.VolunteerScheduleDayTime as d
ON w.VolunteerScheduleWeekID = d.VolunteerScheduleDayTimeID
WHERE m.VolunteerPersonID = @VolunteerPersonID
GROUP BY m.[Month], w.[Week], d.[DayOfWeek], d.ActualHoursTotal, m.VolunteerPersonID)


SELECT CONCAT(v.ContactFirstName, ' ', v.ContactLastName) as FullName
FROM Volunteer.VolunteerContactInformation as v
INNER JOIN WorkHistory as h
ON h.PersonID = v.ContactPersonID

GROUP BY h.MonthID, h.WeekID, h.DayID, h.[Hours], h.PersonID, v.ContactFirstName, v.ContactLastName

END;
GO
/****** Object:  StoredProcedure [Maintenance].[CreateRoleScript]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Written By Bradley Morris
--In Query Analyzer be sure to go to
--Query -> Current Connection Options -> Advanced (Tab)
--and set Maximum characters per column
--to a high number, such as 10000, so
--that all the code will be displayed.

Create Procedure [Maintenance].[CreateRoleScript](@RoleName [SYSNAME])
As

--Written By Bradley Morris
--In Query Analyzer be sure to go to
--Query -> Current Connection Options -> Advanced (Tab)
--and set Maximum characters per column
--to a high number, such as 10000, so
--that all the code will be displayed.

DECLARE  @DatabaseRoleName [SYSNAME]
--SET @DatabaseRoleName = '{Database Role Name}'

--SET @DatabaseRoleName = 'role_name_goes_here'
SET @DatabaseRoleName =@RoleName

SET NoCount  ON

DECLARE  @errStatement      [VARCHAR](8000),
         @msgStatement      [VARCHAR](8000),
         @DatabaseRoleID    [SMALLINT],
         @IsApplicationRole [BIT],
         @ObjectID          [INT],
         @ObjectName        [SYSNAME]

SELECT @DatabaseRoleID = [uId],
       @IsApplicationRole = CAST([IsapProle] AS BIT)
FROM   [dbo].[sysUsers]
WHERE  [Name] = @DatabaseRoleName
       AND ([IssqlRole] = 1
             OR [IsapProle] = 1)
       AND [Name] NOT IN ('public',
                          'INFORMATION_SCHEMA',
                          'db_owner',
                          'db_accessadmin',
                          'db_securityadmin',
                          'db_ddladmin',
                          'db_backupoperator',
                          'db_datareader',
                          'db_datawriter',
                          'db_denydatareader',
                          'db_denydatawriter')

IF @DatabaseRoleID IS NULL
  BEGIN
    IF @DatabaseRoleName IN ('public',
                             'INFORMATION_SCHEMA',
                             'db_owner',
                             'db_accessadmin',
                             'db_securityadmin',
                             'db_ddladmin',
                             'db_backupoperator',
                             'db_datareader',
                             'db_datawriter',
                             'db_denydatareader',
                             'db_denydatawriter')
      SET @errStatement = 'Role ' + @DatabaseRoleName + ' is a fixed database role and cannot be scripted.'
    ELSE
      SET @errStatement = 'Role ' + @DatabaseRoleName + ' does not exist in ' + Db_name() + '.' + CHAR(13) + 'Please provide the name of a current role in ' + Db_name() + ' you wish to script.'
    RAISERROR (@errStatement,16,1)
  END
ELSE
  BEGIN
    SET @msgStatement = '--Security creation script for role ' + @DatabaseRoleName + CHAR(13) + '--Created At: ' + CONVERT(VARCHAR,Getdate(),112) + REPLACE(CONVERT(VARCHAR,Getdate(),108),':','') + CHAR(13) + '--Created By: ' + Suser_name() + CHAR(13) + '--Add Role To Database' + CHAR(13)
    IF @IsApplicationRole = 1
      SET @msgStatement = @msgStatement + 'EXEC sp_addapprole' + CHAR(13) + CHAR(9) + '@rolename = ''' + @DatabaseRoleName + '''' + CHAR(13) + CHAR(9) + '@password = ''{Please provide the password here}''' + CHAR(13)
    ELSE
      BEGIN
        SET @msgStatement = @msgStatement + 'EXEC sp_addrole' + CHAR(13) + CHAR(9) + '@rolename ''' + @DatabaseRoleName + '''' + CHAR(13)
        PRINT 'GO'
      END
    SET @msgStatement = @msgStatement + '--Set Object Specific Permissions For Role'
    PRINT @msgStatement
    DECLARE _sySobjects CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR
    SELECT DISTINCT ([sySobjects].[Id]),
                    '[' + User_name([sySobjects].[uId]) + '].[' + [sySobjects].[Name] + ']'
    FROM   [dbo].[sysProtects]
           INNER JOIN [dbo].[sySobjects]
             ON [sysProtects].[Id] = [sySobjects].[Id]
    WHERE  [sysProtects].[uId] = @DatabaseRoleID
    OPEN _sySobjects
    FETCH NEXT FROM _sySobjects
    INTO @ObjectID,
         @ObjectName
    WHILE @@FETCH_STATUS = 0
      BEGIN
        SET @msgStatement = ''
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 193
                          AND [ProtectType] = 205)
          SET @msgStatement = @msgStatement + 'SELECT,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 195
                          AND [ProtectType] = 205)
          SET @msgStatement = @msgStatement + 'INSERT,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 197
                          AND [ProtectType] = 205)
          SET @msgStatement = @msgStatement + 'UPDATE,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 196
                          AND [ProtectType] = 205)
          SET @msgStatement = @msgStatement + 'DELETE,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 224
                          AND [ProtectType] = 205)
          SET @msgStatement = @msgStatement + 'EXECUTE,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 26
                          AND [ProtectType] = 205)
          SET @msgStatement = @msgStatement + 'REFERENCES,'
        IF len(@msgStatement) > 0
          BEGIN
            IF RIGHT(@msgStatement,1) = ','
              SET @msgStatement = LEFT(@msgStatement,Len(@msgStatement) - 1)
            SET @msgStatement = 'GRANT' + CHAR(13) + CHAR(9) + @msgStatement + CHAR(13) + CHAR(9) + 'ON ' + @ObjectName + CHAR(13) + CHAR(9) + 'TO ' + @DatabaseRoleName
            PRINT @msgStatement
          END
        SET @msgStatement = ''
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 193
                          AND [ProtectType] = 206)
          SET @msgStatement = @msgStatement + 'SELECT,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 195
                          AND [ProtectType] = 206)
          SET @msgStatement = @msgStatement + 'INSERT,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 197
                          AND [ProtectType] = 206)
          SET @msgStatement = @msgStatement + 'UPDATE,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 196
                          AND [ProtectType] = 206)
          SET @msgStatement = @msgStatement + 'DELETE,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 224
                          AND [ProtectType] = 206)
          SET @msgStatement = @msgStatement + 'EXECUTE,'
        IF EXISTS (SELECT *
                   FROM   [dbo].[sysProtects]
                   WHERE  [Id] = @ObjectID
                          AND [uId] = @DatabaseRoleID
                          AND [Action] = 26
                          AND [ProtectType] = 206)
          SET @msgStatement = @msgStatement + 'REFERENCES,'
        IF len(@msgStatement) > 0
          BEGIN
            IF RIGHT(@msgStatement,1) = ','
              SET @msgStatement = LEFT(@msgStatement,Len(@msgStatement) - 1)
            SET @msgStatement = 'DENY' + CHAR(13) + CHAR(9) + @msgStatement + CHAR(13) + CHAR(9) + 'ON ' + @ObjectName + CHAR(13) + CHAR(9) + 'TO ' + @DatabaseRoleName
            PRINT @msgStatement
          END
        FETCH NEXT FROM _sySobjects
        INTO @ObjectID,
             @ObjectName
      END
    CLOSE _sySobjects
    DEALLOCATE _sySobjects
    PRINT 'GO'
  END

GO
/****** Object:  StoredProcedure [Maintenance].[pFamilyMemberStartsNewHousehold]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/*************************************************************************************************
*
*Author: Gary Savard
*Date: 15 April 2011
*
Description: This SP covers the instances where a family member starts a new household. This is really only removing 
them from their current household since the record type is the same for client and family members. 
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pFamilyMemberStartsNewHousehold](
	@ClientPersonID int, -- The old client that the person moving is associated with.
	@FamilyToClientPersonID int,--The person who is creating a  new household.
	@ModifiedBy name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonID int,
	@PersonID int,
	@Notes NVarchar(100),
	@ErrNo int
	
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempPersonID =0;
	SET @ErrNo =0;		

	
	           
BEGIN TRY
	 BEGIN TRANSACTION;
	--We first check to be sure that the @FamilyToClientPersonID is in the db
	--Check to see that the old @ClientToPersonID is in the db
	 --if either fails, then bail!
	--Place a record in the Journal Table with the appropriate information before making the change. 
	--Remove the new client from the FamilyRelationship table
	--Make update to  Family relationships table table for new family status. This will probably be blank since we will 
	--want the family to be created on the new query.
	 

	

	 --We need them BOTH to be in the FamilyRelationship table in the same record, else the system does not know that they are related!
		IF EXISTS(SELECT * from person.FamilyRelationships where PersonID =@FamilyToClientPersonID AND ClientPersonID=@ClientPersonID)
			BEGIN
				--Create a string to pass into notes in journal
				SET @Notes = 'Create new household for Person = ' + @FamilyToClientPersonID + 'Previous Household''s Head = ' + @ClientPersonID + 'old household tie removed from FamilyRelationships table'
				
				 					--Time to remove the person. We need to only remove them from the FamilyRelationships table. They will have to Certify when they come in.
						
					DELETE FROM Person.FamilyRelationships WHERE PersonID = @FamilyToClientPersonID AND ClientPersonID = @ClientPersonID
					
					SELECT @ErrNo=@@ERROR
					
					IF @ErrNo<>0
						BEGIN
							SET @ErrorStatus ='Failed on Delete Family Member PersonID: ' + CONVERT(NVarchar(50),@FamilyToClientPersonID)
							RAISERROR(@ErrorStatus,16,0)
					
						END--IF@ErrNO
						
				--Make Journal Entry. We are ignoring potential errors from journal for the time being. 
				 EXEC pInsertJournalClientFamilyChanges @FamilyToClientPersonID,@ClientPersonID,0,'New Household Created','',@ModifiedBY,@Success OUTPUT,@ErrorStatus OUTPUT
				 
					
			
			END
		ELSE
			BEGIN
				SET @ErrorStatus ='Client/House member not matched FamRel tab : ' + CONVERT(NVarchar(50),@FamilyToClientPersonID) + ' ' + CONVERT(NVarchar(50),@ClientPersonID)
							RAISERROR(@ErrorStatus,16,0)
			
			END
	
	
	/******************************************************************************************************
	 
	 
	
	*******************************************************************************************************/
		COMMIT TRANSACTION;
	
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SET @ErrorStatus=  @ErrorStatus + '-1001';
			  RAISERROR(@ErrorStatus, 15, 1);
		
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [Maintenance].[pGrantViewDefinitionsforUDTs]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Maintenance].[pGrantViewDefinitionsforUDTs] 
	
AS
BEGIN

DECLARE

@UDTName NVarchar(30),
@SchemaID int,
@SchemaName NVarchar(30),
@Cnt int,
@NumRec int,
@ExecString NVarchar(200)



CREATE TABLE #TempTable (counts INT identity,name Varchar(50),SchemaID int)
INSERT INTO #TempTable  SELECT name,schema_id FROM sys.Types 
WHERE is_user_defined = 1

SELECT @NumRec = MAX(Counts) from #TempTable

SET @Cnt =1

While @Cnt <= @NumRec
	BEGIN
		SELECT @UDTName =name, @SchemaID =SCHEMAID from #TempTable where counts =@Cnt
	
		SELECT @SchemaName =name from sys.schemas where schema_id =@SchemaID
	
	SET @ExecString =	'GRANT VIEW DEFINITION ON TYPE::[' + @SchemaName + '].' + @UDTNAME + ' TO db_CrystalReports'
	
	EXEC (@ExecString)
	
	SET @Cnt = @Cnt +1
	
	END 
Drop Table #TempTable
	
END


GO
/****** Object:  StoredProcedure [Maintenance].[pHideAddressType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 2011
*Table Name: LUAddressType
Description: Suppresses from LUAddressType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideAddressType](
	@AddressTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempAddressTypeID int
	
	SET @TempAddressTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@AddressTypeID = 0) OR (@AddressTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6015 AddressTypeID cannot be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempAddressTypeID =@AddressTypeID
				  FROM person.LUAddressType
					 WHERE  AddressTypeID= @AddressTypeID
			
								 
				IF ((@TempAddressTypeID=0) OR (@TempAddressTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6018 AddressTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				UPDATE  Person.LUAddressType
					 SET IsDeleted =1
					 WHERE AddressTypeID = @AddressTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6013 DELETE Fail AddressType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideCity]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date:21 July 2011
*Table Name: LUCity
Description: Hides row in LUCity
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideCity](
	@CityID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempCityID int
	
	SET @TempCityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@CityID = 0) OR (@CityID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60055 CityID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempCityID =@CityID
				  FROM person.LUCity
					 WHERE  CityID= @CityID
			
								 
				IF ((@TempCityID=0) OR (@TempCityID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60058 CityID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60050';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

					UPDATE  Person.LUCity SET IsDeleted =1
					 WHERE CityID = @CityID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60053 DELETE Fail City';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideContactType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 2011
*Table Name: LUContactType
Description: Hides LUContactType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideContactType](
	@ContactTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempContactTypeID int
	
	SET @TempContactTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@ContactTypeID = 0) OR (@ContactTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60025 ContactTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempContactTypeID =ContactTypeID
				  FROM person.LUContactType
					 WHERE  ContactTypeID= @ContactTypeID
			
								 
				IF ((@TempContactTypeID=0) OR (@TempContactTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60028 ContactTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60020';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				UPDATE  Person.LUContactType
					 SET IsDeleted =1
					 WHERE ContactTypeID = @ContactTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60023 DELETE Fail ContactType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideEducationCategory]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 2011
*Table Name: LUEducationCategory
Description: Hides LUEducationCategory
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideEducationCategory](
	@EducationCategoryID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempEducationCategoryID int

	
	SET @TempEducationCategoryID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@EducationCategoryID = 0) OR (@EducationCategoryID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60065 EducationCategoryID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempEducationCategoryID = EducationCategoryID 
				  FROM person.LUEducationCategory
					 WHERE EducationCategoryID = @TempEducationCategoryID
			
								 
				IF ((@TempEducationCategoryID=0) OR (@TempEducationCategoryID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60078 EducationCategoryID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -2000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE   Person.LUEducationCategory
					 SET IsDeleted =1
					 WHERE EducationCategoryID = @EducationCategoryID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60073 DELETE Fail EducationCategory';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideEthnicity]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 11
*Table Name: LUEthnicity
Description: Hides LUEthicity
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideEthnicity](
	@EthnicityID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempEthnicityID int
	
	SET @TempEthnicityID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@EthnicityID = 0) OR (@EthnicityID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60085 EthnicityID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempEthnicityID =EthnicityID  
				  FROM person.LUEthnicity
					 WHERE EthnicityID = @TempEthnicityID
			
								 
				IF ((@TempEthnicityID=0) OR (@TempEthnicityID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60088 EthnicityID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -2000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				UPDATE  Person.LUEthnicity
					 SET IsDeleted =1
					 WHERE EthnicityID = @EthnicityID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60083 DELETE Fail Ethnicity';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideFamilyStatusType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************

*Author: Gary Savard
*Date: 14 March 11
*Table Name: LUFamilyStatusType
Description: Hides LUFamilyStatusType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideFamilyStatusType](
	@FamilyStatusTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempFamilyStatusTypeID int
	
	SET @FamilyStatusTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@FamilyStatusTypeID = 0) OR (@FamilyStatusTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '600015 FamilyStatusTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @FamilyStatusTypeID =FamilySTatusTypeID  
				  FROM person.LUFamilyStatusType
					 WHERE FamilyStatusTypeID = @FamilyStatusTypeID
			
								 
				IF ((@TempFamilyStatusTypeID=0) OR (@TempFamilyStatusTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -600018 FamilySTatusTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -600010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE  Person.LUFamilyStatusType
					 SET IsDeleted =1
					 WHERE FamilyStatusTypeID = @FamilyStatusTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600013 DELETE Fail LuFamilyStatusType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END















GO
/****** Object:  StoredProcedure [Maintenance].[pHideHouseholdTransferOptions]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 11
*Table Name: HouseholdTransferOptions
Description: Hides from HouseholdTransferOptions. 
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideHouseholdTransferOptions](
	@ActionToTakeID  int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempActionToTakeID int
	
	SET @TempActionToTakeID  =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@ActionToTakeID = 0) OR (@ActionToTakeID  IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6015 ActionToTakeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempActionToTakeID =@ActionToTakeID 
				  FROM dbo.LUHouseholdTransferOptions
					 WHERE  HouseholdTransferActionID= @ActionToTakeID
			
								 
				IF ((@TempActionToTakeID=0) OR (@TempActionToTakeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6018 ActionToTakeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				UPDATE  dbo.LUHouseholdTransferOptions
					 SET IsDeleted =1	
					 WHERE HouseholdTransferActionID = @TempActionToTakeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6013 DELETE Fail LUHouseholdTransferOptions';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END














GO
/****** Object:  StoredProcedure [Maintenance].[pHideHousingStatus]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July
*Table Name: LUHousingStatus
Description: Hides LUHousingStatus
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideHousingStatus](
	@HousingStatusID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempHousingStatusID int
	
	SET @TempHousingStatusID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@HousingStatusID = 0) OR (@HousingStatusID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60085 HousingStatusID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempHousingStatusID =HousingStatusID
				  FROM person.LUHousingStatus
					 WHERE  HousingStatusID= @HousingStatusID
			
								 
				IF ((@TempHousingStatusID=0) OR (@TempHousingStatusID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60088 HousingStatusID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60080';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE  Person.LUHousingStatus
					 SET IsDeleted =1
					 WHERE HousingStatusID = @HousingStatusID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60083 DELETE Fail HousingStatus';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideIncomeSource]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 11
*Table Name: LUIncomeSource
Description: Hides LUIncomeSource
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideIncomeSource](
	@IncomeSourceID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempIncomeSourceID int
	
	SET @TempIncomeSourceID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@IncomeSourceID = 0) OR (@IncomeSourceID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60095 IncomeSourceID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempIncomeSourceID = IncomeSourceID 
				  FROM person.LUIncomeSource
					 WHERE IncomeSourceID = @IncomeSourceID
			
								 
				IF ((@TempIncomeSourceID=0) OR (@TempIncomeSourceID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60098 IncomeSourceID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -2000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE   Person.LUIncomeSource
					 SET IsDeleted =1
					 WHERE IncomeSourceID = @IncomeSourceID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60093 DELETE Fail IncomeSource';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideInsuranceType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 11
*Table Name: LUInsuranceType
Description: Hides LUInsuranceType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideInsuranceType](
	@InsuranceTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempInsuranceTypeID int
	
	SET @InsuranceTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@InsuranceTypeID = 0) OR (@InsuranceTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '600015 InsuranceTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @InsuranceTypeID =InsuranceTypeID  
				  FROM person.LUInsuranceType
					 WHERE InsuranceTypeID = @InsuranceTypeID
			
								 
				IF ((@TempInsuranceTypeID=0) OR (@TempInsuranceTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -600018 InsuranceTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -600010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE Person.LUInsuranceType
					 SET IsDeleted =1
					 WHERE InsuranceTypeID = @InsuranceTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600013 DELETE Fail LuInsuranceType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END














GO
/****** Object:  StoredProcedure [Maintenance].[pHideLanguage]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date:21 July 11
*Table Name: LULanguage
Description: Deletes from LULanguage
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideLanguage](
	@LanguageID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempLanguageID int
	
	SET @TempLanguageID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@LanguageID = 0) OR (@LanguageID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60065 LanguageID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempLanguageID = LanguageID 
				  FROM person.LULanguage
					 WHERE LanguageID = @LanguageID
			
								 
				IF ((@TempLanguageID=0) OR (@TempLanguageID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60068 LanguageID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60000';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE Person.LULanguage
					 SET IsDeleted =1
					 WHERE LanguageID = @LanguageID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60063 DELETE Fail Language';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideLUFamilyRelationship]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 11
*Table Name: LUFamilyRelationship
Description: Hide LUFamilyRelationship
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideLUFamilyRelationship](
	@FamilyRelationshipID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempFamilyRelationshipID int
	
	SET @TempFamilyRelationshipID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@FamilyRelationshipID = 0) OR (@FamilyRelationshipID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '60045 FamilyRelationshipID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempFamilyRelationshipID =FamilyRelationshipID
				  FROM person.LUFamilyRelationship
					 WHERE  FamilyRelationshipID= @FamilyRelationshipID
			
								 
				IF ((@TempFamilyRelationshipID=0) OR (@TempFamilyRelationshipID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -60048 FamilyRelationshipID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -60040';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE  Person.LUFamilyRelationship
					 SET IsDeleted =1
					 WHERE FamilyRelationshipID = @FamilyRelationshipID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60043 DELETE Fail FamilyRelationship';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHidePersonType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUPersonType
Description: Hides LUPersonType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHidePersonType](
	@PersonTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempPersonTypeID int
	
	SET @TempPersonTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@PersonTypeID = 0) OR (@PersonTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '600015 PersonTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempPersonTypeID =PersonTypeID  
				  FROM person.LUPersonType
					 WHERE PersonTypeID = @PersonTypeID
			
								 
				IF ((@TempPersonTypeID=0) OR (@TempPersonTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -600018 PersonTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -600010';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				UPDATE  Person.LUPersonType
					 SET IsDeleted =1
					 WHERE PersonTypeID = @PersonTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600013 DELETE Fail PersonType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHidePhoneType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUPhoneType
Description: HideLUPhoneType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHidePhoneType](
	@PhoneTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempPhoneTypeID int
	
	SET @TempPhoneTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@PhoneTypeID = 0) OR (@PhoneTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '600085 PhoneTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempPhoneTypeID =PhoneTypeID  
				  FROM person.LUPhoneType
					 WHERE PhoneTypeID = @PhoneTypeID
			
								 
				IF ((@TempPhoneTypeID=0) OR (@TempPhoneTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -600088 PhoneTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -600080';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE  Person.LUPhoneType
					 SET IsDeleted =1
					 WHERE PhoneTypeID = @PhoneTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-600083 DELETE Fail PhoneType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END














GO
/****** Object:  StoredProcedure [Maintenance].[pHidePostalCode]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 11
*Table Name: LUPostalCode
Description: Hides LUPostalCode
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHidePostalCode](
	@PostalCodeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempPostalCodeID int
	
	SET @TempPostalCodeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@PostalCodeID = 0) OR (@PostalCodeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6075 PostalCodeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempPostalCodeID =PostalCodeID
				  FROM person.LUPostalCode
					 WHERE  PostalCodeID= @PostalCodeID
			
								 
				IF ((@TempPostalCodeID=0) OR (@TempPostalCodeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6078 PostalCodeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6070';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				UPDATE Person.LUPostalCode
					 SET IsDeleted =1
					 WHERE PostalCodeID = @PostalCodeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6073 DELETE Fail PostalCode';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideProgramServiceType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUProgramServiceType
Description: Hides LUProgramServiceType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideProgramServiceType](
	@ProgramServiceTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempProgramServiceTypeID int
	
	SET @TempProgramServiceTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@ProgramServiceTypeID = 0) OR (@ProgramServiceTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6055 ProgramServiceTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempProgramServiceTypeID =ProgramServiceTypeID
				  FROM person.LUProgramServiceType
					 WHERE  ProgramServiceTypeID= @ProgramServiceTypeID
			
								 
				IF ((@TempProgramServiceTypeID=0) OR (@TempProgramServiceTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6058 ProgramServiceTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6050';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE Person.LUProgramServiceType
					 SET IsDeleted =1
					 WHERE ProgramServiceTypeID = @ProgramServiceTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6053 DELETE Fail ProgramServiceType';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideProgramType]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 21 July 11
*Table Name: LUProgramType
Description: Hides LUProgramType
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideProgramType](
	@ProgramTypeID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempProgramTypeID int
	
	SET @TempProgramTypeID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@ProgramTypeID = 0) OR (@ProgramTypeID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6045 ProgramTypeID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempProgramTypeID =ProgramTypeID
				  FROM person.LUProgramType
					 WHERE  ProgramTypeID= @ProgramTypeID
			
								 
				IF ((@TempProgramTypeID=0) OR (@TempProgramTypeID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6048 ProgramTypeID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6040';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE  Person.LUProgramType
					 SET IsDeleted =1
					 WHERE ProgramTypeID = @ProgramTypeID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6043 DELETE Fail PostalCode';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideRace]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LURace
Description: Hides LURace
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideRace](
	@RaceID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempRaceID int
	
	SET @TempRaceID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@RaceID = 0) OR (@RaceID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6025 RaceID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempRaceID =RaceID
				  FROM person.LURace
					 WHERE  RaceID= @RaceID
			
								 
				IF ((@TempRaceID=0) OR (@TempRaceID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6028 RaceID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6020';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				UPDATE Person.LURace
					 SET IsDeleted =1
					 WHERE RaceID = @RaceID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6023 DELETE Fail Race';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pHideState]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*************************************************************************************************

*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: LUState
Description: Hides LUState
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pHideState](
	@StateID int,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@TempStateID int
	
	SET @TempStateID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				IF ((@StateID = 0) OR (@StateID IS NULL)) 
				  BEGIN
					SELECT @ErrorStatus = '6035 StateID cant be 0/NULL';
					SET @Success = 0;
					RAISERROR(@ErrorStatus, 16,1);
				  END
				
				
				SELECT @TempStateID =StateID
				  FROM person.LUState
					 WHERE  StateID= @StateID
			
								 
				IF ((@TempStateID=0) OR (@TempStateID IS  NULL)) 
				    BEGIN
						SELECT @ErrorStatus = ' -6038 StateID does not exist';
						SET @Success =0;
						RAISERROR(@ErrorStatus,16,1);
				    END

				IF @@Error <> 0 
					BEGIN
						SELECT @ErrorStatus = CONVERT(nVarchar(50),@@ERROR) + ' -6030';
						SET @Success = 0;
						RAISERROR(@ErrorStatus, 16, 1);
					END

				 UPDATE Person.LUState
					 SET IsDeleted =1
					 WHERE StateID = @StateID	
										
					set @success =1;
					set @ErrorStatus =0;
				COMMIT TRANSACTION;
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-6033 DELETE Fail State';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END













GO
/****** Object:  StoredProcedure [Maintenance].[pMakeFamilyMemberClientinSameHousehold]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/*************************************************************************************************
*
*Author: Gary Savard
*Date: 15 April 2011
*
Description: This SP covers the instances where a family member replaces the current client and becomes the client. 
*We handle the client by either deleting (supressing) from the system, moving the client to another household, creating
*another household or by 'demoting' the client to family member. 
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pMakeFamilyMemberClientinSameHousehold](
	@ClientPersonID int,
	@PromoteToClientPersonID int,
	@ActionToTake nVarchar(10),
	@NewPersonID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@TempPersonID int,
	@PersonID int;
	
	SET @TempPersonID =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @TempPersonID =0;		

	
	           
BEGIN TRY
	 BEGIN TRANSACTION;
	--Make sure that the @ActionToTake value is valid. If not, bail!
	 
	-- Check the @PromoteToClientPersonID to ensure that the person to be promoted is associated with the current client.
		--If Not Valid, Bail
		--Else
			--all of the household member IDs from the FamilyRelationship table so that we can update the ClientPersonID to that of the new client.
			--Change the Family status of the new client to reflect that they are no longer child, spouse, etc, of the client
	
	
	--If this works, then we will deal with the old client.
	
	--"DEMOTE" If the old client is to become a member of the same household
		--We add them to the FamilyRelationship table and give them a FamilyMember entry
		 
	--If they are part of a new household, then we update any records in the familyRelationship table that has their ID and 
	--Remove any from the FamilyRelationship status as appropriate
	
	--"DELETE" We remove the client by setting the IsDeleted bit in the person table. We keep them in the system,but
	--they are no longer visible from a query.		
	
	--"NEWHOUSEHOLD" -- We create a new household and return the new household ID. May not even need to do that because we are 
	--really just removing their association with the current client. When the move is finished. The person inputting data will have
	--to query on the new record and create the appropriate household members.
	
	
	/******************************************************************************************************
	
	 
	
	*******************************************************************************************************/
		COMMIT TRANSACTION;
	
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SET @ErrorStatus=  @ErrorStatus + '-1001';
			  RAISERROR(@ErrorStatus, 15, 1);
		
			  
		END CATCH
		
	END











GO
/****** Object:  StoredProcedure [Maintenance].[pMoveFamilyMemberToAnotherHousehold]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/*************************************************************************************************
*
*Author: Gary Savard
*Date: 15 April 2011
*
Description: This SP covers the instances where a family member moves to a new household. It assumes that if the 
person is the head of the old household, that another person has been promoted to head of that household already
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pMoveFamilyMemberToAnotherHousehold](
	@OldHouseholdClientPersonID int, -- The old client that the person moving is associated with.
	@NewHouseholdClientPersonID int,--Person moving to new household
	@ToNewHouseholdPersonID int,--The person who going to new household
	@NewFamilyStatusType NVarchar(50) = NULL,--This may or may not be used.
	@NewFamilyRelationshipID int =0, --May or may not be used.
	@NewFamilyRelationshipDescription NVarchar(50)=NULL, --This may or may not be used
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
BEGIN
	DECLARE
	@ErrNo int
	
	
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @ErrNo =0;	

	
	           
BEGIN TRY
	 BEGIN TRANSACTION;
	--Place a record in the Journal Table with the appropriate information before making the change. 
	--Update the Relationship table with the new household's client ID and the new relationship
	--Make update to demographics table for new family status. 
	
				 EXEC dbo.pInsertJournalClientFamilyChanges @ToNewHouseholdPersonID,
															@OldHouseholdClientPersonID,
															@NewHouseholdClientPersonId,
															'Moved to new household',
															@NewFamilyRelationshipDescription,
															@ModifiedBy
															
					
						--Move to new household
						INSERT  Person.FamilyRelationships(PersonID,ClientPersonID,RelationshipID,RelationDescription,ModifiedDate,ModifiedBy)
							VALUES
								(@ToNewHouseholdPersonID,@NewHouseholdClientPersonID,@NewFamilyRelationshipID,@NewFamilyRelationshipDescription,SYSDATETIME(),@ModifiedBy)
						--Remove from old Household
						SELECT @ErrNo =@@ERROR 
				
							IF @ErrNo<>0
								BEGIN
									SET @ErrorStatus ='Failed Insert Move to new household'
									RAISERROR(@ErrorStatus,16,0)
							
								END
						
						DELETE FROM person.FamilyRelationships 
							WHERE PersonID = @ToNewHouseholdPersonID AND ClientPersonID=@OldHouseholdClientPersonID
								
							IF @ErrNo<>0
								BEGIN
									SET @ErrorStatus ='Failed Delete Move to new household'
									RAISERROR(@ErrorStatus,16,0)
								END
						
	/******************************************************************************************************
	
	 
	
	*******************************************************************************************************/
		COMMIT TRANSACTION;
	
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @ErrNo);
					END
			  SET @Success =0;
			  SET @ErrorStatus=  @ErrorStatus + '-1001';
			  RAISERROR(@ErrorStatus, 15, 1);
		
			  
		END CATCH
		
	END












GO
/****** Object:  StoredProcedure [Maintenance].[pRestoreClientRecord]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*
*Author: Gary Savard
*Date: 15 April 2011
*
Description: This SP covers the instances where a deleted person needs to be restored to the database. We just flip the IsDeleted bit.
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pRestoreClientRecord](
	@tRestorePersonID BatchProcessPersonID READONLY,--The person/Household,
	@ModifiedBy Name,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;

	DECLARE
	@ErrNo INT,
	@LogMsg NVarchar(50),
	@journalSuccess BIT,
	@JournalErrorStatus NVarchar(50),
	@ErrorCount int,
	@Notes NVarchar(50)
	
	
	SET @Success = 0;
	SET @ErrorStatus ='';
	SET @ErrNo =0;	
	SET @LogMsg ='Restored client record. ';
	SET @ErrorCount =0;
		
	           
BEGIN TRY
	DECLARE
	@RowCount int,
	@NumberRecs int,
	@tmpPersonID int,
	@tmpClientPersonID int
					
							
	SET @RowCount =1
					
								
					
	SELECT @NumberRecs = COUNT(*) FROM @tRestorePersonID --How many records?
						
						
		WHILE @RowCount <=@NumberRecs
			BEGIN
				BEGIN TRANSACTION;--TX for each individual record
				
				SET @Notes =''
				
				SELECT @tmpPersonID =PersonID 
					FROM @tRestorePersonID
					WHERE RowID =@Rowcount
			
			UPDATE Person.Person
				SET IsDeleted =0
				WHERE PersonID =@TmpPersonID
				
				SELECT @ErrNo =@@ERROR 
				
				 SET @RowCount = @RowCount + 1
				 
			IF @ErrNo<>0 OR @@ROWCOUNT =0 
				BEGIN
					SET @ErrorCount = @ErrorCount +1
					SET @ErrorStatus ='Fail RestoreID: ' + CONVERT(NVarchar(50),@TmpPersonID)+','
					SET @Notes ='Failed restore PersonID' + CONVERT(NVarchar(50),@TmpPersonID)
					 
					ROLLBACK TRANSACTION --Rollback only the one that failed!
				END--IF@ErrNO	 
			
			IF @@TRANCOUNT >0
				BEGIN
					COMMIT TRANSACTION
					SET @Notes ='Restored PersonID: '+ CONVERT(NVarchar(50),@TmpPersonID)
				END
				
			
			--Place a record in the Journal Table with the appropriate information before making the change. 	
			 EXEC dbo.pInsertJournalClientFamilyChanges @TmpPersonID,
											0,--@HeadofHouseholdPersonID not needed
											0,--@NewHeadOfHouseholdPersonID
											@LogMsg,
											@Notes,
											@ModifiedBy,
											@JournalSuccess,--we don't care about the return values of this and error status for time being
											@JournalErrorStatus	
			END --End While
			
	
		 IF @ErrorCount >0--This goes to the error trap for recording those that failed, but we do not rollback in the error trap.
			BEGIN
				RAISERROR(@ErrorStatus,16,0)
			END
			
			
					
				
						
	/******************************************************************************************************
	
	 
	
	*******************************************************************************************************/
		
	
		END TRY

		BEGIN CATCH
			--We do not rollback here
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @ErrNo);
					END
			  SET @Success =0;
			  SET @ErrorStatus=  @ErrorStatus + '-1001';
			  RAISERROR(@ErrorStatus, 15, 1);
		
			  
		END CATCH
		

















GO
/****** Object:  StoredProcedure [Maintenance].[pRetrieveClientRecords]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*************************************************************************************************

*Author: Gary Savard
*Date: 11 Jun 11

Description: Returns the names DOB  of queried records
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pRetrieveClientRecords](
	@IsDeleted bit,
	@IsSoundsLike bit,
	@FirstName Name,--if complete query for all deleted, then we don't need names or dob
	@LastName Name,
	@DOB DateTime,
	@IsAllDeletedRecords bit,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
	DECLARE
	@ErrNO int
	
	SET @ErrNO =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
		
			IF @IsAllDeletedRecords = 1 AND @IsDeleted =1 
				BEGIN
					--Cannot retrieve one record AND all records!
					SET @ErrorStatus ='Error ISAllDeltetedRecords & IsDeleted mutually exclusive, both cannot be True: ' 
							RAISERROR(@ErrorStatus,16,0)
				END
			--return everyone who is delteted
			IF @IsAllDeletedRecords =1 
				BEGIN
					SELECT A.FirstName,A.LastName,A.DateOfBirth, 
						   B.AddressLine1, b.City 
				    FROM Person.[Person] AS A, 
						 Person.Address AS B  
				    WHERE (A.PersonID = B.PersonID) AND A.IsDeleted =1
				END
			--Just one deleted	
			IF 	@IsDeleted =1
				BEGIN
				  SELECT A.FirstName, A.LastName, A.DateofBirth,
						 B.AddressLine1, b.City 
				  FROM person.[Person] AS A,
					    Person.Address as B
				  WHERE (A.PersonID = B.PersonID) AND FirstName = @FirstName AND LastName = @LastName AND DateOfBirth = @DOB AND IsDeleted =1
				END
			--Use soundex on last name to return deleted records like those	
			IF @IsDeleted =1 AND @IsSoundsLike =1
				BEGIN
					SELECT A.FirstName,A.LastName,A.DateOfBirth, 
						   B.AddressLine1, b.City 
				    FROM Person.[Person] AS A, 
						 Person.Address AS B  
				    WHERE (A.personid = B.personid) AND soundex(A.Lastname) =SOUNDEX(@LastName) AND A.IsDeleted =1
					
				END
					
			--Completely different query for non deleted record with soundex using both first and last name because IsDeleted =0 and we could have
			--a ton of Smiths!
			IF @IsDeleted =0 and @IsSoundsLike =1
				BEGIN
					BEGIN
					SELECT A.FirstName,A.LastName,A.DateOfBirth, 
						   B.AddressLine1, b.City 
				    FROM Person.[Person] AS A, 
						 Person.Address AS B  
				    WHERE (A.personid = B.personid) AND SOUNDEX(A.Lastname) =SOUNDEX(@LastName) AND SOUNDEX(a.Firstname) = SOUNDEX (@FirstName) AND A.IsDeleted =0
					
				END
				END		
				
				SELECT @ErrNO = @@ERROR
				
				IF @ErrNo<>0
						BEGIN
							SET @ErrorStatus ='Error on query: ' 
							RAISERROR(@ErrorStatus,16,0)
					
						END--IF@ErrNO
				
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @Errno because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @ErrNO <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @ErrNO);
					END
			  SET @Success =0;
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END















GO
/****** Object:  StoredProcedure [Maintenance].[pRetrieveLookupTables]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*************************************************************************************************

*Author: Gary Savard
*Date: 11 Jun 11

Description: Returns the names of all look up tables in CV Connect
Revisions:
**************************************************************************************************/
CREATE PROCEDURE [Maintenance].[pRetrieveLookupTables](
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS
SET NOCOUNT ON;
	DECLARE
	@ErrNO int
	
	SET @ErrNO =0;
	SET @Success = 0;
	SET @ErrorStatus ='';
		
	
	
	BEGIN
		BEGIN TRY
			
				SELECT * FROM sys.tables WHERE tables.name LIKE 'LU'+'%'
				SELECT @ErrNO =@@ERROR
				
				IF @ErrNo<>0
						BEGIN
							SET @ErrorStatus ='Failed on LU table return: ' 
							RAISERROR(@ErrorStatus,16,0)
					
						END--IF@ErrNO
				
		
		END TRY

		BEGIN CATCH
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SET @Success =0;
			  SELECT @ErrorStatus= @ErrorStatus +'-60063 DELETE Fail Language';
			  RAISERROR(@ErrorStatus, 15, 1);
			 
			  
		END CATCH
		
	END














GO
/****** Object:  StoredProcedure [Signature].[pInsertSignature]    Script Date: 10/8/2021 11:21:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*************************************************************************************************
*Author: Gary Savard
*Date: 8 Oct 10
*Table Name: Signature.Signatures and Signature.Signature
Description: The signature history for each client must be kept in the signature table,thus there is an interchange
table called signatures that creates the relationship ties between the person and signature table.This procedure first
insterts to Singnature, retrieves the new SignatureID and makes the tie by inserting a row in the Signatures table. 
We do not need to do updates to this procedure since a new row must always be generated for the client.
Revisions:
**************************************************************************************************/

CREATE PROCEDURE [Signature].[pInsertSignature](
	@PersonID int,
	@Signature varChar(MAX),
	@ModifiedBy Name,
	@NewSignatureID int Output,
	@NewSignaturesID int Output,
	@Success bit Output,
	@ErrorStatus Nvarchar(50) Output
	)
AS

Set NoCount ON;


	DECLARE
	@TempSignatureID int,
	@TempPersonID int,
	@ProcedureLocation varchar,
	@TempSignaturesID int;
	
	
	SET @TempSignatureID =0;
	SET @TempPersonID =0;
	SET @TempSignaturesID =0;
	SET @Success = 0;
	SET @ProcedureLocation ='';
	SET @ErrorStatus ='';
	
	          

BEGIN TRANSACTION; --We will wrap both inserts in the same transaction to avoid orphaned data
  BEGIN TRY
  /****************************************************************************/
	--Check to see if this person already has a signaure. This is not required with the current procedure but 
	--is potentially required in the future so it remains. 	
		SELECT @TempPersonID = @PersonID
		  FROM Signature.Signature
			 WHERE Signature.PersonID = @PersonID 

/****************************************************************************/
  
	IF @@Error <> 0 
	BEGIN
		SET @ErrorStatus = @@ERROR + '-4000'; --Range for Signature/Signatures
		SET @Success = 0;
		RAISERROR (@ErrorStatus,16,1);
	END

	   BEGIN
	  				
					INSERT INTO Signature.Signature(PersonID,Signature.Signature,ModifiedDate, ModifiedBy)
						VALUES (@PersonID,@Signature,SYSDATETIME(),@ModifiedBy)
					
					SET @TempSignatureID =@@IDENTITY;
					SET @ErrorStatus =@@ERROR;
					SET @ProcedureLocation = 'Signature';
				
				 If @ErrorStatus = 0
					BEGIN	
						INSERT INTO Signature.signatures(PersonID, SignatureID, ModifiedDate, ModifiedBy)
							Values (@PersonID, @TempSignatureID,SYSDATETIME(),@ModifiedBy)
							
							SET @TempSignaturesID = @@IDENTITY;
							SET @ErrorStatus =@@ERROR; 
							SET @ProcedureLocation ='Signatures';
					END		
				IF @ErrorStatus =0
					BEGIN	
						SET @ProcedureLocation='';
						SET @success =1;
						COMMIT TRANSACTION;
					END
				ELSE
					BEGIN
						SELECT @ProcedureLocation = 'Insert failed at:' +@ProcedureLocation;
						RAISERROR( @ProcedureLocation,16,1);
					END 
		END
	END TRY
	

		BEGIN CATCH
		--Add in some granularity by returning an error id that indicates whether the failure was in Signature or Signatures.
			  ROLLBACK TRANSACTION;
			  --We are ignoring @@Error because it returns 50000 whenever a string is passed to RAISERROR
				--We only care if the error was not raised by SSE
				IF @@ERROR <> 50000
					BEGIN
						SELECT @ErrorStatus = @ErrorStatus + CONVERT(nVarchar(50), @@Error);
					END
			  SELECT @ProcedureLocation = @ProcedureLocation + '4001 ' +@ErrorStatus;
			  SET @Success =0;
			  RAISERROR(@ProcedureLocation, 16, 1);
			 
		END CATCH;

		
	














GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Collection of XML schemas for the AdditionalContactInfo column in the Person.Contact table.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'XML SCHEMA COLLECTION',@level1name=N'AdditionalContactInfoSchemaCollection'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to names and addresses of customers, vendors, and employees' , @level0type=N'SCHEMA',@level0name=N'Person'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Yearly Certification and Signature' , @level0type=N'SCHEMA',@level0name=N'Foodshelf', @level1type=N'TABLE',@level1name=N'FoodShelfCertification'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Makes each row unique for those who utilize the service more than once' , @level0type=N'SCHEMA',@level0name=N'Foodshelf', @level1type=N'TABLE',@level1name=N'FoodTypeGiven', @level2type=N'CONSTRAINT',@level2name=N'UK_FoodTypeGivenRecord'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the electronic signature capture table.' , @level0type=N'SCHEMA',@level0name=N'Foodshelf', @level1type=N'TABLE',@level1name=N'Signature'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID being used instead of the actual code because it may be possible to avoid duplicate addresses in the future' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Address', @level2type=N'COLUMN',@level2name=N'AddressTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The clientPersonID is the PersonID of the client. All in the household are stored here in the PersonID column, except for the client. This ties household members to the client' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'FamilyRelationships', @level2type=N'COLUMN',@level2name=N'ClientPersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup Table for Family Relationships. Data source is client' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'FamilyRelationships'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is called IncomeSourceRowID because we already have IncomeID from the LUIncomeType, avoid confusion!' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Income', @level2type=N'COLUMN',@level2name=N'IncomeSourceRowID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Person can have multiple income sources, but we only want to record each source once, thus uniqueness' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Income', @level2type=N'CONSTRAINT',@level2name=N'UK_IncomeSource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table lists all languages spoken by employee or volunteer' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LanguagesSpoken'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for AddressType records.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUAddressType', @level2type=N'COLUMN',@level2name=N'AddressTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Address type description. For example, Billing, Home, etc.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUAddressType', @level2type=N'COLUMN',@level2name=N'AddressType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUAddressType', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Types of addresses stored in the Address table. ' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUAddressType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUAddressType', @level2type=N'CONSTRAINT',@level2name=N'PK_AddressType_AddressTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'City for the hierarchy State, County City, PostalCode' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUCity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for ContactType records.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUContactType', @level2type=N'COLUMN',@level2name=N'ContactTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contact type description.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUContactType', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUContactType', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup table containing the types of contacts stored in Contact.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUContactType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUContactType', @level2type=N'CONSTRAINT',@level2name=N'PK_ContactType_ContactTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the lookup table for Country of Origin for clients. The list is based on the CIA World Facts Book' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUCountryOfOrigin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'List of counties' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUCounty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lookup Table for levels of education. Source is Client''s categories' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUEducationCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the ethnicity lookup table based on US Census Categories' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUEthnicity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Where the client gets income. Source is organization''s categories' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUIncomeSource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the lookup table for race. It is based on US Census Categories' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LURace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for State records.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUState', @level2type=N'COLUMN',@level2name=N'StateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ISO standard state code.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUState', @level2type=N'COLUMN',@level2name=N'StateCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUState', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUState', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State lookup table.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'LUState', @level2type=N'CONSTRAINT',@level2name=N'PK_State_StateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Join table to allow multiple addresses per person' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'PersonAddresses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table associates a person with a particluar program (division) within the organization' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Programs', @level2type=N'COLUMN',@level2name=N'ModifiedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table associates a person with one or more services within a program' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'ProgramServicesUsed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the electronic signature capture table. It lives in its own schema and may be encrypted for security reasons' , @level0type=N'SCHEMA',@level0name=N'Signature', @level1type=N'TABLE',@level1name=N'Signature'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Only one SSN per person!' , @level0type=N'SCHEMA',@level0name=N'SSN', @level1type=N'TABLE',@level1name=N'SSN', @level2type=N'CONSTRAINT',@level2name=N'UK_SSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The types of jobs that the volunteer can do' , @level0type=N'SCHEMA',@level0name=N'Volunteer', @level1type=N'TABLE',@level1name=N'VolunteerJobs'
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
         Begin Table = "FoodshelfRules (Foodshelf)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 230
               Right = 504
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
         Filter = 4350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetFoodshelfRules'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetFoodshelfRules'
GO
USE [master]
GO
ALTER DATABASE [ChamplainCharityLLC] SET  READ_WRITE 
GO
