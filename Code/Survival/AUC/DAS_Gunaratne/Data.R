bt6 <- data_merge %>% filter(grepl('DAS Gunaratne' , Striker))
nrow(bt6)
#743

DAS_H <- bt6 %>% filter(Venue == "Home")
nrow(DAS_H)
#225

DAS_O <- bt6 %>% filter(Venue == "Overseas")
nrow(DAS_O)
#518

unique(bt6$bat_position)

DAS_6 <- bt6 %>% filter(bat_position == 6)
nrow(DAS_6)
#435

DAS_5 <- bt6 %>% filter(bat_position == 5)
nrow(DAS_5)
#97

DAS_7 <- bt6 %>% filter(bat_position == 7)
nrow(DAS_7)
#92

DAS_4 <- bt6 %>% filter(bat_position == 4)
nrow(DAS_4)
#119