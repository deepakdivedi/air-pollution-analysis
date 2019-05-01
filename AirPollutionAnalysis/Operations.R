modes=data.frame(c("View DataSet",
                   "View Bar Charts",
                   "View Pie Charts",
                   "View Scatter Plot",
                   "View Group Bar Chart",
                   "View Regression Plot",
                   "Exit"))
operation=select.list(apply(modes,
                            1,
                            paste,
                            collapse="  "),
                      graphics=TRUE,
                      multiple=FALSE,
                      title = "Select Operation")

switch(operation,
       "View DataSet" = source(file = "ViewData.R"),
       "View Bar Charts" = source(file = "BarCharts.R"),
       "View Pie Charts" = source(file = "PieCharts.R"),
       "View Scatter Plot"= source(file = "ScatterPlot.R"),
       "View Group Bar Chart" = source(file = "GroupBarCharts.R"),
       "View Regression Plot" = source(file = "PlotRegression.R"),
       "Exit"=stop("Terminated Successfully"))
rm(list=setdiff(ls(),c("dataPDP")))
source(file = "Operations.R")
