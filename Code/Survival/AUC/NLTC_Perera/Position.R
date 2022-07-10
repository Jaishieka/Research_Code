bt12 <- data_merge %>% filter(grepl('NLTC Perera' , Striker))


#7
NLTC_P_7 <- bt12 %>% filter(bat_position == 7)


cox_NLTC_P_7 <- coxph(Surv(cum_balls , wicket) ~ 
                       cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = NLTC_P_7)

cox.zph(cox_NLTC_P_7)

model_NLTC_P_7 <- stepAIC(cox_NLTC_P_7)

cox_NLTC_P_7_new <- coxph(Surv(cum_balls , wicket) ~ 
                            cum_runs + cum_singles + ridge(cum_dotBalls), data = NLTC_P_7)


cox.zph(cox_NLTC_P_7_new)


NLTC_P_7_cut <- survSplit(NLTC_P_7 , cut = 20 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

NLTC_P_7_cut$hv1 <- NLTC_P_7_cut$cum_runs * (NLTC_P_7_cut$start < 20)
NLTC_P_7_cut$hv2 <- NLTC_P_7_cut$cum_runs * (NLTC_P_7_cut$start >= 20)


cox_NLTC_P_7_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                             hv1 +hv2 + cum_boundaries  + ridge(cum_dotBalls) + cluster (id) , data = NLTC_P_7_cut)

cox.zph(cox_NLTC_P_7_heav)

#8
NLTC_P_8 <- bt12 %>% filter(bat_position == 8)


cox_NLTC_P_8 <- coxph(Surv(cum_balls , wicket) ~ 
                       cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = NLTC_P_8)

cox.zph(cox_NLTC_P_8)

model_NLTC_P_8 <- stepAIC(cox_NLTC_P_8)

cox_NLTC_P_8_new <- coxph(Surv(cum_balls , wicket) ~ 
                            cum_runs + cum_singles +ridge(cum_dotBalls), data = NLTC_P_8)


cox.zph(cox_NLTC_P_8_new)



NLTC_P_8_cut <- survSplit(NLTC_P_8 , cut = 20 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

NLTC_P_8_cut$hv1 <- NLTC_P_8_cut$cum_runs * (NLTC_P_8_cut$start < 20)
NLTC_P_8_cut$hv2 <- NLTC_P_8_cut$cum_runs * (NLTC_P_8_cut$start >= 20)


cox_NLTC_P_8_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                           hv1 + hv2 +  cum_boundaries + ridge(cum_dotBalls) + cluster (id) , data = NLTC_P_8_cut)

cox.zph(cox_NLTC_P_8_heav)
