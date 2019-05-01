library("zoom")

dataPDP$Air.Quality.Annual.Average.PM10.=gsub("NA",0,dataPDP$Air.Quality.Annual.Average.PM10.)
Air.Quality.Annual.Average.PM10.=as.numeric(dataPDP$Air.Quality.Annual.Average.PM10.)

dataPDP$Density..km2.=gsub("NA",0,dataPDP$Density..km2.)
Density..km2.=as.numeric(dataPDP$Density..km2.)

predictedval <- predict(lm(Density..km2.~Air.Quality.Annual.Average.PM10.))
print(predictedval)


cl=character(0)
for(i in seq(length(dataPDP$Cities))){
  val1=as.matrix(dataPDP[i,"Air.Quality.Annual.Average.PM10."])
  val=as.matrix(dataPDP[i,"Density..km2."])
  val=as.numeric(val)
  val1=as.numeric(val1)
  
  if(val<5000 && val1<80){
    cl=append(cl,"Green",length(cl))
  }else{
    cl=append(cl,"Red",length(cl))
  }
}

plot(Air.Quality.Annual.Average.PM10.,Density..km2.,abline(lm(Density..km2.~Air.Quality.Annual.Average.PM10.)),col=cl)
legend("topright",
       fill = c("Green","red"),
       bty="n",
       y.intersp = .5,
       legend=c("Low Mental Illiness","High Mental Illiness"),
       cex = .8)

#plot(Density..km2.,Air.Quality.Annual.Average.PM10.,abline(lm(Air.Quality.Annual.Average.PM10.~Density..km2.)))
zm()



