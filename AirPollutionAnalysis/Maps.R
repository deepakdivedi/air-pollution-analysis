IND_adm2 <- readRDS("E:/College/MCS/SEM2/R/RProject/IND_adm2.rds")


IND_adm2$NAME_2 = as.factor(IND_adm2$NAME_2)
IND_adm2$fake.data = runif(length(IND_adm2$NAME_2))
spplot(IND_adm2,"NAME_2",  col.regions=rgb(0,IND_adm2$fake.data,0), colorkey=T, main="India")

