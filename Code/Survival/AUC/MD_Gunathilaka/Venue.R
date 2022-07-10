bt4 <- data_merge %>% filter(grepl('MD Gunathilaka' , Striker))

MDG_H <- bt4 %>% filter(Venue == "Home")

cox_MDG_H <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = MDG_H)

model_MDG_H <- stepAIC(cox_MDG_H)

cox_MDG_H_new <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = MDG_H)


cox.zph(cox_MDG_H_new)


MDG_H_cut <- survSplit(MDG_H , cut = 35 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

MDG_H_cut$hv1 <- MDG_H_cut$cum_singles * (MDG_H_cut$start < 35)
MDG_H_cut$hv2 <- MDG_H_cut$cum_singles * (MDG_H_cut$start >= 35)


cox_MDG_H_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                          hv1 + hv2+cum_doubles +cum_boundaries+ridge(cum_dotBalls) + cluster (id) , data = MDG_H_cut)
cox.zph(cox_MDG_H_heav)





MDG_O <- bt4 %>% filter(Venue == "Overseas")

cox_MDG_O <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = MDG_O)


model_MDG_O <- stepAIC(cox_MDG_O)

cox_MDG_O_new <- coxph(Surv(cum_balls , wicket) ~ 
                         cum_runs  +cum_boundaries+ ridge(cum_dotBalls), data = MDG_O)

cox.zph(cox_MDG_O_new)


cox_MDG_O_new <- coxph(Surv(cum_balls , wicket) ~ 
                         cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = MDG_O)


cox.zph(cox_MDG_O_new)



MDG_O_cut <- survSplit(MDG_O , cut = 35 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

MDG_O_cut$hv1 <- MDG_O_cut$cum_singles * (MDG_O_cut$start < 35)
MDG_O_cut$hv2 <- MDG_O_cut$cum_singles * (MDG_O_cut$start >= 35)


cox_MDG_O_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                          hv1 + hv2+cum_doubles +cum_boundaries+ridge(cum_dotBalls) + cluster (id) , 
                        data = MDG_O_cut)
cox.zph(cox_MDG_O_heav)
