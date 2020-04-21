-- Create a view over the yellow cab folders and select only 4 years of data through the folders 2015, 2016, 2017, 2018
CREATE VIEW [dbo].[YellowCabAggregated]
	AS
SELECT 
	CONVERT(varchar(10), tpepPickupDateTime, 112) as PickupDateYellow, count([vendorID]) as Yellowrides
FROM  
    OPENROWSET(
        BULK 'https://<ADLSg2 Account Name>.dfs.core.windows.net/nyctlc/yellow/puYear=*/puMonth=*/',
        FORMAT='PARQUET'
    )
	AS nyc
	where nyc.filepath(1) IN (2015, 2016, 2017, 2018)
	group by CONVERT(varchar(10), tpepPickupDateTime, 112)
GO;

-- Create a view over the green cab folders and select only 4 years of data through the folders 2015, 2016, 2017, 2018
CREATE VIEW [dbo].[GreenCabAggregated]
	AS
SELECT 
	CONVERT(varchar(10), lpepPickupDateTime, 112) as PickupDateGreen, count([vendorID]) as Greenrides
FROM  
    OPENROWSET(
        BULK 'https://<ADLSg2 Account Name>.dfs.core.windows.net/nyctlc/green/puYear=*/puMonth=*/',
        FORMAT='PARQUET'
    )
	AS nyc
	where nyc.filepath(1) IN (2015, 2016, 2017, 2018)
	group by CONVERT(varchar(10), lpepPickupDateTime, 112)
GO;

-- Create a view over the FHV folders 
CREATE VIEW [dbo].[FHVAggregated]
	AS
SELECT 
	CONVERT(varchar(10), PickupDateTime, 112) as PickupDateFHV, count([DISPATCHBASENUM]) as FHVrides
FROM  
    OPENROWSET(
        BULK 'https://<ADLSg2 Account Name>.dfs.core.windows.net/nyctlc/fhvbackup/puYear=*/puMonth=*/',
        FORMAT='PARQUET'
    )
	AS nyc
	group by CONVERT(varchar(10), PickupDateTime, 112)
GO;