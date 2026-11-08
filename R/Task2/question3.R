## Question [3]

x <- c(-1.48,-0.96,-2,-0.32,-0.11,-0.78,-0.78,-0.15,1.19,0.51,0.22,1.01,-1.03,-0.20,0.15,0.67,-0.54,-0.37,0.27,0.80)
y <- c(2.11,-0.32,0.76,-0.39,0.42,-0.73,0.40,-0.53,-0.30,-0.51,1.63,-0.77,0.28,0.21,0.24,1.46,-0.66,-0.23,-0.55,-1.27)
df <- data.frame(x,y)

### 1.Permutation test
#print(cor(df$x,df$y))

### 2.Permutation test

#plot(df$x,df$y)
set.seed(1234)
N <- 10000 # repeat shuffling for N times
corPerm <- numeric(length = N) # vector with the results of the test statistic under each permutation
for(i in 1:N)
{
  shufdf <- df[sample(nrow(df)),]
  corPerm[i] <- cor(shufdf$x, df$y)
}
corObserved <- cor(df$x, df$y)

hist(corPerm, xlim=range(c(corPerm,corObserved)))
abline(v=corObserved, col="red")

p_value_Cor <- (sum(corPerm>=corObserved)+1)/length(corPerm)
print(p_value_Cor)


### 3. Comparison
reg <- lm(y~x, data = df)
print(summary(reg))