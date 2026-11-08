load("Student_data_BUS.RData")

cor(Student_data_BUS$Age, Student_data_BUS$Pr)
cor.test(Student_data_BUS$Age, Student_data_BUS$Pr, alternative = 'two.sided')

fit<-lm(Student_data_BUS$Starting_Sal~Student_data_BUS$Age)
summary(fit)

fit<-lm(Student_data_BUS$HRs.per.week~Student_data_BUS$Age)
summary(fit)

fit<-lm(Student_data_BUS$Pr~Student_data_BUS$Age)
summary(fit)

fit<-lm(Student_data_BUS$Rct~Student_data_BUS$Age)
summary(fit)

fit<-lm(Student_data_BUS$Rct~Student_data_BUS$Pr)
summary(fit)

fit<-lm(Student_data_BUS$Pr~Student_data_BUS$Age)
summary(fit)

fit<-lm(Student_data_BUS$HRs.per.week~Student_data_BUS$Starting_Sal)
summary(fit)

fit<-lm(Student_data_BUS$HRs.per.week~Student_data_BUS$Age)
summary(fit)