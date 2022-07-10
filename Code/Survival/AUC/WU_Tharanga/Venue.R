bt15 <- data_merge %>% filter(grepl('WU Tharanga' , Striker))

WUT_H <- bt15 %>% filter(Venue == "Home")

cox_WUT_H <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = WUT_H)
cox.zph(cox_WUT_H)

model_WUT_H <- stepAIC(cox_WUT_H)


cox_WUT_H_new <- coxph(Surv(cum_balls , wicket) ~ 
                         cum_doubles+cum_boundaries+ ridge(cum_dotBalls), data = WUT_H)

cox.zph(cox_WUT_H_new)


WUT_O <- bt15 %>% filter(Venue == "Overseas")

cox_WUT_O <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = WUT_O)


cox.zph(cox_WUT_O)

model_WUT_O <- stepAIC(cox_WUT_O)


cox_WUT_O_new <- coxph(Surv(cum_balls , wicket) ~ 
                         cum_doubles+cum_boundaries+ ridge(cum_dotBalls), data = WUT_O)

cox.zph(cox_WUT_O_new)
