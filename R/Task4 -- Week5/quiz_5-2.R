load("../Student_data_BUS-8.RData")

## Question 1  
A=as.matrix(table(Student_data_BUS$Sex,Student_data_BUS$Smk),2)
A
prop.test(A, alternative = "greater", correct = F)$p.value

## Question 2
var.test(Student_data_BUS$Starting_Sal[Student_data_BUS$Smk==1], 
         Student_data_BUS$Starting_Sal[Student_data_BUS$Smk==2])$p.value
t.test(Student_data_BUS$Starting_Sal[Student_data_BUS$Smk==1], 
       Student_data_BUS$Starting_Sal[Student_data_BUS$Smk==2],
       alternative = "less")$p.value

## Question 3
var.test(Student_data_BUS$HRs.per.week[Student_data_BUS$Caf==1], 
         Student_data_BUS$HRs.per.week[Student_data_BUS$Caf==2])$p.value

t.test(Student_data_BUS$HRs.per.week[Student_data_BUS$Caf==1], 
       Student_data_BUS$HRs.per.week[Student_data_BUS$Caf==2])$p.value

## Question 5
var.test(Student_data_BUS$Pr[Student_data_BUS$Sex==1], 
         Student_data_BUS$Pr[Student_data_BUS$Sex==2])$p.value

t.test(Student_data_BUS$Pr[Student_data_BUS$Sex==1], 
       Student_data_BUS$Pr[Student_data_BUS$Sex==2],
       conf.level = 0.95)$conf.int

## Question 4
C=as.matrix(table(Student_data_BUS$Sex,Student_data_BUS$Smk),2)
C
prop.test(C, conf.level = 0.89, correct = FALSE)$conf.int

## Question 6


##
men_sal<-subset(Student_data_BUS, Sex==1, select = Starting_Sal)
wom_sal<-subset(Student_data_BUS, Sex==2, select = Starting_Sal)

t.test(men_sal, wom_sal, alternative = "greater")$p.value
t.test(men_sal, wom_sal, alternative = "greater", conf.level = 0.95)$conf.int

##
table<-as.factor(xtabs(~Student_data_BUS$Sex+Student_data_BUS$Smk))
table
