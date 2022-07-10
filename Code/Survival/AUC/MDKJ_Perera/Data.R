bt10 <- data_merge %>% filter(grepl('MDKJ Perera' , Striker))
nrow(bt10)
#1970

MDKJ_H <- bt10 %>% filter(Venue == "Home")
nrow(MDKJ_H)
#613

MDKJ_O <- bt10 %>% filter(Venue == "Overseas")
nrow(MDKJ_O)
#1357

unique(bt10$bat_position)

MDKJ_1 <- bt10 %>% filter(bat_position == 1)
nrow(MDKJ_1)
#386

MDKJ_6 <- bt10 %>% filter(bat_position == 6)
nrow(MDKJ_6)
#94

MDKJ_7 <- bt10 %>% filter(bat_position == 7)
nrow(MDKJ_7)
#89

MDKJ_3 <- bt10 %>% filter(bat_position == 3)
nrow(MDKJ_3)
#565

MDKJ_4 <- bt10 %>% filter(bat_position == 4)
nrow(MDKJ_4)
#262

MDKJ_2 <- bt10 %>% filter(bat_position == 2)
nrow(MDKJ_2)
#574