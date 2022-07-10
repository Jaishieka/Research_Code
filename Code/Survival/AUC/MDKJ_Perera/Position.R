bt10 <- data_merge %>% filter(grepl('MDKJ Perera' , Striker))

#1
MDKJ_P_1 <- bt10 %>% filter(bat_position == 1)


cox_MDKJ_P_1 <- coxph(Surv(cum_balls , wicket) ~ 
                       cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = MDKJ_P_1)

cox.zph(cox_MDKJ_P_1)

model_MDKJ_P_1 <- stepAIC(cox_MDKJ_P_1)

cox_MDKJ_P_1_new <- coxph(Surv(cum_balls , wicket) ~ 
                            cum_runs + cum_boundaries +ridge(cum_dotBalls), data = MDKJ_P_1)


cox.zph(cox_MDKJ_P_1_new)



MDKJ_P_1_cut <- survSplit(MDKJ_P_1 , cut = 30 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

MDKJ_P_1_cut$hv1 <- MDKJ_P_1_cut$cum_boundaries  * (MDKJ_P_1_cut$start < 30)
MDKJ_P_1_cut$hv2 <- MDKJ_P_1_cut$cum_boundaries  * (MDKJ_P_1_cut$start >= 30)

cox_MDKJ_P_1_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                             cum_runs +hv1 + hv2 + ridge(cum_dotBalls) + cluster (id) , data = MDKJ_P_1_cut)
cox.zph(cox_MDKJ_P_1_heav)

#3
MDKJ_P_3 <- bt10 %>% filter(bat_position == 3)


cox_MDKJ_P_3 <- coxph(Surv(cum_balls , wicket) ~ 
                       cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = MDKJ_P_3)

cox.zph(cox_MDKJ_P_3)

model_MDKJ_P_3 <- stepAIC(cox_MDKJ_P_3)

cox_MDKJ_P_3_new <- coxph(Surv(cum_balls , wicket) ~ 
                            cum_runs + cum_boundaries+ridge(cum_dotBalls), data = MDKJ_P_3)


cox.zph(cox_MDKJ_P_3_new)


MDKJ_P_3_cut <- survSplit(MDKJ_P_3 , cut = 30 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

MDKJ_P_3_cut$hv1 <- MDKJ_P_3_cut$cum_boundaries  * (MDKJ_P_3_cut$start < 30)
MDKJ_P_3_cut$hv2 <- MDKJ_P_3_cut$cum_boundaries  * (MDKJ_P_3_cut$start >= 30)

cox_MDKJ_P_3_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                             cum_runs +hv1 + hv2 + ridge(cum_dotBalls) + cluster (id) , data = MDKJ_P_3_cut)
cox.zph(cox_MDKJ_P_3_heav)



#4
MDKJ_P_4 <- bt10 %>% filter(bat_position == 4)


cox_MDKJ_P_4 <- coxph(Surv(cum_balls , wicket) ~ 
                       cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = MDKJ_P_4)

cox.zph(cox_MDKJ_P_4)

model_MDKJ_P_4 <- stepAIC(cox_MDKJ_P_4)

cox_MDKJ_P_4_new <- coxph(Surv(cum_balls , wicket) ~ 
                            cum_runs + cum_boundaries+ridge(cum_dotBalls), data = MDKJ_P_4)


cox.zph(cox_MDKJ_P_4_new)


MDKJ_P_4_cut <- survSplit(MDKJ_P_4 , cut = 30 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

MDKJ_P_4_cut$hv1 <- MDKJ_P_4_cut$cum_boundaries  * (MDKJ_P_4_cut$start < 30)
MDKJ_P_4_cut$hv2 <- MDKJ_P_4_cut$cum_boundaries  * (MDKJ_P_4_cut$start >= 30)

cox_MDKJ_P_4_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                             cum_runs +hv1 + hv2 + ridge(cum_dotBalls) + cluster (id) , data = MDKJ_P_4_cut)
cox.zph(cox_MDKJ_P_4_heav)


#2
MDKJ_P_2 <- bt10 %>% filter(bat_position == 2)


cox_MDKJ_P_2 <- coxph(Surv(cum_balls , wicket) ~ 
                       cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = MDKJ_P_2)

cox.zph(cox_MDKJ_P_2)

model_MDKJ_P_2 <- stepAIC(cox_MDKJ_P_2)

cox_MDKJ_P_2_new <- coxph(Surv(cum_balls , wicket) ~ 
                            cum_runs + cum_boundaries+ridge(cum_dotBalls), data = MDKJ_P_2)


cox.zph(cox_MDKJ_P_2_new)


MDKJ_P_2_cut <- survSplit(MDKJ_P_2 , cut = 30 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

MDKJ_P_2_cut$hv1 <- MDKJ_P_2_cut$cum_boundaries  * (MDKJ_P_2_cut$start < 30)
MDKJ_P_2_cut$hv2 <- MDKJ_P_2_cut$cum_boundaries  * (MDKJ_P_2_cut$start >= 30)

cox_MDKJ_P_2_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                             cum_runs +hv1 + hv2 + ridge(cum_dotBalls) + cluster (id) , data = MDKJ_P_2_cut)
cox.zph(cox_MDKJ_P_2_heav)