library("stringr")
library("zoom")

PieType=c("Population","Density","Air Pollution PM10")

choice=select.list(apply(as.data.frame(PieType),
                         1,
                         paste,collapse="  "),
                   graphics=TRUE,
                   multiple=FALSE,
                   title = "Select Option for Displaying Pie Chart")


chartDisplay=function(category){
  cl=colors(TRUE)
  data=dataPDP[,category]
  data=gsub("NA",0,data)
  data=as.numeric(data)
  pie(data,
      main = paste(choice,"of Cities"),
      col=cl,
      radius = 1.5,
      labels = "")
  
  legend(-2.8,1.8,
         fill = cl[1:50],
         bty="n",
         y.intersp = .5,
         legend=dataPDP$Cities[c(1:50)],
         cex = .6)
  legend(1.5,1.8,
         fill = cl[51:100],
         bty="n",
         y.intersp = .5,
         legend=dataPDP$Cities[c(51:100)],
         cex = .6)
  
  zm()
}

switch(choice,"Population"=chartDisplay("Population"),
       "Density"=chartDisplay("Density..km2."),
       "Air Pollution PM10"=chartDisplay("Air.Quality.Annual.Average.PM10."))
