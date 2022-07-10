library(tidyverse)

#Reading the files
PlayerHome <- read.csv("~/Research/Research---ST426/Data/EDA_Data/Players/HomeMerge/PlayerHome.csv")
PlayerOverseas <- read.csv("~/Research/Research---ST426/Data/EDA_Data/Players/OverseasMerge/PlayerOverseas.csv")

str(PlayerHome)
str(PlayerOverseas)


#Changing the character variable to integer variable
PlayerOverseas$extra_runs <- as.integer(PlayerOverseas$extra_runs)
PlayerHome$batsman_runs <- as.integer(PlayerHome$batsman_runs)
PlayerOverseas$batsman_runs <- as.integer(PlayerOverseas$batsman_runs)

#Merging the two dataframes
Full_data <- rbind(PlayerHome , PlayerOverseas)
head(Full_data)

#Writing the merged file to another directory 
write.csv(Full_data , "~/Research/Research---ST426/Data/EDA_Data/FullPlayerData/FullData.csv" , row.names = FALSE)
