library(tidyverse)

#Assigning the path to read the files
read_path <- "~/Research/Research---ST426/Data/EDA_Data/Players/Home"

#List of the file names in the directory
files_1 <- dir(read_path , pattern = "*.csv")

#Reading all the files and merging
data_1 <- files_1  %>%  map(function(x) read_csv(file.path(read_path , x))) %>%
  reduce(rbind)

#Writing the merged file to another directory 
write.csv(data_1 , "~/Research/Research---ST426/Data/EDA_Data/Players/HomeMerge/PlayerHome.csv" , row.names = FALSE)