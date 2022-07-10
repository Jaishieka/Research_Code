library(tidyverse)

mergeHome <- read.csv("~/Research/Research---ST426/Data/MergeData/Home/mergeHome.csv")

HPtData <- mergeHome

unique(HPtData[c("non_striker")])
str(HPtData)

HPtData1 <- HPtData[-c(593,905,3697,7384,8592),]
unique(HPtData1[c("non_striker")])

HPtData1$Partnership <- paste(HPtData1$Striker,HPtData1$non_striker,sep = "-")


spt2 <- split(HPtData1 , HPtData1$Partnership)


lapply(names(spt2),function(x){
  write_csv(spt2[[x]], path = paste(x, ".csv",sep = ""))
})
