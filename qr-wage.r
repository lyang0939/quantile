
getwd()
setwd("D:/102/quantile") 

sink("wage-qr.out")

dat=read.csv("wage.csv",header=T)
attach(dat)

dat


#install.packages('quantreg')

library(quantreg)

exp2 <- exp*exp

ls <- lm(lnwage~gender+marry+gov+farm+edu+exp+exp2)
summary(ls)


taus <- c(0.05,0.25,0.75,0.95)

qt <- summary(rq(lnwage~gender+marry+gov+farm+edu+exp+exp2, taus))

qt


pdf("wage.pdf", horizontal = FALSE, width = 8.5, height =8.5)
#plot(qt, nrow =5, ncol = 2)
plot(qt)
dev.off()

