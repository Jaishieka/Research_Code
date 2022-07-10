cox_ADM_2_new <- coxph(Surv(cum_balls , wicket) ~ 
                         cum_runs +  ridge(cum_dotBalls), data = ADM_2)

test_ADM_2 <- cox.zph(cox_ADM_2_new)
test_ADM_2



cox_ADM_1_new <- coxph(Surv(cum_balls , wicket) ~ 
                         cum_runs +  ridge(cum_dotBalls), data = ADM_1)

test_ADM_1 <- cox.zph(cox_ADM_1_new)
test_ADM_1