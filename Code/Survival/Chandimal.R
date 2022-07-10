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

#Cox model for single variables

#Cumulative runs
cox_LD_runs <- coxph(Surv(cum_balls , wicket) ~ cum_runs, data = bt1)
summary(cox_LD_runs)

cox.zph(cox_LD_runs)

#Cumulative singles
cox_LD_singles <- coxph(Surv(cum_balls , wicket) ~ cum_singles, data = bt1)
summary(cox_LD_singles)

cox.zph(cox_LD_singles)

#Cumulative doubles
cox_LD_doubles <- coxph(Surv(cum_balls , wicket) ~ cum_doubles, data = bt1)
summary(cox_LD_doubles)

cox.zph(cox_LD_doubles)

#Cumulative boundaries
cox_LD_boundaries <- coxph(Surv(cum_balls , wicket) ~ cum_boundaries, data = bt1)
summary(cox_LD_boundaries)

cox.zph(cox_LD_boundaries)

#Cumulative dotballs
cox_LD_dotBalls <- coxph(Surv(cum_balls , wicket) ~ cum_dotBalls, data = bt1)
summary(cox_LD_dotBalls)

cox.zph(cox_LD_dotBalls)
