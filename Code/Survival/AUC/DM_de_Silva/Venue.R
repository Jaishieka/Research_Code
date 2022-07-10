bt <- data_merge %>% filter(grepl('DM de Silva' , Striker))

DMS_H <- bt %>% filter(Venue == "Home")

cox_DMS_H <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = DMS_H)

model_DMS_H <- stepAIC(cox_DMS_H)


cox_DMS_H_new <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_singles + cum_doubles + cum_boundaries+ridge(cum_dotBalls), data = DMS_H)

cox.zph(cox_DMS_H_new)



DMS_H_cut <- survSplit(DMS_H , cut = 30 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

DMS_H_cut$hv1 <- DMS_H_cut$cum_singles  * (DMS_H_cut$start < 30)
DMS_H_cut$hv2 <- DMS_H_cut$cum_singles  * (DMS_H_cut$start >= 30)

cox_DMS_H_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                          hv1 + hv2 + cum_boundaries+ ridge(cum_dotBalls) + cluster (id) , data = DMS_H_cut)

cox.zph(cox_DMS_H_heav)



DMS_O <- bt %>% filter(Venue == "Overseas")

cox_DMS_O <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = DMS_O)


model_DMS_O <- stepAIC(cox_DMS_O)


cox_DMS_O_new <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_singles + cum_doubles + cum_boundaries+ridge(cum_dotBalls), data = DMS_O)

cox.zph(cox_DMS_O_new)



DMS_O_cut <- survSplit(DMS_O , cut = 30 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

DMS_O_cut$hv1 <- DMS_O_cut$cum_singles  * (DMS_O_cut$start < 30)
DMS_O_cut$hv2 <- DMS_O_cut$cum_singles  * (DMS_O_cut$start >= 30)

cox_DMS_O_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                          hv1 + hv2 + cum_boundaries+ ridge(cum_dotBalls) + cluster (id) , data = DMS_O_cut)

cox.zph(cox_DMS_O_heav)
