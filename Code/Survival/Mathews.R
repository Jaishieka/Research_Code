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
bt2 <- data_merge %>% filter(grepl('AD Mathews' , Striker))

#Cox model for single variables

#Cumulative runs
cox_AD_runs <- coxph(Surv(cum_balls , wicket) ~ cum_runs, data = bt2)
summary(cox_AD_runs)

cox.zph(cox_AD_runs)

#Cumulative singles
cox_AD_singles <- coxph(Surv(cum_balls , wicket) ~ cum_singles, data = bt2)
summary(cox_AD_singles)

cox.zph(cox_AD_singles)

#Cumulative doubles
cox_AD_doubles <- coxph(Surv(cum_balls , wicket) ~ cum_doubles, data = bt2)
summary(cox_AD_doubles)

cox.zph(cox_AD_doubles)

#Cumulative boundaries
cox_AD_boundaries <- coxph(Surv(cum_balls , wicket) ~ cum_boundaries, data = bt2)
summary(cox_AD_boundaries)

cox.zph(cox_AD_boundaries)

#Cumulative dotballs
cox_AD_dotBalls <- coxph(Surv(cum_balls , wicket) ~ cum_dotBalls, data = bt2)
summary(cox_AD_dotBalls)

cox.zph(cox_AD_dotBalls)
