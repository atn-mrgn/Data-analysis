library(boot)
N=10000
x=numeric(N)
for(i in 1:N){
  a=rbinom(1,size=1,prob = 0.5)
  vente=runif(1,1,9)
  if(a==1){
    pct = runif(1,25,75)
    x[i]<-vente*pct/100 + vente
  }else{
    x[i]=vente
  }
}
means <- function(d,w) {
n <- length(d)
return(sum(d[w[1:n]])/n)
}
npbs <- boot(x, means,R=1000)
print(npbs)
  