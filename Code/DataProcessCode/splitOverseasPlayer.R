library(tidyverse)

mergeOverseas <- read.csv("~/Research/Research---ST426/Data/MergeData/Overseas/mergeOverseas.csv")

OData <- mergeOverseas

spt1 <- split(OData , OData$Striker)

lapply(names(spt1),function(x){
  write_csv(spt1[[x]], path = paste(x, ".csv",sep = ""))
})
