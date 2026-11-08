## Load Data set
library("tidyverse")
data <- read_csv("bank-full.csv", show_col_types = FALSE)

## 

#ages <- unique(data)

## Filter data by population, age and sex
group_data <- subset(data, population=="Patient" & age %in% c(15:30) & sex %in% c("M","F"))

## Take a sample of 50 observations
indexs <- sample.int(n=nrow(group_data), size = 50, replace = F)
sample <- group_data[indexs,]