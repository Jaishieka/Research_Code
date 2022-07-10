library(tidyverse)

mergeOverseas <- read.csv("~/Research/Research---ST426/Data/MergeData/Overseas/mergeOverseas.csv")

OPtData <- mergeOverseas

unique(OPtData[c("non_striker")])


OPtData$Partnership <- paste(OPtData$Striker,OPtData$non_striker,sep = "-")


spt3 <- split(OPtData , OPtData$Partnership)


lapply(names(spt3),function(x){
  write_csv(spt3[[x]], path = paste(x, ".csv",sep = ""))
})