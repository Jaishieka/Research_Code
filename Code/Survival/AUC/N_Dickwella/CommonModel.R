cox_ND_1_new <- coxph(Surv(cum_balls , wicket) ~ 
                        cum_runs + cum_singles + cum_doubles + ridge(cum_dotBalls), data = ND_1)



ND_1_cut <- survSplit(ND_1 , cut = 35 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

ND_1_cut$hv1 <- ND_1_cut$cum_runs * (ND_1_cut$start < 35)
ND_1_cut$hv2 <- ND_1_cut$cum_runs * (ND_1_cut$start >= 35)


cox_ND_1_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                         hv1 + hv2 ++ cum_singles + cum_doubles + cum_boundaries+ ridge(cum_dotBalls)+ cluster (id) , 
                       data = ND_1_cut)
cox.zph(cox_ND_1_heav)


ND_2_cut <- survSplit(ND_2 , cut = 35 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

ND_2_cut$hv1 <- ND_2_cut$cum_runs * (ND_2_cut$start < 35)
ND_2_cut$hv2 <- ND_2_cut$cum_runs * (ND_2_cut$start >= 35)


cox_ND_2_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                         hv1 + hv2 ++ cum_singles + cum_doubles + cum_boundaries+ ridge(cum_dotBalls)+ cluster (id) , 
                       data = ND_2_cut)

cox.zph(cox_ND_2_heav)
