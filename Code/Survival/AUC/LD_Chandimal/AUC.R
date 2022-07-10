library(tidyverse)
library(survival)
library(ggfortify)
library(survminer)
library(rms)
library(dynpred)
library(MASS)
library(CPE)

#Read the data sets
Home <- read.csv("~/Research/Research---ST426/Data/NewData/Merge/Home/Home.csv")
Overseas <- read.csv("~/Research/Research---ST426/Data/NewData/Merge/Overseas/Overseas.csv")

#Merge two data sets
data_merge <- rbind(Home , Overseas)

#Filter the data of LD Chandimal
bt2 <- data_merge %>% filter(grepl('SL Malinga' , Striker))

#Filter the first innings
BKG_1 <- bt2 %>% filter(innings == 1)

#Filter the second innings
LDC_2 <- bt1 %>% filter(innings == 2)

#Cox model for first innings
cox_BKG_1 <- coxph(Surv(cum_balls , wicket) ~  cum_singles+ridge(cum_dotBalls), data = BKG_1)
summary(cox_BKG_1)

#Finding the best model
model_BKG_1 <- stepAIC(cox_BKG_1)

#Test pH assumptions
test_BKG_1 <- cox.zph(cox_BKG_1)
test_BKG_1

#C - statistics for first innings
phcpe(cox_LDC_1)


#Cox model for second innings
cox_LDC_2 <- coxph(Surv(cum_balls , wicket) ~ cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls), data = LDC_2)
summary(cox_LDC_2)

#Finding the best model
model_LDC_2 <- stepAIC(cox_LDC_2)

#New model
cox_LDC_2_new <- coxph(Surv(cum_balls , wicket) ~ cum_singles+cum_boundaries+cum_dotBalls, data = LDC_2)
summary(cox_LDC_2_new)

#Test pH assumptions
test_LDC_2 <- cox.zph(cox_LDC_2_new)
test_LDC_2


#Using heaviside function
LDC_2_cut <- survSplit(LDC_2 , cut = 35 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

LDC_2_cut$hv1 <- LDC_2_cut$cum_doubles * (LDC_2_cut$start < 35)
LDC_2_cut$hv2 <- LDC_2_cut$cum_doubles * (LDC_2_cut$start >= 35)


cox_LDC_2_heav <- coxph(Surv(start,cum_balls , wicket) ~ 
                     cum_singles+ hv1 + hv2 +cum_boundaries+cum_dotBalls + cluster (id) , data = LDC_2_cut)
summary(cox_LDC_2_heav)


#test
test_LDC_2_heav <- cox.zph(cox_LDC_2_heav)
test_LDC_2_heav


#C - statistics for second innings
phcpe(cox_LDC_2_heav)



#Filter the home data
LDC_H <- bt1 %>% filter(Venue == "Home")

#Filter the second innings
LDC_O <- bt1 %>% filter(Venue == "Overseas")

#Cox model for first innings
cox_LDC_H <- coxph(Surv(cum_balls , wicket) ~ cum_runs+cum_singles+cum_doubles+cum_boundaries+cum_dotBalls, data = LDC_1)
summary(cox_LDC_H)

#Finding the best model
model_LDC_H <- stepAIC(cox_LDC_H)

#Test pH assumptions
test_LDC_H <- cox.zph(cox_LDC_H)
test_LDC_H

#C - statistics for first innings
phcpe(cox_LDC_H)


p1 <- ggadjustedcurves(cox_BKG_1 , data = BKG_1 , size = 2,ggtheme = theme_survminer()) + 
        geom_hline(yintercept = c(0.25,0.5,0.75) , linetype = "dashed") +xlim(0,70)

p2 <- ggadjustedcurves(cox_LDC_2_new , data = LDC_2 , size = 2,ggtheme = theme_survminer()) + 
        geom_hline(yintercept = c(0.25,0.5,0.75) , linetype = "dashed") +xlim(0,50)

p1
par(new = TRUE)
p2
p1+p2

ggadjustedcurves(c(cox_LDC_1_new ,cox_LDC_2_new), data = c(LDC_1 ,LDC_2), size = 2,ggtheme = theme_survminer()) + 
  geom_hline(yintercept = c(0.25,0.5,0.75) , linetype = "dashed") +xlim(0,70)

a1 <- unique(LDC_1[c("Match_Number","winning_status")])
nrow(a1)
count(a1$winning_status==1)
sum(a1$winning_status==1)

a4 <- data_merge %>% filter(Match_Number %in% unique(LDC_1$Match_Number))
a2 <- a4 %>% summarise(sum_runs = sum(tot_runs))
a3 <- LDC_1 %>%  summarise(sum_runs = sum(tot_runs))
