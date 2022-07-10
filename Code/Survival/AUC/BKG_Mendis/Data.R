bt3 <- data_merge %>% filter(grepl('BKG Mendis' , Striker))
nrow(bt3)

BKG_H <- bt3 %>% filter(Venue == "Home")
nrow(BKG_H)
#1163

BKG_O <- bt3 %>% filter(Venue == "Overseas")
nrow(BKG_O)
#1474


unique(bt3$bat_position)


BKG_3 <- bt3 %>% filter(bat_position == 3)
nrow(BKG_3)
#1370

BKG_6 <- bt3 %>% filter(bat_position == 6)
nrow(BKG_6)
#2

BKG_4 <- bt3 %>% filter(bat_position == 4)
nrow(BKG_4)
#1135

BKG_8 <- bt3 %>% filter(bat_position == 8)
nrow(BKG_8)
#7

BKG_2 <- bt3 %>% filter(bat_position == 2)
nrow(BKG_2)
#7

ADM_5 <- bt3 %>% filter(bat_position == 5)
nrow(ADM_5)
#114

ADM_1 <- bt3 %>% filter(bat_position == 1)
nrow(ADM_1)
#2