#Read the datasets
mergeHome <- read.csv("~/Research/Research---ST426/Data/MergeData/Home/mergeHome.csv")
mergeOverseas <- read.csv("~/Research/Research---ST426/Data/MergeData/Overseas/mergeOverseas.csv")

#Append H and O for the Match number
mergeHome$Match_Number <- sub("^" , "H_", mergeHome$Match_Number)
mergeOverseas$Match_Number <-  sub("^" , "O_", mergeOverseas$Match_Number)


#Write the files
write.csv(mergeHome , "~/Research/Research---ST426/Data/MergeData/Home/mergeHome.csv" , row.names = FALSE)
write.csv(mergeOverseas , "~/Research/Research---ST426/Data/MergeData/Overseas/mergeOverseas.csv" , row.names = FALSE)
