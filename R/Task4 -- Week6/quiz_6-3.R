load("Snakes.RData")

shapiro.test(Snakes$PR)

bartlett.test(Snakes$PR ~ Snakes$DrugGroup)

model<-aov(Snakes$PR ~ Snakes$DrugGroup)
summary(model)

TukeyHSD(model)

################################################################################

shapiro.test(Snakes$Weight)

bartlett.test(Snakes$Weight ~ Snakes$DrugGroup)

model<-aov(Snakes$Weight ~ Snakes$DrugGroup)
summary(model)

TukeyHSD(model)

################################################################################

shapiro.test(Snakes$Length)

bartlett.test(Snakes$Length ~ Snakes$DrugGroup)

model<-aov(Snakes$Length ~ Snakes$DrugGroup)
summary(model)

TukeyHSD(model)

