BKG_1_cut <- survSplit(BKG_1 , cut = 35 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

BKG_1_cut$hv1 <- BKG_1_cut$cum_singles * (BKG_1_cut$start < 35)
BKG_1_cut$hv2 <- BKG_1_cut$cum_singles * (BKG_1_cut$start >= 35)


cox_BKG_1_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                          hv1 + hv2 + cum_boundaries+ridge(cum_dotBalls) + cluster (id) , data = BKG_1_cut)

test_BKG_1_heav <- cox.zph(cox_BKG_1_heav)
test_BKG_1_heav



BKG_2_cut <- survSplit(BKG_2 , cut = 35 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

BKG_2_cut$hv1 <- BKG_2_cut$cum_singles * (BKG_2_cut$start < 35)
BKG_2_cut$hv2 <- BKG_2_cut$cum_singles * (BKG_2_cut$start >= 35)


cox_BKG_2_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                          hv1 + hv2 +  cum_boundaries+ridge(cum_dotBalls) + cluster (id) , data = BKG_2_cut)

test_BKG_2_heav <- cox.zph(cox_BKG_2_heav)
test_BKG_2_heav