cox_LDC_2_new <- coxph(Surv(cum_balls , wicket) ~ 
                          cum_singles + cum_boundaries+ ridge(cum_dotBalls), data = LDC_2)

test_LDC_2 <- cox.zph(cox_LDC_2_new)
test_LDC_2



cox_LDC_1_new <- coxph(Surv(cum_balls , wicket) ~ 
                          cum_singles + cum_boundaries+ ridge(cum_dotBalls), data = LDC_1)

test_LDC_1 <- cox.zph(cox_LDC_1_new)
test_LDC_1