-- Create back-up tables
CREATE TABLE [backup].[FHV]
( 
	[dispatchBaseNum] [varchar](40)  NULL,
	[pickupDateTime] [datetime]  NULL,
	[dropOffDateTime] [datetime]  NULL,
	[puLocationId] [varchar](3)  NULL,
	[doLocationId] [varchar](3)  NULL,
	[srFlag] [varchar](30)  NULL,
	[puYear] [int]  NULL,
	[puMonth] [int]  NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO

CREATE TABLE [backup].[GreenCab]
( 
    [lpepPickupDateTime] [datetime]  NULL,
    [lpepDropoffDateTime] [datetime]  NULL,
	[passengerCount] [int]  NULL,
	[puLocationId] [varchar](3)  NULL,
	[doLocationId] [varchar](3)  NULL,
	[pickupLongitude] [float]  NULL,
	[pickupLatitude] [float]  NULL,
	[dropoffLongitude] [float]  NULL,
	[dropoffLatitude] [float]  NULL,
	[tipAmount] [float]  NULL,
	[totalAmount] [float]  NULL,
	[puYear] [int]  NULL,
	[puMonth] [int]  NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO

CREATE TABLE [backup].[YellowCab]
( 
    [tpepPickupDateTime] [datetime]  NULL,
    [tpepDropoffDateTime] [datetime]  NULL,
	[passengerCount] [int]  NULL,
	[puLocationId] [varchar](3)  NULL,
	[doLocationId] [varchar](3)  NULL,
	[startLon] [float]  NULL,
	[startLat] [float]  NULL,
	[endLon] [float]  NULL,
	[endLat] [float]  NULL,
	[tipAmount] [float]  NULL,
	[totalAmount] [float]  NULL,
	[puYear] [int]  NULL,
	[puMonth] [int]  NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO

CREATE TABLE [staging].[FHV]
( 
	[dispatchBaseNum] [varchar](40)  NULL,
	[pickupDateTime] [datetime]  NULL,
	[dropOffDateTime] [datetime]  NULL,
	[puLocationId] [varchar](3)  NULL,
	[doLocationId] [varchar](3)  NULL,
	[srFlag] [varchar](30)  NULL,
	[puYear] [int]  NULL,
	[puMonth] [int]  NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO

CREATE TABLE [staging].[GreenCab]
( 
    [lpepPickupDateTime] [datetime]  NULL,
    [lpepDropoffDateTime] [datetime]  NULL,
	[passengerCount] [int]  NULL,
	[puLocationId] [varchar](3)  NULL,
	[doLocationId] [varchar](3)  NULL,
	[pickupLongitude] [float]  NULL,
	[pickupLatitude] [float]  NULL,
	[dropoffLongitude] [float]  NULL,
	[dropoffLatitude] [float]  NULL,
	[tipAmount] [float]  NULL,
	[totalAmount] [float]  NULL,
	[puYear] [int]  NULL,
	[puMonth] [int]  NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO