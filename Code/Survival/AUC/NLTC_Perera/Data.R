bt12 <- data_merge %>% filter(grepl('NLTC Perera' , Striker))
nrow(bt12)
#1047

NLTC_H <- bt12 %>% filter(Venue == "Home")
nrow(NLTC_H)
#463

NLTC_O <- bt12 %>% filter(Venue == "Overseas")
nrow(NLTC_O)
#584

unique(bt12$bat_position)

NLTC_8 <- bt12 %>% filter(bat_position == 8)
nrow(NLTC_8)
#249

NLTC_7 <- bt12 %>% filter(bat_position == 7)
nrow(NLTC_7)
#626

NLTC_6 <- bt12 %>% filter(bat_position == 6)
nrow(NLTC_6)
#116

NLTC_5 <- bt12 %>% filter(bat_position == 5)
nrow(NLTC_5)
#55

NLTC_4 <- bt12 %>% filter(bat_position == 4)
nrow(NLTC_4)
#1