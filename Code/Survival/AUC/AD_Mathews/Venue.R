bt2 <- data_merge %>% filter(grepl('AD Mathews' , Striker))

ADM_H <- bt2 %>% filter(Venue == "Home")

cox_ADM_H <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = ADM_H)

model_ADM_H <- stepAIC(cox_ADM_H)


cox.zph(cox_ADM_H)


ADM_O <- bt2 %>% filter(Venue == "Overseas")

cox_ADM_O <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = ADM_O)


model_ADM_O <- stepAIC(cox_ADM_O)

cox_ADM_O_new <- coxph(Surv(cum_balls , wicket) ~ 
                         cum_runs  +cum_boundaries+ ridge(cum_dotBalls), data = ADM_O)

cox.zph(cox_ADM_O_new)



cox_ADM_H_new <- coxph(Surv(cum_balls , wicket) ~ 
                         cum_runs  +cum_boundaries+ ridge(cum_dotBalls), data = ADM_H)

cox.zph(cox_ADM_H_new)
