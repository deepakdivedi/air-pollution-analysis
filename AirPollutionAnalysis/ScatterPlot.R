library("stringr")
library("zoom")

data=c(dataPDP$Density..km2.,dataPDP$Air.Quality.Annual.Average.PM10.)
data=gsub("NA",0,data)
data=as.numeric(data)
plot(data,
        xlab = "Air Quality",
        ylab = "Density ",
        main = "Correlation between Air Quality and Density of citites",
        col=colors(TRUE))
zm()



