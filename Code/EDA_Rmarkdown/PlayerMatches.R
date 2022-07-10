Matches <- data_merge %>% select(Match_Number,Striker) %>% 
  group_by(Striker) %>% 
  summarise(count_match = n_distinct(Match_Number)) %>% 
  filter(count_match >= 10)

view(Matches)

write.csv(Matches, "~/Research/Research---ST426/Data/PlayerData/PlayersAnalysed.csv", row.names = FALSE)
