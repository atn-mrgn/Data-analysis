load("Student_data_BUS-1.RData")

## Question 1
table<-xtabs(~ factor(Student_data_BUS$Sex)+factor(Student_data_BUS$Smk))
chisq.test(table, correct = F)

## Question 2
table<-xtabs(~ factor(Student_data_BUS$Aer)+factor(Student_data_BUS$Sex))
chisq.test(table, correct = F)

## Question 3
table<-xtabs(~factor(Student_data_BUS$Smk)+Student_data_BUS$Major)
chisq.test(table, correct = F)

## Question 4
table<-xtabs(~factor(Student_data_BUS$Aer)+Student_data_BUS$Major)
chisq.test(table, correct = F)$expected

## Question 5
table<-xtabs(~factor(Student_data_BUS$Sex)+factor(Student_data_BUS$Caf))
chisq.test(table, correct = F)$expected

## Question 10
table<-xtabs(~factor(Student_data_BUS$Sex)+Student_data_BUS$Major)
chisq.test(table, correct = F)$expected