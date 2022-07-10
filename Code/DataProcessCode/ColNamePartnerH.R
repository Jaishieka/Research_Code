library(tidyverse)

data_path_3 <- "~/Research/Research---ST426/Data/FinalData/partnership/home/"
to_p_2 <- "~/Research/Research---ST426/Data/EDA_Data/Partnership/Home/"

setwd(data_path_3)

filenames_3 <- list.files(pattern = "*.csv")


change_colName <- function(filename , write_p){
  player_name <- read.csv(filename)
  names(player_name)[2] <- "ball_over"
  
  write.csv(player_name , file = paste0(write_p , "/" , basename(filename)) , row.names = FALSE) 
}

lapply(filenames_3 , FUN = change_colName , write_p = to_p_2)
