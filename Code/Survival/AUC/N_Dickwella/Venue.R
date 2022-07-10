bt11 <- data_merge %>% filter(grepl('N Dickwella' , Striker))

ND_H <- bt11 %>% filter(Venue == "Home")

cox_ND_H <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = ND_H)

model_ND_H <- stepAIC(cox_ND_H)


cox_ND_H_new <- coxph(Surv(cum_balls , wicket) ~ 
                    cum_singles+cum_doubles+ridge(cum_dotBalls), data = ND_H)


cox.zph(cox_ND_H_new)


ND_O <- bt11 %>% filter(Venue == "Overseas")

cox_ND_O <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = ND_O)


model_ND_O <- stepAIC(cox_ND_O)

cox_ND_O_new <- coxph(Surv(cum_balls , wicket) ~ 
                        cum_singles+cum_doubles+ridge(cum_dotBalls), data = ND_O)

cox.zph(cox_ND_O_new)
