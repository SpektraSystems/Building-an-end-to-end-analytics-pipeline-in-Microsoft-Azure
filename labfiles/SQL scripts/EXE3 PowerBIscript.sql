CREATE VIEW Marketsharepbiview
as
with Fhvtemp
AS
(
SELECT PickupDate, count([PickupDate]) as fhvrides
FROM [dbo].[FhvFinal]
group by [PickupDate]
)
, Yellowtemp 
AS
(
SELECT PickupDate as PickupDateYellow, count([PickupDate]) as Yellowrides
FROM [dbo].[YellowCabFinal]
group by [PickupDate]
)
, Greentemp
AS
(
SELECT PickupDate as PickupDateGreen, count([PickupDate]) as Greenrides
FROM [dbo].[GreenCabFinal]
group by [PickupDate]
)
 
Select CONVERT(varchar(10), PickupDate, 112) as PickupDate,fhvrides,Yellowrides, Greenrides from Fhvtemp
 INNER JOIN Yellowtemp ON Yellowtemp.PickupDateYellow = Fhvtemp.PickupDate
 INNER JOIN Greentemp ON Greentemp.PickupDateGreen = Fhvtemp.PickupDate