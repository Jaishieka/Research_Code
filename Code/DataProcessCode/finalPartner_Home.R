library(tidyverse)

my_path_3 <- "~/Research/Research---ST426/Data/PartnershipData/HomeMerge/"

setwd(my_path_3)

df_names_3 <- list.files(pattern = "*.csv")

head(df_names_3)

to_path_3 <- "~/Research/Research---ST426/Data/FinalData/partnership/home/"


surv_data <- function(filename , write_path){
  player_name <- read.csv(filename)
  
  copy_data <- group_by(player_name , Match_Number)
  
  copy_data_new <- copy_data %>% add_column(singles = NA,
                                            doubles = NA,
                                            boundaries = NA,
                                            dotBalls = NA)
  
  
  new_data <- mutate(copy_data_new , 
                     singles = ifelse(batsman_runs == 1 , 1 , 0)  ,
                     doubles = ifelse(batsman_runs == 2 , 1 , 0) ,
                     boundaries = ifelse(batsman_runs == 4 , 1 , 0) , 
                     dotBalls = ifelse(batsman_runs == 0 , 1 , 0) )
  
  new_data_2 <- new_data %>% mutate(player_singles = cumsum(singles),
                                    player_doubles = cumsum(doubles),
                                    player_boundaries = cumsum(boundaries),
                                    player_dotBalls = cumsum(dotBalls) ,
                                    total_balls = cumsum(ball_faced),
                                    total_runs = cumsum(batsman_runs))
  
  
  write.csv(new_data_2 , file = paste0(write_path , "/" , basename(filename)))
}


lapply(df_names_3, FUN = surv_data , write_path = to_path_3)
