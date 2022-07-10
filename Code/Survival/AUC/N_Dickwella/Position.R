bt11 <- data_merge %>% filter(grepl('N Dickwella' , Striker))

#1
ND_P_1 <- bt11 %>% filter(bat_position == 1)


cox_ND_P_1 <- coxph(Surv(cum_balls , wicket) ~ 
                       cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = ND_P_1)

cox.zph(cox_ND_P_1)

model_ND_P_1 <- stepAIC(cox_ND_P_1)

cox_ND_P_1_new <- coxph(Surv(cum_balls , wicket) ~ 
                           cum_singles + cum_boundaries+ridge(cum_dotBalls), data = ND_P_1)


cox.zph(cox_ND_P_1_new)


#3
ND_P_3 <- bt11 %>% filter(bat_position == 3)


cox_ND_P_3 <- coxph(Surv(cum_balls , wicket) ~ 
                       cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = ND_P_3)

cox.zph(cox_ND_P_3)

model_ND_P_3 <- stepAIC(cox_ND_P_3)

cox_ND_P_3_new <- coxph(Surv(cum_balls , wicket) ~ 
                           cum_singles + cum_boundaries+ridge(cum_dotBalls), data = ND_P_3)


cox.zph(cox_ND_P_3_new)
