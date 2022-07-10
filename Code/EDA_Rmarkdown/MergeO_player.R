library(tidyverse)

#Assigning the path to read the files
read_path_1 <- "~/Research/Research---ST426/Data/EDA_Data/Players/Overses"

#List of the file names in the directory
files_2 <- dir(read_path_1 , pattern = "*.csv")

#Reading all the files and merging
data_2 <- files_2  %>%  map(function(x) read_csv(file.path(read_path_1 , x))) %>%
  reduce(rbind)

#Writing the merged file to another directory 
write.csv(data_2 , "~/Research/Research---ST426/Data/EDA_Data/Players/OverseasMerge/PlayerOverseas.csv" , row.names = FALSE)