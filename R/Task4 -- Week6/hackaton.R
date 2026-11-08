df <- read.csv("train.csv")

shapiro.test(df$pm2_5[1:5000])

bartlett.test(df$pm2_5 ~ df$device)

