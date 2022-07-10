MDG_2_cut <- survSplit(MDG_2 , cut = 38 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

MDG_2_cut$hv1 <- MDG_2_cut$cum_singles * (MDG_2_cut$start < 38)
MDG_2_cut$hv2 <- MDG_2_cut$cum_singles * (MDG_2_cut$start >= 38)


cox_MDG_2_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                          hv1 + hv2  + ridge(cum_dotBalls) + cluster (id) , data = MDG_2_cut)

test_MDG_2_heav <- cox.zph(cox_MDG_2_heav)
test_MDG_2_heav




MDG_1_cut <- survSplit(MDG_1 , cut = 38 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

MDG_1_cut$hv1 <- MDG_1_cut$cum_singles * (MDG_1_cut$start < 38)
MDG_1_cut$hv2 <- MDG_1_cut$cum_singles * (MDG_1_cut$start >= 38)


cox_MDG_1_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                         hv1 + hv2 +  ridge(cum_dotBalls) + cluster (id) , data = MDG_1_cut)

test_MDG_1_heav <- cox.zph(cox_MDG_1_heav)
test_MDG_1_heav
