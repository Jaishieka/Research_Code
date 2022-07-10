library(tidyverse)

#Read the data set
Home <- read.csv("~/Research/Research---ST426/Data/NewData/Merge/Home/Home.csv")

#Add new columns
data_5 <- Home %>% group_by(Match_Number, Striker) %>% 
                   mutate(ball_faced = 1 ,
                          singles = ifelse(batsman_runs == 1 , 1 , 0)  ,
                          doubles = ifelse(batsman_runs == 2 , 1 , 0) ,
                          triples = ifelse(batsman_runs == 3 , 1 , 0) ,
                          boundaries = ifelse(batsman_runs == 4 , 1 , 0) , 
                          six = ifelse(batsman_runs == 6 , 1 , 0) , 
                          dotBalls = ifelse(batsman_runs == 0 , 1 , 0),
                          cum_singles = cumsum(singles),
                          cum_doubles = cumsum(doubles),
                          cum_triples = cumsum(triples),
                          cum_boundaries = cumsum(boundaries),
                          cum_six = cumsum(six),
                          cum_dotBalls = cumsum(dotBalls) ,
                          cum_balls = cumsum(ball_faced) ,
                          cum_runs = cumsum(batsman_runs))
#d <- data_5 %>% filter(Striker == "LD Chandimal")
#view(d)



#Adding batsman status
batsman_vec <- c("BKG Mendis","CK Kapugedera","DAS Gunaratne","EMDY Munaweera","FDM Karunaratne","HDRL Thirimanne","LD Chandimal","MDKJ Perera",
                 "N Dickwella","S Samarawickrama","WIA Fernando","WU Tharanga","BOP Fernando","DS Weerakkody","KNA Bandara","M Bhanuka","P Nissanka",
                 "PARP Perera")

bowler_vec <- c("CBRLS Kumara","KMDN Kulasekara","MA Aponso","MVT Fernando","N Pradeep","NGRP Jayasuriya","PADLR Sandakan","PVD Chameera","RAS Lakmal",
                "SL Malinga","AM Fernando","B Fernando","C Karunaratne","CAK Rajitha","DSK Madushanka","JDF Vandersay","KMC Bandara","P Jayawickrama",
                "PLS Gamage","RMS Eranga","S Randiv")

allR_vec <- c("A Dananjaya","AD Mathews","AK Perera","DM de Silva","GSNFG Jayasuriya","I Udana","LD Madushanka","MD Gunathilaka","MD Shanaka",
              "MDK Perera","NLTC Perera","PM Pushpakumara","PWH de Silva","S Prasanna","SS Pathirana","TAM Siriwardana","TM Dilshan",
              "BMAJ Mendis","D Lakshan","KIC Asalanka","MF Maharoof","PC de Silva","PHKD Mendis","RTM Mendis")

data_6 <- data_5 %>% mutate(Striker_status =
  case_when(Striker %in% batsman_vec ~ "batsman",
            Striker %in% bowler_vec ~ "bowler",
            Striker %in% allR_vec ~ "all rounder")
)

write.csv(data_6 , "~/Research/Research---ST426/Data/NewData/Merge/Home/Home.csv" , row.names = FALSE)
