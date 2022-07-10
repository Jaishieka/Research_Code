bt15 <- data_merge %>% filter(grepl('WU Tharanga' , Striker))

#2
WUT_P_2 <- bt15 %>% filter(bat_position == 2)


cox_WUT_P_2 <- coxph(Surv(cum_balls , wicket) ~ 
                       cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = WUT_P_2)

cox.zph(cox_WUT_P_2)

model_WUT_P_2 <- stepAIC(cox_WUT_P_2)

cox_WUT_P_2_new <- coxph(Surv(cum_balls , wicket) ~ 
                          cum_singles + cum_doubles + cum_boundaries, data = WUT_P_2)


cox.zph(cox_WUT_P_2_new)




WUT_P_2_cut <- survSplit(WUT_P_2 , cut = 50 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")


WUT_P_2_cut$hv3 <- WUT_P_2_cut$cum_singles   * (WUT_P_2_cut$start < 50)
WUT_P_2_cut$hv4 <- WUT_P_2_cut$cum_singles   * (WUT_P_2_cut$start >= 50)

cox_WUT_P_2_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                             hv3 + hv4+ cum_doubles + cum_boundaries+ cluster (id) , data = WUT_P_2_cut)

cox.zph(cox_WUT_P_2_heav)

#4
WUT_P_4 <- bt15 %>% filter(bat_position == 4)


cox_WUT_P_4 <- coxph(Surv(cum_balls , wicket) ~ 
                       cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = WUT_P_4)

cox.zph(cox_WUT_P_4)

model_WUT_P_4 <- stepAIC(cox_WUT_P_4)

cox_WUT_P_4_new <- coxph(Surv(cum_balls , wicket) ~ 
                           cum_runs + cum_singles + cum_doubles + cum_boundaries , data = WUT_P_4)


cox.zph(cox_WUT_P_4_new)

WUT_P_4_cut <- survSplit(WUT_P_4 , cut = 50 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

WUT_P_4_cut$hv3 <- WUT_P_4_cut$cum_singles   * (WUT_P_4_cut$start < 50)
WUT_P_4_cut$hv4 <- WUT_P_4_cut$cum_singles   * (WUT_P_4_cut$start >= 50)

cox_WUT_P_4_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                            hv3 + hv4+ cum_doubles + cum_boundaries + cluster (id) , data = WUT_P_4_cut)
cox.zph(cox_WUT_P_4_heav)

summary(cox_WUT_P_4_heav)

AUC(Surv(start,cum_balls , wicket) ~ 
      hv3 + hv4+ cum_doubles + cum_boundaries + cluster (id) , data = WUT_P_2_cut)
