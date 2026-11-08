load("Final_Exam_BUS.RData")

fit<-lm(Final_Exam_BUS$Weight~Final_Exam_BUS$Height)
summary(fit)

tab<-xtabs(~Final_Exam_BUS$Employment+Final_Exam_BUS$DegreeLevel)
test<-chisq.test(tab, correct = F)
test


t.test(Final_Exam_BUS$BaseSalary, mu=35000, alternative = "less", conf.level = .95, correct=FALSE)

table<-xtabs(~Final_Exam_BUS$Employment+Final_Exam_BUS$Smoke)
prop.test(table, alternative = "greater", correct = F, conf.level = .99)

cor.test(Final_Exam_BUS$Height, Final_Exam_BUS$Weight, alternative = "two.sided", correct=F)

length(Final_Exam_BUS$Employment[Final_Exam_BUS$Employment=="F"])
prop.test(70,120,conf.level = .93, correct = F)

length(Final_Exam_BUS$RegExercise[Final_Exam_BUS$RegExercise==1])
prop.test(57,120,conf.level = .95, correct = F)

test<-aov(Final_Exam_BUS$BaseSalary~Final_Exam_BUS$DegreeLevel)
summary(test)

