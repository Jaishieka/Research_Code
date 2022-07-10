bt3 <- data_merge %>% filter(grepl('BKG Mendis' , Striker))

BKG_H <- bt3 %>% filter(Venue == "Home")

cox_BKG_H <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = BKG_H)

model_BKG_H <- stepAIC(cox_BKG_H)

cox_BKG_H_new <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = BKG_H)


cox.zph(cox_BKG_H_new)



BKG_H_cut <- survSplit(BKG_H , cut = 30 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

BKG_H_cut$hv1 <- BKG_H_cut$cum_singles * (BKG_H_cut$start < 30)
BKG_H_cut$hv2 <- BKG_H_cut$cum_singles * (BKG_H_cut$start >= 30)


cox_BKG_H_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                          hv1 + hv2 +cum_doubles+ cum_boundaries+ridge(cum_dotBalls) + cluster (id) , 
                        data = BKG_H_cut)


cox.zph(cox_BKG_H_heav)




BKG_O <- bt3 %>% filter(Venue == "Overseas")

cox_BKG_O <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = BKG_O)

model_BKG_O <- stepAIC(cox_BKG_O)


cox.zph(cox_ADM_O)



BKG_O_cut <- survSplit(BKG_O , cut = 30 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

BKG_O_cut$hv1 <- BKG_O_cut$cum_singles * (BKG_O_cut$start < 30)
BKG_O_cut$hv2 <- BKG_O_cut$cum_singles * (BKG_O_cut$start >= 30)


cox_BKG_O_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                          hv1 + hv2 +cum_doubles+ cum_boundaries+ridge(cum_dotBalls) + cluster (id) ,
                        data = BKG_O_cut)



cox.zph(cox_BKG_O_heav)
