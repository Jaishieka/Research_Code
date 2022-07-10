library(tidyverse)

data_path_2 <- "~/Research/Research---ST426/Data/FinalData/player/overseas/"
to_p_1 <- "~/Research/Research---ST426/Data/EDA_Data/Players/Overses/"

setwd(data_path_2)

filenames_2 <- list.files(pattern = "*.csv")


change_colName <- function(filename , write_p){
  player_name <- read.csv(filename)
  names(player_name)[2] <- "ball_over"
  
  write.csv(player_name , file = paste0(write_p , "/" , basename(filename)) , row.names = FALSE) 
}

lapply(filenames_2 , FUN = change_colName , write_p = to_p_1)
