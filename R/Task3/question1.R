# Question[1]

library(boot)

### 1.

# Plug-in principle
x<-c(0.06,0.21,1.00,0.91,0.82,0.03,0.90,0.10,1.00,0.98,0.28,0.51,0.01,0.97,0.61,0.43,0.62,0.86,0.94,0.66,0.30,0.52,0.23,0.00,0.68,0.19,0.31,0.02,0.68,0.34)
Fn=ecdf(x)
print(min(x[Fn(x)>=0.25]))

# Bootstrap parametric
npbs <- boot(data = x, statistic = quantile, R=1000, probs = 0.25)
print(npbs)

### 2.

# Find a and b
m <- mean(x)
v <- var(x)
a <- ((m*(1-m))/v -1)*m
b <- ((m*(1-m))/v -1)*(1-m)
print(a)
print(b)
 
# Find error
set.seed(1)
sample <- rbeta(n=40, a, b)
func <- function(d,w) {
  n <- length(d)
  m <- (sum(d[w[1:n]])/n)
  v <- sum((d[w[1:n]]- sum(d[w[1:n]])/n)^2)/n
  a <- ((m*(1-m))/v -1)*m
  b <- ((m*(1-m))/v -1)*(1-m)
  return(c(a,b))
  }

sample.boot <- boot(sample,func, R=1000)
print(sample.boot)
