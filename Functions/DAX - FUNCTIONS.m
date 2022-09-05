# OPERATOR
String: concatenation string : & 
    CombinedName = DimProductCategory[ProductCategoryKey] & "  " & DimProductCategory[EnglishProductCategoryName] & "  " &   DimProductCategory[FrenchProductCategoryName]

#IF Function
    Quantity4.99 = IF(FactInternetSales[SalesAmount] = 4.99, FactInternetSales[OrderQuantity],0) 

    # NULL = BLANK()
    Quantity4.99 = IF(FactInternetSales[SalesAmount] = 4.99, FactInternetSales[OrderQuantity],BLANK())  

    #IF ISBLANK, TRUE = BLANK(), FALSE = NOT BLANK()
    Quantity4.99+1 = IF(ISBLANK(FactInternetSales[Quantity4.99]),BLANK(),FactInternetSales[Quantity4.99]+1)

    #SWITCH (giống như CASE)
    SalesTerrority = if(FactInternetSales[SalesTerritoryKey]<6, "US", "Outside US") 
    SalesTerrority = SWITCH(FactInternetSales[SalesTerritoryKey],
                                1,"NW",
                                2,"NE",
                                3,"Central",
                                4,"SW",
                                5,"SE",
                                "Outside US")
    #IF ERROR (Nếu sai)
    ERROR = IFERROR(FactInternetSales[TotalProductCost]/(FactInternetSales[OrderQuantity]-1),BLANK())

# SIGN FUNCTION 
CompareWith4.99 = SWITCH(SIGN(FactInternetSales(SalesAmount)-4.99),1, "More", 0, "Same", -1, "Less")

# TEXT
* Search : Tìm kiếm 
BikeLocation=SEARCH("bike",DimProductCategory[EnglishProductCategoryName],1,BLANK())

* SUBSTITUE: Thay the
Moped = SUBSTITUE(DimProductSubCategory[EnglishProductCategoryName],"Bike","Moped")


* EXTRACT
ExtractedText = RIGHT(FactInternetSales[SalesOrderNumber],5)
ExtractedText = MID(FactInternetSales[SalesOrderNumber],LEN(SalesOrderNumber)-5+1,LEN(SalesOrderNumber)-2)
ExtractedText = SUBSTITUE(FactInternetSales[SalesOrderNumber],"SO","Sale Order: ")
ExtractedText = REPLACE(FactInternetSales[SalesOrderNumber],1,2,"Sale Order: ")


* LOOKVALUE: Tìm kiếm và trả giá trị 

Custom = LOOKUPVALUE(FactInternetSales[SalesTerritoryKey],FactInternetSales[SalesOrderNumber],"SO51900")