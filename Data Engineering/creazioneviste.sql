DROP VIEW IF EXISTS [dwh].[vBC_nation1];
go
create view [dwh].[vBC_nation1]
as
    select
        CASE 
        WHEN CHARINDEX('(', CAST([measure] AS NVARCHAR(40))) > 0 THEN 
            SUBSTRING(CAST([measure] AS NVARCHAR(40)), 1, CHARINDEX('(', CAST([measure] AS NVARCHAR(40))) - 1)
        ELSE 
            CAST([measure] AS NVARCHAR(40))
    END AS [measure],
        CASE 
        WHEN CHARINDEX('(', CAST([location] AS NVARCHAR(100))) > 0 THEN 
            SUBSTRING(CAST([location] AS NVARCHAR(100)), 1, CHARINDEX('(', CAST([location] AS NVARCHAR(100))) - 1)
        ELSE 
            CAST([location] AS NVARCHAR(100))
    END AS [location],
        CAST([sex] AS varchar(10))as [sex],
        CAST([age] AS varchar(25)) as [age],
        CAST([cause] AS varchar(30)) as [cause],
        CAST([metric] AS varchar(15)) as [metric],
        CAST([year] AS int) as [year],
        CAST(CAST([val] AS float)as decimal(15,7)) as [val],
        CAST(CAST([upper] AS float)as decimal(15,7)) as [upper],
        CAST(CAST([lower] AS float)as decimal(15,7)) as [lower]
    from [stg].[BC_nation1];
go

-----------------------

select *
from [dwh].[vBC_Percent1]
DROP VIEW IF EXISTS [dwh].[vBC_Percent1];
go
create view [dwh].[vBC_Percent1]
as
    select
        CASE 
        WHEN CHARINDEX('(', CAST([measure] AS NVARCHAR(40))) > 0 THEN 
            SUBSTRING(CAST([measure] AS NVARCHAR(40)), 1, CHARINDEX('(', CAST([measure] AS NVARCHAR(40))) - 1)
        ELSE 
            CAST([measure] AS NVARCHAR(40))
    END AS [measure],
        CAST([location] AS char(6)) as [year],
        CAST([sex] AS varchar(10))as [sex],
        CAST([age] AS varchar(25)) as [age],
        CAST([cause] AS varchar(30)) as [cause],
        CAST([metric] AS varchar(15)) as [metric],
        cast (CASE -- year
		when [year] = 'G' then 'Global'
		when [year] = 'L' then 'Low SDI'
		when [year] = 'LM' then 'Low-middle SDI'
		when [year] = 'M' then 'Middle SDI'
		when [year] = 'H' then 'High SDI'
		when [year] = 'HM' then 'High-middle SDI'
	ELSE 'Other'
	END as varchar(15)) as SDI,
        CAST(CAST([val] AS float)as decimal(15,7)) as [val],
        CAST(CAST([upper] AS float)as decimal(15,7)) as [upper],
        CAST(CAST([lower] AS float)as decimal(15,7)) as [lower]
    from [stg].[BC_Percent1];
go

--------------------------

select *
from [dwh].[vBC_predict1]
DROP VIEW IF EXISTS [dwh].[vBC_predict1];
go
create view [dwh].[vBC_predict1]
as
    select
        CASE 
        WHEN CHARINDEX('(', CAST([measure] AS NVARCHAR(40))) > 0 THEN 
            SUBSTRING(CAST([measure] AS NVARCHAR(40)), 1, CHARINDEX('(', CAST([measure] AS NVARCHAR(40))) - 1)
        ELSE 
            CAST([measure] AS NVARCHAR(40))
    END AS [measure],
        CASE 
        WHEN CHARINDEX('(', CAST([location] AS NVARCHAR(100))) > 0 THEN 
            SUBSTRING(CAST([location] AS NVARCHAR(100)), 1, CHARINDEX('(', CAST([location] AS NVARCHAR(100))) - 1)
        ELSE 
            CAST([location] AS NVARCHAR(100))
    END AS [location],
        CAST([sex] AS varchar(10))as [sex],
        CAST([age] AS varchar(25)) as [age],
        CAST([cause] AS varchar(30)) as [cause],
        CAST([metric] AS varchar(15)) as [metric],
        CAST([year] AS int) as [year],
        CAST(CAST([val] AS float)as decimal(15,7)) as [val],
        CAST(CAST([upper] AS float)as decimal(15,7)) as [upper],
        CAST(CAST([lower] AS float)as decimal(15,7)) as [lower]
    from [stg].[BC_predict1];
go

-------------------------

