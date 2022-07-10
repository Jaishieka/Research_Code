library(tidyverse)

mergeHome <- read.csv("~/Research/Research---ST426/Data/MergeData/Home/mergeHome.csv")

HData <- mergeHome

spt <- split(HData , HData$Striker)

lapply(names(spt),function(x){
  write_csv(spt[[x]], path = paste(x, ".csv",sep = ""))
})