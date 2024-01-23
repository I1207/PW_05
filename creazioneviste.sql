create view [dwh].[vBC_nation1] as
select 
CAST([measure] AS varchar(10)) as [measure],
CAST([location] AS nvarchar(25)) as [location],
CAST([sex] AS varchar(10))as [sex],
CAST([age] AS varchar(25)) as [age],
CAST([cause] AS varchar(30)) as [cause],
CAST([metric] AS varchar(15)) as [metric],
CAST([year] AS int) as [year],
CAST(CAST([val] AS float)as decimal(15,7)) as [val],
CAST(CAST([upper] AS float)as decimal(15,7)) as [upper],
CAST(CAST([lower] AS float)as decimal(15,7)) as [lower]
from [stg].[BC_nation1]


-----------------------

create view [dwh].[vBC_Percent1] as
select 
CAST([measure] AS varchar(10)) as [measure],
CAST([location] AS char(6)) as [year],
CAST([sex] AS varchar(10))as [sex],
CAST([age] AS varchar(25)) as [age],
CAST([cause] AS varchar(30)) as [cause],
CAST([metric] AS varchar(15)) as [metric],
cast (CASE -- year
		when [year] = 'G' then 'Global'
		when [year] = 'L' then 'Low'
		when [year] = 'LM' then 'Low-Middle'
		when [year] = 'M' then 'Middle'
		when [year] = 'H' then 'High'
		when [year] = 'HM' then 'High-Middle'
	ELSE 'Other'
	END as varchar(11)) as SDI,
CAST(CAST([val] AS float)as decimal(15,7)) as [val],
CAST(CAST([upper] AS float)as decimal(15,7)) as [upper],
CAST(CAST([lower] AS float)as decimal(15,7)) as [lower]
from [stg].[BC_Percent1]

--------------------------

create view [dwh].[vBC_predict1] as
select 
CAST([measure] AS varchar(10)) as [measure],
CAST([location] AS nvarchar(25)) as [location],
CAST([sex] AS varchar(10))as [sex],
CAST([age] AS varchar(25)) as [age],
CAST([cause] AS varchar(30)) as [cause],
CAST([metric] AS varchar(15)) as [metric],
CAST([year] AS int) as [year],
CAST(CAST([val] AS float)as decimal(15,7)) as [val],
CAST(CAST([upper] AS float)as decimal(15,7)) as [upper],
CAST(CAST([lower] AS float)as decimal(15,7)) as [lower]
from [stg].[BC_predict1]

-------------------------

create view [dwh].[vBC_region_SEX1] as
select 
CAST([measure] AS varchar(10)) as [measure],
--CAST([location] AS nvarchar(25)) as [location],
CAST([sex] AS varchar(10))as [sex],
CAST([age] AS varchar(25)) as [age],
CAST([cause] AS varchar(30)) as [cause],
CAST([metric] AS varchar(15)) as [metric],
CAST([year] AS int) as [year],
CAST(CAST([val] AS float)as decimal(15,7)) as [val],
CAST(CAST([upper] AS float)as decimal(15,7)) as [upper],
CAST(CAST([lower] AS float)as decimal(15,7)) as [lower]
from [stg].[BC_region_SEX1]

-----------------------

create view [dwh].[vBC_region1] 
as
select 
CAST([measure] as varchar(10)) as [measure],
 CAST([location] as nvarchar(50)) as [location],
 CAST([sex] as nvarchar(10)) as [sex],
 CAST([age] as nvarchar(20)) as [age],
 CAST([cause] as varchar(15)) as [cause],
 CAST([metric] as nvarchar(10)) as [metric],
 CAST([year] as INT) as [year],
 CAST([val] as decimal(15,7)) as [val],
 CAST([upper] as decimal(15,7)) as [upper],
 CAST([lower] as decimal(15,7 )) [lower]
 from [stg].[BC_region1]

------------------
create view [dwh].[vHDI_1990]
as
select 
CAST([Country] as nvarchar(50)) as [Country],
CAST([HDI] as decimal(5,2 )) as [HDI]
from [stg].[HDI_1990]

-----------------------

create view [dwh].[vIHME_POP_2017_2100_POP_REFERENC] as
select 
CAST([location_id] as int) as [location_id],
CAST([location_name] as nvarchar(50)) as [location_name],
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
from [stg].[IHME_POP_2017_2100_POP_REFERENC]

-----------------------

create view [dwh].[vWorld_population_age_standard]
as 
select 
CAST([age] as nvarchar(10)) as [age],
CAST([std_population] as decimal(10,2)) as [std_population]
from [stg].[World_population_age_standard]

--no predict
[dwh].[vBC_Percent1]
[dwh].[vBC_region_SDI1]
[dwh].[vBC_nation1]--(?)

