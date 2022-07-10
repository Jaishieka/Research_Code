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
bt3 <- data_merge %>% filter(grepl('BKG Mendis' , Striker))

#Cox model for single variables

#Cumulative runs
cox_BKG_runs <- coxph(Surv(cum_balls , wicket) ~ cum_runs, data = bt3)
summary(cox_BKG_runs)

cox.zph(cox_BKG_runs)

#Cumulative singles
cox_BKG_singles <- coxph(Surv(cum_balls , wicket) ~ cum_singles, data = bt3)
summary(cox_BKG_singles)

cox.zph(cox_BKG_singles)

#Cumulative doubles
cox_BKG_doubles <- coxph(Surv(cum_balls , wicket) ~ cum_doubles, data = bt3)
summary(cox_BKG_doubles)

cox.zph(cox_BKG_doubles)

#Cumulative boundaries
cox_BKG_boundaries <- coxph(Surv(cum_balls , wicket) ~ cum_boundaries, data = bt3)
summary(cox_BKG_boundaries)

cox.zph(cox_BKG_boundaries)

#Cumulative dotballs
cox_BKG_dotBalls <- coxph(Surv(cum_balls , wicket) ~ cum_dotBalls, data = bt3)
summary(cox_BKG_dotBalls)

cox.zph(cox_BKG_dotBalls)
