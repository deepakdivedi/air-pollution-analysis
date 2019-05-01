library("stringr")
library("zoom")

BarType=c("Population","Density","Air Pollution PM10")

choice=select.list(apply(as.data.frame(BarType),
                         1,
                         paste,collapse="  "),
                         graphics=TRUE,
                         multiple=FALSE,
                         title = "Select Option for Displaying Bar Chart")


chartDisplay=function(category){
     data=dataPDP[,category]
     data=gsub("NA",0,data)
     data=as.numeric(data)
     barplot(data,
             xlab = "City Names",
             ylab = category,
             main = paste(choice,"of Cities"),
             names.arg = dataPDP$Cities,
             las=2,
             cex.names = .6)
     zm()
}

switch(choice,"Population"=chartDisplay("Population"),
       "Density"=chartDisplay("Density..km2."),
       "Air Pollution PM10"=chartDisplay("Air.Quality.Annual.Average.PM10."))
