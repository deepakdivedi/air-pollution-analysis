library("stringr")
library("zoom")

data=c(dataPDP$Density..km2.,dataPDP$Air.Quality.Annual.Average.PM10.)
data=gsub("NA",0,data)
data=as.numeric(data)
barplot(data,
        xlab = "City Names",
        ylab = "Density & Air Quality ",
        main = "Correlation between Air Quality and Density of citites",
        col=c("Yellow","Blue"),
        beside = TRUE)
legend("topright",
       fill = c("Yellow","Blue"),
       bty="n",
       y.intersp = .5,
       legend=c("Density","Air Quality"),
       cex = .8)
text(
  x = seq(1,240,2.4),y = -13,srt=90,adj = 0.75,xpd=TRUE,labels = dataPDP$Cities,cex=0.6
)
zm()



