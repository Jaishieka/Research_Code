library(tidyverse)
library(survival)
library(ggfortify)
library(survminer)
library(rms)
library(dynpred)

#Read the data sets
Home <- read.csv("~/Research/Research---ST426/Data/NewData/Merge/Home/Home.csv")
Overseas <- read.csv("~/Research/Research---ST426/Data/NewData/Merge/Overseas/Overseas.csv")

#Merge two data sets
data_merge <- rbind(Home , Overseas)

#Filter the data of AD Mathews
bt2 <- data_merge %>% filter(grepl('AD Mathews' , Striker))


#Coxph model stratified for different innings
cox_AD_1 <- coxph(Surv(cum_balls , wicket) ~ cum_runs+cum_singles+cum_doubles+cum_boundaries+cum_dotBalls + strata(innings), data = bt2)
summary(cox_AD_1)

#Test for the proportional hazard assumptions
test.ph.AD_1 <- cox.zph(cox_AD_1)
test.ph.AD_1

#Adjusted survival curve
ggadjustedcurves(cox_AD_3 , data = bt2_cut , size = 2,ggtheme = theme_survminer()) + 
  geom_hline(yintercept = c(0.25,0.5,0.75) , linetype = "dashed") 



#Using RMS package

cox_ad <- cph(Surv(cum_balls , wicket) ~ cum_runs+new_single+cum_doubles+cum_boundaries+cum_dotBalls + strat(innings), 
              data = bt2 , surv = TRUE , x=TRUE , y=TRUE , time.inc = 40)
validate(cox_ad, u=40 ,B=40)

#Extended cox model

#Slpit the dataset
bt2_split <- survSplit(bt2 , cut = bt2$cum_balls , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

#Time dependent variable for cum_singles
bt2_split$t_singles <- bt2_split$cum_singles * bt2_split$cum_balls

#Cox Model
cox_AD_2 <- coxph(Surv(start,cum_balls , wicket) ~ 
                    cum_runs+cum_singles+cum_doubles+cum_boundaries+cum_dotBalls + t_singles + cluster (id) + strata(innings), data = bt2_split)
summary(cox_AD_2)


#Test the pH assumptions
test.ph.AD_2 <- cox.zph(cox_AD_2)
test.ph.AD_2



#Using heaviside function

#Split the dataset
bt2_cut <- survSplit(bt2 , cut = 30 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

#Create the heaviside functions
bt2_cut$hv1 <- bt2_cut$cum_singles * (bt2_cut$start < 30)
bt2_cut$hv2 <- bt2_cut$cum_singles * (bt2_cut$start >= 30)

#Cox model
cox_AD_3 <- coxph(Surv(start,cum_balls , wicket) ~ 
                    cum_runs+hv1 + hv2 +cum_doubles+cum_boundaries+cum_dotBalls + cluster (id) + strata(innings), data = bt2_cut)
summary(cox_AD_3)


#Test the pH assumptions
test.ph.AD_3 <- cox.zph(cox_AD_3)
test.ph.AD_3

#Validate the cox model
cox_ad_3 <- cph(Surv(start,cum_balls , wicket) ~ cum_runs+hv1 + hv2 +cum_doubles+cum_boundaries+cum_dotBalls + 
                  cluster (id) + strat(innings), data = bt2_cut , surv = TRUE , x=TRUE , y=TRUE , time.inc = 40)
validate(cox_ad_3,method = "randomization", u=40 ,B=40)
