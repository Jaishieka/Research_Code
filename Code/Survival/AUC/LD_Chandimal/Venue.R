bt1 <- data_merge %>% filter(grepl('LD Chandimal' , Striker))

LD_H <- bt1 %>% filter(Venue == "Home")

cox_LD_H <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = LD_H)

model_LD_H <- stepAIC(cox_LD_H)


cox_LD_H_new <- coxph(Surv(cum_balls , wicket) ~ 
                    cum_singles+cum_boundaries+ridge(cum_dotBalls), data = LD_H)


cox.zph(cox_LD_H_new)


LD_O <- bt1 %>% filter(Venue == "Overseas")

cox_LD_O <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = LD_O)


model_LD_O <- stepAIC(cox_LD_O)

cox_LD_O_new <- coxph(Surv(cum_balls , wicket) ~ 
                         cum_runs  +cum_boundaries+ ridge(cum_dotBalls), data = LD_O)

cox.zph(cox_LD_O_new)


cox_LD_O_new <- coxph(Surv(cum_balls , wicket) ~ 
                        cum_singles+cum_boundaries+ridge(cum_dotBalls), data = LD_O)


cox.zph(cox_LD_O_new)
