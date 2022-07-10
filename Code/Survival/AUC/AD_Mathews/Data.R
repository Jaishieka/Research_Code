bt2 <- data_merge %>% filter(grepl('AD Mathews' , Striker))
nrow(bt2)

ADM_H <- bt2 %>% filter(Venue == "Home")
nrow(ADM_H)
#1114

ADM_O <- bt2 %>% filter(Venue == "Overseas")
nrow(ADM_O)
#1227

unique(bt2$bat_position)

ADM_5 <- bt2 %>% filter(bat_position == 5)
nrow(ADM_5)
#1844

ADM_3 <- bt2 %>% filter(bat_position == 3)
nrow(ADM_3)
# 41

ADM_4 <- bt2 %>% filter(bat_position == 4)
nrow(ADM_4)
#381

ADM_6 <- bt2 %>% filter(bat_position == 6)
nrow(ADM_6)
#73

AD_8 <- bt2 %>% filter(bat_position == 8)
nrow(AD_8)
#2
#Use 5 and 4