select *
from [dwh].[vBC_region_SDI1]
DROP VIEW IF EXISTS [dwh].[vBC_region_SDI1];
go
create view [dwh].[vBC_region_SDI1]
as
    select
        CASE 
        WHEN CHARINDEX('(', CAST([measure] AS NVARCHAR(40))) > 0 THEN 
            SUBSTRING(CAST([measure] AS NVARCHAR(40)), 1, CHARINDEX('(', CAST([measure] AS NVARCHAR(40))) - 1)
        ELSE 
            CAST([measure] AS NVARCHAR(40))
    END AS [measure],
        CAST([location] AS nvarchar(25)) as [location],
        CAST([sex] AS varchar(10))as [sex],
        CAST([age] AS varchar(25)) as [age],
        CAST([cause] AS varchar(30)) as [cause],
        CAST([metric] AS varchar(15)) as [metric],
        CAST([year] AS int) as [year],
        CAST(CAST([val] AS float)as decimal(15,7)) as [val],
        CAST(CAST([upper] AS float)as decimal(15,7)) as [upper],
        CAST(CAST([lower] AS float)as decimal(15,7)) as [lower]
    from [stg].[BC_region_SDI1];
    go

-----------------------



select *
from [dwh].[vBC_region_SEX1]
DROP VIEW IF EXISTS [dwh].[vBC_region_SEX1];
go
create view [dwh].[vBC_region_SEX1]
as
    select
        CASE 
        WHEN CHARINDEX('(', CAST([measure] AS NVARCHAR(40))) > 0 THEN 
            SUBSTRING(CAST([measure] AS NVARCHAR(40)), 1, CHARINDEX('(', CAST([measure] AS NVARCHAR(40))) - 1)
        ELSE 
            CAST([measure] AS NVARCHAR(40))
    END AS [measure],
        --CAST([location] AS nvarchar(25)) as [location],
        CAST([sex] AS varchar(10))as [sex],
        CAST([age] AS varchar(25)) as [age],
        CAST([cause] AS varchar(30)) as [cause],
        CAST([metric] AS varchar(15)) as [metric],
        CAST([year] AS int) as [year],
        CAST(CAST([val] AS float)as decimal(15,7)) as [val],
        CAST(CAST([upper] AS float)as decimal(15,7)) as [upper],
        CAST(CAST([lower] AS float)as decimal(15,7)) as [lower]
    from [stg].[BC_region_SEX1];
    go


select *
from [dwh].[vBC_region1]
DROP VIEW IF EXISTS [dwh].[vBC_region1];
go
create view [dwh].[vBC_region1]
as
    select
        CASE 
        WHEN CHARINDEX('(', CAST([measure] AS NVARCHAR(40))) > 0 THEN 
            SUBSTRING(CAST([measure] AS NVARCHAR(40)), 1, CHARINDEX('(', CAST([measure] AS NVARCHAR(40))) - 1)
        ELSE 
            CAST([measure] AS NVARCHAR(40))
    END AS [measure],
        CASE 
        WHEN CHARINDEX('(', CAST([location] AS NVARCHAR(100))) > 0 THEN 
            SUBSTRING(CAST([location] AS NVARCHAR(100)), 1, CHARINDEX('(', CAST([location] AS NVARCHAR(100))) - 1)
        ELSE 
            CAST([location] AS NVARCHAR(100))
    END AS [location],
        CAST([sex] as nvarchar(10)) as [sex],
        CAST([age] as nvarchar(20)) as [age],
        CAST([cause] as varchar(15)) as [cause],
        CAST([metric] as nvarchar(10)) as [metric],
        CAST([year] as INT) as [year],
        CAST([val] as decimal(15,7)) as [val],
        CAST([upper] as decimal(15,7)) as [upper],
        CAST([lower] as decimal(15,7 )) [lower]
    from [stg].[BC_region1];
 go

------------------
select *
from [dwh].[vHDI_1990]
DROP VIEW IF EXISTS [dwh].[vHDI_1990];
go
create view [dwh].[vHDI_1990]
as
    select
        CASE 
        WHEN CHARINDEX('(', CAST([Country] AS NVARCHAR(100))) > 0 THEN 
            SUBSTRING(CAST([Country] AS NVARCHAR(100)), 1, CHARINDEX('(', CAST([Country] AS NVARCHAR(100))) - 1)
        ELSE 
            CAST([Country] AS NVARCHAR(100))
    END AS [Country],
        CAST([HDI] as decimal(5,2 )) as [HDI]
    from [stg].[HDI_1990];
go          

-----------------------

