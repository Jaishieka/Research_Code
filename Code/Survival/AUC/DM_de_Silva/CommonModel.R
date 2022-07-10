DMS_1_cut <- survSplit(DMS_1 , cut = 27 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

DMS_1_cut$hv1 <- DMS_1_cut$cum_boundaries  * (DMS_1_cut$start < 27)
DMS_1_cut$hv2 <- DMS_1_cut$cum_boundaries  * (DMS_1_cut$start >= 27)

cox_DMS_1_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                          cum_singles +hv1 + hv2 + ridge(cum_dotBalls) + cluster (id) , data = DMS_1_cut)

test_DMS_1_heav <- cox.zph(cox_DMS_1_heav)
test_DMS_1_heav



DMS_2_cut <- survSplit(DMS_2 , cut = 27 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

DMS_2_cut$hv1 <- DMS_2_cut$cum_boundaries  * (DMS_2_cut$start < 27)
DMS_2_cut$hv2 <- DMS_2_cut$cum_boundaries  * (DMS_2_cut$start >= 27)

cox_DMS_2_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                          cum_singles +hv1 + hv2 + ridge(cum_dotBalls) + cluster (id) , data = DMS_2_cut)

test_DMS_2_heav <- cox.zph(cox_DMS_2_heav)
test_DMS_2_heav

