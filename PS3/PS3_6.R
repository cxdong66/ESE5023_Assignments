library(MASS)
data(cpus)
library(tidyr)
library(dplyr)
library(ggplot2)


sample_index <- sample(nrow(cpus),nrow(cpus)*0.80)
cpus_train <- cpus[sample_index,]
cpus_test  <- cpus[-sample_index,]

#1
model_1 <- lm(perf ~ syct+mmin+mmax+cach+chmin+chmax, data = cpus_train)
summary(model_1)

#2
library(leaps)
subset_result <- regsubsets(perf ~ syct+mmin+mmax+cach+chmin+chmax, data = cpus_train, nbest=2, nvmax = 14)
plot(subset_result, scale="bic")
nullmodel=lm(perf ~ 1, data = cpus_train)
fullmodel=lm(perf ~ mmin+mmax+cach+chmax, data = cpus_train)

model_step_b <- step(fullmodel,direction='backward')
model_step_f <- step(nullmodel, scope=list(lower=nullmodel, upper=fullmodel), direction='forward')
model_step_s <- step(nullmodel, scope=list(lower=nullmodel, upper=fullmodel), direction='both')
