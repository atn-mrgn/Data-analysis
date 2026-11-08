load("Student_data_BUS-1.RData")

##Question 1
caf<-factor(Student_data_BUS$Caf)
aer<-factor(Student_data_BUS$Aer)
table<-xtabs(~caf+aer)
table

##Question 2
maj<-Student_data_BUS$Major
caf<-factor(Student_data_BUS$Caf)
table<-xtabs(~maj+caf)
table

##Question 6
smk<-factor(Student_data_BUS$Smk)
sex<-factor(Student_data_BUS$Sex)
table<-xtabs(~smk+sex)
table

##Question 8
maj<-Student_data_BUS$Major
aer<-factor(Student_data_BUS$Aer)
table<-xtabs(~maj+aer)
table
