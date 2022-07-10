library(tidyverse)

data_path_4 <- "~/Research/Research---ST426/Data/FinalData/partnership/overseas/"
to_p_3 <- "~/Research/Research---ST426/Data/EDA_Data/Partnership/Overseas/"

setwd(data_path_4)

filenames_4 <- list.files(pattern = "*.csv")


change_colName <- function(filename , write_p){
  player_name <- read.csv(filename)
  names(player_name)[2] <- "ball_over"
  
  write.csv(player_name , file = paste0(write_p , "/" , basename(filename)) , row.names = FALSE) 
}

lapply(filenames_4 , FUN = change_colName , write_p = to_p_3)
