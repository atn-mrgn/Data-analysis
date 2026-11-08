load("Delivery_data-1.RData")

## Question 2
model <- aov(Delivery_data$Driver_Height ~ Delivery_data$Company)
model
summary(model)

TukeyHSD(model)

## Question 3
model2 <- aov(Delivery_data$Box_Weight ~ Delivery_data$Company)
model2
summary(model2)

## Question 7

TukeyHSD(model2)

## Question 8

TukeyHSD(model)

## Question 9
model3 <- aov(Delivery_data$Driver_Salary ~ Delivery_data$Company)
model3
a<-summary(model3)
TukeyHSD(model3)