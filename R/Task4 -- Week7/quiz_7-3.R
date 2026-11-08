load("Student_data_BUS-1.RData")

table<-xtabs(~Student_data_BUS$Aer+Student_data_BUS$Sex)
table
test<-chisq.test(table, correct = F)
test$expected
test

###############################################################################

table<-xtabs(~Student_data_BUS$Sex+Student_data_BUS$Smk)
prop.test(table,alternative = "less",correct = F)$p.value

###############################################################################

smk_sal<-subset(Student_data_BUS, Smk==1, select = Starting_Sal)
nsmk_sal<-subset(Student_data_BUS, Smk==2, select = Starting_Sal)

t.test(smk_sal, nsmk_sal, alternative = "less")$p.value

###############################################################################

table<-xtabs(~Student_data_BUS$Smk+Student_data_BUS$Major)
test<-chisq.test(table, correct = F)
test

###############################################################################

table<-xtabs(~Student_data_BUS$Caf+Student_data_BUS$Sex)
table