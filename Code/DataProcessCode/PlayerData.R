data_INN_1 <- data_merge %>% filter(innings == 1)
data_INN_2 <- data_merge %>% filter(innings == 2)

data_ven_H <- data_merge %>% filter(Venue == "Home")
data_ven_O <- data_merge %>% filter(Venue == "Overseas")



Matches_1 <- data_INN_1 %>% select(Match_Number,Striker) %>% 
  group_by(Striker) %>% 
  summarise(count_match = n_distinct(Match_Number)) %>% 
  filter(count_match >= 10)

view(Matches_1)


Matches_2 <- data_INN_2 %>% select(Match_Number,Striker) %>% 
  group_by(Striker) %>% 
  summarise(count_match = n_distinct(Match_Number)) %>% 
  filter(count_match >= 10)

view(Matches_2)



Matches_H <- data_ven_H %>% select(Match_Number,Striker) %>% 
  group_by(Striker) %>% 
  summarise(count_match = n_distinct(Match_Number)) %>% 
  filter(count_match >= 10)

view(Matches_H)


Matches_O <- data_ven_O %>% select(Match_Number,Striker) %>% 
  group_by(Striker) %>% 
  summarise(count_match = n_distinct(Match_Number)) %>% 
  filter(count_match >= 10)

view(Matches_O)



write.csv(Matches_1, "~/Research/Research---ST426/Data/PlayerData/PlayersAnalysed_1.csv", row.names = FALSE)
write.csv(Matches_2, "~/Research/Research---ST426/Data/PlayerData/PlayersAnalysed_2.csv", row.names = FALSE)
write.csv(Matches_H, "~/Research/Research---ST426/Data/PlayerData/PlayersAnalysed_H.csv", row.names = FALSE)
write.csv(Matches_O, "~/Research/Research---ST426/Data/PlayerData/PlayersAnalysed_O.csv", row.names = FALSE)
