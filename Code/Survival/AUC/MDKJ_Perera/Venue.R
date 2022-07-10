bt10 <- data_merge %>% filter(grepl('MDKJ Perera' , Striker))

MDKJ_H <- bt10 %>% filter(Venue == "Home")

cox_MDKJ_H <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = MDKJ_H)

model_MDKJ_H <- stepAIC(cox_MDKJ_H)


cox_MDKJ_H_new <- coxph(Surv(cum_balls , wicket) ~ 
                      cum_singles+cum_boundaries+ridge(cum_dotBalls), data = MDKJ_H)

cox.zph(cox_MDKJ_H_new)


MDKJ_H_cut <- survSplit(MDKJ_H , cut = 40 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

MDKJ_H_cut$hv1 <- MDKJ_H_cut$cum_singles * (MDKJ_H_cut$start < 40)
MDKJ_H_cut$hv2 <- MDKJ_H_cut$cum_singles * (MDKJ_H_cut$start >= 40)


cox_MDKJ_H_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                          hv1 + hv2 +cum_boundaries+ridge(cum_dotBalls) + cluster (id) , data = MDKJ_H_cut)
cox.zph(cox_MDKJ_H_heav)


MDKJ_O <- bt10 %>% filter(Venue == "Overseas")

cox_MDKJ_O <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = MDKJ_O)


model_MDKJ_O <- stepAIC(cox_MDKJ_O)

cox.zph(cox_MDKJ_O)


MDKJ_O_cut <- survSplit(MDKJ_O , cut = 40 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

MDKJ_O_cut$hv1 <- MDKJ_O_cut$cum_singles * (MDKJ_O_cut$start < 40)
MDKJ_O_cut$hv2 <- MDKJ_O_cut$cum_singles * (MDKJ_O_cut$start >= 40)


cox_MDKJ_O_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                           hv1 + hv2 +cum_boundaries+ridge(cum_dotBalls) + cluster (id) , data = MDKJ_O_cut)
cox.zph(cox_MDKJ_O_heav)
