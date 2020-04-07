--STORED PROCEDURE TO load data in columnstore format for the GreenCab
CREATE PROC [dbo].[LoadDataGreenCab] AS
BEGIN
       IF OBJECT_ID('dbo.GreenCabFinal') IS NULL
              CREATE TABLE dbo.GreenCabFinal
              WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = ROUND_ROBIN)
              AS
              SELECT
                     lpepPickupDateTime
                     , lpepDropoffDateTime
                     , passengerCount
                     , puLocationId
                     , doLocationId
                     , pickupLongitude
                     , pickupLatitude
                     , dropoffLongitude
                     , dropoffLatitude
                     , tipAmount
                     , totalAmount
                     , puYear
                     , puMonth
                     --ADDED THESE 4 FIELDS THROUGH TRANSFORMS
                     , CAST(lpepPickupDateTime AS DATE) as PickupDate
                     , CAST(lpepPickupDateTime AS TIME) as PickupTime
                     , CAST(lpepDropoffDateTime AS DATE) as DropoffDate
                     , CAST(lpepDropoffDateTime AS TIME) as DropoffTime
              FROM [staging].GreenCab
        ELSE
                INSERT INTO dbo.GreenCabFinal
                SELECT
                     lpepPickupDateTime
                     , lpepDropoffDateTime
                     , passengerCount
                     , puLocationId
                     , doLocationId
                     , pickupLongitude
                     , pickupLatitude
                     , dropoffLongitude
                     , dropoffLatitude
                     , tipAmount
                     , totalAmount
                     , puYear
                     , puMonth
                     --ADDED THESE 4 FIELDS THROUGH TRANSFORMS
                     , CAST(lpepPickupDateTime AS DATE) as PickupDate
                     , CAST(lpepPickupDateTime AS TIME) as PickupTime
                     , CAST(lpepDropoffDateTime AS DATE) as DropoffDate
                     , CAST(lpepDropoffDateTime AS TIME) as DropoffTime
              FROM [staging].GreenCab
END
GO

--STORED PROCEDURE TO load data in columnstore format for the YellowCab
CREATE PROC [dbo].[LoadDataYellowCab] AS
BEGIN
       IF OBJECT_ID('dbo.YellowCabFinal') IS NULL
              CREATE TABLE dbo.YellowCabFinal
              WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = ROUND_ROBIN)
              AS
              SELECT
                     tpepPickupDateTime
                     , tpepDropoffDateTime
                     , passengerCount
                     , puLocationId
                     , doLocationId
                     , startLon
                     , startLat
                     , endLon
                     , endLat
                     , tipAmount
                     , totalAmount
                     , puYear
                     , puMonth
                     --ADDED THESE 4 FIELDS THROUGH TRANSFORMS
                     , CAST(tpepPickupDateTime AS DATE) as PickupDate
                     , CAST(tpepPickupDateTime AS TIME) as PickupTime
                     , CAST(tpepDropoffDateTime AS DATE) as DropoffDate
                     , CAST(tpepDropOffDateTime AS TIME) as DropoffTime
              FROM [staging].YellowCab
        ELSE
                INSERT INTO dbo.YellowCabFinal
                SELECT
                     tpepPickupDateTime
                     , tpepDropoffDateTime
                     , passengerCount
                     , puLocationId
                     , doLocationId
                     , startLon
                     , startLat
                     , endLon
                     , endLat
                     , tipAmount
                     , totalAmount
                     , puYear
                     , puMonth
                     --ADDED THESE 4 FIELDS THROUGH TRANSFORMS
                     , CAST(tpepPickupDateTime AS DATE) as PickupDate
                     , CAST(tpepPickupDateTime AS TIME) as PickupTime
                     , CAST(tpepDropoffDateTime AS DATE) as DropoffDate
                     , CAST(tpepDropOffDateTime AS TIME) as DropoffTime
              FROM [staging].YellowCab
END
GO

--STORED PROCEDURE TO load data in columnstore format for the FHV
CREATE PROC [dbo].[LoadDataFhv] AS
BEGIN
       IF OBJECT_ID('dbo.FhvFinal') IS NULL
              CREATE TABLE dbo.FhvFinal
              WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = ROUND_ROBIN)
              AS
              SELECT
                     dispatchBaseNum
                     , pickupDateTime
                     , dropOffDateTime
                     , puLocationId
                     , doLocationId
                     , srFlag
                     , puYear
                     , puMonth
                     --ADDED THESE 4 FIELDS THROUGH TRANSFORMS
                     , CAST(pickupDateTime AS DATE) as PickupDate
                     , CAST(pickupDateTime AS TIME) as PickupTime
                     , CAST(dropOffDateTime AS DATE) as DropoffDate
                     , CAST(dropOffDateTime AS TIME) as DropoffTime
              FROM [staging].Fhv
        ELSE
                INSERT INTO dbo.FhvFinal SELECT
                     dispatchBaseNum
                     , pickupDateTime
                     , dropOffDateTime
                     , puLocationId
                     , doLocationId
                     , srFlag
                     , puYear
                     , puMonth
                     --ADDED THESE 4 FIELDS THROUGH TRANSFORMS
                     , CAST(pickupDateTime AS DATE) as PickupDate
                     , CAST(pickupDateTime AS TIME) as PickupTime
                     , CAST(dropOffDateTime AS DATE) as DropoffDate
                     , CAST(dropOffDateTime AS TIME) as DropoffTime
              FROM [staging].Fhv
END
GO