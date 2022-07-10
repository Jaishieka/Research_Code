bt <- data_merge %>% filter(grepl('DM de Silva' , Striker))
nrow(bt)
#1405

DMS_H <- bt %>% filter(Venue == "Home")
nrow(DMS_H)
#511

DMS_O <- bt %>% filter(Venue == "Overseas")
nrow(DMS_O)
#894

unique(bt$bat_position)

DMS_6 <- bt %>% filter(bat_position == 6)
nrow(DMS_6)
#382

DMS_1 <- bt %>% filter(bat_position == 1)
nrow(DMS_1)
#289

DMS_5 <- bt %>% filter(bat_position == 5)
nrow(DMS_5)
#255

DMS_7 <- bt %>% filter(bat_position == 7)
nrow(DMS_7)
#236

DMS_8 <- bt %>% filter(bat_position == 8)
nrow(DMS_8)
#62

DMS_3 <- bt %>% filter(bat_position == 3)
nrow(DMS_3)
#39

DMS_4 <- bt %>% filter(bat_position == 4)
nrow(DMS_4)
#113

DMS_2 <- bt %>% filter(bat_position == 2)
nrow(DMS_2)
#29