select *
from [dwh].[vIHME_POP_2017_2100_POP_REFERENC]
DROP VIEW IF EXISTS [dwh].[vIHME_POP_2017_2100_POP_REFERENC];
go
create view [dwh].[vIHME_POP_2017_2100_POP_REFERENC]
as
    select
        CAST([location_id] as int) as [location_id],
        CAST([location_name] as nvarchar(100)) as [location_name],
        CAST([sex_id] as INT) as [sex_id],
        CAST([sex] as nvarchar(10)) as [sex],
        CAST([age_group_id] as INT) as [age_group_id],
        CAST([age_group_name] as varchar(15)) [age_group_name],
        CAST([year_id] as INT) as [year_id],
        CAST([measure_id]as INT) as [measure_id],
        CAST([measure_name] as varchar(10)) as [measure_name],
        CAST([metric_id] as INT)as  [metric_id],
        CAST([metric_name] as nvarchar(10)) as [metric_name],
        CAST([scenario] as INT) as [scenario], --un solo valore 
        CAST([scenario_name] as varchar(10)) as [scenario_name],--un solo valore
        CAST([val] as float) as [val],
        CAST([upper] as float) as [upper],
        CAST([lower] as float)  as [lower]
    from [stg].[IHME_POP_2017_2100_POP_REFERENC];
go

-----------------------
DROP VIEW IF EXISTS [dwh].[vWorld_population_age_standard];
go
create view [dwh].[vWorld_population_age_standard]
as
    select
        CAST([age] as nvarchar(10)) as [age],
        CAST([std_population] as decimal(10,2)) as [std_population]
    from [stg].[World_population_age_standard];
go

--no predict
--[dwh].[vBC_Percent1]
--[dwh].[vBC_region_SDI1]
--[dwh].[vBC_nation1]--(?)

drop view if exists [dwh].[test_aml];
go
create view [dwh].[test_aml]
as
    select
        P.[SDI]
    , P.[year]
    , P.[cause]
    , P.[val] AS [ASR]
    , R.[val] AS [Rate_tot]
    from [dwh].[vBC_Percent1] as P
        inner join
        [dwh].[vBC_region_SDI1] as R
        on 
P.[SDI] = R.[location]
            and
            P.[year] = R.[year]
    where 
P.[measure] = 'Deaths'
        and
        R.[measure] = 'Deaths'
        and
        P.[metric] = 'Rate'
        and
        R.[metric] = 'Rate'
        and
        P.[age] = 'All ages'
        and
        R.[age] = 'All ages'
go

-----------------------------------------------------------
drop view if exists [dwh].[vGHDX_SDI_Quintiles];
go
create view [dwh].[vGHDX_SDI_Quintiles]
as
    select
        cast([sdi_quintile] as nvarchar(20)) as SDI,
        cast([lower_bound] as float) as [lower],
        cast([upper_bound] as float) as [upper]
    from [stg].[GHDX_SDI_Quintiles]
go


------------------------------

drop view if exists [dwh].[vGHDX_Deaths_SDIcluster];
go
create view [dwh].[vGHDX_Deaths_SDIcluster]
as
    select
        CAST([location] AS NVARCHAR(100)) AS SDI,
        CAST([sex] AS NVARCHAR(10)) AS [sex],
        CAST([rei] AS NVARCHAR(25)) AS Risk,
        CAST([year] AS CHAR(4)) AS [year],
        CAST([val] AS FLOAT) AS [val]
    from [stg].[GHDX_Deaths_SDIcluster]
go



-----------------------------------------------------------------

drop view if exists [dwh].[vGHDX_Deaths];
go
CREATE VIEW [dwh].[vGHDX_Deaths]
as
    select
        CAST([location] AS NVARCHAR(100)) AS [location],
        CAST([sex] AS NVARCHAR(10)) AS [sex],
        CAST([rei] AS NVARCHAR(25)) AS Risk,
        CAST([year] AS CHAR(4)) AS [year],
        CAST([val] AS FLOAT) AS [val]
    from [stg].[GHDX_Deaths]
    where sex = 'Both'
go


--------------------------------------



drop view if exists [dwh].[vGHDX_SDI_Countries];
go
create view [dwh].[vGHDX_SDI_Countries]
as
    select
        CAST([location] AS NVARCHAR(100)) AS Location,
        cast([1990]as decimal(5,4)) as [1990],
        cast([1991]as decimal(5,4)) as [1991],
        cast([1992]as decimal(5,4)) as [1992],
        cast([1993]as decimal(5,4)) as [1993],
        cast([1994]as decimal(5,4)) as [1994],
        cast([1995]as decimal(5,4)) as [1995],
        cast([1996]as decimal(5,4)) as [1996],
        cast([1997]as decimal(5,4)) as [1997],
        cast([1998]as decimal(5,4)) as [1998],
        cast([1999]as decimal(5,4)) as [1999],
        cast([2000]as decimal(5,4)) as [2000],
        cast([2001]as decimal(5,4)) as [2001],
        cast([2002]as decimal(5,4)) as [2002],
        cast([2003]as decimal(5,4)) as [2003],
        cast([2004]as decimal(5,4)) as [2004],
        cast([2005]as decimal(5,4)) as [2005],
        cast([2006]as decimal(5,4)) as [2006],
        cast([2007]as decimal(5,4)) as [2007],
        cast([2008]as decimal(5,4)) as [2008],
        cast([2009]as decimal(5,4)) as [2009],
        cast([2010]as decimal(5,4)) as [2010],
        cast([2011]as decimal(5,4)) as [2011],
        cast([2012]as decimal(5,4)) as [2012],
        cast([2013]as decimal(5,4)) as [2013],
        cast([2014]as decimal(5,4)) as [2014],
        cast([2015]as decimal(5,4)) as [2015],
        cast([2016]as decimal(5,4)) as [2016],
        cast([2017]as decimal(5,4)) as [2017],
        cast([2018]as decimal(5,4)) as [2018],
        cast([2019]as decimal(5,4)) as [2019]
    from [stg].[GHDX_SDI_Countries]
