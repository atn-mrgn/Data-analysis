## Load dataset
data <- read.csv("Sellin_Product.csv")

library(ggplot2)

## Delete NA rows
filter_data <- na.omit(data)

## Product_1 density distribution
print(mean(filter_data$YOSHHAELVICT))
print(median(filter_data$YOSHHAELVICT))
ggplot(filter_data, aes(x=YOSHHAELVICT)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="blue")+
  geom_density(alpha=.6, fill="#FF6666")

## Product_2 density distribution
print(mean(filter_data$YOSHELLYCATH))
print(median(filter_data$YOSHELLYCATH))
ggplot(filter_data, aes(x=YOSHELLYCATH)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="blue")+
  geom_density(alpha=.6, fill="#FF6666") 

## Product_3 density distribution
print(mean(filter_data$YOSHLROYARTI))
print(median(filter_data$YOSHLROYARTI))
ggplot(filter_data, aes(x=YOSHLROYARTI)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="blue")+
  geom_density(alpha=.6, fill="#FF6666") 