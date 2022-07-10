bt2 <- data_merge %>% filter(grepl('AD Mathews' , Striker))

ADM_P_5 <- bt2 %>% filter(bat_position == 5)


cox_ADM_P_5 <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = ADM_P_5)

cox.zph(cox_ADM_P_5)

model_ADM_P_5 <- stepAIC(cox_ADM_P_5)

cox_ADM_P_5_new <- coxph(Surv(cum_balls , wicket) ~ 
                        cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = ADM_P_5)


cox.zph(cox_ADM_P_5_new)


ADM_P_4 <- bt2 %>% filter(bat_position == 4)


cox_ADM_P_4 <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = ADM_P_4)

cox.zph(cox_ADM_P_4)

model_ADM_P_4 <- stepAIC(cox_ADM_P_4)

cox_ADM_P_4_new <- coxph(Surv(cum_balls , wicket) ~ 
                         cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = ADM_P_4)


cox.zph(cox_ADM_P_4_new)
