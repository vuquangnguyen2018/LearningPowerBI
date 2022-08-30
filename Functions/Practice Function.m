# Practice Activity 20
IncomePerPerson=MROUND(DimCustomer[Yearly]/DimCustomer[NumberPeople],1000)
RankEQ = RANK.EQ(DimCustomer[IncomePerPerson],DimCustomer[IncomePerPerson],DESC)
Hundreds=QUOTIENT(DimCustomer[RankEQ],100) 
Remainder=MOD(DimCustomer[RankEQ],100)
GoalStatus=SWITCH(SIGN(DimCustomer[IncomePerPerson]-10000),
                    1,"Above by " & (DimCustomer[IncomePerPerson]-10000),
                    0,"In line with target",
                    -1,"Below by  "& ABS(DimCustomer[IncomePerPerson]-10000))


