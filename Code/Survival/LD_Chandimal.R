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

#Filter the data of LD Chandimal
bt1 <- data_merge %>% filter(grepl('LD Chandimal' , Striker))


#Coxph model stratified for different innings
cox_LD_1 <- coxph(Surv(cum_balls , wicket) ~ cum_runs+cum_singles+cum_doubles+cum_boundaries+cum_dotBalls + strata(innings), data = bt1)
summary(cox_LD_1)

#Test for the proportional hazard assumptions
test.ph.LD_1 <- cox.zph(cox_LD_1)
test.ph.LD_1

bt1$innings <- as.factor(bt1$innings)

#Adjusted survival curve
ggadjustedcurves(cox_LD_1 , data = bt1 , size = 2,ggtheme = theme_survminer()) + 
  geom_hline(yintercept = c(0.25,0.5,0.75) , linetype = "dashed")


#Using RMS package

cox_ld <- cph(Surv(cum_balls , wicket) ~ cum_runs+cum_singles+cum_doubles+cum_boundaries+cum_dotBalls  + strat(innings), 
              data = bt1 , surv = TRUE , x=TRUE , y=TRUE , time.inc = 40)
validate(cox_ld, u=40 ,B=40)
plot(calibrate(cox_ld , u = 40))

stats::step(cox_LD_1)
