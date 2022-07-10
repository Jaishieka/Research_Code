bt12 <- data_merge %>% filter(grepl('NLTC Perera' , Striker))

NLTC_H <- bt12 %>% filter(Venue == "Home")

cox_NLTC_H <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = NLTC_H)

model_NLTC_H <- stepAIC(cox_NLTC_H)


cox_NLTC_H_new <- coxph(Surv(cum_balls , wicket) ~ 
                      cum_runs+cum_singles+ridge(cum_dotBalls), data = NLTC_H)

cox.zph(cox_NLTC_H_new)


NLTC_H_cut <- survSplit(NLTC_H , cut = 20 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

NLTC_H_cut$hv1 <- NLTC_H_cut$cum_runs * (NLTC_H_cut$start < 20)
NLTC_H_cut$hv2 <- NLTC_H_cut$cum_runs * (NLTC_H_cut$start >= 20)


cox_NLTC_H_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                           hv1 + hv2 +cum_singles+ridge(cum_dotBalls) + cluster (id) , data = NLTC_H_cut)

cox.zph(cox_NLTC_H_heav)


NLTC_O <- bt12 %>% filter(Venue == "Overseas")

cox_NLTC_O <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = NLTC_O)


model_NLTC_O <- stepAIC(cox_NLTC_O)

cox_NLTC_O_new <- coxph(Surv(cum_balls , wicket) ~ 
                          cum_runs+cum_singles+ridge(cum_dotBalls), data = NLTC_O)

cox.zph(cox_NLTC_O_new)


NLTC_O_cut <- survSplit(NLTC_O , cut = 20 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

NLTC_O_cut$hv1 <- NLTC_O_cut$cum_runs * (NLTC_O_cut$start < 20)
NLTC_O_cut$hv2 <- NLTC_O_cut$cum_runs * (NLTC_O_cut$start >= 20)


cox_NLTC_O_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                           hv1 + hv2 +cum_singles+ridge(cum_dotBalls) + cluster (id) , data = NLTC_O_cut)

cox.zph(cox_NLTC_O_heav)
