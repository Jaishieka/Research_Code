#Editing the player dismissal 
x = allR1 %>% filter(dismissal == 2)
view(x)

FullData <- edit(FullData)
view(FullData)

FullData <- FullData %>% mutate(Match_Number = recode(Match_Number,
                                                      "H_1" = "H_01" , "H_2" = "H_02" , "H_3" = "H_03" , "H_4" = "H_04" , "H_5" = "H_05" , "H_6" = "H_06" , "H_7" = "H_07" , 
                                                      "H_8" = "H_08" , "H_9" = "H_09" , "O_1" = "O_01" , "O_2" = "O_02" , "O_3" = "O_03" , "O_4" = "O_04" , "O_5" = "O_05" ,
                                                      "O_6" = "O_06" , "O_7" = "O_07" , "O_8" = "O_08" , "O_9" = "O_09"))

unique(FullData$Match_Number)



#Add player position
FullData <- FullData %>% add_column(bat_position = 0 , .after = "ball_over")
head(FullData)

FullData <- FullData %>% add_column(match_date = NA , .before  = "ball_over")
head(FullData)

FullData <- FullData %>% add_column(winning_status = 0 , .after  = "match_date")
head(FullData)

FullData <- FullData %>% add_column(innings = 1 , .before  = "ball_over")
head(FullData)

FullData <- FullData %>% add_column(opposition = NA , .after = "match_date")

