O_61 <- O_61 %>% add_column(winning_status = 0 , .after  = "match_date")
O_61 <- O_61 %>% add_column(innings = 4 , .before  = "ball_over")
O_61 <- O_61 %>% add_column(opposition = NA , .after = "match_date")
