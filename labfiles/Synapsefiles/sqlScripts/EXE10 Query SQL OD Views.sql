Select PickupDateYellow,FHVrides,Yellowrides, Greenrides from dbo.YellowCabAggregated
        INNER JOIN dbo.FHVAggregated ON dbo.FHVAggregated.PickupDateFHV = dbo.YellowCabAggregated.PickupDateYellow
        INNER JOIN dbo.GreenCabAggregated ON dbo.GreenCabAggregated.PickupDateGreen = dbo.YellowCabAggregated.PickupDateYellow
    ORDER BY PickupDateFHV ASC	