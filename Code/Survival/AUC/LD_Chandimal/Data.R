bt1 <- data_merge %>% filter(grepl('LD Chandimal' , Striker))
nrow(bt1)
#1770

LD_H <- bt1 %>% filter(Venue == "Home")
nrow(LD_H)
#732

LD_O <- bt1 %>% filter(Venue == "Overseas")
nrow(LD_O)
#1038

unique(bt1$bat_position)

LD_4 <- bt1 %>% filter(bat_position == 4)
nrow(LD_4)
#1096

LD_2 <- bt1 %>% filter(bat_position == 2)
nrow(LD_2)
#74

LD_3 <- bt1 %>% filter(bat_position == 3)
nrow(LD_3)
#221

LD_7 <- bt1 %>% filter(bat_position == 7)
nrow(LD_7)
#4

LD_5 <- bt1 %>% filter(bat_position == 5)
nrow(LD_5)
#375