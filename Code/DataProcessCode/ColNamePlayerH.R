library(tidyverse)

data_path_1 <- "~/Research/Research---ST426/Data/FinalData/player/home/"
to_p <- "~/Research/Research---ST426/Data/EDA_Data/Players/Home/"

setwd(data_path_1)

filenames_1 <- list.files(pattern = "*.csv")


change_colName <- function(filename , write_p){
  player_name <- read.csv(filename)
  names(player_name)[2] <- "ball_over"
 
  write.csv(player_name , file = paste0(write_p , "/" , basename(filename)) , row.names = FALSE) 
}

lapply(filenames_1 , FUN = change_colName , write_p = to_p)



