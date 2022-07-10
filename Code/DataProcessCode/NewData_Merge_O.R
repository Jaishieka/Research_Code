library(tidyverse)

#Assigning the path to read the files
read_path_3 <- "~/Research/Research---ST426/Data/NewData/Player/Overseas"

#List of the file names in the directory
files_4 <- dir(read_path_3 , pattern = "*.csv")

#Reading all the files and merging
data_4 <- files_4  %>%  map(function(x) read_csv(file.path(read_path_3 , x))) %>%
  reduce(rbind)

#select the specific columns
data_4 <- data_4 %>% 
  select(Match_Number, match_date, opposition, winning_status, innings, ball_over, ball_number, bat_position, Striker, non_striker, bowler, 
         extra_runs, batsman_runs, tot_runs, player_out, wicket)

#Writing the merged file to another directory 
write.csv(data_4 , "~/Research/Research---ST426/Data/NewData/Merge/Overseas/Overseas.csv" , row.names = FALSE)
