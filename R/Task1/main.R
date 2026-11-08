library(ggplot2)
library(GGally)

# Question[1]
library(dplyr)

### load data
data <- read.csv("creditworthiness.csv")

### extract rated lines
filter_data <- data %>% filter(credit.rating %in% c(1,2,3))

### split data
set.seed(25)
dt = sort(sample(nrow(filter_data), nrow(filter_data)*.5))
train_data <- filter_data[dt,]
test_data <- filter_data[-dt,]

# Question[2]
library(rpart)
library(rpart.plot)

## a-
### Convert credit.rating column in factor
train_data$credit.rating = factor(train_data$credit.rating,labels=c("A","B","C"))
### Train
DT.rpart <- rpart(credit.rating ~., train_data)
rpart.plot(DT.rpart)

## b-
### Create median individu
med = c(0,1,1,0,3,0,3,3,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3)
med_df <- setNames(
  data.frame( t(data.frame(med)) ,row.names = NULL,stringsAsFactors = FALSE),
  colnames(data)[1:45]
  )
print(predict(DT.rpart, med_df, type="class"))

## c-
library(caret)
pred = predict(DT.rpart, test_data[,1:45], type="class")
print(confusionMatrix(pred,train_data$credit.rating))

## e-
library(randomForest)
RF <- randomForest(credit.rating~., data=train_data, proximity=TRUE) 
#print(RF)

## f-
p <- predict(RF, test_data[,1:45], type="class")
print(confusionMatrix(p,train_data$credit.rating))

#Question[3]
library(e1071)

## a-
model.svm <- svm(credit.rating~., data=train_data)
print(predict(model.svm, med_df, decision.values=TRUE))

## b-
p2 <- predict(model.svm, test_data[,1:45], type="class")
print(confusionMatrix(p2,train_data$credit.rating))

## c-
set.seed(5)
tmodel <- tune.svm(credit.rating ~ ., data = train_data, kernel="radial",
                  gamma = 10^(-1:1), cost = 10^(2:7))
plot(tmodel)
best.svm <- tmodel$best.model
p3 <- predict(best.svm, test_data[,1:45], type="class")
print(confusionMatrix(p3,train_data$credit.rating))

# Question[4]

## a-
m <- naiveBayes(credit.rating ~., data = train_data)
print(predict(m, med_df, type="raw"))

## c-
p4 <- predict(m, test_data[,1:45])
print(confusionMatrix(p4,train_data$credit.rating))

#Question[6]

### Modify data
modif_data <- data %>% filter(credit.rating %in% c(1,2,3))
modif_data$credit.rating = factor(modif_data$credit.rating,labels=c("A","0","0"))
### Splitting
set.seed(25)
dt = sort(sample(nrow(modif_data), nrow(modif_data)*.5))
train <- modif_data[dt,]
test <- modif_data[-dt,]

## a-
model.glm <- glm(credit.rating~., data = train, family = binomial("logit"))
print(summary(model.glm))

## d-
svm.model <- svm(credit.rating~., data=train)
p5 <- predict(svm.model, test[,1:45], type="class")
print(confusionMatrix(p5,test$credit.rating))

## e-
library(ROCR)
pred.svm <- predict(svm.model, newdata = test[,1:45],decision.values = TRUE)
pred.reg <- predict(model.glm, newdata = test[,1:45],type="response")
y.svm <- attr(pred.svm, "decision.values")
classifier.svm <- prediction(y.svm, test$credit.rating =="0")
classifier.reg<- prediction(pred.reg, test$credit.rating =="0")
perf.svm <- performance(classifier.svm, "tpr","fpr")
perf.reg <- performance(classifier.reg, "tpr","fpr")
plot(perf.svm, col = 1, print.cutoffs.at=seq(0,1,0.1))
plot(perf.reg, col = 4, add = TRUE)
legend("bottomright", c("SVM", "Logistic Regressor"),lty = 1, col = 1:4)
