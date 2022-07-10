bt <- data_merge %>% filter(grepl('DM de Silva' , Striker))


#6
DMS_P_6 <- bt %>% filter(bat_position == 6)


cox_DMS_P_6 <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = DMS_P_6)

cox.zph(cox_DMS_P_6)

model_DMS_P_6 <- stepAIC(cox_DMS_P_6)

cox_DMS_P_6_new <- coxph(Surv(cum_balls , wicket) ~ 
                           cum_runs + cum_singles + cum_boundaries +ridge(cum_dotBalls), data = DMS_P_6)


cox.zph(cox_DMS_P_6_new)



DMS_P_6_cut <- survSplit(DMS_P_6 , cut = 30 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

DMS_P_6_cut$hv1 <- DMS_P_6_cut$cum_runs  * (DMS_P_6_cut$start < 30)
DMS_P_6_cut$hv2 <- DMS_P_6_cut$cum_runs  * (DMS_P_6_cut$start >= 30)

cox_DMS_P_6_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                            cum_singles +hv1 + hv2 + cum_boundaries + ridge(cum_dotBalls) + cluster (id) , data = DMS_P_6_cut)
cox.zph(cox_DMS_P_6_heav)




#1
DMS_P_1 <- bt %>% filter(bat_position == 1)


cox_DMS_P_1 <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_singles+cum_doubles+ridge(cum_dotBalls), data = DMS_P_1)

cox.zph(cox_DMS_P_1)

model_DMS_P_1 <- stepAIC(cox_DMS_P_1)

cox_DMS_P_1_new <- coxph(Surv(cum_balls , wicket) ~ 
                            cum_singles + cum_boundaries +ridge(cum_dotBalls), data = DMS_P_1)


cox.zph(cox_DMS_P_1_new)




DMS_P_1_cut <- survSplit(DMS_P_1 , cut = 30 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

DMS_P_1_cut$hv1 <- DMS_P_1_cut$cum_singles  * (DMS_P_1_cut$start < 30)
DMS_P_1_cut$hv2 <- DMS_P_1_cut$cum_singles  * (DMS_P_1_cut$start >= 30)

cox_DMS_P_1_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                            cum_singles  + cum_boundaries + ridge(cum_dotBalls) + cluster (id) , data = DMS_P_1_cut)
cox.zph(cox_DMS_P_1_heav)


#5
DMS_P_5 <- bt %>% filter(bat_position == 5)


cox_DMS_P_5 <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = DMS_P_5)

cox.zph(cox_DMS_P_5)

model_DMS_P_5 <- stepAIC(cox_DMS_P_5)

cox_DMS_P_5_new <- coxph(Surv(cum_balls , wicket) ~ 
                           cum_runs + cum_singles + cum_boundaries +ridge(cum_dotBalls), data = DMS_P_5)


cox.zph(cox_DMS_P_5_new)


DMS_P_5_cut <- survSplit(DMS_P_5 , cut = 30 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

DMS_P_5_cut$hv1 <- DMS_P_5_cut$cum_runs  * (DMS_P_5_cut$start < 30)
DMS_P_5_cut$hv2 <- DMS_P_5_cut$cum_runs  * (DMS_P_5_cut$start >= 30)

cox_DMS_P_5_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                            cum_singles +hv1 + hv2 + cum_boundaries + ridge(cum_dotBalls) + cluster (id) , 
                          data = DMS_P_5_cut)
cox.zph(cox_DMS_P_5_heav)


#7
DMS_P_7 <- bt %>% filter(bat_position == 7)


cox_DMS_P_7 <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = DMS_P_7)

cox.zph(cox_DMS_P_7)

model_DMS_P_7 <- stepAIC(cox_DMS_P_7)

cox_DMS_P_7_new <- coxph(Surv(cum_balls , wicket) ~ 
                           cum_runs + cum_singles + cum_boundaries +ridge(cum_dotBalls), data = DMS_P_7)


cox.zph(cox_DMS_P_7_new)

DMS_P_7_cut <- survSplit(DMS_P_7 , cut = 30 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

DMS_P_7_cut$hv1 <- DMS_P_7_cut$cum_runs  * (DMS_P_7_cut$start < 30)
DMS_P_7_cut$hv2 <- DMS_P_7_cut$cum_runs  * (DMS_P_7_cut$start >= 30)

cox_DMS_P_7_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                            cum_singles +hv1 + hv2 + cum_boundaries + ridge(cum_dotBalls) + cluster (id) , data = DMS_P_7_cut)
cox.zph(cox_DMS_P_7_heav)
