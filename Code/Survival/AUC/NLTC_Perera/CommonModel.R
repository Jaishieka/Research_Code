NLTC_1_cut <- survSplit(NLTC_1 , cut = 23 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

NLTC_1_cut$hv1 <- NLTC_1_cut$cum_runs * (NLTC_1_cut$start < 23)
NLTC_1_cut$hv2 <- NLTC_1_cut$cum_runs * (NLTC_1_cut$start >= 23)

NLTC_1_cut$hv3 <- NLTC_1_cut$cum_singles * (NLTC_1_cut$start < 23)
NLTC_1_cut$hv4 <- NLTC_1_cut$cum_singles * (NLTC_1_cut$start >= 23)


cox_NLTC_1_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                           hv1 + hv2 + hv3 + hv4 + ridge(cum_dotBalls) + cluster (id) , data = NLTC_1_cut)

cox.zph(cox_NLTC_1_heav)

NLTC_2_cut <- survSplit(NLTC_2 , cut = 23 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

NLTC_2_cut$hv1 <- NLTC_2_cut$cum_runs * (NLTC_2_cut$start < 23)
NLTC_2_cut$hv2 <- NLTC_2_cut$cum_runs * (NLTC_2_cut$start >= 23)

NLTC_2_cut$hv3 <- NLTC_2_cut$cum_singles * (NLTC_2_cut$start < 23)
NLTC_2_cut$hv4 <- NLTC_2_cut$cum_singles * (NLTC_2_cut$start >= 23)


cox_NLTC_2_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                           hv1 + hv2+ hv3 + hv4 +ridge(cum_dotBalls) + cluster (id) , data = NLTC_2_cut)

cox.zph(cox_NLTC_2_heav)