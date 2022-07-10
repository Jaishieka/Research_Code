cox_MDKJ_1_new <- coxph(Surv(cum_balls , wicket) ~ 
                          cum_runs + cum_singles + ridge(cum_dotBalls), data = MDKJ_1)

cox.zph(cox_MDKJ_1_new)


cox_MDKJ_2_new <- coxph(Surv(cum_balls , wicket) ~ 
                          cum_runs + cum_singles + ridge(cum_dotBalls), data = MDKJ_2)


cox.zph(cox_MDKJ_2_new)
