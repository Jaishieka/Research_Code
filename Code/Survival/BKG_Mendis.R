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

#Filter the data of BKG Mendis
bt3 <- data_merge %>% filter(grepl('BKG Mendis' , Striker))


#Coxph model stratified for different innings
cox_BKG_1 <- coxph(Surv(cum_balls , wicket) ~ cum_runs+cum_singles+cum_doubles+cum_boundaries+cum_dotBalls + strata(innings), data = bt3)
summary(cox_BKG_1)

#Test for the proportional hazard assumptions
test.ph.BKG_1 <- cox.zph(cox_BKG_1)
test.ph.BKG_1

#Adjusted survival curve
ggadjustedcurves(cox_BKG_1 , data = bt3 , size = 2,ggtheme = theme_survminer()) + 
  geom_hline(yintercept = c(0.25,0.5,0.75) , linetype = "dashed") 



#Using RMS package

cox_bkg <- cph(Surv(cum_balls , wicket) ~ cum_runs+cum_singles+cum_doubles+cum_boundaries+cum_dotBalls  + strat(innings), 
              data = bt3 , surv = TRUE , x=TRUE , y=TRUE , time.inc = 40)
validate(cox_ad, u=40 ,B=40)
plot(calibrate(cox_ad , u = 40))


#Extended cox model

#Slpit the dataset
bt3_split <- survSplit(bt3 , cut = bt3$cum_balls , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

#Time dependent variable for cum_singles
bt3_split$t_doubles <- bt3_split$cum_doubles * (bt3_split$cum_balls >= 30)

cox_BKG_2 <- coxph(Surv(start,cum_balls , wicket) ~ 
                    cum_runs+cum_singles+cum_doubles+cum_boundaries+cum_dotBalls + 
                     t_doubles + cluster (id) + strata(innings), data = bt3_split)
summary(cox_BKG_2)

test.ph.BKG_2 <- cox.zph(cox_BKG_2)
test.ph.BKG_2


#Using heaviside function
bt3_cut <- survSplit(bt3 , cut = 45 , end = "cum_balls" , event = "wicket" , start = "start" , id = "id")

bt3_cut$hv1 <- bt3_cut$cum_doubles * (bt3_cut$start < 45)
bt3_cut$hv2 <- bt3_cut$cum_doubles * (bt3_cut$start >= 45)


cox_BKG_3 <- coxph(Surv(start,cum_balls , wicket) ~ 
                    cum_runs+cum_singles+ hv1 + hv2 +cum_boundaries+cum_dotBalls + cluster (id) + strata(innings), data = bt3_cut)
summary(cox_BKG_3)

test.ph.BKG_3 <- cox.zph(cox_BKG_3)
test.ph.BKG_3
