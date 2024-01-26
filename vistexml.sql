DROP VIEW IF EXISTS [ml].[Death_GHDX];
GO
CREATE VIEW [ml].[Death_GHDX] AS
SELECT
    CASE
        WHEN b.[1990] < 0.454743 THEN 'Low'
        WHEN b.[1990] >= 0.454743 AND b.[1990] < 0.607679 THEN 'Low-middle'
        WHEN b.[1990] >= 0.607679 AND b.[1990] < 0.689504 THEN 'Middle'
        WHEN b.[1990] >= 0.689504 AND b.[1990] < 0.805129 THEN 'High-middle'
        WHEN b.[1990] >= 0.805129 THEN 'High'
    END AS [cluster_sdi]
    -- , b.[SDI_1990]
    , a.[Risk]
    , a.[Val]--------
	,piv.*
FROM
    [dwh].[GHDX_Deaths_CLEAN2] AS a
    INNER JOIN [dwh].[vGHDX_SDI_Countries] AS b
    ON a.[location] = b.[location] 
	INNER JOIN [dwh].[vGHDX_SDI_Countries_UNPIVOT] AS piv
        ON a.[location] = piv.[location] AND a.[year] = piv.[year]
;
GO



select * from [ml].[Death_GHDX]