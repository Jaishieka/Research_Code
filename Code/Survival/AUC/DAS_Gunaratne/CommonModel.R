DAS_2_cut <- survSplit(DAS_2 , cut = 25 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

DAS_2_cut$hv1 <- DAS_2_cut$cum_runs  * (DAS_2_cut$start < 25)
DAS_2_cut$hv2 <- DAS_2_cut$cum_runs  * (DAS_2_cut$start >= 25)

DAS_2_cut$hv3 <- DAS_2_cut$cum_boundaries  * (DAS_2_cut$start < 25)
DAS_2_cut$hv4 <- DAS_2_cut$cum_boundaries  * (DAS_2_cut$start >= 25)


cox_DAS_2_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                          hv1 + hv2 + cum_doubles+hv3 + hv4+ridge(cum_dotBalls) + cluster (id) , data = DAS_2_cut)

test_DAS_2_heav <- cox.zph(cox_DAS_2_heav)
test_DAS_2_heav




DAS_1_cut <- survSplit(DAS_1 , cut = 25 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

DAS_1_cut$hv1 <- DAS_1_cut$cum_runs  * (DAS_1_cut$start < 25)
DAS_1_cut$hv2 <- DAS_1_cut$cum_runs  * (DAS_1_cut$start >= 25)

DAS_1_cut$hv3 <- DAS_1_cut$cum_boundaries  * (DAS_1_cut$start < 25)
DAS_1_cut$hv4 <- DAS_1_cut$cum_boundaries  * (DAS_1_cut$start >= 25)


cox_DAS_1_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                          hv1 + hv2 + cum_doubles+hv3 + hv4+ridge(cum_dotBalls) + cluster (id) , data = DAS_1_cut)

test_DAS_1_heav <- cox.zph(cox_DAS_1_heav)
test_DAS_1_heav