go









DROP TABLE IF EXISTS [dwh].[GHDX_Deaths_CLEAN2];
GO
SELECT *
INTO [dwh].[GHDX_Deaths_CLEAN2]
FROM dwh.[vGHDX_Deaths];
GO



UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'Bahamas', 'The Bahamas')
WHERE [location] = 'Bahamas';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'Bolivia (Plurinational State of)', 'Bolivia')
WHERE [location] = 'Bolivia (Plurinational State of)';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'Brunei Darussalam', 'Brunei')
WHERE [location] = 'Brunei Darussalam';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'Cabo Verde', 'Cape Verde')
WHERE [location] = 'Cabo Verde';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'Democratic Republic of the Congo', 'DR Congo')
WHERE [location] = 'Democratic Republic of the Congo';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'Congo', 'Congo (Brazzaville)')
WHERE [location] = 'Congo';
-- WHERE sCHARINDEX('Congo', [location]) > 0
--     AND NOT CHARINDEX('Democratic Republic of the Congo', [location]) > 0;

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'Czechia', 'Czech Republic')
WHERE [location] = 'Czechia';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'Democratic People''s Republic of Korea', 'North Korea')
WHERE [location] = 'Democratic People''s Republic of Korea';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'Iran (Islamic Republic of)', 'Iran')
WHERE [location] = 'Iran (Islamic Republic of)';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'Lao People''s Democratic Republic', 'Laos')
WHERE [location] = 'Lao People''s Democratic Republic';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'Micronesia (Federated States of)', 'Federated States of Micronesia')
WHERE [location] = 'Micronesia (Federated States of)';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'Republic of Korea', 'South Korea')
WHERE [location] = 'Republic of Korea';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'Republic of Moldova', 'Moldova')
WHERE [location] = 'Republic of Moldova';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'Russian Federation', 'Russia')
WHERE [location] = 'Russian Federation';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'Sao Tome and Principe', 'S�o Tom� and Pr�ncipe')
WHERE [location] = 'Sao Tome and Principe';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'Syrian Arab Republic', 'Syria')
WHERE [location] = 'Syrian Arab Republic';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'United Kingdom', 'UK')
WHERE [location] = 'United Kingdom';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'United Republic of Tanzania', 'Tanzania')
WHERE [location] = 'United Republic of Tanzania';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'United States of America', 'USA')
WHERE [location] = 'United States of America';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'United States Virgin Islands', 'Virgin Islands')
WHERE [location] = 'United States Virgin Islands';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'Venezuela (Bolivarian Republic of)', 'Venezuela')
WHERE [location] = 'Venezuela (Bolivarian Republic of)';

UPDATE [dwh].[GHDX_Deaths_CLEAN2]
SET [location] = REPLACE([location], 'Viet Nam', 'Vietnam')
WHERE [location] = 'Viet Nam';
GO


DROP VIEW IF EXISTS [dwh].[vGHDX_SDI_Countries_UNPIVOT];
GO
CREATE VIEW [dwh].[vGHDX_SDI_Countries_UNPIVOT]
AS
    SELECT
        [location]
    , CAST([Years] AS SMALLINT) AS [year]
    , [SDI]
    FROM
        (
    SELECT
            [location]--, [years]
        , [1990], [1991], [1992], [1993], [1994], [1995], [1996], [1997], [1998], [1999], [2000], [2001], [2002], [2003], [2004], [2005], [2006], [2007], [2008], [2009], [2010], [2011], [2012], [2013], [2014], [2015], [2016], [2017], [2018], [2019]
        FROM [dwh].vGHDX_SDI_Countries
    ) AS a
    UNPIVOT (
    [SDI] FOR [Years] IN (
        [1990], [1991], [1992], [1993], [1994], [1995], [1996], [1997], [1998], [1999], [2000], [2001], [2002], [2003], [2004], [2005], [2006], [2007], [2008], [2009], [2010], [2011], [2012], [2013], [2014], [2015], [2016], [2017], [2018], [2019]
        )
    ) AS unpvt;
GO