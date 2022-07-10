bt15 <- data_merge %>% filter(grepl('WU Tharanga' , Striker))
nrow(bt15)
#1854

WU_H <- bt15 %>% filter(Venue == "Home")
nrow(WU_H)
#569

WU_O <- bt15 %>% filter(Venue == "Overseas")
nrow(WU_O)
#1285

unique(bt15$bat_position)

WU_5 <- bt15 %>% filter(bat_position == 5)
nrow(WU_5)
#141

WU_2 <- bt15 %>% filter(bat_position == 2)
nrow(WU_2)
#1249

WU_4 <- bt15 %>% filter(bat_position == 4)
nrow(WU_4)
#304

WU_1 <- bt15 %>% filter(bat_position == 1)
nrow(WU_1)
#52

WU_6 <- bt15 %>% filter(bat_position == 6)
nrow(WU_6)
#21

WU_7 <- bt15 %>% filter(bat_position == 7)
nrow(WU_7)
#86

WU_9 <- bt15 %>% filter(bat_position == 9)
nrow(WU_9)
#1


WUT_1_cut <- survSplit(WUT_1 , cut = 50 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

WUT_1_cut$hv1 <- WUT_1_cut$cum_runs  * (WUT_1_cut$start < 50)
WUT_1_cut$hv2 <- WUT_1_cut$cum_runs  * (WUT_1_cut$start >= 50)

WUT_1_cut$hv3 <- WUT_1_cut$cum_singles   * (WUT_1_cut$start < 50)
WUT_1_cut$hv4 <- WUT_1_cut$cum_singles   * (WUT_1_cut$start >= 50)

cox_WUT_1_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                          hv1 + hv2 +hv3 +hv4 + ridge(cum_dotBalls) + cluster (id) , data = WUT_1_cut)



WUT_2_cut <- survSplit(WUT_2 , cut = 50 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

WUT_2_cut$hv1 <- WUT_2_cut$cum_runs  * (WUT_2_cut$start < 50)
WUT_2_cut$hv2 <- WUT_2_cut$cum_runs  * (WUT_2_cut$start >= 50)

WUT_2_cut$hv3 <- WUT_2_cut$cum_singles   * (WUT_2_cut$start < 50)
WUT_2_cut$hv4 <- WUT_2_cut$cum_singles   * (WUT_2_cut$start >= 50)

cox_WUT_2_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                          hv1 + hv2 +hv3 +hv4 + ridge(cum_dotBalls) + cluster (id) , data = WUT_2_cut)