library(corrplot)
library(tidyverse)
library(caret)
library(MASS)
library(car)
library(survival)

Home <- read.csv("~/Research/Research---ST426/Data/NewData/Merge/Home/Home.csv")
Overseas <- read.csv("~/Research/Research---ST426/Data/NewData/Merge/Overseas/Overseas.csv")


data_merge <- rbind(Home , Overseas)

names(data_merge)

M <- data_merge %>% dplyr::select(cum_runs,cum_singles,cum_doubles,cum_boundaries,cum_dotBalls)

M1 <- cor(M,method = "spearman")

corrplot(M1,addCoef.col = 'black')

filepath <- "~/Research/Thesis_S16373/images/"
postscript(file = paste0(filepath,"cplot.eps"),width = 10,height = 7,horizontal = FALSE)
cplot
dev.off()

m1_inv <- ginv(M1)

colnames(m1_inv) <- colnames(M)
row.names(m1_inv) <- colnames(M)

corrplot(m1_inv,method = "number",is.corr = FALSE)


model <- coxph(Surv(cum_balls , wicket) ~ cum_runs+cum_singles+cum_doubles+cum_boundaries+ridge(cum_dotBalls) , data = data_merge)
vif(model)
