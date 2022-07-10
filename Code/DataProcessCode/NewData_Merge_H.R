library(tidyverse)

#Assigning the path to read the files
read_path_2 <- "~/Research/Research---ST426/Data/NewData/Player/Home"

#List of the file names in the directory
files_3 <- dir(read_path_2 , pattern = "*.csv")

#Reading all the files and merging
data_3 <- files_3  %>%  map(function(x) read_csv(file.path(read_path_2 , x))) %>%
  reduce(rbind)

#select the specific columns
data_3 <- data_3 %>% 
  select(Match_Number, match_date, opposition, winning_status, innings, ball_over, ball_number, bat_position, Striker, non_striker, bowler, 
         extra_runs, batsman_runs, tot_runs, player_out, wicket)

#Writing the merged file to another directory 
write.csv(data_3 , "~/Research/Research---ST426/Data/NewData/Merge/Home/Home.csv" , row.names = FALSE)
