bt11 <- data_merge %>% filter(grepl('N Dickwella' , Striker))
nrow(bt11)
#1718

ND_H <- bt11 %>% filter(Venue == "Home")
nrow(ND_H)
#847

ND_O <- bt11 %>% filter(Venue == "Overseas")
nrow(ND_O)
#871

unique(bt11$bat_position)

ND_1 <- bt11 %>% filter(bat_position == 1)
nrow(ND_1)
#1257

ND_2 <- bt11 %>% filter(bat_position == 2)
nrow(ND_2)
#97

ND_3 <- bt11 %>% filter(bat_position == 3)
nrow(ND_3)
#207

ND_5 <- bt11 %>% filter(bat_position == 5)
nrow(ND_5)
#52

ND_4 <- bt11 %>% filter(bat_position == 4)
nrow(ND_4)
#96

ND_6 <- bt11 %>% filter(bat_position == 6)
nrow(ND_6)
#9