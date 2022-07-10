bt10_ps <- bt10 %>% filter(bat_position == c(1,3,4,2))
survdiff(Surv(cum_balls , wicket) ~ bat_position , data = bt10_ps)


AUC(Surv(start,cum_balls , wicket) ~ 
      hv1 + hv2 +cum_boundaries+ridge(cum_dotBalls) + cluster (id) , data = MDKJ_H_cut)




bt12_ps <- bt12 %>% filter(bat_position == c(7,8))
survdiff(Surv(cum_balls , wicket) ~ bat_position , data = bt12_ps)
