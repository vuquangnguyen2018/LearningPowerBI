#DIM CUSTOMER 
FullName = DimCustomer[Title] & " " & DimCustomer[FirstName] & " " & DimCustomer[MiddleName] & " " & DimCustomer[LastName]
NoMiddleName = if(ISBLANK(DimCustomer[MiddleName]),"No Middle Name", BLANK()) 
#HOUSE AND CAR 
HasBothHouseAndCar = IF(AND(DimCustomer[HouseOwnerFlag]>=1,DimCustomer[NumberCarsOwned]>=1),"YES", "NO") 

HasBothHouseAndCar = IF(AND(DimCustomer[HouseOwnerFlag]>=1,DimCustomer[NumberCarsOwned]>=1),"YES", 
IF(DimCustomer[NumberCarsOwned]>=1, "Car Only", 
IF(DimCustomer[HouseOwnerFlag]>=1, "House Only", "Neither" ) ))

# FACT SALES 

Season = SWITCH(FactInternetSales[QuarterNumber],
1, "SPRING",
2, "SUMMER",
3, "AUTUMN",
4, "WINTER",
"ERROR")

# DIM SALES TERRITORY 
InUS = IF(DimSalesTerritory[SalesTerritoryCountry] = "United States", "In US", "Outside of US") 