#H_01
H_01 <- FullData %>% filter(grepl('H_01' , Match_Number))
H_01$match_date <- "21/08/2016"
H_01$opposition <- "Australia"
H_01$winning_status = 0
H_01$innings = 1
H_01 <- H_01 %>% arrange(ball_over)
H_01 <- edit(H_01)
H_01 <- H_01 %>% select(-X)
head(H_01)
write.csv(H_01 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_01.csv" , row.names = FALSE)

#H_02
H_02 <- FullData %>% filter(grepl('H_02' , Match_Number))
H_02$match_date <- "04/09/2016"
H_02$opposition <- "Australia"
H_02$winning_status = 0
H_02$innings = 1
H_02 <- H_02 %>% arrange(ball_over)
H_02 <- edit(H_02)
H_02 <- H_02 %>% select(-X)
head(H_02)
write.csv(H_02 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_02.csv" , row.names = FALSE)

#H_03
H_03 <- FullData %>% filter(grepl('H_03' , Match_Number))
H_03$match_date <- "31/08/2016"
H_03$opposition <- "Australia"
H_03$winning_status = 0
H_03$innings = 1
H_03 <- H_03 %>% arrange(ball_over)
H_03 <- edit(H_03)
H_03 <- H_03 %>% select(-X)
head(H_03)
write.csv(H_03 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_03.csv" , row.names = FALSE)


#H_04
H_04 <- FullData %>% filter(grepl('H_04' , Match_Number))
H_04$match_date <- "28/08/2016"
H_04$opposition <- "Australia"
H_04$winning_status = 0
H_04$innings = 1
H_04 <- H_04 %>% arrange(ball_over)
H_04 <- edit(H_04)
H_04 <- H_04 %>% select(-X)
head(H_04)
write.csv(H_04 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_04.csv" , row.names = FALSE)


#H_05
H_05 <- FullData %>% filter(grepl('H_05' , Match_Number))
H_05$match_date <- "24/08/2016"
H_05$opposition <- "Australia"
H_05$winning_status = 1
H_05$innings = 1
H_05 <- H_05 %>% arrange(ball_over)
H_05 <- edit(H_05)
H_05 <- H_05 %>% select(-X)
head(H_05)
write.csv(H_05 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_05.csv" , row.names = FALSE)


#H_06
H_06 <- FullData %>% filter(grepl('H_06' , Match_Number))
H_06$match_date <- "01/04/2017"
H_06$opposition <- "Bangladesh"
H_06$winning_status = 1
H_06$innings = 1
H_06 <- H_06 %>% arrange(ball_over)
H_06 <- edit(H_06)
H_06 <- H_06 %>% select(-X)
head(H_06)
write.csv(H_06 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_06.csv" , row.names = FALSE)


#H_07
H_07 <- FullData %>% filter(grepl('H_07' , Match_Number))
H_07$match_date <- "28/03/2017"
H_07$opposition <- "Bangladesh"
H_07$winning_status = 2
H_07$innings = 1
H_07 <- H_07 %>% arrange(ball_over)
H_07 <- edit(H_07)
H_07 <- H_07 %>% select(-X)
head(H_07)
write.csv(H_07 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_07.csv" , row.names = FALSE)



#H_08
H_08 <- FullData %>% filter(grepl('H_08' , Match_Number))
H_08$match_date <- "25/03/2017"
H_08$opposition <- "Bangladesh"
H_08$winning_status = 0
H_08$innings = 2
H_08 <- H_08 %>% arrange(ball_over)
H_08 <- edit(H_08)
H_08 <- H_08 %>% select(-X)
head(H_08)
write.csv(H_08 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_08.csv" , row.names = FALSE)


#H_09
H_09 <- FullData %>% filter(grepl('H_09' , Match_Number))
H_09$match_date <- "10/07/2017"
H_09$opposition <- "Zimbabwe"
H_09$winning_status = 0
H_09$innings = 1
H_09 <- H_09 %>% arrange(ball_over)
H_09 <- edit(H_09)
H_09 <- H_09 %>% select(-X)
head(H_09)
write.csv(H_09 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_09.csv" , row.names = FALSE)


#H_10
H_10 <- FullData %>% filter(grepl('H_10' , Match_Number))
H_10$match_date <- "08/07/2017"
H_10$opposition <- "Zimbabwe"
H_10$winning_status = 0
H_10$innings = 1
H_10 <- H_10 %>% arrange(ball_over)
H_10 <- edit(H_10)
H_10 <- H_10 %>% select(-X)
head(H_10)
write.csv(H_10 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_10.csv" , row.names = FALSE)


#H_11
H_11 <- FullData %>% filter(grepl('H_11' , Match_Number))
H_11$match_date <- "06/07/2017"
H_11$opposition <- "Zimbabwe"
H_11$winning_status = 1
H_11$innings = 2
H_11 <- H_11 %>% arrange(ball_over)
H_11 <- edit(H_11)
H_11 <- H_11 %>% select(-X)
head(H_11)
write.csv(H_11 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_11.csv" , row.names = FALSE)

#H_12
H_12 <- FullData %>% filter(grepl('H_12' , Match_Number))
H_12$match_date <- "02/07/2017"
H_12$opposition <- "Zimbabwe"
H_12$winning_status = 1
H_12$innings = 2
H_12 <- H_12 %>% arrange(ball_over)
H_12 <- edit(H_12)
H_12 <- H_12 %>% select(-X)
head(H_12)
write.csv(H_12 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_12.csv" , row.names = FALSE)

#H_13
H_13 <- FullData %>% filter(grepl('H_13' , Match_Number))
H_13$match_date <- "30/06/2017"
H_13$opposition <- "Zimbabwe"
H_13$winning_status = 0
H_13$innings = 1
H_13 <- H_13 %>% arrange(ball_over)
H_13 <- edit(H_13)
H_13 <- H_13 %>% select(-X)
head(H_13)
write.csv(H_13 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_13.csv" , row.names = FALSE)

#H_14
H_14 <- FullData %>% filter(grepl('H_14' , Match_Number))
H_14$match_date <- "03/09/2017"
H_14$opposition <- "India"
H_14$winning_status = 0
H_14$innings = 1
H_14 <- H_14 %>% arrange(ball_over)
H_14 <- edit(H_14)
H_14 <- H_14 %>% select(-X)
head(H_14)
write.csv(H_14 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_14.csv" , row.names = FALSE)

#H_15
H_15 <- FullData %>% filter(grepl('H_15' , Match_Number))
H_15$match_date <- "31/08/2017"
H_15$opposition <- "India"
H_15$winning_status = 0
H_15$innings = 2
H_15 <- H_15 %>% arrange(ball_over)
H_15 <- edit(H_15)
H_15 <- H_15 %>% select(-X)
head(H_15)
write.csv(H_15 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_15.csv" , row.names = FALSE)

#H_16
H_16 <- FullData %>% filter(grepl('H_16' , Match_Number))
H_16$match_date <- "27/08/2017"
H_16$opposition <- "India"
H_16$winning_status = 0
H_16$innings = 1
H_16 <- H_16 %>% arrange(ball_over)
H_16 <- edit(H_16)
H_16 <- H_16 %>% select(-X)
head(H_16)
write.csv(H_16 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_16.csv" , row.names = FALSE)

#H_17
H_17 <- FullData %>% filter(grepl('H_17' , Match_Number))
H_17$match_date <- "24/08/2017"
H_17$opposition <- "India"
H_17$winning_status = 0
H_17$innings = 1
H_17 <- H_17 %>% arrange(ball_over)
H_17 <- edit(H_17)
H_17 <- H_17 %>% select(-X)
head(H_17)
write.csv(H_17 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_17.csv" , row.names = FALSE)

#H_18
H_18 <- FullData %>% filter(grepl('H_18' , Match_Number))
H_18$match_date <- "20/08/2017"
H_18$opposition <- "India"
H_18$winning_status = 0
H_18$innings = 1
H_18 <- H_18 %>% arrange(ball_over)
H_18 <- edit(H_18)
H_18 <- H_18 %>% select(-X)
head(H_18)
write.csv(H_18 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_18.csv" , row.names = FALSE)

#H_19
H_19 <- FullData %>% filter(grepl('H_19' , Match_Number))
H_19$match_date <- "12/08/2018"
H_19$opposition <- "South Africa"
H_19$winning_status = 1
H_19$innings = 1
H_19 <- H_19 %>% arrange(ball_over)
H_19 <- edit(H_19)
H_19 <- H_19 %>% select(-X)
head(H_19)
write.csv(H_19 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_19.csv" , row.names = FALSE)

#H_20
H_20 <- FullData %>% filter(grepl('H_20' , Match_Number))
H_20$match_date <- "08/08/2018"
H_20$opposition <- "South Africa"
H_20$winning_status = 1
H_20$innings = 1
H_20 <- H_20 %>% arrange(ball_over)
H_20 <- edit(H_20)
H_20 <- H_20 %>% select(-X)
head(H_20)
write.csv(H_20 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_20.csv" , row.names = FALSE)

#H_21
H_21 <- FullData %>% filter(grepl('H_21' , Match_Number))
H_21$match_date <- "05/08/2018"
H_21$opposition <- "South Africa"
H_21$winning_status = 0
H_21$innings = 2
H_21 <- H_21 %>% arrange(ball_over)
H_21 <- edit(H_21)
H_21 <- H_21 %>% select(-X)
head(H_21)
write.csv(H_21 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_21.csv" , row.names = FALSE)

#H_22
H_22 <- FullData %>% filter(grepl('H_22' , Match_Number))
H_22$match_date <- "01/08/2018"
H_22$opposition <- "South Africa"
H_22$winning_status = 0
H_22$innings = 1
H_22 <- H_22 %>% arrange(ball_over)
H_22 <- edit(H_22)
H_22 <- H_22 %>% select(-X)
head(H_22)
write.csv(H_22 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_22.csv" , row.names = FALSE)

#H_23
H_23 <- FullData %>% filter(grepl('H_23' , Match_Number))
H_23$match_date <- "29/07/2018"
H_23$opposition <- "South Africa"
H_23$winning_status = 0
H_23$innings = 1
H_23 <- H_23 %>% arrange(ball_over)
H_23 <- edit(H_23)
H_23 <- H_23 %>% select(-X)
head(H_23)
write.csv(H_23 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_23.csv" , row.names = FALSE)

#H_24
H_24 <- FullData %>% filter(grepl('H_24' , Match_Number))
H_24$match_date <- "23/10/2018"
H_24$opposition <- "England"
H_24$winning_status = 1
H_24$innings = 1
H_24 <- H_24 %>% arrange(ball_over)
H_24 <- edit(H_24)
H_24 <- H_24 %>% select(-X)
head(H_24)
write.csv(H_24 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_24.csv" , row.names = FALSE)

#H_25
H_25 <- FullData %>% filter(grepl('H_25' , Match_Number))
H_25$match_date <- "20/10/2018"
H_25$opposition <- "England"
H_25$winning_status = 0
H_25$innings = 1
H_25 <- H_25 %>% arrange(ball_over)
H_25 <- edit(H_25)
H_25 <- H_25 %>% select(-X)
head(H_25)
write.csv(H_25 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_25.csv" , row.names = FALSE)

#H_26
H_26 <- FullData %>% filter(grepl('H_26' , Match_Number))
H_26$match_date <- "17/10/2018"
H_26$opposition <- "England"
H_26$winning_status = 0
H_26$innings = 1
H_26 <- H_26 %>% arrange(ball_over)
H_26 <- edit(H_26)
H_26 <- H_26 %>% select(-X)
head(H_26)
write.csv(H_26 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_26.csv" , row.names = FALSE)

#H_27
H_27 <- FullData %>% filter(grepl('H_27' , Match_Number))
H_27$match_date <- "13/10/2018"
H_27$opposition <- "England"
H_27$winning_status = 0
H_27$innings = 2
H_27 <- H_27 %>% arrange(ball_over)
H_27 <- edit(H_27)
H_27 <- H_27 %>% select(-X)
head(H_27)
write.csv(H_27 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_27.csv" , row.names = FALSE)

#H_28
H_28 <- FullData %>% filter(grepl('H_28' , Match_Number))
H_28$match_date <- "31/07/2019"
H_28$opposition <- "Bangladesh"
H_28$winning_status = 1
H_28$innings = 1
H_28 <- H_28 %>% arrange(ball_over)
H_28 <- edit(H_28)
H_28 <- H_28 %>% select(-X)
head(H_28)
write.csv(H_28 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_28.csv" , row.names = FALSE)

#H_29
H_29 <- FullData %>% filter(grepl('H_29' , Match_Number))
H_29$match_date <- "28/07/2019"
H_29$opposition <- "Bangladesh"
H_29$winning_status = 1
H_29$innings = 2
H_29 <- H_29 %>% arrange(ball_over)
H_29 <- edit(H_29)
H_29 <- H_29 %>% select(-X)
head(H_29)
write.csv(H_29 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_29.csv" , row.names = FALSE)

#H_30
H_30 <- FullData %>% filter(grepl('H_30' , Match_Number))
H_30$match_date <- "26/07/2019"
H_30$opposition <- "Bangladesh"
H_30$winning_status = 1
H_30$innings = 1
H_30 <- H_30 %>% arrange(ball_over)
H_30 <- edit(H_30)
H_30 <- H_30 %>% select(-X)
head(H_30)
write.csv(H_30 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_30.csv" , row.names = FALSE)

#H_31
H_31 <- FullData %>% filter(grepl('H_31' , Match_Number))
H_31$match_date <- "01/03/2020"
H_31$opposition <- "West Indies"
H_31$winning_status = 1
H_31$innings = 1
H_31 <- H_31 %>% arrange(ball_over)
H_31 <- edit(H_31)
H_31 <- H_31 %>% select(-X)
head(H_31)
write.csv(H_31 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_31.csv" , row.names = FALSE)

#H_32
H_32 <- FullData %>% filter(grepl('H_32' , Match_Number))
H_32$match_date <- "26/02/2020"
H_32$opposition <- "West Indies"
H_32$winning_status = 1
H_32$innings = 1
H_32 <- H_32 %>% arrange(ball_over)
H_32 <- edit(H_32)
H_32 <- H_32 %>% select(-X)
head(H_32)
write.csv(H_32 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_32.csv" , row.names = FALSE)

#H_33
H_33 <- FullData %>% filter(grepl('H_33' , Match_Number))
H_33$match_date <- "22/02/2020"
H_33$opposition <- "West Indies"
H_33$winning_status = 1
H_33$innings = 2
H_33 <- H_33 %>% arrange(ball_over)
H_33 <- edit(H_33)
H_33 <- H_33 %>% select(-X)
head(H_33)
write.csv(H_33 , "~/Research/Research---ST426/Data/NewData/Player/Home/H_33.csv" , row.names = FALSE)






#O_01
O_01 <- FullData %>% filter(grepl('O_01' , Match_Number))
O_01$match_date <- "05/01/2016"
O_01$opposition <- "New Zealand"
O_01$winning_status = 0
O_01$innings = 2
O_01 <- O_01 %>% arrange(ball_over)
O_01 <- edit(O_01)
O_01 <- O_01 %>% select(-X)
head(O_01)
write.csv(O_01 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_01.csv" , row.names = FALSE)

#O_02
O_02 <- FullData %>% filter(grepl('O_02' , Match_Number))
O_02$match_date <- "02/07/2016"
O_02$opposition <- "England"
O_02$winning_status = 0
O_02$innings = 2
O_02 <- O_02 %>% arrange(ball_over)
O_02 <- edit(O_02)
O_02 <- O_02 %>% select(-X)
head(O_02)
write.csv(O_02 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_02.csv" , row.names = FALSE)

#O_03
O_03 <- FullData %>% filter(grepl('O_03' , Match_Number))
O_03$match_date <- "29/06/2016"
O_03$opposition <- "England"
O_03$winning_status = 0
O_03$innings = 1
O_03 <- O_03 %>% arrange(ball_over)
O_03 <- edit(O_03)
O_03 <- O_03 %>% select(-X)
head(O_03)
write.csv(O_03 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_03.csv" , row.names = FALSE)

#O_04
O_04 <- FullData %>% filter(grepl('O_04' , Match_Number))
O_04$match_date <- "26/06/2016"
O_04$opposition <- "England"
O_04$winning_status = 2
O_04$innings = 1
O_04 <- O_04 %>% arrange(ball_over)
O_04 <- edit(O_04)
O_04 <- O_04 %>% select(-X)
head(O_04)
write.csv(O_04 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_04.csv" , row.names = FALSE)

#O_05
O_05 <- FullData %>% filter(grepl('O_05' , Match_Number))
O_05$match_date <- "24/06/2016"
O_05$opposition <- "England"
O_05$winning_status = 0
O_05$innings = 1
O_05 <- O_05 %>% arrange(ball_over)
O_05 <- edit(O_05)
O_05 <- O_05 %>% select(-X)
head(O_05)
write.csv(O_05 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_05.csv" , row.names = FALSE)

#O_06
O_06 <- FullData %>% filter(grepl('O_06' , Match_Number))
O_06$match_date <- "21/06/2016"
O_06$opposition <- "England"
O_06$winning_status = 2
O_06$innings = 1
O_06 <- O_06 %>% arrange(ball_over)
O_06 <- edit(O_06)
O_06 <- O_06 %>% select(-X)
head(O_06)
write.csv(O_06 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_06.csv" , row.names = FALSE)

#O_07
O_07 <- FullData %>% filter(grepl('O_07' , Match_Number))
O_07$match_date <- "18/06/2016"
O_07$opposition <- "Ireland"
O_07$winning_status = 1
O_07$innings = 1
O_07 <- O_07 %>% arrange(ball_over)
O_07 <- edit(O_07)
O_07 <- O_07 %>% select(-X)
head(O_07)
write.csv(O_07 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_07.csv" , row.names = FALSE)

#O_08
O_08 <- FullData %>% filter(grepl('O_08' , Match_Number))
O_08$match_date <- "27/11/2016"
O_08$opposition <- "Zimbabwe"
O_08$winning_status = 1
O_08$innings = 2
O_08 <- O_08 %>% arrange(ball_over)
O_08 <- edit(O_08)
O_08 <- O_08 %>% select(-X)
head(O_08)
write.csv(O_08 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_08.csv" , row.names = FALSE)

#O_09
O_09 <- FullData %>% filter(grepl('O_09' , Match_Number))
O_09$match_date <- "23/11/2016"
O_09$opposition <- "West Indies"
O_09$winning_status = 1
O_09$innings = 1
O_09 <- O_09 %>% arrange(ball_over)
O_09 <- edit(O_09)
O_09 <- O_09 %>% select(-X)
head(O_09)
write.csv(O_09 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_09.csv" , row.names = FALSE)

#O_10
O_10 <- FullData %>% filter(grepl('O_10' , Match_Number))
O_10$match_date <- "16/11/2016"
O_10$opposition <- "West Indies"
O_10$winning_status = 0
O_10$innings = 2
O_10 <- O_10 %>% arrange(ball_over)
O_10 <- edit(O_10)
O_10 <- O_10 %>% select(-X)
head(O_10)
write.csv(O_10 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_10.csv" , row.names = FALSE)

#O_11
O_11 <- FullData %>% filter(grepl('O_11' , Match_Number))
O_11$match_date <- "14/11/2016"
O_11$opposition <- "Zimbabwe"
O_11$winning_status = 1
O_11$innings = 2
O_11 <- O_11 %>% arrange(ball_over)
O_11 <- edit(O_11)
O_11 <- O_11 %>% select(-X)
head(O_11)
write.csv(O_11 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_11.csv" , row.names = FALSE)

#O_12
O_12 <- FullData %>% filter(grepl('O_12' , Match_Number))
O_12$match_date <- "10/02/2017"
O_12$opposition <- "South Africa"
O_12$winning_status = 0
O_12$innings = 2
O_12 <- O_12 %>% arrange(ball_over)
O_12 <- edit(O_12)
O_12 <- O_12 %>% select(-X)
head(O_12)
write.csv(O_12 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_12.csv" , row.names = FALSE)

#O_13
O_13 <- FullData %>% filter(grepl('O_13' , Match_Number))
O_13$match_date <- "07/02/2017"
O_13$opposition <- "South Africa"
O_13$winning_status = 0
O_13$innings = 2
O_13 <- O_13 %>% arrange(ball_over)
O_13 <- edit(O_13)
O_13 <- O_13 %>% select(-X)
head(O_13)
write.csv(O_13 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_13.csv" , row.names = FALSE)

#O_14
O_14 <- FullData %>% filter(grepl('O_14' , Match_Number))
O_14$match_date <- "04/02/2017"
O_14$opposition <- "South Africa"
O_14$winning_status = 0
O_14$innings = 1
O_14 <- O_14 %>% arrange(ball_over)
O_14 <- edit(O_14)
O_14 <- O_14 %>% select(-X)
head(O_14)
write.csv(O_14 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_14.csv" , row.names = FALSE)

#O_15
O_15 <- FullData %>% filter(grepl('O_15' , Match_Number))
O_15$match_date <- "01/02/2017"
O_15$opposition <- "South Africa"
O_15$winning_status = 0
O_15$innings = 2
O_15 <- O_15 %>% arrange(ball_over)
O_15 <- edit(O_15)
O_15 <- O_15 %>% select(-X)
head(O_15)
write.csv(O_15 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_15.csv" , row.names = FALSE)

#O_16
O_16 <- FullData %>% filter(grepl('O_16' , Match_Number))
O_16$match_date <- "28/01/2017"
O_16$opposition <- "South Africa"
O_16$winning_status = 0
O_16$innings = 1
O_16 <- O_16 %>% arrange(ball_over)
O_16 <- edit(O_16)
O_16 <- O_16 %>% select(-X)
head(O_16)
write.csv(O_16 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_16.csv" , row.names = FALSE)

#O_17
O_17 <- FullData %>% filter(grepl('O_17' , Match_Number))
O_17$match_date <- "03/06/2017"
O_17$opposition <- "South Africa"
O_17$winning_status = 0
O_17$innings = 2
O_17 <- O_17 %>% arrange(ball_over)
O_17 <- edit(O_17)
O_17 <- O_17 %>% select(-X)
head(O_17)
write.csv(O_17 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_17.csv" , row.names = FALSE)

#O_18
O_18 <- FullData %>% filter(grepl('O_18' , Match_Number))
O_18$match_date <- "08/06/2016"
O_18$opposition <- "India"
O_18$winning_status = 1
O_18$innings = 2
O_18 <- O_18 %>% arrange(ball_over)
O_18 <- edit(O_18)
O_18 <- O_18 %>% select(-X)
head(O_18)
write.csv(O_18 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_18.csv" , row.names = FALSE)

#O_19
O_19 <- FullData %>% filter(grepl('O_19' , Match_Number))
O_19$match_date <- "12/06/2017"
O_19$opposition <- "Pakistan"
O_19$winning_status = 0
O_19$innings = 1
O_19 <- O_19 %>% arrange(ball_over)
O_19 <- edit(O_19)
O_19 <- O_19 %>% select(-X)
head(O_19)
write.csv(O_19 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_19.csv" , row.names = FALSE)

#O_20
O_20 <- FullData %>% filter(grepl('O_20' , Match_Number))
O_20$match_date <- "23/10/2017"
O_20$opposition <- "Pakistan"
O_20$winning_status = 0
O_20$innings = 1
O_20 <- O_20 %>% arrange(ball_over)
O_20 <- edit(O_20)
O_20 <- O_20 %>% select(-X)
head(O_20)
write.csv(O_20 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_20.csv" , row.names = FALSE)


#O_21
O_21 <- FullData %>% filter(grepl('O_21' , Match_Number))
O_21$match_date <- "20/10/2017"
O_21$opposition <- "Pakistan"
O_21$winning_status = 0
O_21$innings = 1
O_21 <- O_21 %>% arrange(ball_over)
O_21 <- edit(O_21)
O_21 <- O_21 %>% select(-X)
head(O_21)
write.csv(O_21 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_21.csv" , row.names = FALSE)

#O_22
O_22 <- FullData %>% filter(grepl('O_22' , Match_Number))
O_22$match_date <- "18/10/2017"
O_22$opposition <- "Pakistan"
O_22$winning_status = 0
O_22$innings = 1
O_22 <- O_22 %>% arrange(ball_over)
O_22 <- edit(O_22)
O_22 <- O_22 %>% select(-X)
head(O_22)
write.csv(O_22 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_22.csv" , row.names = FALSE)

#O_23
O_23 <- FullData %>% filter(grepl('O_23' , Match_Number))
O_23$match_date <- "16/10/2017"
O_23$opposition <- "Pakistan"
O_23$winning_status = 0
O_23$innings = 2
O_23 <- O_23 %>% arrange(ball_over)
O_23 <- edit(O_23)
O_23 <- O_23 %>% select(-X)
head(O_23)
write.csv(O_23 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_23.csv" , row.names = FALSE)

#O_24
O_24 <- FullData %>% filter(grepl('O_24' , Match_Number))
O_24$match_date <- "13/10/2017"
O_24$opposition <- "Pakistan"
O_24$winning_status = 0
O_24$innings = 2
O_24 <- O_24 %>% arrange(ball_over)
O_24 <- edit(O_24)
O_24 <- O_24 %>% select(-X)
head(O_24)
write.csv(O_24 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_24.csv" , row.names = FALSE)

#O_25
O_25 <- FullData %>% filter(grepl('O_25' , Match_Number))
O_25$match_date <- "17/12/2017"
O_25$opposition <- "India"
O_25$winning_status = 0
O_25$innings = 1
O_25 <- O_25 %>% arrange(ball_over)
O_25 <- edit(O_25)
O_25 <- O_25 %>% select(-X)
head(O_25)
write.csv(O_25 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_25.csv" , row.names = FALSE)

#O_26
O_26 <- FullData %>% filter(grepl('O_26' , Match_Number))
O_26$match_date <- "13/12/2017"
O_26$opposition <- "India"
O_26$winning_status = 0
O_26$innings = 2
O_26 <- O_26 %>% arrange(ball_over)
O_26 <- edit(O_26)
O_26 <- O_26 %>% select(-X)
head(O_26)
write.csv(O_26 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_26.csv" , row.names = FALSE)

#O_27
O_27 <- FullData %>% filter(grepl('O_27' , Match_Number))
O_27$match_date <- "10/12/2017"
O_27$opposition <- "India"
O_27$winning_status = 1
O_27$innings = 2
O_27 <- O_27 %>% arrange(ball_over)
O_27 <- edit(O_27)
O_27 <- O_27 %>% select(-X)
head(O_27)
write.csv(O_27 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_27.csv" , row.names = FALSE)

#O_28
O_28 <- FullData %>% filter(grepl('O_28' , Match_Number))
O_28$match_date <- "27/01/2018"
O_28$opposition <- "Bangladesh"
O_28$winning_status = 1
O_28$innings = 1
O_28 <- O_28 %>% arrange(ball_over)
O_28 <- edit(O_28)
O_28 <- O_28 %>% select(-X)
head(O_28)
write.csv(O_28 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_28.csv" , row.names = FALSE)


#O_29
O_29 <- FullData %>% filter(grepl('O_29' , Match_Number))
O_29$match_date <- "25/01/2018"
O_29$opposition <- "Bangladesh"
O_29$winning_status = 1
O_29$innings = 2
O_29 <- O_29 %>% arrange(ball_over)
O_29 <- edit(O_29)
O_29 <- O_29 %>% select(-X)
head(O_29)
write.csv(O_29 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_29.csv" , row.names = FALSE)


#O_30
O_30 <- FullData %>% filter(grepl('O_30' , Match_Number))
O_30$match_date <- "21/01/2018"
O_30$opposition <- "Zimbabwe"
O_30$winning_status = 1
O_30$innings = 2
O_30 <- O_30 %>% arrange(ball_over)
O_30 <- edit(O_30)
O_30 <- O_30 %>% select(-X)
head(O_30)
write.csv(O_30 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_30.csv" , row.names = FALSE)


#O_31
O_31 <- FullData %>% filter(grepl('O_31' , Match_Number))
O_31$match_date <- "19/01/2018"
O_31$opposition <- "Bangladesh"
O_31$winning_status = 0
O_31$innings = 2
O_31 <- O_31 %>% arrange(ball_over)
O_31 <- edit(O_31)
O_31 <- O_31 %>% select(-X)
head(O_31)
write.csv(O_31 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_31.csv" , row.names = FALSE)


#O_32
O_32 <- FullData %>% filter(grepl('O_32' , Match_Number))
O_32$match_date <- "17/01/2018"
O_32$opposition <- "Zimbabwe"
O_32$winning_status = 0
O_32$innings = 2
O_32 <- O_32 %>% arrange(ball_over)
O_32 <- edit(O_32)
O_32 <- O_32 %>% select(-X)
head(O_32)
write.csv(O_32 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_32.csv" , row.names = FALSE)


#O_33
O_33 <- FullData %>% filter(grepl('O_33' , Match_Number))
O_33$match_date <- "17/09/2018"
O_33$opposition <- "Afghanistan"
O_33$winning_status = 0
O_33$innings = 2
O_33 <- O_33 %>% arrange(ball_over)
O_33 <- edit(O_33)
O_33 <- O_33 %>% select(-X)
head(O_33)
write.csv(O_33 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_33.csv" , row.names = FALSE)


#O_34
O_34 <- FullData %>% filter(grepl('O_34' , Match_Number))
O_34$match_date <- "15/09/2018"
O_34$opposition <- "Bangladesh"
O_34$winning_status = 0
O_34$innings = 2
O_34 <- O_34 %>% arrange(ball_over)
O_34 <- edit(O_34)
O_34 <- O_34 %>% select(-X)
head(O_34)
write.csv(O_34 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_34.csv" , row.names = FALSE)


#O_35
O_35 <- FullData %>% filter(grepl('O_35' , Match_Number))
O_35$match_date <- "08/01/2018"
O_35$opposition <- "New Zealand"
O_35$winning_status = 0
O_35$innings = 2
O_35 <- O_35 %>% arrange(ball_over)
O_35 <- edit(O_35)
O_35 <- O_35 %>% select(-X)
head(O_35)
write.csv(O_35 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_35.csv" , row.names = FALSE)


#O_36
O_36 <- FullData %>% filter(grepl('O_36' , Match_Number))
O_36$match_date <- "05/01/2019"
O_36$opposition <- "New Zealand"
O_36$winning_status = 0
O_36$innings = 2
O_36 <- O_36 %>% arrange(ball_over)
O_36 <- edit(O_36)
O_36 <- O_36 %>% select(-X)
head(O_36)
write.csv(O_36 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_36.csv" , row.names = FALSE)


#O_37
O_37 <- FullData %>% filter(grepl('O_37' , Match_Number))
O_37$match_date <- "03/01/2019"
O_37$opposition <- "New Zealand"
O_37$winning_status = 0
O_37$innings = 2
O_37 <- O_37 %>% arrange(ball_over)
O_37 <- edit(O_37)
O_37 <- O_37 %>% select(-X)
head(O_37)
write.csv(O_37 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_37.csv" , row.names = FALSE)


#O_38
O_38 <- FullData %>% filter(grepl('O_38' , Match_Number))
O_38$match_date <- "16/03/2019"
O_38$opposition <- "South Africa"
O_38$winning_status = 0
O_38$innings = 1
O_38 <- O_38 %>% arrange(ball_over)
O_38 <- edit(O_38)
O_38 <- O_38 %>% select(-X)
head(O_38)
write.csv(O_38 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_38.csv" , row.names = FALSE)


#O_39
O_39 <- FullData %>% filter(grepl('O_39' , Match_Number))
O_39$match_date <- "13/03/2019"
O_39$opposition <- "South Africa"
O_39$winning_status = 0
O_39$innings = 1
O_39 <- O_39 %>% arrange(ball_over)
O_39 <- edit(O_39)
O_39 <- O_39 %>% select(-X)
head(O_39)
write.csv(O_39 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_39.csv" , row.names = FALSE)


#O_40
O_40 <- FullData %>% filter(grepl('O_40' , Match_Number))
O_40$match_date <- "10/03/2019"
O_40$opposition <- "South Africa"
O_40$winning_status = 0
O_40$innings = 2
O_40 <- O_40 %>% arrange(ball_over)
O_40 <- edit(O_40)
O_40 <- O_40 %>% select(-X)
head(O_40)
write.csv(O_40 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_40.csv" , row.names = FALSE)


#O_41
O_41 <- FullData %>% filter(grepl('O_41' , Match_Number))
O_41$match_date <- "06/03/2019"
O_41$opposition <- "South Africa"
O_41$winning_status = 0
O_41$innings = 2
O_41 <- O_41 %>% arrange(ball_over)
O_41 <- edit(O_41)
O_41 <- O_41 %>% select(-X)
head(O_41)
write.csv(O_41 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_41.csv" , row.names = FALSE)

#O_42
O_42 <- FullData %>% filter(grepl('O_42' , Match_Number))
O_42$match_date <- "03/03/2019"
O_42$opposition <- "South Africa"
O_42$winning_status = 0
O_42$innings = 1
O_42 <- O_42 %>% arrange(ball_over)
O_42 <- edit(O_42)
O_42 <- O_42 %>% select(-X)
head(O_42)
write.csv(O_42 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_42.csv" , row.names = FALSE)

#O_43
O_43 <- FullData %>% filter(grepl('O_43' , Match_Number))
O_43$match_date <- "21/05/2019"
O_43$opposition <- "Scotland"
O_43$winning_status = 1
O_43$innings = 1
O_43 <- O_43 %>% arrange(ball_over)
O_43 <- edit(O_43)
O_43 <- O_43 %>% select(-X)
head(O_43)
write.csv(O_43 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_43.csv" , row.names = FALSE)

#O_44
O_44 <- FullData %>% filter(grepl('O_44' , Match_Number))
O_44$match_date <- "28/06/2019"
O_44$opposition <- "South Africa"
O_44$winning_status = 0
O_44$innings = 1
O_44 <- O_44 %>% arrange(ball_over)
O_44 <- edit(O_44)
O_44 <- O_44 %>% select(-X)
head(O_44)
write.csv(O_44 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_44.csv" , row.names = FALSE)

#O_45
O_45 <- FullData %>% filter(grepl('O_45' , Match_Number))
O_45$match_date <- "21/06/2019"
O_45$opposition <- "England"
O_45$winning_status = 1
O_45$innings = 1
O_45 <- O_45 %>% arrange(ball_over)
O_45 <- edit(O_45)
O_45 <- O_45 %>% select(-X)
head(O_45)
write.csv(O_45 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_45.csv" , row.names = FALSE)

#O_46
O_46 <- FullData %>% filter(grepl('O_46' , Match_Number))
O_46$match_date <- "15/06/2019"
O_46$opposition <- "Australia"
O_46$winning_status = 0
O_46$innings = 2
O_46 <- O_46 %>% arrange(ball_over)
O_46 <- edit(O_46)
O_46 <- O_46 %>% select(-X)
head(O_46)
write.csv(O_46 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_46.csv" , row.names = FALSE)

#O_47
O_47 <- FullData %>% filter(grepl('O_47' , Match_Number))
O_47$match_date <- "04/06/2019"
O_47$opposition <- "Afghanistan"
O_47$winning_status = 1
O_47$innings = 1
O_47 <- O_47 %>% arrange(ball_over)
O_47 <- edit(O_47)
O_47 <- O_47 %>% select(-X)
head(O_47)
write.csv(O_47 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_47.csv" , row.names = FALSE)

#O_48
O_48 <- FullData %>% filter(grepl('O_48' , Match_Number))
O_48$match_date <- "01/06/2019"
O_48$opposition <- "New Zealand"
O_48$winning_status = 0
O_48$innings = 1
O_48 <- O_48 %>% arrange(ball_over)
O_48 <- edit(O_48)
O_48 <- O_48 %>% select(-X)
head(O_48)
write.csv(O_48 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_48.csv" , row.names = FALSE)

#O_49
O_49 <- FullData %>% filter(grepl('O_49' , Match_Number))
O_49$match_date <- "06/07/2019"
O_49$opposition <- "India"
O_49$winning_status = 0
O_49$innings = 1
O_49 <- O_49 %>% arrange(ball_over)
O_49 <- edit(O_49)
O_49 <- O_49 %>% select(-X)
head(O_49)
write.csv(O_49 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_49.csv" , row.names = FALSE)

#O_50
O_50 <- FullData %>% filter(grepl('O_50' , Match_Number))
O_50$match_date <- "01/07/2019"
O_50$opposition <- "West Indies"
O_50$winning_status = 1
O_50$innings = 1
O_50 <- O_50 %>% arrange(ball_over)
O_50 <- edit(O_50)
O_50 <- O_50 %>% select(-X)
head(O_50)
write.csv(O_50 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_50.csv" , row.names = FALSE)

#O_51
O_51 <- FullData %>% filter(grepl('O_51' , Match_Number))
O_51$match_date <- "02/10/2019"
O_51$opposition <- "Pakistan"
O_51$winning_status = 0
O_51$innings = 1
O_51 <- O_51 %>% arrange(ball_over)
O_51 <- edit(O_51)
O_51 <- O_51 %>% select(-X)
head(O_51)
write.csv(O_51 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_51.csv" , row.names = FALSE)

#O_52
O_52 <- FullData %>% filter(grepl('O_52' , Match_Number))
O_52$match_date <- "30/09/2019"
O_52$opposition <- "Pakistan"
O_52$winning_status = 0
O_52$innings = 2
O_52 <- O_52 %>% arrange(ball_over)
O_52 <- edit(O_52)
O_52 <- O_52 %>% select(-X)
head(O_52)
write.csv(O_52 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_52.csv" , row.names = FALSE)

#O_53
O_53 <- FullData %>% filter(grepl('O_53' , Match_Number))
O_53$match_date <- "14/03/2021"
O_53$opposition <- "West Indies"
O_53$winning_status = 0
O_53$innings = 1
O_53 <- O_53 %>% arrange(ball_over)
O_53 <- edit(O_53)
O_53 <- O_53 %>% select(-X)
head(O_53)
write.csv(O_53 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_53.csv" , row.names = FALSE)

#O_54
O_54 <- FullData %>% filter(grepl('O_54' , Match_Number))
O_54$match_date <- "12/03/2021"
O_54$opposition <- "West Indies"
O_54$winning_status = 0
O_54$innings = 1
O_54 <- O_54 %>% arrange(ball_over)
O_54 <- edit(O_54)
O_54 <- O_54 %>% select(-X)
head(O_54)
write.csv(O_54 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_54.csv" , row.names = FALSE)

#O_55
O_55 <- FullData %>% filter(grepl('O_55' , Match_Number))
O_55$match_date <- "10/03/2021"
O_55$opposition <- "West Indies"
O_55$winning_status = 0
O_55$innings = 1
O_55 <- O_55 %>% arrange(ball_over)
O_55 <- edit(O_55)
O_55 <- O_55 %>% select(-X)
head(O_55)
write.csv(O_55 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_55.csv" , row.names = FALSE)

#O_56
O_56 <- FullData %>% filter(grepl('O_56' , Match_Number))
O_56$match_date <- "23/05/2021"
O_56$opposition <- "Bangladesh"
O_56$winning_status = 0
O_56$innings = 2
O_56 <- O_56 %>% arrange(ball_over)
O_56 <- edit(O_56)
O_56 <- O_56 %>% select(-X)
head(O_56)
write.csv(O_56 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_56.csv" , row.names = FALSE)

#O_57
O_57 <- FullData %>% filter(grepl('O_57' , Match_Number))
O_57$match_date <- "25/05/2021"
O_57$opposition <- "Bangladesh"
O_57$winning_status = 0
O_57$innings = 2
O_57 <- O_57 %>% arrange(ball_over)
O_57 <- edit(O_57)
O_57 <- O_57 %>% select(-X)
head(O_57)
write.csv(O_57 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_57.csv" , row.names = FALSE)

#O_58
O_58 <- FullData %>% filter(grepl('O_58' , Match_Number))
O_58$match_date <- "28/05/2021"
O_58$opposition <- "Bangladesh"
O_58$winning_status = 1
O_58$innings = 1
O_58 <- O_58 %>% arrange(ball_over)
O_58 <- edit(O_58)
O_58 <- O_58 %>% select(-X)
head(O_58)
write.csv(O_58 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_58.csv" , row.names = FALSE)

#O_59
O_59 <- FullData %>% filter(grepl('O_59' , Match_Number))
O_59$match_date <- "04/07/2021"
O_59$opposition <- "England"
O_59$winning_status = 2
O_59$innings = 1
O_59 <- O_59 %>% arrange(ball_over)
O_59 <- edit(O_59)
O_59 <- O_59 %>% select(-X)
head(O_59)
write.csv(O_59 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_59.csv" , row.names = FALSE)

#O_60
O_60 <- FullData %>% filter(grepl('O_60' , Match_Number))
O_60$match_date <- "01/07/2021"
O_60$opposition <- "England"
O_60$winning_status = 0
O_60$innings = 1
O_60 <- O_60 %>% arrange(ball_over)
O_60 <- edit(O_60)
O_60 <- O_60 %>% select(-X)
head(O_60)
write.csv(O_60 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_60.csv" , row.names = FALSE)

#O_61
O_61 <- FullData %>% filter(grepl('O_61' , Match_Number))
O_61$match_date <- "29/06/2021"
O_61$opposition <- "England"
O_61$winning_status = 0
O_61$innings = 1
O_61 <- O_61 %>% arrange(ball_over)
O_61 <- edit(O_61)
O_61 <- O_61 %>% select(-X)
head(O_61)
write.csv(O_61 , "~/Research/Research---ST426/Data/NewData/Player/Overseas/O_61.csv" , row.names = FALSE)


















#write.csv(FullData , "~/Research/Research---ST426/Data/EDA_Data/FullPlayerData/FullData.csv" , row.names = FALSE)