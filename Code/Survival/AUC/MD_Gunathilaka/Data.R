bt4 <- data_merge %>% filter(grepl('MD Gunathilaka' , Striker))
nrow(bt4)
#1699

MDG_H <- bt4 %>% filter(Venue == "Home")
nrow(MDG_H)
#597

MDG_O <- bt4 %>% filter(Venue == "Overseas")
nrow(MDG_O)
#1102

unique(bt4$bat_position)

MDG_2 <- bt4 %>% filter(bat_position == 2)
nrow(MDG_2)
#988

MDG_1 <- bt4 %>% filter(bat_position == 1)
nrow(MDG_1)
#657

MDG_7 <- bt4 %>% filter(bat_position == 7)
nrow(MDG_7)
#53

MDG_0 <- bt4 %>% filter(bat_position == 0)
nrow(MDG_0)
#1