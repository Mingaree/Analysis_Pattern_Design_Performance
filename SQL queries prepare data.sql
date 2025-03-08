WITH LASTTRACK AS (
SELECT DISTINCT 
       CASE WHEN [customer] LIKE '%NIKE%' THEN LEFT([Style], 6) ELSE [Style] END AS STYLE,
       [SEASON],
       CASE 
           WHEN [Season] LIKE '%SP%' THEN 1 
           WHEN [Season] LIKE '%SU%' THEN 2 
           WHEN [Season] LIKE '%FA%' THEN 3 
           WHEN [Season] LIKE '%HO%' THEN 4 
           ELSE NULL 
       END AS [SEQ],
       [Leadtime],
       [TYPE], 
       CONCAT([Group TYPE], '-', [TYPE]) AS [Group TYPE],
       [PROGRAM],
       ([Received Date]) AS [Received Date],  
       [New/Carry],
       [FACTORY],
       ([PLAN]) AS [PLAN],
       ([First Plan]) AS [First Plan],
       ([FINISH DATE]) AS [FINISH DATE],
       [PT Maker],
       [PT TEAM],
       REPLACE([Remark], '0', '') AS [Remark],
       [Customer],
       [IN-IOTP],[status],
      ([PT STATUS]) AS [PT STATUS],
       ROW_NUMBER() OVER (PARTITION BY [customer], [Style], [SEASON], [Leadtime], [TYPE], [Group TYPE], [PROGRAM] ORDER BY ([Received Date])) AS RNUM
   FROM [Project_ProductLifeCycle].[dbo].[ALLMASTERPATTERN]
   WHERE
       [TYPE] IN ('BULK', 'QPP', 'QRS') 
       AND [Customer] LIKE '%NIKE%' 
       AND [IN-IOTP] <> 'DROP'
),

AA_CTE AS (
SELECT *
FROM (
   SELECT 
       STYLE,
       SEASON,
       SEQ,
       Leadtime,
       [Group TYPE],
       PROGRAM,
       [Received Date],
	[New/Carry],
       [PLAN],
       [First Plan],
       [FINISH DATE],
       [PT Maker],
       [PT TEAM],
       Remark,
       Customer,
       [IN-IOTP],
       [PT STATUS],
       [TYPE],[status]
   FROM LASTTRACK
   WHERE RNUM = 1 
) AS SourceTable
PIVOT (
   MIN([FINISH DATE]) -- Aggregate using MIN
   FOR [TYPE] IN ([QPP], [QRS], [BULK]) -- Pivot by TYPE values
) AS PivotTable
),

STYLECOUNT_CTE AS (
SELECT 
     [MER Team]
     ,[MER DEV]
     ,Season = concat ([SEASON_Code],right([SEASON_YR],2))
     ,[STYLE NUMBER]
     ,case when [CARRY-OVER STYLE (Y/N)] = 'Y' then 'CARRY OVER' ELSE 'NEW STYLE' END AS [CARRY-OVER STYLE (Y/N)]
     ,[Release Pattern Date (BULK)]
     ,[Remark for Pattern],
	  ROW_NUMBER() over (partition by  [MER Team],[MER DEV],concat ([SEASON_Code],right([SEASON_YR],2)),[STYLE NUMBER] order by (select null) 
	  ) as row1
 FROM [Project_ProductLifeCycle].[dbo].[STYLECOUNT] WHERE [STYLE NUMBER] IS NOT NULL and concat ([SEASON_Code],right([SEASON_YR],2)) not like '%24%'
),

STYLE_CARRY_CTE AS (
SELECT STYLE,STYLE_NAME,SEASON,[CARRY Y/N],ORDER_PLACE FROM [dbo].[STYLE_CARRY]
WHERE [ORDER_PLACE] > '2023-01-01' and [SEASON] NOT LIKE '%24%' and [SEASON] NOT LIKE '%23%' and [STYLE] NOT LIKE '%/MS%' 
)

SELECT DISTINCT 
    
	COALESCE(NULLIF(C.[STYLE],null),TT.[STYLE NUMBER],C.[STYLE]) AS [STYLE]
     	,C.[STYLE_NAME]
     	,COALESCE(NULLIF(C.[SEASON],NULL),TT.Season,C.[SEASON]) AS [SEASON]
    	 ,COALESCE(NULLIF(C.[CARRY Y/N],NULL),TT.[CARRY-OVER STYLE (Y/N)],C.[CARRY Y/N]) AS [CARRY Y/N]
     	,C.[ORDER_PLACE]
	,COALESCE(NULLIF(TT.[MER Team], NULL), REPLACE(AA.PROGRAM,0,'') ) AS [All MER Team]
	 ,TT.[MER DEV]
	 ,COALESCE(NULLIF(TT.[Release Pattern Date (BULK)],NULL),AA.[Received Date],TT.[Release Pattern Date (BULK)]) AS 	[MER_RELEASE_PT_DATE]
     	,TT.[Remark for Pattern]
       	,COALESCE(NULLIF(AA.[Group TYPE],''),'ORDER-BULK',AA.[Group TYPE]) AS [Group TYPE],
      	AA.[PLAN],
      	AA.[QPP], AA.[QRS], AA.[BULK],
       	REPLACE(AA.[PT Maker],'0','') AS [PT Maker],
       	REPLACE(AA.[PT TEAM],'0','') AS [PT TEAM],
       	AA.[PT STATUS],
	AA.[status],AA.Remark

FROM AA_CTE AS AA
RIGHT JOIN STYLE_CARRY_CTE AS C ON C.[STYLE] = AA.STYLE AND C.SEASON = AA.SEASON
LEFT JOIN STYLECOUNT_CTE AS TT ON C.STYLE = TT.[STYLE NUMBER] AND C.SEASON = TT.SEASON


WHERE (row1 = 1 or row1 is null)