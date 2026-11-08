n <- 2000
k <- seq(0, n, by = 20)
plot (k, dbinom(k, n, pi/10))
lines(k, dbinom(k, n, pi/10), col = "red", lwd = 2)
#xfit<-seq(min(v1),max(v1),length=10)

## (1) Binomial distribution

### n=50  p=0.2
v1 <-rbinom(20, 50, 0.2)
pmf <- dbinom(0:20, size = 50, prob = 0.2)
cdf <- pbinom(0:20, size = 50, prob = 0.2)
par(mfrow=c(1,2))
plot(0:20, pmf, main = "Probability mass function")
plot(0:20, cdf, main = "Cumulative distribution function")

### n=100  p=0.2
v1 <-rbinom(20, 100, 0.2)
pmf <- dbinom(0:20, size = 100, prob = 0.2)
cdf <- pbinom(0:20, size = 100, prob = 0.2)
par(mfrow=c(1,2))
plot(0:20, pmf, main = "Probability mass function")
plot(0:20, cdf, main = "Cumulative distribution function")

### n=100  p=0.6
v1 <-rbinom(20, 100, 0.6)
pmf <- dbinom(0:20, size = 100, prob = 0.6)
cdf <- pbinom(0:20, size = 100, prob = 0.6)
par(mfrow=c(1,2))
plot(0:20, pmf, main = "Probability mass function")
plot(0:20, cdf, main = "Cumulative distribution function")

### n=50  p=0.6
v1 <-rbinom(20, 50, 0.6)
pmf <- dbinom(0:20, size = 50, prob = 0.6)
cdf <- pbinom(0:20, size = 50, prob = 0.6)
par(mfrow=c(1,2))
plot(0:20, pmf, main = "Probability mass function")
plot(0:20, cdf, main = "Cumulative distribution function")


## (2) Geometric distribution

### p1=0.2
v2<-rgeom(20, 0.2)
pmf <- dgeom(0:20, prob = 0.2)
cdf <- pgeom(0:20, prob = 0.2)
plot(0:20, pmf, main = "Probability mass function")
plot(0:20, cdf, main = "Cumulative distribution function")

### p2=0.3
v2<-rgeom(20, 0.6)
pmf <- dgeom(0:20, prob = 0.6)
cdf <- pgeom(0:20, prob = 0.6)
plot(0:20, pmf, main = "Probability mass function")
plot(0:20, cdf, main = "Cumulative distribution function")

## (2) Poisson distribution

### lambda=0.3
v3<-rpois(20, 0.3)
pmf <- dpois(0:20,  lambda = 0.3)
cdf <- ppois(0:20, lambda = 0.3)
plot(0:20, pmf, main = "Probability mass function")
plot(0:20, cdf, main = "Cumulative distribution function")

### lambda=0.1
v3<-rgeom(20, 1)
pmf <- dpois(0:20, lambda = 1)
cdf <- ppois(0:20, lambda = 1)
plot(0:20, pmf, main = "Probability mass function")
plot(0:20, cdf, main = "Cumulative distribution function")


