load("Diamonds.RData")

plot(Diamonds$Carat, Diamonds$Price)

shapiro.test(Diamonds$Carat)$p.value

shapiro.test(Diamonds$Price)$p.value

fit<-lm(Diamonds$Price~Diamonds$Carat)
summary(fit)

cor.test(Diamonds$Carat, Diamonds$Price, alternative = "two.sided")