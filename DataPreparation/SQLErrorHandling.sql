USE [DSTraining]
GO
/****** Object:  StoredProcedure [dbo].[__template__1]    Script Date: 11/23/2017 10:20:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Samuel Peoples
-- Create date: 20171123
-- Description:	RAW -> WRK
-- MOD DATE:
-- =============================================
CREATE PROC [dbo].[BLD_FakeNamesCanada_20171123]

AS
BEGIN
-- =============================================
-- CREATE TABLE 
-- =============================================
	--SELECT  * FROM [dbo].[SOURCE]

Create Table [WRK_FakeNamesCanada_20171123](
       [RowNumber]       int identity(1,1)
      ,[Number]          varchar(100)
      ,[Gender]          varchar(10)
      ,[GivenName]       varchar(1000)
      ,[Surname]         varchar(1000)
      ,[StreetAddress]   varchar(1000)
      ,[City]            varchar(1000)
      ,[ZipCode]         varchar(7)
      ,[CountryFull]     varchar(100)
      ,[Birthday]        Date
      ,[Balance]         float
      ,[InterestRate]    float)   

-- =============================================
-- DROP TABLE
-- =============================================
IF OBJECT_ID ('WRK_FakeNamesCanada_20171123') IS NOT NULL
DROP Table [WRK_FakeNamesCanada_20171123]

--truncate table WRK_FakeNamesCanada_20171123
-- =============================================
-- INSERT INTO
-- =============================================
Insert into [WRK_FakeNamesCanada_20171123](
       [Number]
      ,[Gender]
      ,[GivenName]
      ,[Surname]
      ,[StreetAddress]
      ,[City]
      ,[ZipCode]
      ,[CountryFull]
      ,[Birthday]
      ,[Balance]
      ,[InterestRate])
Select
       [Number]
      ,[Gender]
      ,[GivenName]
      ,[Surname]
      ,[StreetAddress]
      ,[City]
      ,[ZipCode]
      ,[CountryFull]
      ,[Birthday]
      ,[Balance]
      ,[InterestRate]
FROM [RAW_FakeNamesCanada_20171123]
--(Run Console Comments)
WHERE isnumeric([Balance])=1   --10 Rows
AND LEN([ZipCode]) = 7         --2  Rows
AND isdate([Birthday])=1       --1  Row
-- =============================================
-- Additional Exclusions
-- =============================================
DELETE
FROM [WRK_FakeNamesCanada_20171123]
WHERE [Balance] <0
--(1 row)
DELETE
FROM [WRK_FakeNamesCanada_20171123]
--WHERE [ZipCode] NOT LIKE '___ ___'
--(3 rows)
--WHERE [Birthday] > '2001-11-23'
--(1 row)


SELECT * FROM [WRK_FakeNamesCanada_20171123]
--WHERE isnumeric([Balance])<>1
--WHERE isdate([Birthday])<>1
--WHERE Balance<0
--WHERE [ZipCode] NOT LIKE '___ ___'
WHERE [Birthday] > '2001-11-23'
END
