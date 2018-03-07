library(shiny)
#source("APIs.R") #if you want to re-pull the data uncomment this line and comment out the next one
load("APIEnvironment.RData")
source("barplots.R")
source("analysis.R")
source("timegraphfunction.R")
runApp("Data_Squad_App")
