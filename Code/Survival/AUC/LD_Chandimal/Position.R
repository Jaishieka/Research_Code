bt1 <- data_merge %>% filter(grepl('LD Chandimal' , Striker))


#4

LD_P_4 <- bt1 %>% filter(bat_position == 4)


cox_LD_P_4 <- coxph(Surv(cum_balls , wicket) ~ 
                       cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = LD_P_4)

cox.zph(cox_LD_P_4)

model_LD_P_4 <- stepAIC(cox_LD_P_4)

cox_LD_P_4_new <- coxph(Surv(cum_balls , wicket) ~ 
                          cum_singles + cum_doubles + cum_boundaries+ridge(cum_dotBalls), data = LD_P_4)


cox.zph(cox_LD_P_4_new)


#5

LD_P_5 <- bt1 %>% filter(bat_position == 5)


cox_LD_P_5 <- coxph(Surv(cum_balls , wicket) ~ 
                       cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = LD_P_5)

cox.zph(cox_LD_P_5)

model_LD_P_5 <- stepAIC(cox_LD_P_5)


cox_LD_P_5_new <- coxph(Surv(cum_balls , wicket) ~ 
                          cum_singles + cum_doubles + cum_boundaries+ridge(cum_dotBalls), data = LD_P_5)


cox.zph(cox_LD_P_5_new)


#3

LD_P_3 <- bt1 %>% filter(bat_position == 3)


cox_LD_P_3 <- coxph(Surv(cum_balls , wicket) ~ 
                       cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = LD_P_3)

cox.zph(cox_LD_P_3)

model_LD_P_3 <- stepAIC(cox_LD_P_3)

cox_LD_P_3_new <- coxph(Surv(cum_balls , wicket) ~ 
                          cum_singles + cum_doubles + cum_boundaries+ridge(cum_dotBalls), data = LD_P_3)


cox.zph(cox_LD_P_3_new)
