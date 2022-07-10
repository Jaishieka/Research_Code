bt4 <- data_merge %>% filter(grepl('MD Gunathilaka' , Striker))

#2
MDG_P_2 <- bt4 %>% filter(bat_position == 2)


cox_MDG_P_2 <- coxph(Surv(cum_balls , wicket) ~ 
                       cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = MDG_P_2)

cox.zph(cox_MDG_P_2)

model_MDG_P_2 <- stepAIC(cox_MDG_P_2)

cox_MDG_P_2_new <- coxph(Surv(cum_balls , wicket) ~ 
                           cum_runs + cum_doubles +cum_boundaries+ridge(cum_dotBalls), data = MDG_P_2)


cox.zph(cox_MDG_P_2_new)



#1
MDG_P_1 <- bt4 %>% filter(bat_position == 1)


cox_MDG_P_1 <- coxph(Surv(cum_balls , wicket) ~ 
                       cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = MDG_P_1)

cox.zph(cox_MDG_P_1)

model_MDG_P_1 <- stepAIC(cox_MDG_P_1)

cox_MDG_P_1_new <- coxph(Surv(cum_balls , wicket) ~ 
                           cum_runs + cum_doubles +cum_boundaries+ridge(cum_dotBalls), data = MDG_P_1)


cox.zph(cox_MDG_P_1_new)
