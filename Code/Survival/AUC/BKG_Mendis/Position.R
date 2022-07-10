bt3 <- data_merge %>% filter(grepl('BKG Mendis' , Striker))

BKG_P_3 <- bt3 %>% filter(bat_position == 3)


cox_BKG_P_3 <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = BKG_P_3)

cox.zph(cox_BKG_P_3)

model_BKG_P_3 <- stepAIC(cox_BKG_P_3)

cox_BKG_P_3_new <- coxph(Surv(cum_balls , wicket) ~ 
                         cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = BKG_P_3)


cox.zph(cox_BKG_P_3_new)



BKG_P_4 <- bt3 %>% filter(bat_position == 4)


cox_BKG_P_4 <- coxph(Surv(cum_balls , wicket) ~ 
                     cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = BKG_P_4)

cox.zph(cox_BKG_P_4)

model_BKG_P_4 <- stepAIC(cox_BKG_P_4)

cox_BKG_P_4_new <- coxph(Surv(cum_balls , wicket) ~ 
                         cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = BKG_P_4)


cox.zph(cox_BKG_P_4_new)
