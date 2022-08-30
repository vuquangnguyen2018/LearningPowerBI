#-----------------------------------############ ------------------------------------------------
# Practice Activity 18 


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



#-----------------------------------############ ------------------------------------------------
# Practice Activity 20


IncomePerPerson=MROUND(DimCustomer[Yearly]/DimCustomer[NumberPeople],1000)
RankEQ = RANK.EQ(DimCustomer[IncomePerPerson],DimCustomer[IncomePerPerson],DESC)
Hundreds=QUOTIENT(DimCustomer[RankEQ],100) 
Remainder=MOD(DimCustomer[RankEQ],100)
GoalStatus=SWITCH(SIGN(DimCustomer[IncomePerPerson]-10000),
                    1,"Above by " & (DimCustomer[IncomePerPerson]-10000),
                    0,"In line with target",
                    -1,"Below by  "& ABS(DimCustomer[IncomePerPerson]-10000))


