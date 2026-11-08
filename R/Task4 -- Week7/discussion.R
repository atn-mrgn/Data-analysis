load("Student_data_BUS-1.RData")

smk<-factor(Student_data_BUS$Smk)
caf<-factor(Student_data_BUS$Caf)
table<-xtabs(~smk+caf)
table
test<-chisq.test(table, correct = F)
test$expected
test
